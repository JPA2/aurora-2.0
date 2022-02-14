<?php
namespace Application\Model;
use Application\Model\ModelInterface;
use Interop\Container\ContainerInterface;
use Laminas\Db\TableGateway\TableGatewayInterface;
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
     * @var \Laminas\Db\TableGateway\AbstractTableGateway;
     */
    protected $db;
    /**
     * Constructor
     *
     * @param array|object $input Object values must act like ArrayAccess
     * @param int          $flags
     * @param string       $iteratorClass
     */
    public function __construct(
        TableGatewayInterface $tableGateway,
        ContainerInterface $container = null,
        $input = [], 
        $flags = self::ARRAY_AS_PROPS, 
        $iteratorClass = 'ArrayIterator')
    {
        $this->db = $tableGateway;
        $this->setFlags($flags);
        $this->storage = $input;
        $this->setIteratorClass($iteratorClass);
        $this->protectedProperties = array_keys(get_object_vars($this));
        parent::__construct($input, $flags, $iteratorClass);
    }
    public function getRoleId()
    {
        if($this->offsetExist('role'))
        {
            return $this->offsetGet('role');
        }
        return null;
    }
    public function getOwnerId()
    {
        if($this->offsetExist('userId'))
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