<?php
namespace Store\Db\RowGateway;
use Application\Db\RowGateway\RowGateway;
use Laminas\Db\RowGateway\Exception\InvalidArgumentException;
use Laminas\Db\RowGateway\Exception\RuntimeException;

class Order extends RowGateway
{
    /**
     * 
     * @var int $id|$this->data['id']
     */
    protected $id;
    /**
     * 
     * @var int $userId|$this->data['userId']
     */
    protected $userId;
    /**
     * 
     * @var string $createdDate|$this->data['createdDate']
     */
    protected $createdDate;
    /**
     * 
     * @var string $processedDate|$this->data['processedDate']
     */
    protected $processedDate;
    /**
     * 
     * @var int|bool $completed|$this->data['completed']
     */
    protected $completed;
    /**
     * 
     * @var int|bool $active|$this->data['active']
     */
    protected $active;
    /**
     * 
     * @param string $primaryKeyColumn 
     * @param string $table 
     * @param mixed $adapterOrSql 
     * @return void 
     * @throws InvalidArgumentException 
     * @throws RuntimeException 
     */
    public function __construct($primaryKeyColumn = 'id', $table = 'store_orders', $adapterOrSql = null)
    {
        parent::__construct($primaryKeyColumn, $table, $adapterOrSql);
    }

}