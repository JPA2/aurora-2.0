<?php
namespace Application\Utilities;

use Laminas\Config\Config;
use Laminas\Http\PhpEnvironment\Request;
use Laminas\Permissions\Acl\Acl;
use Laminas\Permissions\Acl\Resource\ResourceInterface;
use Laminas\Mail\Transport\TransportInterface;
use Laminas\Mail\Transport\Smtp as SmtpTransport;
use Laminas\Mail\Transport\SmtpOptions;
use Laminas\Mail\Message;
use Laminas\Mime\Message as MimeMessage;
use Laminas\Mime\Mime;
use Laminas\Mime\Part as MimePart;
use Laminas\ServiceManager\ServiceLocatorInterface;
use Laminas\I18n\Translator\TranslatorAwareTrait;
use Laminas\Mail\Exception\DomainException;
use Laminas\Mail\Exception\InvalidArgumentException;
use Psr\Container\NotFoundExceptionInterface;
use Psr\Container\ContainerExceptionInterface;
use User\Model\User as User;
use \RuntimeException;

class Mailer implements ResourceInterface
{
    use TranslatorAwareTrait;
    const RESOURCE_ID = 'mailService';

    const VERIFICATION = 'verificationMessage';

    const WELCOME = 'welcomeMessage';

    const RESET_PASSWORD = 'resetPasswordMessage';

    const NEWSLETTER = 'newsletterMessage';

    const CONTACT = 'contactUs';

    /**
     *
     * @var $acl Acl
     */
    private $acl;

    /**
     *
     * @var $appSettings \Laminas\Config\Config
     */
    protected $appSettings;

    /**
     *
     * @var $request \Laminas\Http\PhpEnvironment\Request
     */
    protected $request;

    /**
     *
     * @var $hostName string|HTTP_HOST
     */
    protected $hostName;

    /**
     *
     * @var $requestScheme string|http https|REQUEST_SCHEME
     */
    protected $requestScheme;

    public $message;

    public $subject;

    public $user;
    /**
     * 
     * @var \Laminas\ServiceManager\ServiceManager $sm
     */
    protected $sm;
    /**
     *
     * @var \Laminas\Mail\Transport\Smtp
     */
    protected $transport;
    /**
     * 
     * @param Config|null $settings 
     * @param Request|null $request 
     * @param ServiceLocatorInterface $sm 
     * @return void 
     * @throws NotFoundExceptionInterface 
     * @throws ContainerExceptionInterface 
     */
    public function __construct(Config $settings = null, Request $request = null, ServiceLocatorInterface $sm)
    {
        if($sm instanceof ServiceLocatorInterface) 
        {
            $this->sm = $sm;
            //$this->setTranslator($this->sm->get('Translator'));
        }
        $config = $this->sm->get('config');
        if (! empty($settings)) {
            $this->appSettings = $settings;
        }
        if (! empty($request)) {
            $this->request = $request;
            $this->hostName = $this->request->getServer('HTTP_HOST');
            $this->requestScheme = $this->request->getServer('REQUEST_SCHEME');
        }
        $this->setMessage(new Message());
        $transport = new SmtpTransport();
        /** this removes the connection info from the db since we are tracking the
         * db exports in git, which would expose our connection creds
         * see /config/autoload/local.php for connection config options
         */
        $options = new SmtpOptions($config['smtp_options']);
        $transport->setOptions($options);
        // currently only Smtp transport is supported
        $this->setTransport($transport);
    }
    /**
     * 
     * @param TransportInterface $transport 
     * @return void 
     */
    public function setTransport(TransportInterface $transport)
    {
        $this->transport = $transport;
    }
    /**
     * 
     * @param mixed $address 
     * @param mixed $type 
     * @param mixed $token 
     * @return void 
     * @throws DomainException 
     * @throws InvalidArgumentException 
     */
    public function sendMessage($address, $type, $token = null)
    {
        try {
            $message = $this->getMessage();
            $message->addTo($address);
            // This email must match the connection_config key in the options above
            $message->addFrom($this->appSettings->smtpSenderAddress);
            
            switch ($type) {
                case self::VERIFICATION:
                    $message->setSubject($this->appSettings->appName . ' account verification');
                    $this->verificationMessage($address, $message, $token);
                    break;
                case self::WELCOME:

                    break;
                case self::RESET_PASSWORD:
                    $message->setSubject($this->appSettings->appName . ' Password Reset Requested');
                    $this->passwordResetMessage($address, $message, $token);
                    break;
                default:
                    throw new \RuntimeException('Unsupported message type detected!!');
                    break;
            }
        } catch (RuntimeException $e) {
            echo $e->getMessage();
        }
    }
    public function contactUsMessage($fromAddress, $fromName, $formText)
    {
        if (empty($fromAddress)) {
            throw new \RuntimeException('Unknown From address...');
        }
        $textContent = $formText;

        $text = new MimePart($textContent);
        $text->type = Mime::TYPE_TEXT;
        $text->charset = 'utf-8';
        $text->encoding = Mime::ENCODING_QUOTEDPRINTABLE;

        $htmlMarkup = '<p>' . $textContent . '</p>';

        $html = new MimePart($htmlMarkup);
        $html->type = Mime::TYPE_HTML;
        $html->charset = 'utf-8';
        $html->encoding = Mime::ENCODING_QUOTEDPRINTABLE;

        $body = new MimeMessage();
        $body->setParts([
            $text,
            $html
        ]);
        $this->message->setBody($body);
        $this->message->setFrom($fromAddress, $fromName);
        $this->message->addTo($this->appSettings->appContactEmail);
        $this->message->setSubject($this->appSettings->appName . ' Contact Page Submission');
        $contentTypeHeader = $this->message->getHeaders()->get('Content-Type');
        $contentTypeHeader->setType('multipart/alternative');

        try {
            $this->transport->send($this->message);
        } catch (RuntimeException $e) {
            echo $e->getMessage();
        }
    }
    protected function passwordResetMessage($address, $message, $token)
    {
        try {
            //$translator = $this->getTranslator();
            if (empty($token)) {
                throw new \RuntimeException('You must pass a token to send a password reset email!!');
            }
            $textContent = 'Please click the link below to change your password.';

            $text = new MimePart($textContent);
            $text->type = Mime::TYPE_TEXT;
            $text->charset = 'utf-8';
            $text->encoding = Mime::ENCODING_QUOTEDPRINTABLE;

            $htmlMarkup = '<p>' . $textContent . '<br>';
            $format = '<a href="%s://%s/user/password/reset/reset-password?token=%s">Change Password</a>';
            $htmlMarkup .= sprintf($format, $this->requestScheme, $this->hostName, $token);
            $htmlMarkup .= '</p>';

            $html = new MimePart($htmlMarkup);
            $html->type = Mime::TYPE_HTML;
            $html->charset = 'utf-8';
            $html->encoding = Mime::ENCODING_QUOTEDPRINTABLE;

            $body = new MimeMessage();
            $body->setParts([
                $text,
                $html
            ]);
            $message->setBody($body);
            $contentTypeHeader = $message->getHeaders()->get('Content-Type');
            $contentTypeHeader->setType('multipart/alternative');

            try {
                $this->transport->send($message);
            } catch (RuntimeException $e) {
                echo $e->getMessage();
            }
        } catch (RuntimeException $e) {
            echo $e->getMessage();
        }
    }
    protected function verificationMessage($address, $message, $token)
    {
        try {
            $translator = $this->getTranslator();
            if (empty($token)) {
                throw new \RuntimeException('You must pass a token to send a verification email!!');
            }
            $textContent = $translator->translate('Please click the link below to verify your account.');

            $text = new MimePart($textContent);
            $text->type = Mime::TYPE_TEXT;
            $text->charset = 'utf-8';
            $text->encoding = Mime::ENCODING_QUOTEDPRINTABLE;
            $htmlMarkup = '<p>' . $textContent . '<br>';
            $format = '<a href="%s://%s/user/register/verify?token=%s">Verify Account</a>';
            $htmlMarkup .= sprintf($format, $this->requestScheme, $this->hostName, $token);
            $htmlMarkup .= '</p>';

            $html = new MimePart($htmlMarkup);
            $html->type = Mime::TYPE_HTML;
            $html->charset = 'utf-8';
            $html->encoding = Mime::ENCODING_QUOTEDPRINTABLE;

            $body = new MimeMessage();
            $body->setParts([
                $text,
                $html
            ]);
            $message->setBody($body);
            $contentTypeHeader = $message->getHeaders()->get('Content-Type');
            $contentTypeHeader->setType('multipart/alternative');

            try {
                $this->transport->send($message);
            } catch (RuntimeException $e) {
                echo $e->getMessage();
            }
        } catch (RuntimeException $e) {
            echo $e->getMessage();
        }
    }
    public function getResourceId()
    {
        return $this->resourceId;
    }
    /**
     * 
     * @return object \Laminas\Mail\Message $message
     */
    public function getMessage()
    {
        return $this->message;
    }
    /**
     * 
     * @param \Laminas\Mail\Message $message 
     * @return void 
     */
    public function setMessage(Message $message)
    {
        $this->message = $message;
    }
}