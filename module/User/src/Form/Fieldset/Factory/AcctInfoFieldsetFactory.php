<?php
declare(strict_types=1);
namespace User\Form\Fieldset\Factory;

use Interop\Container\ContainerInterface;
use Laminas\ServiceManager\Factory\FactoryInterface;
use User\Form\Fieldset\AcctInfoFieldset;

class AcctInfoFieldsetFactory implements FactoryInterface
{
    public function __invoke(ContainerInterface $container, $requestedName, ?array $options = null)
    {
        return new AcctInfoFieldset();
    }
}