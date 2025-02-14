<?php
declare(strict_types=1);
namespace User\Controller\Factory;

use Interop\Container\ContainerInterface;
use Application\Model\Settings;
use Laminas\Config\Config;
use Laminas\ServiceManager\Factory\FactoryInterface;
use User\Controller\AccountController;
use User\Model\Users;

class AccountControllerFactory implements FactoryInterface
{
    public function __invoke(ContainerInterface $container, $requestedName, ?array $options = null)
    {
        return new AccountController($container->get(Users::class), $container->get(Settings::class));
    }
}
