<?php
declare(strict_types=1);
namespace User\Form\Fieldset\Factory;

use Application\Model\Settings;
use Interop\Container\ContainerInterface;
use Laminas\Authentication\AuthenticationService;
use Laminas\ServiceManager\Factory\FactoryInterface;
use User\Form\UserForm;
use User\Model\Users;
use User\Permissions\PermissionsManager;

class UserFormFactory implements FactoryInterface
{
    public function __invoke(ContainerInterface $container, $requestedName, ?array $options = null)
    {
        return new UserForm(
            $container->get(AuthenticationService::class),
            $container->get(PermissionsManager::class),
            $container->get(Users::class),
            $container->get(Settings::class)
        );
    }
}