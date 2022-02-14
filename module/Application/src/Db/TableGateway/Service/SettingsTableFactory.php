<?php
namespace Application\Db\TableGateway\Service;
use Interop\Container\ContainerInterface;
use Laminas\EventManager\EventManager;
use Laminas\ServiceManager\Factory\FactoryInterface;
use Application\Db\TableGateway\SettingsTable;


class SettingsTableFactory implements FactoryInterface
{

    public function __invoke(ContainerInterface $container, $requestedName, ?array $options = NULL)
    {
        return new SettingsTable('settings', $container);
    }
}