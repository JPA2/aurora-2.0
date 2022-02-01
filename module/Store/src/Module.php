<?php
namespace Store;

use Laminas\ModuleManager\Feature\ConfigProviderInterface;
use Laminas\ModuleManager\Feature\ServiceProviderInterface;
use Store\Model\Basket;
use Store\Model\Product;
use Store\Model\Order;

class Module implements ConfigProviderInterface, ServiceProviderInterface
{
    public function getConfig()
    {
        return include __DIR__ . '/../config/module.config.php';
    }
    public function getServiceConfig()
    {
        return [
            'factories' => [
                Model\Basket::class => function($container) {
                	return new Basket();
                },
                Model\Product::class => function($container) {
                    return new Product();
                },
                Model\Order::class => function($container) {
                    return new Order();
                },
            ],
        ];
    }
}