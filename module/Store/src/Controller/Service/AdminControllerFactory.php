<?php
namespace Store\Controller\Service;
use Interop\Container\ContainerInterface;
use Store\Controller\AdminController;

class AdminControllerFactory
{
    public function __invoke(ContainerInterface $container)
    {
        return new AdminController();
    }
}