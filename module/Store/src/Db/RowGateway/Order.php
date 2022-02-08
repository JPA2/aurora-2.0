<?php
namespace Store\Db\RowGateway;
use Application\Db\RowGateway\RowGateway;
use Laminas\Db\RowGateway\Exception\InvalidArgumentException;
use Laminas\Db\RowGateway\Exception\RuntimeException;
use Laminas\Json\Json;
class Order extends RowGateway
{
    /**
     * 
     * @var array $orderData
     */
    protected $orderData = [
        'products' => [],
    ];
    /**
     * @var \Laminas\Json\Json $json
     */
    public $json;
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
        $this->json = new Json();
    }
    public function getJson()
    {
        /**
         * enforce what type of Json handler to use
         */
        if($this->json instanceof \Laminas\Json\Json)
        {
            return $this->json;
        }
        $this->json = new Json();
        return $this->json;
    }
}