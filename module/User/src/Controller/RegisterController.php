<?php
declare(strict_types=1);
namespace User\Controller;

use Application\Controller\AbstractController;
use Application\Model\Settings;
use Application\Service\Email;
use Laminas\Mail\Message;
use User\Form\UserForm;
use User\Form\LoginForm;
use User\Model\Users;
use User\Filter\RegistrationHash as Filter;

class RegisterController extends AbstractController
{
    /**
     * 
     * @var \User\Model\Users
     */
    protected $usrModel;
    /**
     * @var 
     */
    /**
     * 
     * @param Users $usrModel 
     * @return void 
     */
    public function __construct(Users $usrModel, UserForm $form, Settings $appSettings)
    {
        $this->usrModel = $usrModel;
        $this->form = $form;
        $this->appSettings = $appSettings;
    }
	/**
	 * The default action - show the action
	 */
    public function indexAction()
    {
        $mailService = $this->sm->get(Email::class);        
        if(!$this->appSettings->security->enable_registration) {
           return $this->view; 
        }
        //$form = new UserForm('RegistrationForm', $this->appSettings->toArray());
        //$this->form->get('submit')->setValue('Register');

        if (! $this->request->isPost()) {
            // Initial page load, send them the form
            return $this->view->setVariable('form', $this->form);
        }
        // if weve made it to here then its a post request
        $post = $this->request->getPost();

       //$this->form->setInputFilter($this->formFilters->getInputFilter());
        $this->form->setData($this->request->getPost());
        // Is the posted form data valid? if not send them the form back and the problems 
        // reported by the filters and validators
        if (! $this->form->isValid()) {
            $this->view->setVariable('form', $this->form);
            return $this->view;
        }
        // at this point the form has posted and were ready to kick this off
        $now = new \DateTime();
        // time format is 02/13/1975
        $timeStamp = $now->format($this->appSettings->server->time_format);
        
        // get  the valid data from the form, we need to add to it before user is saved
        $formData = $this->form->getData();
        $value = ['email' => $formData['email'], 'timestamp' => $timeStamp];
        $filter = new Filter();
        $hash = $filter->filter($value);
        $token = $formData['email'] . $hash;
        $formData['regDate'] = $timeStamp;
        $formData['regHash'] = $hash;

        // save the new user, $result should be the new users Id
        $this->usrModel->exchangeArray($formData);
        $result = $this->usrModel->insert($this->usrModel);
        $sendEmail = false;
        if($result > 0) {
            $sendEmail = true;
        }
        if($sendEmail) {
            $this->hostName = $this->request->getServer('HTTP_HOST');
            $this->requestScheme = $this->request->getServer('REQUEST_SCHEME');
            $mailService->sendMessage($formData['email'], Email::VERIFICATION, $token);
        }
    }
    public function verifyAction()
    {
        $token = $this->request->getQuery('token');

        if(!empty($token)) {
        	$position = strpos($token, '$');
        	$email = substr($token, 0, $position);
        	$user = $this->usrModel->fetchByColumn('email', $email);
        	if($user instanceof Users) {
        		$check = password_verify($email.$user->regDate, $user->regHash);
        		if($check) {
        			$user->active = 1;
        			$user->verified = 1;
        			$user->regHash = null;
        			$result = $user->update($user, ['id' => $user->id]);
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