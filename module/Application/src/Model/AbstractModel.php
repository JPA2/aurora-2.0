<?php
namespace Application\Model;
use Application\Db\TableGateway\TableGateway;
use Application\Model\ModelInterface;
use Interop\Container\ContainerInterface;
use Laminas\Config\Config;
use Laminas\Db\ResultSet\ResultSet;
use Laminas\EventManager\EventManager;
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
     * @var TableGateway $db;
     */
    protected $db;
    protected $role;
    protected $config;
    /**
     * Constructor
     * @param \Laminas\Db\TableGateway\AbstractTableGateway;
     */
    public function __construct($table, EventManager $eventManager, Config $config)
    {
        $resultSetPrototype = new ResultSet();
        $resultSetPrototype->setArrayObjectPrototype($this);
        $this->db = new TableGateway($table, $eventManager, $resultSetPrototype);
        $this->config = $config;
        parent::__construct([], ArrayObject::ARRAY_AS_PROPS);
    }
    public function getTablegateway()
    {
        return $this->db;
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
        /**
         * userId is always the foriegn key that points to
         * users.id
         */
        if(isset($this->userId))
        {
            return $this->userId;
        }
    }
    public function getResourceId()
    {
        return $this->db->getTable();
    }
    public function toArray()
    {
        return $this->getArrayCopy();
    }
    public function getSql()
    {
        return $this->db->getSql();
    }
    public function getResultSetPrototype()
    {
        return $this->db->getResultSetPrototype();
    }
}