<?php
declare(strict_types=1);
namespace Application\Model\Factory;

use Application\Model\Settings;
use Interop\Container\ContainerInterface;
use Laminas\Config\Config;
use Laminas\EventManager\EventManager;
use Laminas\ServiceManager\Factory\FactoryInterface;

class SettingsFactory implements FactoryInterface
{
    public function __invoke(ContainerInterface $container, $requestedName, ?array $options = null)
    {
        $config = new Config($container->get('Config'));
        return new Settings($config->db->settings_table_name, $container->get(EventManager::class), $config);
    }
}