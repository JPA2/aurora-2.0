<?php
namespace Store\Controller\Service;
use Interop\Container\ContainerInterface;
use Store\Controller\IndexController;
use Store\Model\Basket;

class IndexControllerFactory
{

    public function __invoke(ContainerInterface $container)
    {
        $basket = $container->get('Store\Model\Basket');
        return new IndexController($basket);
    }
}