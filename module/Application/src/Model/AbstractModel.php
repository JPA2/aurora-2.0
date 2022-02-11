<?php

namespace Application\Model;

use Laminas\Db\TableGateway\TableGatewayInterface;
use Application\Db\TableGateway\AbstractDbTableGateway;
use Application\Permissions\PermissionsManager as Acl;
use Laminas\Permissions\Acl\ProprietaryInterface;
use Laminas\Permissions\Acl\Resource\ResourceInterface;
use Laminas\Permissions\Acl\Role\RoleInterface;
use ArrayAccess;
use Countable;
use RuntimeException;
use function get_called_class;
use function is_array;

class AbstractModel implements
    ArrayAccess,
    Countable,
    ResourceInterface,
    ProprietaryInterface,
    RoleInterface
{
    /**
     * 
     * @var Application\Db\TableGateway\AbstractDbTableGateway $db
     */
    protected $db;
    /**
     * 
     * @var Laminas\Log\Logger $log
     */
    protected $log;

    /**
     * 
     * @var $acl Laminas\Permissions\Acl\Acl
     */
    public $acl;
    /**
     * 
     * @var array $data
     */
    protected $data = [];

    public function __construct(AbstractDbTableGateway $tableGateway)
    {
        $this->db = $tableGateway;
    }
    public function insert($data)
    {
        if (is_array($data)) {
            return $this->db->insert($data);
        }
        if ($data instanceof $this) {
            return $this->db->insert($data->toArray());
        }
    }
    public function update($data)
    {
        if (is_array($data)) {
            return $this->db->update($data);
        }
        if ($data instanceof $this) {
            return $this->db->insert($data->toArray());
        }
    }
    public function getAdapter()
    {
        return $this->db->getAdapter();
    }
    /**
     * @param mixed $array
     * @return AbstractRowGateway
     */
    public function exchangeArray(array $array)
    {
        $this->data = $array;
    }

    /**
     * Offset Exists
     *
     * @param  string $offset
     * @return bool
     */
    public function offsetExists($offset)
    {
        return array_key_exists($offset, $this->data);
    }

    /**
     * Offset get
     *
     * @param  string $offset
     * @return mixed
     */
    public function offsetGet($offset)
    {
        return $this->data[$offset];
    }

    /**
     * Offset set
     *
     * @param  string $offset
     * @param  mixed $value
     * @return self Provides a fluent interface
     */
    public function offsetSet($offset, $value)
    {
        $this->data[$offset] = $value;
        return $this;
    }

    /**
     * Offset unset
     *
     * @param  string $offset
     * @return self Provides a fluent interface
     */
    public function offsetUnset($offset)
    {
        $this->data[$offset] = null;
        return $this;
    }

    /**
     * @return int
     */
    public function count()
    {
        return count($this->data);
    }

    /**
     * To array
     *
     * @return array
     */
    public function toArray()
    {
        return $this->data;
    }

    /**
     * __get
     *
     * @param  string $name
     * @throws RuntimeException
     * @return mixed
     */
    public function __get($name)
    {
        if (array_key_exists($name, $this->data)) {
            return $this->data[$name];
        } else {
            throw new RuntimeException('Not a valid column in this table: ' . $name);
        }
    }

    /**
     * __set
     *
     * @param  string $name
     * @param  mixed $value
     * @return void
     */
    public function __set($name, $value)
    {
        $this->offsetSet($name, $value);
    }

    /**
     * __isset
     *
     * @param  string $name
     * @return bool
     */
    public function __isset($name)
    {
        return $this->offsetExists($name);
    }

    /**
     * __unset
     *
     * @param  string $name
     * @return void
     */
    public function __unset($name)
    {
        $this->offsetUnset($name);
    }
    /**
     * 
     * @see \Laminas\Permissions\Acl\Resource\ResourceInterface::getResourceId()
     */
    public function getResourceId()
    {
        // TODO Auto-generated method stub
        return $this->db->getTable();
    }
    /**
     * 
     * @see \Laminas\Permissions\Acl\ProprietaryInterface::getOwnerId()
     */
    public function getOwnerId()
    {
        if ($this instanceof RoleInterface) {
            return $this->offsetGet('id');
        } elseif ($this->offsetExists('userId')) {
            return $this->offsetGet('userId');
        }
        return null;
    }
    public function getRoleId()
    {
        if ((get_called_class()) === 'User' && $this->offsetExists('role')) {
            return $this->offsetGet('role');
        }
        return 'guest';
    }
}
