<?php
namespace Application\Db\TableGateway;
use Laminas\Db\Metadata\Metadata;
use Laminas\Db\Sql\Select;
use Laminas\Db\RowGateway\RowGatewayInterface;
use \RuntimeException;
use function sprintf;
trait TableGatewayTrait
{
    public $lastInsertId;
    /**
     * 
     * @param string $column 
     * @param int|string $value 
     * @return \Laminas\Db\RowGateway\RowGatewayInterface 
     * @throws RuntimeException 
     */
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
    /**
     * 
     * @param string $column 
     * @param string|int $value 
     * @param null|array $columns 
     * @return \Laminas\Db\RowGateway\RowGatewayInterface 
     * @throws RuntimeException 
     */
    public function fetchColumnsByColumn($column, $value, ?array $columns)
    {
        $resultSet = $this->select(function(Select $select) use ($column, $value, $columns) {
            $select->columns($columns)->where([$column => $value]);
        });
        $row = $resultSet->current();
        if(!$row) {
            throw new RuntimeException(sprintf('could not find row with column: ' . $column . ' with value: ' . $value));
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
    /**
     * 
     * @deprecated
     */
    public function save($data, $isEdit = false, array $where = null)
    {
        throw new RuntimeException('Save method is deprecated use insert or update!!');
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