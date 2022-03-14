<?php
declare(strict_types=1);
namespace Application\Controller\Factory;

use Application\Controller\TestController;
use Application\Model\Settings;
use User\Model\Users;
use Interop\Container\ContainerInterface;
use Laminas\ServiceManager\Factory\FactoryInterface;

class TestControllerFactory implements FactoryInterface
{
    public function __invoke(ContainerInterface $container, $requestedName, ?array $options = null)
    {
        return new TestController(
            $container->get(Users::class),
            $container->get(Settings::class),
            $container->get('config')
        );
    }
}