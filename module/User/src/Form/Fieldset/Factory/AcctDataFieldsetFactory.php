<?php
declare(strict_types=1);
namespace User\Form\Fieldset\Factory;

use Interop\Container\ContainerInterface;
use Laminas\ServiceManager\Factory\FactoryInterface;
use User\Form\Fieldset\AcctDataFieldset;
use User\Model\Users;

class AcctDataFieldsetFactory implements FactoryInterface
{
    public function __invoke(ContainerInterface $container, $requestedName, ?array $options = null)
    {
        return new AcctDataFieldset($options);
    }
}