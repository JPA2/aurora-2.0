<?php
namespace Store\Controller\Service;
use Interop\Container\ContainerInterface;
use Laminas\ServiceManager\Factory\FactoryInterface;
use Store\Controller\AdminProductsController;
use Store\Form\ProductForm;

class AdminProductsControllerFactory implements FactoryInterface
{
    public function __invoke(ContainerInterface $container, $requestedName, ?array $options = NULL)
    {
        $formManager = $container->get('FormElementManager');
        return new AdminProductsController(
            $container->get('Acl'),
            $container->get('Store\Db\TableGateway\CategoriesTable'),
            $container->get('Store\Db\TableGateway\ProductsTable'),
            $formManager->get('Store\Form\ProductForm')
        );
    }
}