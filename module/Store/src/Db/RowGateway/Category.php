<?php
namespace Store\Db\RowGateway;
use Application\Db\RowGateway\RowGateway;
use Laminas\Db\RowGateway\Exception\InvalidArgumentException;
use Laminas\Db\RowGateway\Exception\RuntimeException;

class Category extends RowGateway
{
    /**
     * 
     * @param string $primaryKeyColumn 
     * @param string $table 
     * @param mixed $adapterOrSql 
     * @return void 
     * @throws InvalidArgumentException 
     * @throws RuntimeException 
     */
    public function __construct($primaryKeyColumn = 'id', $table = 'store_categories', $adapterOrSql = null)
    {
        parent::__construct($primaryKeyColumn, $table, $adapterOrSql);
    }
}