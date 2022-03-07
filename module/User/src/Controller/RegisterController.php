<?php

namespace User\Controller;

use Application\Controller\AbstractController;
use Application\Event\LogEvents;
use Application\Utils\Mailer;
use Laminas\Validator\Db\NoRecordExists as Validator;
use Laminas\Mail\Message;
use User\Form\UserForm;
use User\Form\LoginForm;
use User\Form\RegistrationForm;
use User\Model\User;
use User\Model\UserTable;
use User\Filter\RegistrationHash as Filter;
use User\Filter\FormFilters;

class RegisterController extends AbstractController
{
    /**
     * 
     * @var \User\Model\UserTable $table
     */
    public $table;
    public function __construct(UserTable $table)
    {
        $this->table = $table;
    }
	/**
	 * The default action - show the action
	 */
    public function indexAction()
    {
        $formFilters = new FormFilters(null, $this->table);
        $sm = $this->getEvent()->getApplication()->getServiceManager();
        $mailer = $sm->get('Application\Utils\Mailer');        
        if($this->appSettings->disableRegistration) {
           return $this->view; 
        }
        $form = new UserForm('RegistrationForm', $this->appSettings->toArray());
        $form->get('submit')->setValue('Register');

        if (! $this->request->isPost()) {
            // Initial page load, send them the form
            return $this->view->setVariable('form', $form);
        }
        // if weve made it to here then its a post request
        $post = $this->request->getPost();

        $form->setInputFilter($formFilters->getInputFilter());
        $form->setData($this->request->getPost());
        // Is the posted form data valid? if not send them the form back and the problems 
        // reported by the filters and validators
        if (! $form->isValid()) {
            $this->view->setVariable('form', $form);
            return $this->view;
        }
        // at this point the form has posted and were ready to kick this off
        $now = new \DateTime();
        // time format is 02/13/1975
        $timeStamp = $now->format($this->appSettings->timeFormat);
        
        // get  the valid data from the form, we need to add to it before user is saved
        $formData = $form->getData();
        $value = ['email' => $formData['email'], 'timestamp' => $timeStamp];
        $filter = new Filter();
        $hash = $filter->filter($value);
        $token = $formData['email'] . $hash;
        $formData['regDate'] = $timeStamp;
        $formData['regHash'] = $hash;
        unset($formData['conf_password']);
        unset($formData['captcha']);
        unset($formData['submit']);
        // save the new user, $result should be the new users Id
        $result = $this->table->insert($formData);
        $sendEmail = false;
        if($result > 0) {
            /**
             * 
             * @var \User\Model\ProfileTable $profileTable
             */
            $profileTable = $this->sm->get('User\Model\ProfileTable');
            $data['userId'] = $result;
            $profileInsertResult = $profileTable->insert($data);
            if(!$profileInsertResult > 0) {
                throw new \RuntimeException('Default Profile data was not saved!!');
            }
            $sendEmail = true;
        }
        if($sendEmail) {
            $this->hostName = $this->request->getServer('HTTP_HOST');
            $this->requestScheme = $this->request->getServer('REQUEST_SCHEME');
            $mailer->sendMessage($formData['email'], Mailer::VERIFICATION, $token);
        }
    }
    public function verifyAction()
    {
        $token = $this->request->getQuery('token');
        //$token = $this->params('token');
        $this->debug::dump($token, '$token');
        if(!empty($token)) {
        	$position = strpos($token, '$');
        	$email = substr($token, 0, $position);
        	$this->debug::dump($email, '$email');
        	$user = $this->table->fetchByColumn('email', $email);
        	if($user instanceof User) {
        		$check = password_verify($email.$user->regDate, $user->regHash);
        		if($check) {
        			$user->active = 1;
        			$user->verified = 1;
        			$user->regHash = null;
        			$result = $user->save();
        			if($result) {
        				$this->view->setVariable('verified', true);
        			}
        			else {
        				$this->view->setVariable('verified', false);
        			}
        		}
        	}
        }
        return $this->view;
    }
}