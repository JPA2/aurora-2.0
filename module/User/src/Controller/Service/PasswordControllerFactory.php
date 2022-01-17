<?php
namespace User\Controller\Service;
use Interop\Container\ContainerInterface;
use User\Controller\PasswordController;
use Application\Utilities\Debug;
class PasswordControllerFactory
{
	public function __invoke(ContainerInterface $container)
	{
		$userTable = $container->get('User\Model\UserTable');
		//Debug::dump($userTable);
		return new PasswordController($userTable);
	}
}