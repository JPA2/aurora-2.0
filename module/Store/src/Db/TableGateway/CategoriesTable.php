<?php
namespace Store\Db\TableGateway;
use Laminas\Db\TableGateway\TableGateway;
use Application\Db\TableGateway\TableGatewayTrait;

class CategoriesTable extends TableGateway
{
    use TableGatewayTrait;
    public $pk = 'id';
    public $parentId;
}