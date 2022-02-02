<?php
namespace Store\Db\RowGateway;
use Application\Db\RowGateway\RowGateway;
use Laminas\Db\RowGateway\Exception\InvalidArgumentException;
use Laminas\Db\RowGateway\Exception\RuntimeException;

class Review extends RowGateway
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
     * @var int $productId|$this->data['productId']
     */
    protected $productId;
    /**
     * 
     * @var string $createdDate|$this->data['createdDate']
     */
    protected $createdDate;
    /**
     * @var string $editDate|$this->data['editDate']
     */
    /**
     * @var int $rating|$this->data['rating']
     */
    protected $rating;
    /**
     * @var string $content|$this->data['content']
     */
    /**
     * 
     * @param string $primaryKeyColumn 
     * @param string $table 
     * @param mixed $adapterOrSql 
     * @return void 
     * @throws InvalidArgumentException 
     * @throws RuntimeException 
     */
    public function __construct(
        $primaryKeyColumn = 'id', 
        $table = 'store_product_reviews', 
        $adapterOrSql = null
        )
    {
        parent::__construct($primaryKeyColumn, $table, $adapterOrSql);
    }

}