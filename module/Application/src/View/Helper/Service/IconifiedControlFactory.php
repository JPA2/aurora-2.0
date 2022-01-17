<?php
namespace Application\View\Helper\Service;

use Laminas\ServiceManager\ServiceManager;
use Application\View\Helper\IconifiedControl;

class IconifiedControlFactory
{
	public function __invoke(ServiceManager $container)
	{
		if (! $container instanceof ServiceManager) {
			$container = $container->get('ViewHelperManager');
		}
		return new IconifiedControl($container->get('Acl'));
	}
}