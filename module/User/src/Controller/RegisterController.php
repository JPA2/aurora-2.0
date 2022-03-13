<?php
declare(strict_types=1);
namespace User\Controller;

use Application\Controller\AbstractController;
use Application\Utils\Mailer;
use Laminas\Validator\Db\NoRecordExists as Validator;
use Laminas\Mail\Message;
use User\Form\UserForm;
use User\Form\LoginForm;
use User\Form\RegistrationForm;
use User\Model\Users;
use User\Filter\RegistrationHash as Filter;
use User\Filter\FormFilters;

class RegisterController extends AbstractController
{
    /**
     * 
     * @var \User\Model\Users
     */
    public $usrModel;
    public function __construct(Users $usrModel)
    {
        $this->usrModel = $usrModel;
    }
	/**
	 * The default action - show the action
	 */
    public function indexAction()
    {
        $formFilters = new FormFilters(null, $this->usrModel);
        $sm = $this->getEvent()->getApplication()->getServiceManager();
        $mailer = $sm->get(Mailer::class);        
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
        $this->usrModel->exchangeArray($formData);
        $result = $this->usrModel->insert($this->usrModel);
        $sendEmail = false;
        if($result > 0) {
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