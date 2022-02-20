<?php
namespace User\Controller;
use User\Model\UserTable;
use Application\Form\SettingsForm;
use \RuntimeException;
use Laminas\Json\Json;
use Laminas\View\Model\JsonModel;
use Application\Controller\AbstractAdminController;

class AdminController extends AbstractAdminController
{
    
    public function __construct(UserTable $table)
    {
        $this->table = $table;
    }

    public function indexAction()
    {
        //var_dump($this->user);
    }
    public function widgetAction()
    {
        //$this->view = new JsonModel();
        try {
            $userName = $this->params('userName');
            $hasMessage = false;
            if(!empty($userName)) {
                $this->fm = $this->plugin('flashMessenger');
                $this->fm->addSuccessMessage('User ' . $userName . ' was successfully deleted!!');
                $hasMessage = true;
            }
           /// $this->view->setVariable('hasMessage', $hasMessage);
            $this->view->setVariable('users', $this->table->loadMemberContext());

            return $this->view;
        } catch (RuntimeException $e) {
            
        }
    }
}