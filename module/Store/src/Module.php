<?php
namespace Store;
use Laminas\ModuleManager\Feature\ConfigProviderInterface;
use Laminas\ModuleManager\Feature\ServiceProviderInterface;
use Laminas\ModuleManager\Feature\ControllerProviderInterface;
use Laminas\ModuleManager\Feature\FormElementProviderInterface;
use Laminas\Mvc\MvcEvent;
use Store\Model\Cart;
use Store\Model\Order;
use Store\Model\Category;
use Store\Model\Product;
use Store\Model\ProductByCategory;
use Store\Listener\UploadListener;

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
    public function onBootstrap(MvcEvent $e)
    {
        $app = $e->getApplication();
        $uploadListener = new UploadListener();
        $uploadListener->attach($app->getEventManager(), 10);
    }
    public function getServiceConfig()
    {
        return [
            'factories' => [
                Model\Cart::class => function($container) {
                	return new Cart($container);
                },
                Model\Product::class => function($container) {
                    return new Product($container->get(Db\TableGateway\ProductsTable::class), $container);
                },
                Model\Category::class => function($container) {
                    return new Category($container->get(Db\TableGateway\CategoriesTable::class), $container);
                },
                Model\ProductByCategory::class => function($container) {
                    return new ProductByCategory($container->get(Db\TableGateway\ProductsByCategoryTable::class), $container);
                },
                Model\Order::class => function($container) {
                    return new Order($container->get(Db\TableGateway\OrdersTable::class), $container);
                },
                Db\TableGateway\ProductsTable::class => Db\TableGateway\Service\ProductsTableFactory::class,
                Db\TableGateway\CategoriesTable::class => Db\TableGateway\Service\CategoriesTableFactory::class,
                Db\TableGateway\ProductsByCategoryTable::class => Db\TableGateway\Service\ProductsByCategoryTableFactory::class,
                Db\TableGateway\OrdersTable::class => Db\TableGateway\Service\OrdersTableFactory::class,
            ],
        ];
    }
    public function getControllerConfig()
    {
        return [
            'factories' => [
                Controller\ShippingController::class => Controller\Factory\ShippingControllerFactory::class,
                Controller\IndexController::class => Controller\Factory\IndexControllerFactory::class,
                Controller\AdminController::class => Controller\Factory\AdminControllerFactory::class,
                Controller\AdminProductsController::class => Controller\Factory\AdminProductsControllerFactory::class,
            ],
        ];
    }
    public function getFormElementConfig()
    {
        return [
            'factories' => [
                Form\Fieldset\ProductInfo::class => Form\Fieldset\Factory\ProductInfoFactory::class,
                Form\Fieldset\ProductImages::class => Form\Fieldset\Factory\ProductImagesFactory::class,
            ],
        ];
    }
}