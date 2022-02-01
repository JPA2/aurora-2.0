<?php
namespace Store;

use Laminas\ModuleManager\Feature\ConfigProviderInterface;
use Laminas\ModuleManager\Feature\ServiceProviderInterface;
use Laminas\Db\ResultSet\ResultSet;
use Store\Model\Basket;
use Store\Db\TableGateway\ProductTable;
use Store\Db\TableGateway\OrderTable;
use Store\Db\TableGateway\CategoriesTable;
use Store\Db\RowGateway\Product;
use Store\Db\RowGateway\Order;
use Store\Db\RowGateway\Category;

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
                Db\TableGateway\ProductTable::class => function($container) {
                    $dbAdapter = $container->get(AdapterInterface::class);
                    $resultSetPrototype = new ResultSet();
                    $resultSetPrototype->setArrayObjectPrototype(new Product('id','store_products', $dbAdapter));
                    return new Db\TableGateway\ProductTable('store_products', $dbAdapter, null, $resultSetPrototype);
                },
                Db\TableGateway\OrderTable::class => function($container) {
                    $dbAdapter = $container->get(AdapterInterface::class);
                    $resultSetPrototype = new ResultSet();
                    $resultSetPrototype->setArrayObjectPrototype(new Product('id','store_orders', $dbAdapter));
                    return new Db\TableGateway\OrderTable('store_orders', $dbAdapter, null, $resultSetPrototype);
                },
                Db\TableGateway\CategoriesTable::class => function($container) {
                    $dbAdapter = $container->get(AdapterInterface::class);
                    $resultSetPrototype = new ResultSet();
                    $resultSetPrototype->setArrayObjectPrototype(new Product('id','store_categories', $dbAdapter));
                    return new Db\TableGateway\CategoriesTable('store_categories', $dbAdapter, null, $resultSetPrototype);
                }
            ],
        ];
    }
}