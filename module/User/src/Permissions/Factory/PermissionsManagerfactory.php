<?php
declare(strict_types=1);
namespace User\Permissions\Factory;

use Interop\Container\ContainerInterface;
use Laminas\Config\Config;
use Laminas\EventManager\EventManager;
use Laminas\Permissions\Acl\Acl;
use Laminas\ServiceManager\Factory\FactoryInterface;
use User\Permissions\PermissionsManager;
use User\Model\Roles;

class PermissionsManagerFactory implements FactoryInterface
{
    public function __invoke(ContainerInterface $container, $requestedName, ?array $options = null)
    {
        $config = new Config($container->get('Config'));
        return new PermissionsManager(
            new Acl(), 
            new Roles(
                $config->db->user_roles_table_name, 
                $container->get(EventManager::class), 
                $config), 
            $config
        );
    }
}