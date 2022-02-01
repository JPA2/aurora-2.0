<?php
declare(strict_types=1);
namespace Store\Controller;
use Application\Controller\AbstractController;
use Store\Model\Basket;

class IndexController extends AbstractController
{
    public $basket;
    public function __construct(Basket $basket)
    {
        $this->basket = $basket;
    }
    public function indexAction()
    {
        return $this->view;
    }
    public function viewOrderAction()
    {
        return $this->view;
    }
    public function addItemAction()
    {
       return $this->view;
    }
}