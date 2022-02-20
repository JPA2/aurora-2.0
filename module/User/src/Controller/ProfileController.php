<?php
namespace User\Controller;

use Application\Controller\AbstractController;
use User\Model\UserTable;
use User\Form\EditProfileForm;
use \RuntimeException;
use Laminas\Filter\File\RenameUpload;
use Laminas\Form\FormInterface;
use User\Form\LoginForm;
use Laminas\Filter\BaseName;
use Laminas\Db\RowGateway\RowGatewayInterface;

class ProfileController extends AbstractController
{
    protected $profileTable;
    public function __construct(UserTable $table)
    {
        $this->table = $table;
    }
    public function _init()
    {
       // var_dump($this->getEvent()->getApplication()->getServiceManager());
        $sm = $this->getEvent()->getApplication()->getServiceManager();
        $this->profileTable = $sm->get('User\Model\ProfileTable');
        
        if(!$this->authenticated) {
            $this->redirect()->toUrl('/user/login');
        }
    }
    public function viewAction()
    {
        try {
            $userName = $this->params()->fromRoute('userName');
            $requestedUser = $this->table->fetchByColumn('userName', !empty($userName) ? $userName : $this->user->userName);
            $profileData = $this->profileTable->fetchByColumn('userId', $requestedUser->id);
            $profileData->userName = $requestedUser->userName;
            $previous = substr($this->referringUrl, -5);
            if($previous === 'login') {
                $this->logger->info('User ' . $this->user->userName . ' logged in.', [
                    'userId' => $this->user->id,
                    'userName' => $this->user->userName,
                    'firstName' => ! empty($profileData->firstName) ? $profileData->firstName : null,
                    'lastName' => ! empty($profileData->lastName) ? $profileData->lastName : null
                ]);
            }
            //var_dump($profileData);
            return $this->view->setVariable('data', $profileData);

        } catch (RuntimeException $e) {
            //$this->logger->err($e->getMessage());
        }
    }

    public function editProfileAction()
    {
        // Create the form object
        $form = new EditProfileForm();
        $userName = $this->params()->fromRoute('userName');
        $user = $this->table->fetchByColumn('userName', $this->params()->fromRoute('userName'));
        $profile = $this->profileTable->fetchByColumn('userId', $user->id);
        $form->bind($profile);
        if (! $this->request->isPost()) {
            return [
                'form' => $form
            ];
        }
        // is this post?
        if ($this->request->isPost()) {
            // We must merge the $_POST and $_FILES because Laminas\Http\Request remaps the $_FILES array
            $merged = array_merge_recursive($this->request->getPost()->toArray(), $this->request->getFiles()->toArray());
            unset($merged['submit']);
            /**
             * setting this data should hydrate the bound $profile rowgateway object
             */
            $form->setData($merged);
            if ($form->isValid()) {
                $profile = $form->getData();
                // we should get a hydated rowgateway object here
                //var_dump($profile);
                // we will need this to rename and move the uploaded file
                $fileFilter = new RenameUpload();
                // set it to randomize the file name
                $fileFilter->setRandomize(true);
                // notice this sets the path for directory and the base file name used for all profile Images
                $fileFilter->setTarget($this->basePath . '/public/modules/user/profile/profileImages/profileImage');
                // maintain the original file extension
                $fileFilter->setUseUploadExtension(true);
                // perform the move and rename on the file
                $filtered = $fileFilter->filter($profile->profileImage);
                $baseNameFilter = new BaseName();
                // grab just the file name so it can be stored in the profile table
                $baseName = $baseNameFilter->filter($filtered['tmp_name']);
                //var_dump($baseName);
                $profile->profileImage = $baseName;
                try {
                    //$profile true
                    $result = $this->profileTable->update($profile->toArray(), ['userId' => $profile->userId]);
                } catch (RuntimeException $e) {
                    echo $e->getMessage();
                }
                // $profile->populate($merged, true);
            }
        }
        $this->view->setVariable('form', $form);
        return $this->view;
    }
}