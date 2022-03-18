<?Php 
declare(strict_types=1);
namespace Application\Form\Fieldset\Factory;

use Application\Form\Fieldset\SecurityFieldset;
use Interop\Container\ContainerInterface;
use Laminas\ServiceManager\Factory\FactoryInterface;

class SecurityFieldsetFactory implements FactoryInterface
{
    public function __invoke(ContainerInterface $container, $requestedName, ?array $options = null)
    {
        return new SecurityFieldset();
    }
}