<?php
declare(strict_types=1);
namespace User\Model;

use Application\Model\AbstractModel;
use Application\Model\ModelTrait;
use Laminas\Db\ResultSet\ResultSetInterface;
use Laminas\Db\Sql\Exception\InvalidArgumentException;
use Laminas\Db\Sql\Select;
use Laminas\Db\TableGateway\Exception\RuntimeException as ExceptionRuntimeException;
use \RuntimeException;

class Roles extends AbstractModel
{
    use ModelTrait;
    /**
     * 
     * @return array 
     * @throws ExceptionRuntimeException 
     * @throws InvalidArgumentException 
     * @throws RuntimeException 
     */
    public function fetchSelectData() : array
    {
        $data = [];
        $result = $this->db->select(function(Select $select){
            $select->columns(['id', 'label'])->order('id ASC');
        });
        if($result instanceof ResultSetInterface) {
            foreach($result as $row) {
                $data[$row->id] = $row->label;
            }
        }
        if(count($data) > 0) {
            return $data;
        } else {
            throw new RuntimeException('Roles could not be retrieved');
        }
    }
}