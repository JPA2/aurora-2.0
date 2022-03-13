<?php
declare(strict_types=1);
namespace User\Controller\Factory;

use Interop\Container\ContainerInterface;
use Laminas\Db\Sql\Select;
use Laminas\ServiceManager\Factory\FactoryInterface;
use Laminas\Paginator\Paginator;
use Laminas\Paginator\Adapter\LaminasDb\DbSelect;
use Laminas\paginator\AdapterPluginManager;
use User\Controller\WidgetController;
use User\Model\UserTable;
use Laminas\Db\Adapter\AdapterInterface;

class WidgetControllerFactory implements FactoryInterface
{
    public function __invoke(ContainerInterface $container, $requestedName, ?array $options = NULL)
    {
        return new WidgetController();
    }
}