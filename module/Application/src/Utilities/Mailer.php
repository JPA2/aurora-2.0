<?php
namespace Application\Utilities;

use Laminas\Config\Config;
use Laminas\Http\PhpEnvironment\Request;
use Laminas\Permissions\Acl\Acl;
use Application\Model\SettingsTable;
use User\Model\User as User;
use Laminas\Permissions\Acl\Resource\ResourceInterface;

use Laminas\Mail\Transport\Smtp as SmtpTransport;
use Laminas\Mail\Transport\SmtpOptions;
use Laminas\Mail\Message;
use Laminas\Mime\Message as MimeMessage;
use Laminas\Mime\Mime;
use Laminas\Mime\Part as MimePart;
/**
 *
 * smtp-relay.gmail.com on port 587.
 */

/**
 *
 * @author Joey Smith
 *        
 */
class Mailer implements ResourceInterface
{
    const RESOURCE_ID = 'mailService';
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
    public $user;
    /**
     * 
     * @var \Laminas\Mail\Transport\Smtp
     */
    protected $transport;

    public function __construct(Config $settings = null, Request $request = null)
    {
        if(!empty($settings)) {
            $this->appSettings = $settings;
        }
        if(!empty($request)) {
            $this->request = $request;
            $this->hostName = $this->request->getServer('HTTP_HOST');
            $this->requestScheme = $this->request->getServer('REQUEST_SCHEME');
        }
        $transport = new SmtpTransport();
        
        $options   = new SmtpOptions([
            'name' => 'webinertia.net',
            'host' => 'smtp-relay.gmail.com',
            'port' => '587',
            'connection_class'  => 'login',
            'connection_config' => [
                'username' => $this->appSettings->smtpSenderAddress,
                'password' => $this->appSettings->smtpSenderPasswd,
                'ssl' => 'tls',
            ],
        ]);
        $transport->setOptions($options);
       // $transport->send($message);
        
    }
    public function sendMessage($address, Message $message)
    {
        $message->addTo($address);
        // This email must match the connection_config key in the options below
        $message->addFrom($this->appSettings->smtpSenderAddress);
        $message->setSubject($this->appSettings->appName . ' account verification');
    }
    protected function verificationMessage()
    {
        $textContent = 'Please click the link below to verify your account.';
        
        $text = new MimePart($textContent);
        $text->type = Mime::TYPE_TEXT;
        $text->charset = 'utf-8';
        $text->encoding = Mime::ENCODING_QUOTEDPRINTABLE;
        
        $htmlMarkup = '';
        $format = '<a href="%s://%s/user/register/verify?token=%s">Verify account</a>';
        $htmlMarkup .= sprintf( );
        
        $html = new MimePart($htmlMarkup);
        $html->type = Mime::TYPE_HTML;
        $html->charset = 'utf-8';
        $html->encoding = Mime::ENCODING_QUOTEDPRINTABLE;
        
        $body = new MimeMessage();
        $body->setParts([$text, $html]);
        
        $message = new Message();
        $message->setBody($body);
        
        $contentTypeHeader = $message->getHeaders()->get('Content-Type');
        $contentTypeHeader->setType('multipart/alternative');
        
        /*
         * 'Please click <a href="'.$this->requestScheme.'://'. $this->hostName .'/user/register/verify/?token='.$hash.'">here</a>'
         */
        
    }
    public function getResourceId()
    {
        return $this->resourceId;
    }
    
}