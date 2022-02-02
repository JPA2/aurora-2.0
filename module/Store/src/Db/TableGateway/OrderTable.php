<?php
namespace Store\Db\TableGateway;
use Laminas\Db\TableGateway\TableGateway;
use Application\Db\TableGateway\TableGatewayTrait;

class OrderTable extends TableGateway
{
    use TableGatewayTrait;
    /**
     * foreignKey pointing to user.id
     * @var string $forKey
     */
    public $forKey = 'userId';
    /**
     * primaryKey column for this table
     * @var string $pk
     */
    public $pk = 'id';
}