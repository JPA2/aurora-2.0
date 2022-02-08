<?php
namespace Store\Db\TableGateway;
use Laminas\Db\TableGateway\TableGateway;
use Application\Db\TableGateway\TableGatewayTrait;

class CategoriesTable extends TableGateway
{
    use TableGatewayTrait;
    public $pk = 'id';
    public $parentId;
    public function fetchSelectValueOptions()
    {
        $data = [];
        $resultSet = $this->select();
        foreach($resultSet as $row)
        {
            $data[$row->id] = $row->name;
        }
        return $data;
    }
}