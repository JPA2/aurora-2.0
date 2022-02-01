<?php
namespace Application\Db\RowGateway;

use Laminas\Db\RowGateway\RowGateway as LaminasRowGateWay;
use Laminas\Permissions\Acl\Resource\ResourceInterface;
use Laminas\Permissions\Acl\Role\RoleInterface;
use Laminas\Permissions\Acl\ProprietaryInterface;

class RowGateway extends LaminasRowGateway implements RoleInterface, ResourceInterface, ProprietaryInterface
{
    /**
     * @var string $forKey
     */
    public $forKey;
    /**
     * Parent id for this row is defined
     * @var int $parentId|$this->data['parentId']
     */
    public $parentId;
    /**
     * {@inheritDoc}
     * @see \Laminas\Permissions\Acl\Resource\ResourceInterface::getResourceId()
     */
    public function getResourceId()
    {
        // TODO Auto-generated method stub
        return $this->table;
    }
    public function getArrayCopy()
    {
        return $this->toArray();
    }
    /**
     * {@inheritDoc}
     * @see \Laminas\Permissions\Acl\ProprietaryInterface::getOwnerId()
     */
    public function getOwnerId()
    {
        // TODO Auto-generated method stub
        if($this->offsetExists('userId')) {
            return $this->offsetGet('userId');
        }
        return $this->offsetGet('id');
    }

    /**
     * {@inheritDoc}
     * @see \Laminas\Permissions\Acl\Role\RoleInterface::getRoleId()
     */
    public function getRoleId()
    {
        // TODO Auto-generated method stub
        return $this->offsetGet('role');
    }

}