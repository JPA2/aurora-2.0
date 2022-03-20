<?php
declare(strict_types=1);
namespace User\Model\Factory;

use Interop\Container\ContainerInterface;
use Laminas\EventManager\EventManager;
use Laminas\Config\Config;
use Laminas\ServiceManager\Factory\FactoryInterface;
use User\Model\Users;

class UsersFactory implements FactoryInterface
{
    public function __invoke(ContainerInterface $container, $requestedName, ?array $options = null)
    {
        $config = new Config($container->get('Config'));
        return new Users($config->db->users_table_name, $container->get(EventManager::class), $config);
    }
}