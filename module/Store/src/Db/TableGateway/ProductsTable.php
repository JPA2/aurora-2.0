<?php
namespace Store\Db\TableGateway;
use Application\Db\TableGateway\AbstractDbTableGateway;
use Application\Db\TableGateway\TableGatewayTrait;
use Laminas\EventManager\EventManager;
use Laminas\Db\ResultSet\ResultSet;
use Store\Model\Product;
class ProductsTable extends AbstractDbTableGateway
{
    use TableGatewayTrait;
    public function __construct($table, EventManager $e)
    {
        parent::__construct($table, $e);
        $resultSet = new ResultSet();
        $resultSet->setArrayObjectPrototype(new Product($this));
        $this->resultSetPrototype = $resultSet;
        $this->initialize();
    }
}