<?php
namespace Store\Db\TableGateway;
use Application\Db\TableGateway\TableGatewayTrait;
use Laminas\Db\TableGateway\TableGateway;

class ProductReviewsTable extends TableGateway
{
    use TableGatewayTrait;
    /**
     * foreign keys pointing to user.id|store_products.id
     * @var int|[]
     */
    public $forKey = [
        'userId' => 0, 
        'productId' => 0
    ];
    /**
     * primaryKey column for this table
     * @var string $pk
     */
    public $pk = 'id';
}