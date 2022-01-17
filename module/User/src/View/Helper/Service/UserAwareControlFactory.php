<?php
namespace User\View\Helper\Service;

use Laminas\ServiceManager\ServiceManager;
use User\View\Helper\UserAwareControl;
use Application\Utilities\Debug;

class UserAwareControlFactory
{
	public function __invoke(ServiceManager $container)
	{
		if (! $container instanceof ServiceManager) {
			$container = $container->get('ViewHelperManager');
		}
		
		$controllerPluginManager = $container->get('ControllerPluginManager');
		//Debug::dump($controllerPluginManager, __FILE__);
		$identity = $controllerPluginManager->get('Identity');
		//Debug::dump($identity);
		$authService = $identity->getAuthenticationService();
		//Debug::dump($authService->hasIdentity());
		if($authService->hasIdentity()) {
			$userName = $authService->getIdentity();
			//Debug::dump($userName);
			$userTable = $container->get('User\Model\UserTable');
			$currentUser = $userTable->fetchByColumn('userName', $userName);
		}
		$view = $container->get('ViewRenderer');
		//Debug::dump($currentUser);
		return new UserAwareControl($currentUser, $container->get('Acl'), $view);
	}
}