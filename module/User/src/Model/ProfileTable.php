<?php
namespace User\Model;
use Laminas\Db\Metadata\Object\TableObject;
use Laminas\Db\Metadata\Metadata;
use RuntimeException;
use User\Model\User as User;
use User\Model\UserTable as UserTable;
use Laminas\Db\RowGateway\RowGateway;
use Laminas\Db\RowGateway\RowGatewayInterface;
use Laminas\Db\TableGateway\TableGateway;
use Laminas\Db\Sql\Select;
use Application\Model\GatewayTrait;

class ProfileTable extends TableGateway
{
    use GatewayTrait;
    protected $userTable;
    protected $user;
    public $pk = 'id';
    /**
     * 
     * @var $meta \Laminas\Db\Metadata\Metadata
     */
    protected $meta;
    /**
     * 
     * @var $tableObject \Laminas\Db\Metadata\Object\TableObject
     */
    protected $tableObject;

    public function getTableMetaData()
    {
        $this->meta = new Metadata($this->getAdapter());
        $this->tableObject = $this->meta->getTable($this->getTable());
    }
}