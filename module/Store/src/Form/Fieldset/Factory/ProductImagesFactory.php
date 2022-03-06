<?php
namespace Store\Form\Fieldset\Factory;

use Interop\Container\ContainerInterface;
use Laminas\ServiceManager\Factory\FactoryInterface;
use Store\Form\Fieldset\ProductImages;
use Laminas\Db\TableGateway\TableGateway;
use Laminas\Db\Adapter\AdapterInterface;

class ProductImagesFactory implements FactoryInterface
{
    public function __invoke(ContainerInterface $container, $requestedName, ?array $options = null)
    {
        $adapter = $container->get(AdapterInterface::class);
        return new ProductImages(new TableGateway('store_images', $adapter));
    }
}