<?Php 
declare(strict_types=1);
namespace Application\Form\Factory;

use Application\Form\BaseForm;
use Interop\Container\ContainerInterface;
use Laminas\ServiceManager\Factory\FactoryInterface;

class BaseFormFactory implements FactoryInterface
{
    public function __invoke(ContainerInterface $container, $requestedName, ?array $options = null)
    {
        return new BaseForm();
    }
}