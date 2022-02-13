<?php
namespace Application\Model;
use Laminas\Db\Sql\Select;
use \RuntimeException;
use function sprintf;
trait ModelTrait
{
    public function fetchByColumn($column, $value)
    {
        $column = (string) $column;
        $resultSet = $this->db->select([$column => $value]);
        $row = $resultSet->current();
        if(! $row) {
            throw new RuntimeException(sprintf('Could not fetch column: ' . $column . ' with value: '. $value));
        }
        return $row;
    }
    public function fetchColumns($column, $value, ?array $columns)
    {
        $resultSet = $this->db->select(function(Select $select) use ($column, $value, $columns){
            $select->columns($columns)->where([$column => $value]);
        });
        $row = $resultSet->current();
        if(! $row) {
            throw new RuntimeException(sprintf('Could not fetch row with column: '. $column . ' with value: ' . $value));
        }
        return $row;
    }
    public function fetchall()
    {
        return $this->db->select();
    }
}