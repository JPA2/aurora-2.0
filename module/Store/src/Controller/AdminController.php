<?php
namespace Store\Controller;
use Application\Controller\AbstractAdminController;
use Laminas\Stdlib\ArrayObject;
use Store\Model\Product;
class AdminController extends AbstractAdminController
{
    public function __construct()
    {
        
    }
    public function overviewAction()
    {
        $this->view->setTerminal(true);
        return $this->view;
    }
    public function indexAction()
    {

    }
}