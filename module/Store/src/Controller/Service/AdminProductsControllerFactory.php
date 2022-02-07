<?php
namespace Store\Controller\Service;
use Interop\Container\ContainerInterface;
use Store\Controller\AdminProductsController;

class AdminProductsControllerFactory
{
    public function __invoke(ContainerInterface $container)
    {
        return new AdminProductsController();
    }
}