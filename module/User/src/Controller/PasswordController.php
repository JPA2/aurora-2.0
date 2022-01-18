<?php
namespace User\Controller;
use Application\Controller\AbstractController;
use Laminas\Db\TableGateway\TableGatewayInterface;
class PasswordController extends AbstractController
{
	/**
	 * 
	 * @var User\Model\UserTable $userTable
	 */
	protected $userTable;
	
	public function __construct(TableGatewayInterface $table)
	{
		$this->userTable = $table;
		//Debug::dump($this->userTable, __CLASS__.'::'.__LINE__);
	}
	public function resetAction()
	{
		
	}
}