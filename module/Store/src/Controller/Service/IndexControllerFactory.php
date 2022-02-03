<?php
namespace Store\Controller\Service;
use Interop\Container\ContainerInterface;
use Store\Controller\IndexController;
use Store\Model\Cart;

class IndexControllerFactory
{

    public function __invoke(ContainerInterface $container)
    {
        $cart = $container->get('Store\Model\Cart');
        return new IndexController($cart);
    }
}