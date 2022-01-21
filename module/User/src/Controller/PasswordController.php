<?php
namespace User\Controller;

use Application\Controller\AbstractController;
use Application\Utilities\Mailer;
use Laminas\Db\TableGateway\TableGatewayInterface;
use Laminas\Form\Form;
use \RuntimeException;
use \DateTime;
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
            $step = $this->params('step');
            $dateTime = new DateTime('NOW');
            $options = ['db' => $this->userTable];
            $form = new ResetPassword(null, $options);
            switch ($step)
            {
                case 'one':
                    if(!$this->request->isPost()) 
                    {
                        // create and inject the timestamp into form
                        
                        $startTime = $dateTime->format($this->appSettings->timeFormat);
                        $formData = ['resetTimeStamp' => $startTime, 'step' => 'two'];
                        $form->remove('password');
                        $form->remove('conf_password');
                        $form->setAttribute('action', '/user/password/progress/one');
                        $form->setData($formData);
                    }
                    else {
                        
                        $post = $this->request->getPost();
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
                            }
                            else {
                                throw new RuntimeException('Information not saved');
                            }
                            
                        }
                        $form->setData($post);
                        if ($form->isValid())
                        {
                            $form->remove('submit');
                            $data = $form->getData();

                        }
                    }
                    
                    
                    break;
                case 'two':
                    // this will be incoming from email
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
        $step = $this->request->params('step', 'zero');
        $this->debug::dump($step);
    }
}
