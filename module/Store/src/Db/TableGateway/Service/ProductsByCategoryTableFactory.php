<?php
namespace Store\Db\TableGateway\Service;
use Interop\Container\ContainerInterface;
use Laminas\EventManager\EventManager;
use Laminas\ServiceManager\Factory\FactoryInterface;
use Store\Db\TableGateway\ProductsByCategoryTable;

class ProductsByCategoryTableFactory implements FactoryInterface
{

    public function __invoke(ContainerInterface $container, $requestedName, ?array $options = NULL)
    {
        return new ProductsByCategoryTable('store_products_by_category_lookup', $container->get(EventManager::class));
    }
}