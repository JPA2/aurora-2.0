<?php
namespace Store\Model;
use Application\Model\AbstractModel;
use Application\Model\ModelTrait;
use Store\Db\TableGateway\ProductsByCategoryTable;
use Laminas\Log\Logger;
class Product extends AbstractModel
{
    use ModelTrait;
    /**
     * 
     * @var \Store\Db\TableGateway\ProductsByCategoryTable;
     */
    protected $lookupTable;
    protected $logger;
    public function __construct($tableGateway, $container)
    {
        $this->db = $tableGateway;
        $this->lookupTable = $container->get(ProductsByCategoryTable::class);
        $this->logger = $container->get(Logger::class);
        // This must be called !!!!!!!!!!!!!
        parent::__construct($tableGateway, $container);
    }
    public function save(Product $product)
    {
        try {
            $data = $product->getArrayCopy();
            $lookupData = [];
            $lookupData['categoryId'] = $data['categoryId'];
            unset($data['categoryId']);
            // decide if this is insert or update 
            if(empty($data['id'])) {
                unset($data['id']);
                $result = $this->db->insert($data);
                $data['id'] = $lookupData['productId'] = $this->db->getLastInsertValue();
                $data['categoryId'] = $lookupData['categoryId']; // make sure the returned object has the correct context
                $product->exchangeArray($data);
                $result = $this->lookupTable->insert($lookupData);
                return $product;
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