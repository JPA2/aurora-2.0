<?php
namespace Application\Model;
use Application\Model\ModelInterface;
use Interop\Container\ContainerInterface;
use Laminas\Db\TableGateway\AbstractTableGateway;
use Laminas\Permissions\Acl\ProprietaryInterface;
use Laminas\Permissions\Acl\Resource\ResourceInterface;
use Laminas\Permissions\Acl\Role\RoleInterface;
use Laminas\Stdlib\ArrayObject;

abstract class AbstractModel 
extends ArrayObject 
implements 
ResourceInterface,
ProprietaryInterface,
RoleInterface,
ModelInterface
{
    /**
     * 
     * @var \Laminas\Db\TableGateway\AbstractTableGateway $db;
     */
    protected $db;
    /**
     * @var \Interop\Container\ContainerInterface $container 
     */
    protected $container;
    protected $role;
    /**
     * Constructor
     * @param \Laminas\Db\TableGateway\AbstractTableGateway;
     * @param Interop\Container\ContainerInterface $container
     */
    public function __construct(
        AbstractTableGateway $tableGateway,
        ContainerInterface $container
        )
    {
        $this->db = $tableGateway;
        $this->container = $container;
        parent::__construct([], ArrayObject::ARRAY_AS_PROPS);
    }
    public function getRoleId()
    {
        if($this->offsetExists('role'))
        {
            return $this->offsetGet('role');
        }
        return null;
    }
    public function getOwnerId()
    {
        if($this->offsetExists('userId'))
        {
            return $this->offsetGet('userId');
        }
        return null;
    }
    public function getResourceId()
    {
        return $this->db->getTable();
    }
    public function toArray()
    {
        return $this->storage;
    }
}