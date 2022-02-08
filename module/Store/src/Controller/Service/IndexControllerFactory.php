<?php
namespace Store\Controller\Service;
use Interop\Container\ContainerInterface;
use Laminas\ServiceManager\Factory\FactoryInterface;
use Store\Controller\IndexController;
use Store\Model\Cart;

class IndexControllerFactory implements FactoryInterface
{

    public function __invoke(ContainerInterface $container, $requestedName, ?array $options = NULL)
    {
        $cart = $container->get('Store\Model\Cart');
        return new IndexController($cart);
    }
}