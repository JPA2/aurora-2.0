<?php
namespace Application\Model;
use Application\Model\AbstractModel;
use Application\Model\ModelTrait;
use Laminas\Db\Sql\Select;
class Setting extends AbstractModel
{
    use ModelTrait;
    public function fetchAll()
    {
         $data = [];
         $rowset = $this->db->select();
         foreach ($rowset as $row){
             $data["$row->variable"] = $row->value;
         }
         return $data;
    }
    public function fetchSettingsForForm()
    {
        $data = [];
        $rowset = $this->db->select(function(Select $select){
            $select->order(['settingType']);
        });
        foreach($rowset as $row) {
            $data[] = $row->toArray();
        }
        return $data;
    }
    /**
     * Special save method for saving all settings without a row id being passed since 
     * we will be updating all rows 
     * @param mixed $data 
     * @return mixed 
     */
    public function save()
    {
        
        // if (is_array($data)) {
        //     return $this->db->update($data);
        // }
        // if ($data instanceof $this && ($this->offsetGet('id') === null)) {
        //     return $this->db->insert($data->toArray());
        // }
    }
    public function updateAll()
    {
        /**
         * $set, $where = null, ?array $joins = null
         */
        foreach($this->data as $key => $value)
        {
            $saveData = [
                'variable' => $key,
                'value'    => $value
            ];
            $result = $this->db->update($saveData, ['variable' => $key]);
        }
    }
}