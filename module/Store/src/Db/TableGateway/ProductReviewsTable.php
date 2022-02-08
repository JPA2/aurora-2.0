<?php
namespace Store\Db\TableGateway;
use Application\Db\TableGateway\TableGatewayTrait;
use Laminas\Db\TableGateway\TableGateway;

class ProductReviewsTable extends TableGateway
{
    use TableGatewayTrait;
    /**
     * primaryKey column for this table
     * @var string $pk
     */
    public $pk = 'id';
}