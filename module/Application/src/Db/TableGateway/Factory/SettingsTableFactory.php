<?php

declare(strict_types=1);
namespace Application\Db\TableGateway\Factory;

use Interop\Container\ContainerInterface;
use Laminas\ServiceManager\Factory\FactoryInterface;
use Application\Db\TableGateway\SettingsTable;

class SettingsTableFactory implements FactoryInterface
{

    public function __invoke(ContainerInterface $container, $requestedName, ?array $options = NULL)
    {
        return new SettingsTable('settings', $container);
    }
}