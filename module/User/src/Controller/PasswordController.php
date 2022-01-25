<?php
namespace User\Controller;

use Application\Controller\AbstractController;
use Application\Utilities\Mailer;
use Laminas\Db\TableGateway\TableGatewayInterface;
use Laminas\Form\Form;
use \RuntimeException;
use \DateTime;
use PhpParser\Node\Stmt\TryCatch;
use User\Form\ResetPassword;
use User\Model\User;
use User\Filter\RegistrationHash;

class PasswordController extends AbstractController
{

    /**
     *
     * @var User\Model\UserTable $userTable
     */
    protected $userTable;

    public function __construct(TableGatewayInterface $table)
    {
        $this->userTable = $table;
        // Debug::dump($this->userTable, __CLASS__.'::'.__LINE__);
    }

    public function resetAction()
    {
        /*
         * TODO: create timestamp representing now
         * TODO: store now stamp in the db
         * TODO: add 86,400 seconds to that stamp and save it as expire time
         * TODO: write reset email method in Utilities\Mailer to send reset password email with link and token
         * TODO: use a /:step param to divide workflow
         * TODO: create form for resetting password
         * testing commit
         */
        try {
            //$mailer = $this->sm->get('Application\Utilities\Mailer');
            $step = $this->params('step', 'zero');
            $this->logger->log(6, "$step");
            $dateTime = new DateTime('NOW');
            $options = ['db' => $this->userTable, 'enableCaptcha' => $this->appSettings->enableCaptcha];
            $form = new ResetPassword(null, $options);
            $this->view->setVariable('showForm', true);
            switch ($step)
            {
                case 'submit-email':
                    $startTime = $dateTime->format($this->appSettings->timeFormat);
                    $formData = ['resetTimeStamp' => $startTime, 'step' => 'two'];
                    $form->remove('password');
                    $form->remove('conf_password');
                    $form->setAttribute('action', '/user/password/reset/send-email');
                    $form->setData($formData);
                    break;
                case 'send-email':
                    if($this->request->isPost())
                    {
                        $this->view->setVariable('showForm', false);
                        $form->setValidationGroup('email', 'resetTimeStamp');
                        $post = $this->request->getPost();
                        $form->setData($post);
                        if($form->isValid()) {
                            $data = $form->getData();
                        }
                        $user = $this->userTable->fetchByColumn('email', $post['email']);

                        if ($user instanceof User)
                        {
                            $filter = new RegistrationHash();
                            $hash = $filter->filter(['email' => $post['email'], 'timestamp' => $post['resetTimeStamp']]);
                            $user->resetTimeStamp = $post['resetTimeStamp'];
                            $user->resetHash = $hash;
                            if($user->save())
                            {
                                // send reset email 
                                /**
                                 * @var Application\Utilities\Mailer $mailer
                                 */
                                $mailer = $this->sm->get('Application\Utilities\Mailer');
                                try {
                                    //code...
                                    $mailer->sendMessage($post['email'], Mailer::RESET_PASSWORD, $hash);
                                } catch (\Throwable $th) {
                                    $this->logger->log(2, $th->getMessage());
                                }
                                // redirect
                                $this->logger->log(6, 'Password change request', $user->getLogData());
                            }
                            else {
                                throw new RuntimeException('Information not saved');
                            }
                        }
                    }
                    else {
                        //TODO: test this part of routine
                        // condition is when you have just submitted your email to be sent a link to reset
                        $this->flashMessenger()->addInfoMessage('You have been sent a reset link via the submitted email, please click the provided link to rest your password');
                        $this->redirect()->toRoute('password', ['action' => 'progress', 'step' => 'submit-email-complete']);
                    }
                    break;
                case 'reset-password':
                    $token = $this->request->getQuery('token');
                    try {
                        $user = $this->userTable->fetchByColumn('resetHash', $token);
                    } catch (\Throwable $th) {
                        $this->logger->log(
                            5,
                            'Unknown user from IP:' . $this->request->getServer('REMOTE_ADDR') . ' attempted to reset password with invalid or expired token'
                        );
                    }
                    
                    $dateTime = new DateTime('NOW');
                    if(!$this->request->isPost())
                    {
                        $this->view->setVariable('showForm', true);
                        $form->remove('email');
                        $form->setAttribute(
                            'action',
                            '/user/password/reset/reset-password?token='.$token
                        );
                        $startTime = DateTime::createFromFormat($this->appSettings->timeFormat, $user->resetTimeStamp);
                        $limit = DateTime::createFromFormat(
                                            $this->appSettings->timeFormat, 
                                            $dateTime->format($this->appSettings->timeFormat)
                                        );
                        $interval = $startTime->diff($limit);
                        if($interval->d > 0)
                        {
                            $this->flashmessenger()->addErrorMessage('Your reset link has expired, please submit your email to send a valid reset link');
                            return $this->redirect()->toRoute('password', ['action' => 'reset', 'step' => 'submit-email']);
                        }
                    }
                    else {
                        $form->setInputFilter($form->addInputFilter());
                        $form->setValidationGroup('password', 'conf_password');
                        $post = $this->request->getPost();
                        
                        $form->setData($post);
                        if($form->isValid())
                        {
                            $data = $form->getData();
                            $user->password = $data['password'];
                            $user->resetTimeStamp = null;
                            $user->resetHash = null;
                            if($user->save())
                            {
                                $this->flashmessenger()->addSuccessMessage('Your password has been succesfully updated');
                                return $this->redirect()->toRoute('user', ['action' => 'login']);
                            } else {
                                $this->flashmessenger()->addErrorMessage('Your password was not updated due to an error processing your request');
                                return $this->redirect()->toRoute('password', ['action' => 'progress', 'step' => 'failure']);
                            }
                        }
                    }
                break;
            }
            $this->view->setVariable('form', $form);
            return $this->view;
            //$this->debug::dump();
            if ($step !== 'two') {
                throw new RuntimeException('Step is not two');
            }
        } catch (RuntimeException $e) {
            $this->logger->log(2, $e->getMessage());
        }
    }
    public function progressAction()
    {
        $step = $this->params('step');
        
        return $this->view;
    }
}
