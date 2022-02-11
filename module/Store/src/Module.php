<?php
namespace Store;
use Laminas\ModuleManager\Feature\ConfigProviderInterface;
use Laminas\ModuleManager\Feature\ServiceProviderInterface;
use Laminas\ModuleManager\Feature\ControllerProviderInterface;
use Laminas\ModuleManager\Feature\FormElementProviderInterface;
use Store\Model\Cart;
use Store\Model\Order;
use Store\Model\Category;
use Store\Model\Product;

class Module implements 
ConfigProviderInterface, 
ServiceProviderInterface,
ControllerProviderInterface,
FormElementProviderInterface
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
                Model\Product::class => function($container) {
                    return new Product($container->get(Db\TableGateway\ProductsTable::class));
                },
                Model\Category::class => function($container) {
                    return new Category($container->get(Db\TableGateway\CategoriesTable::class));
                },
                Model\Category::class => function($container) {
                    return new Order($container->get(Db\TableGateway\OrdersTable::class));
                },
                Db\TableGateway\ProductsTable::class => Db\TableGateway\Service\ProductsTableFactory::class,
                Db\TableGateway\CategoriesTable::class => Db\TableGateway\Service\CategoriesTableFactory::class,
                Db\TableGateway\OrdersTable::class => Db\TableGateway\Service\OrdersTableFactory::class,
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
    public function getFormElementConfig()
    {
        return [
            'factories' => [
                Form\Fieldset\ProductInfo::class => Form\Fieldset\Factory\ProductInfoFactory::class,
            ],
        ];
    }
}