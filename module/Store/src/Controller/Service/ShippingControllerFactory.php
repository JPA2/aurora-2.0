<?php
namespace Store\Controller\Service;

use Application\Utilities\Debug;
use Interop\Container\ContainerInterface;
use Store\Controller\ShippingController;
class ShippingControllerFactory
{

    public function __invoke(ContainerInterface $container)
    {
        $acl = $container->get('Acl');
        $shippingManager = $container->get('Store\Shipping\ShippingManager');
        return new ShippingController($acl, $shippingManager);
    }
}