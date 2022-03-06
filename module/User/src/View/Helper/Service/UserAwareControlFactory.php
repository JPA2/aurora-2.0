<?php
namespace User\View\Helper\Service;

use Laminas\ServiceManager\ServiceManager;
use User\View\Helper\UserAwareControl;
use User\Model\Guest;

class UserAwareControlFactory
{

    public function __invoke(ServiceManager $container)
    {
        if (! $container instanceof ServiceManager)
        {
            $container = $container->get('ViewHelperManager');
        }
        $controllerPluginManager = $container->get('ControllerPluginManager');
        $identity = $controllerPluginManager->get('Identity');
        $authService = $identity->getAuthenticationService();
        if ($authService->hasIdentity()) {
            $userName = $authService->getIdentity();
            $userTable = $container->get('User\Model\UserTable');
            $currentUser = $userTable->fetchByColumn('userName', $userName);
        }
        else {
            $currentUser = new Guest();
        }
        $view = $container->get('ViewRenderer');
        return new UserAwareControl($currentUser, $container->get('Acl'), $view);
    }
}