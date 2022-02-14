<?php
namespace Store\Model;
use Application\Model\AbstractModel;
use Application\Model\ModelTrait;
use Store\Db\TableGateway\ProductsByCategoryTable;
use Laminas\Log\Logger;
class Product extends AbstractModel
{
    use ModelTrait;
    private $lookupTable;
    private $logger;
    public function __construct($tableGateway, $container)
    {
        $this->db = $tableGateway;
        $this->lookupTable = $container->get(ProductsByCategoryTable::class);
        $this->logger = $container->get(Logger::class);
    }
    public function save(Product $product)
    {
        try {
            //code...
            $lookupData = [];
            $lookupData['categoryId'] = $product->offsetGet('categoryId');
            $product->offsetUnset('categoryId');
            // decide if this is insert or update 
            if(empty($this->offsetGet('id'))) {
                $this->offsetUnset('id');
                $result = $this->db->insert($product->getArrayCopy());
                $lookupData['productId'] = $this->db->getLastInsertValue();
                $result = $this->lookupTable->insert($lookupData);
            }
            else {
                // we need to run an update with a join
            }
            
        } catch (\Throwable $th) {
            //throw $th;
            $this->logger->log(6, $th->getMessage());
        }

    }
}