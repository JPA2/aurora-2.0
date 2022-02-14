<?php
namespace Store\Db\TableGateway\Service;
use Interop\Container\ContainerInterface;
use Laminas\ServiceManager\Factory\FactoryInterface;
use Store\Db\TableGateway\CategoriesTable;


class CategoriesTableFactory implements FactoryInterface
{

    public function __invoke(ContainerInterface $container, $requestedName, ?array $options = NULL)
    {
        return new CategoriesTable('store_categories', $container);
    }
}