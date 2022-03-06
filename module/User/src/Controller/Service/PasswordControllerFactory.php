<?php
namespace User\Controller\Service;

use Interop\Container\ContainerInterface;
use Laminas\ServiceManager\Factory\FactoryInterface;
use User\Controller\PasswordController;

class PasswordControllerFactory implements FactoryInterface
{

    public function __invoke(ContainerInterface $container, $requestedName, ?array $options = NULL)
    {
        $userTable = $container->get('User\Model\UserTable');
        return new PasswordController($userTable);
    }
}