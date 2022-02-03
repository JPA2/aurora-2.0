<?php
namespace Fedex\Controller;

use Application\Controller\AbstractAdminController;
use Application\Controller\AbstractController;
class IndexController extends AbstractAdminController
{
    public function indexAction()
    {
        return $this->view;
    }
}