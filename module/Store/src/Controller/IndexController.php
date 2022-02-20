<?php
declare(strict_types=1);
namespace Store\Controller;
use Application\Controller\AbstractController;
use Store\Model\Cart;
use Store\Model\Product;

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
        $cartData = [];
        $products = $this->sm->get(Product::class);
        $allProducts = $products->fetchAll();
        foreach($allProducts as $entry) {
            $cartData[] = $entry->getArrayCopy();
        }
        $this->cart->items = $cartData;
        $exit = '';
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