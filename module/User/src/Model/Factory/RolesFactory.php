<?Php
declare(strict_types=1);
namespace User\Model\Factory;

use Application\Model\AbstractModel;
use Interop\Container\ContainerInterface;
use Laminas\Config\Config;
use Laminas\EventManager\EventManager;
use Laminas\ServiceManager\Factory\FactoryInterface;
use User\Model\Roles;

class RolesFactory implements FactoryInterface
{
    public function __invoke(ContainerInterface $container, $requestedName, ?array $options = null)
    {
        $config = new Config($container->get('Config'));
        return new Roles(
            $config->db->user_roles_table_name, 
            $container->get(EventManager::class),
            $config
        );
    }
}