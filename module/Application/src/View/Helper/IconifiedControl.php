<?php
namespace Application\View\Helper;
use Laminas\View\Helper\AbstractHelper;
use Laminas\Permissions\Acl\Acl;

class IconifiedControl extends AbstractHelper
{
	/**
	 * 
	 * @var \Laminas\Permissions\Acl\Acl
	 */
	protected $acl;
	
	/**
	 * 
	 * @param Acl $acl
	 * @param Debug $debug
	 */
	public function __construct(Acl $acl)
	{
		$this->acl = $acl;
	}
	public function __invoke()
	{
		return $this;
	}
}