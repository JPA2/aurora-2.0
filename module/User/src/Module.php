<?php
namespace User;

use Laminas\Db\Adapter\AdapterInterface;
use Laminas\Db\ResultSet\ResultSet;
use Laminas\ModuleManager\Feature\ConfigProviderInterface;
use Laminas\ModuleManager\Feature\ViewHelperProviderInterface;
use User\Model\User;
use User\Model\UserTable;
use User\Model\Profile;
use User\Model\ProfileTable;
use User\Model\RolesTable;
use Application\Db\RowGateway\RowGateway;
use Laminas\Permissions\Acl\Acl;
use User\Permissions\PermissionsManager;
use User\View\Service\UserAwareControlFactory;

class Module implements ConfigProviderInterface, ViewHelperProviderInterface
{
    public function getConfig()
    {
        return include __DIR__ . '/../config/module.config.php';
    }
    public function getViewHelperConfig()
    {
    	return [
    			'aliases' => [
    					'userawarecontrol' => View\Helper\UserAwareControl::class,
    					'UserAwareControl' => View\Helper\UserAwareControl::class,
    					'userAwareControl' => View\Helper\UserAwareControl::class,
    					'userControl'      => View\Helper\UserAwareControl::class,
    			],
    			'factories' => [
    					View\Helper\UserAwareControl::class => View\Helper\Service\UserAwareControlFactory::class,
    			],
    	];
    }
    public function getControllerConfig()
    {
        return [
            'factories' => [
                Controller\UserController::class => function($container) {
                    return new Controller\UserController(
                        $container->get(Model\UserTable::class)
                        );
                },
                Controller\ProfileController::class => function($container) {
                    return new Controller\ProfileController(
                        $container->get(Model\UserTable::class)
                        );
                },
                Controller\RegisterController::class => function($container) {
                    return new Controller\RegisterController(
                        $container->get(Model\UserTable::class)
                        );
                },
                ],
                ];
    }
    public function getFilterConfig()
    {
        return [
            'factories' => [
                Filter\PasswordFilter::class => function($container) {
                    return new Filter\PasswordFilter(
                        $container->get(Filter\PasswordFilter::class)
                        );
                },
                ],
                ];
    }
}