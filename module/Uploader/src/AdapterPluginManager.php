<?php
declare(strict_types=1);
namespace Uploader;

use Laminas\ServiceManager\AbstractPluginManager;
use Uploader\Adapter\AdapterInterface;
use Uploader\Adapter\TableGatewayAdapter;
use Uploader\Adapter\Factory\TableGatewayAdapterFactory;
use function get_class;
use function gettype;
use function is_object;
use function sprintf;

class AdapterPluginManager extends AbstractPluginManager
{
    protected $factories = [
        \Uploader\Adapter\TableGatewayAdapter::class => \Uploader\Adapter\Factory\TableGatewayAdapterFactory::class,
    ];
        /** @var string */
    protected $instanceOf = AdapterInterface::class;
    
    // public function configure(array $config)
    // {
    //     if (isset($config['services'])) {
    //         /** @psalm-suppress MixedAssignment */
    //         foreach ($config['services'] as $service) {
    //             $this->validate($service);
    //         }
    //     }
    //     parent::configure($config);
    //     return $this;
    // }
}