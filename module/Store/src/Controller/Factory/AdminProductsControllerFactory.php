<?php
declare(strict_types=1);
namespace Store\Controller\Factory;

use Interop\Container\ContainerInterface;
use Laminas\Permissions\Acl\Acl;
use Laminas\ServiceManager\Factory\FactoryInterface;
use Store\Controller\AdminProductsController;
use Store\Db\TableGateway\CategoriesTable;
use Store\Form\ProductForm;
use Store\Model\Product;
use Store\Db\TableGateway\ProductsTable;

class AdminProductsControllerFactory implements FactoryInterface
{
    public function __invoke(ContainerInterface $container, $requestedName, ?array $options = NULL)
    {
        $formManager = $container->get('FormElementManager');
        return new AdminProductsController(
            $container->get(Acl::class),
            $container->get(CategoriesTable::class),
            $container->get(ProductsTable::class),
            $container->get(Product::class),
            $formManager->get(ProductForm::class)
        );
    }
}