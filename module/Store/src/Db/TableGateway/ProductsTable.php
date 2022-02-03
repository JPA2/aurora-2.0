<?php
namespace Store\Db\TableGateway;
use Laminas\Db\TableGateway\TableGateway;
use Application\Db\TableGateway\TableGatewayTrait;

class ProductsTable extends TableGateway
{
    use TableGatewayTrait;
    public $forKey = 'userId';
    public $pk = 'id';
}