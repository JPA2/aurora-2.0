<?php
namespace Application\Db\TableGateway;

use RuntimeException;
use Application\Db\TableGateway\AbstractDbTableGateway;
use Application\Db\TableGateway\TableGatewayTrait;
use Application\Model\Setting;
use Laminas\EventManager\EventManager;
use Laminas\Db\ResultSet\ResultSet;
use Laminas\Db\Sql\Select;
class SettingsTable extends AbstractDbTableGateway
{
    use TableGatewayTrait;
    const RESOURCE_ID = 'settings';
    const SETTINGS_NAMESPACE = 'aurora';
 
    public function __construct($table, EventManager $e)
    {
        parent::__construct($table, $e);
        $resultSet = new ResultSet();
        $resultSet->setArrayObjectPrototype(new Setting($this));
        $this->resultSetPrototype = $resultSet;
        $this->initialize();
    }
    public function fetchForBootstrap()
    {
        $data = [];
        $rowset = $this->db->select();
        foreach ($rowset as $row){
            $data[self::SETTINGS_NAMESPACE]["$row->variable"] = $row->value;
        }
        return $data;
    }
    public function fetchAll()
    {
         $data = [];
         $rowset = $this->select();
         foreach ($rowset as $row){
             $data["$row->variable"] = $row->value;
         }
         return $data;
    }
    public function fetchSettingsForForm()
    {
        $data = [];
        $rowset = $this->select(function(Select $select){
            $select->order(['settingType']);
        });
        foreach($rowset as $row) {
            $data[] = $row->toArray();
        }
        return $data;
    }    
}