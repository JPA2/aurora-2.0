<?php
namespace Store;
use Laminas\Db\Adapter\AdapterInterface;
use Laminas\ModuleManager\Feature\ConfigProviderInterface;
use Laminas\ModuleManager\Feature\ServiceProviderInterface;
use Laminas\ModuleManager\Feature\ControllerProviderInterface;
use Laminas\Db\ResultSet\ResultSet;
use Laminas\Db\TableGateway\TableGateway;
use Store\Model\Cart;
use Store\Db\TableGateway\ProductsTable;
use Store\Db\TableGateway\OrdersTable;
use Store\Db\TableGateway\CategoriesTable;
use Store\Db\RowGateway\Product;
use Store\Db\RowGateway\Order;
use Store\Db\RowGateway\Category;
use Store\Controller\AdminController;
use Store\Controller\AdminProductsController;
use Store\Controller\IndexController;
use Store\Controller\Service\IndexControllerFactory;
use Store\Controller\Service\AdminControllerFactory;
use Store\Controller\Service\AdminProductsControllerFactory;
use Store\Controller\Service\ShippingControllerFactory;

class Module implements 
ConfigProviderInterface, 
ServiceProviderInterface,
ControllerProviderInterface
{
    public function getConfig()
    {
        return include __DIR__ . '/../config/module.config.php';
    }
    public function getServiceConfig()
    {
        return [
            'factories' => [
                Model\Cart::class => function($container) {
                	return new Cart($container);
                },
                Db\TableGateway\ProductsTable::class => function($container) {
                    $dbAdapter = $container->get(AdapterInterface::class);
                    $resultSetPrototype = new ResultSet();
                    $resultSetPrototype->setArrayObjectPrototype(new Product('id','store_products', $dbAdapter));
                    return new Db\TableGateway\ProductsTable('store_products', $dbAdapter, null, $resultSetPrototype);
                },
                Db\TableGateway\ProductReviewsTable::class => function($container) {
                    $dbAdapter = $container->get(AdapterInterface::class);
                    $resultSetPrototype = new ResultSet();
                    $resultSetPrototype->setArrayObjectPrototype(new Product('id','store_products_reviews', $dbAdapter));
                    return new Db\TableGateway\ProductReviewsTable('store_products_reviews', $dbAdapter, null, $resultSetPrototype);
                },
                Db\TableGateway\OrdersTable::class => function($container) {
                    $dbAdapter = $container->get(AdapterInterface::class);
                    $resultSetPrototype = new ResultSet();
                    $resultSetPrototype->setArrayObjectPrototype(new Product('id','store_orders', $dbAdapter));
                    return new Db\TableGateway\OrdersTable('store_orders', $dbAdapter, null, $resultSetPrototype);
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
    public function getControllerConfig()
    {
        return [
            'factories' => [
                Controller\ShippingController::class => Controller\Service\ShippingControllerFactory::class,
                Controller\IndexController::class => Controller\Service\IndexControllerFactory::class,
                Controller\AdminController::class => Controller\Service\AdminControllerFactory::class,
                Controller\AdminProductsController::class => Controller\Service\AdminProductsControllerFactory::class,
            ],
        ];
    }
}