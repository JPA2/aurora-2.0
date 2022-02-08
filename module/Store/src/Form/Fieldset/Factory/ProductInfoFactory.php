<?php
namespace Store\Form\Fieldset\Factory;
use Interop\Container\ContainerInterface;
use Laminas\ServiceManager\Factory\FactoryInterface;
use Store\Db\TableGateway\CategoriesTable;
use Store\Form\Fieldset\ProductInfo;
class ProductInfoFactory implements FactoryInterface
{
    public function __invoke(ContainerInterface $container, $requestedName, ?array $options = null)
    {
        return new ProductInfo($container->get('Store\Db\TableGateway\CategoriesTable'));
    }
}