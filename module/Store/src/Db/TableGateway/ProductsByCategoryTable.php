<?php
namespace Store\Db\TableGateway;
use Application\Db\TableGateway\AbstractDbTableGateway;
use Application\Db\TableGateway\TableGatewayTrait;
use Laminas\Db\ResultSet\ResultSet;
use Store\Model\Category;
class ProductsByCategoryTable extends AbstractDbTableGateway
{
    use TableGatewayTrait;
    public function __construct($table, $container)
    {
        parent::__construct($table, $container);
        $resultSet = new ResultSet();
        $resultSet->setArrayObjectPrototype(new Category($this, $container));
        $this->resultSetPrototype = $resultSet;
        $this->initialize();
    }
}