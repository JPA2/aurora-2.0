<?php
namespace Application\Db\TableGateway;
use Laminas\Db\Metadata\Metadata;
//use Laminas\Db\RowGateway\RowGateway;
use Laminas\Db\RowGateway\RowGatewayInterface;
use \RuntimeException;
trait TableGatewayTrait
{
    public $lastInsertId;
    public function fetchByColumn($column, $value)
    {
        $column = (string) $column;
        $rowset = $this->select([$column => $value]);
        $row = $rowset->current();
        if (! $row) {
            throw new RuntimeException(sprintf('Could not find row with column: ' . $column . ' with value: ' . $value));
        }
        return $row;
    }
    public function fetchAll()
    {
        return $this->select();
    }
    public function getLastInsertId()
    {
        return $this->lastInsertId;
    }
    public function save($data, $isEdit = false, array $where = null)
    {
        if($data instanceof RowGatewayInterface) {
            $data = $data->toArray();
        }
        $data = $this->filterColumns($data);
        if($isEdit) {
            $result = $this->update($data, $where);
        }
        else {
            $result = $this->insert($data);
            $result = $this->getLastInsertValue();
        }
        return $result;
//         try {
//             if($data instanceof RowGatewayInterface) {
//                 $data = $data->toArray();
//                 $data = $this->filterColumns($data);
//             }
//             elseif(is_array($data) && !empty($data)) {
//                 $data = $this->filterColumns($data);
//             }
//             $row = new RowGateway($this->pk, $this->table, $this->getAdapter());
//             $row->populate($data, $isEdit);
//             if(!$isEdit) {
//                 $row->save();
//                 // see if we can get the last inserted id to return
//                 $this->lastInsertId = $this->getLastInsertValue();
//                 return $row->save();
//             } else {
//                 // returns the number of affected rows
//                 return $row->save();
//             }
            
//         } catch (RuntimeException $e) {
//             echo $e->getMessage();
//         }
    }
    public function filterColumns($data) {
        if($data instanceof RowGatewayInterface) {
            $data = $data->toArray();
        }
        $metaData = new Metadata($this->getAdapter());
        $table = $metaData->getTable($this->table);
        $columns = $table->getColumns();
        $filtered = [];
        foreach ($columns as $allowed) {
            $column = $allowed->getName();
            if(array_key_exists($column, $data)) {
                // filter the incoming array and only allow keys that match existing table columns
                $filtered[$column] = $data[$column];
            }
        }
        return $filtered;
    }
}