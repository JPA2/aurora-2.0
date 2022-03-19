<?php
declare(strict_types=1);
namespace User\Form\Fieldset\Factory;

use Application\Model\Settings;
use Interop\Container\ContainerInterface;
use Laminas\ServiceManager\Factory\FactoryInterface;
use User\Form\UserForm;
use User\Permissions\PermissionsManager;

class UserFormFactory implements FactoryInterface
{
    public function __invoke(ContainerInterface $container, $requestedName, ?array $options = null)
    {
        return new UserForm(
            $container->get(PermissionsManager::class),
            $container->get(Settings::class)
        );
    }
}