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
        $config = $container->get('config');
        return new Settings($config['app_settings']);
    }
}