<?php
namespace User\Model;
use Laminas\Permissions\Acl\Role\RoleInterface;
use Laminas\Permissions\Acl\Resource\ResourceInterface;
use Laminas\Permissions\Acl\ProprietaryInterface;
/**
 *
 * @author acesn
 *        
 */
class Guest implements RoleInterface, ResourceInterface, ProprietaryInterface
{
    protected $roleId = 'guest';
    protected $resourceId = 'User';
    protected $ownerId = 0;
    public $userName = 'Guest';
    public $role = 'guest';
    /**
     * {@inheritDoc}
     * @see \Laminas\Permissions\Acl\Role\RoleInterface::getRoleId()
     */
    public function getRoleId()
    {
        // TODO Auto-generated method stub
        return (string) $this->roleId;
    }
    public function getResourceId()
    {
    	return $this->resourceId;
    }
	/**
	 * {@inheritDoc}
	 * @see \Laminas\Permissions\Acl\ProprietaryInterface::getOwnerId()
	 */
	public function getOwnerId() {
		// TODO Auto-generated method stub
		return $this->ownerId;
	}
}