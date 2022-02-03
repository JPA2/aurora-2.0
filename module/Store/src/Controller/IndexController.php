<?php
declare(strict_types=1);
namespace Store\Controller;
use Application\Controller\AbstractController;
use Store\Model\Cart;

class IndexController extends AbstractController
{
    /**
     * 
     * @var \Store\Model\Cart $cart
     */
    public $cart;
    public function __construct(Cart $cart)
    {
        $this->cart = $cart;
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