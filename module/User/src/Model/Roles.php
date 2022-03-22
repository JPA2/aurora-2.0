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
        $result = $this->db->select();
        foreach($result as $row) {
            $data[]= [
                'value' => $row->role,
                'label' => $row->label,
            ];
            // $data[$row->id]['value'] = $row->role;
            // $data[$row->id]['label'] = $row->label;
        }
        if(count($data) > 0) {
            return $data;
        } else {
            throw new RuntimeException('Roles could not be retrieved');
        }
    }
}