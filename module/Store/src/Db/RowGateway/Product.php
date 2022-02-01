<?php
namespace Store\Db\RowGateway;
use Application\Db\RowGateway\RowGateway;
class Product extends RowGateway
{
    /**
     * 
     * @var int $id
     */
    protected $id;
    /**
     * @var int $userId
     */
    protected $userId;
    /**
     * @var string $name
     */
    public $name;
    /**
     * @var string $description
     */
    public $description;
    /**
     * 
     * @var decimal $cost
     */
    protected $cost = 0.00;
    /**
     * 
     * @var decimal $weight
     */
    protected $weight = 0.00;
    /**
     * 
     * @var string $sku
     */
    protected $sku;
    /**
     * 
     * @var string $createdDate 
     */
    /**
     * 
     * @var bool $active 
     */

    public function __construct($primaryKeyColumn = 'id', $table = 'store_products', $adapterOrSql = null)
    {
        parent::__construct($primaryKeyColumn, $table, $adapterOrSql);
    }
    public function setId($id)
    {
        $this->id = $id;
    }
    public function getId()
    {
        return $this->id;
    }
    public function setCost($cost)
    {
        $this->cost = $cost;
    }
    public function getCost()
    {
        return $this->cost;
    }
    public function getWeight()
    {
        return $this->weight;
    }
    public function getSku()
    {
        return $this->sku;
    }
}