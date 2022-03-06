<?php
declare(strict_types=1);
namespace Uploader\Adapter\Factory;

use Interop\Container\ContainerInterface;
use Laminas\Log\Logger;
use Laminas\ServiceManager\Factory\FactoryInterface;
use Laminas\Db\Adapter\AdapterInterface;
use Uploader\Adapter\TableGatewayAdapter;
use Uploader\AdapterPluginManager;
use Uploader\Uploader;

class TableGatewayAdapterFactory implements FactoryInterface
{
    public function __invoke(ContainerInterface $container, $requestedName, ?array $options = null)
    {
        /**
         * @var AdapterPluginManager $pluginManager
         */
        $pluginManager = $container->get(AdapterPluginManager::class);
        if($container->has(Logger::class)) {
            $logger = $container->get(Logger::class);
        }
        return new TableGatewayAdapter(
            $container->get(AdapterInterface::class), 
            $container->get('config'),
            $logger ?? null
        );
    }
}