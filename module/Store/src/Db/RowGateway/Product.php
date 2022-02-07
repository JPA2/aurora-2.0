<?php
namespace Store\Db\RowGateway;
use Application\Db\RowGateway\RowGateway;
class Product extends RowGateway
{

    public function __construct($primaryKeyColumn = 'id', $table = 'store_products', $adapterOrSql = null)
    {
        parent::__construct($primaryKeyColumn, $table, $adapterOrSql);
    }
    public function getOwnerId()
    {
        return $this->offsetGet('userId');
    }
    public function getResourceId()
    {
        return $this->table;
    }
}