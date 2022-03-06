<?php
declare(strict_types=1);

namespace Uploader\Adapter;

use Laminas\Db\Adapter\AdapterInterface as DbAdapterInterface;
use Laminas\Db\TableGateway\TableGateway as TableGateway;
use Laminas\Log\Logger;
use Uploader\Adapter\AbstractAdapter;
use RuntimeException;

class TableGatewayAdapter extends AbstractAdapter
{
        /**
     * Primary table that records should be stored in.
     * @var \Laminas\Db\TableGateway\TableGateway $table
     */
    protected $table;
    /**
     * @var \Laminas\Db\TableGateway\TableGateway $relatedTable
     */
    protected $relatedTable;
    /**
     * In nearly call cases we should store a userId who uploads this image so they can be tracked
     * @var  \User\Model\UserTable $userTable
     */
    protected $userTable;
    /**
     * 
     * @param DbAdapterInterface $dbAdapter 
     * @return void 
     */
    public function __construct(DbAdapterInterface $dbAdapter, array $config, Logger $logger = null)
    {
        $this->dbAdapter = $dbAdapter;
        $this->getConfig($config);
        if($logger instanceof Logger) {
            $this->logger = $logger;
        }
    }
    public function loadContext()
    {
        parent::loadContext();
        if (isset($this->config[$this->module]['db_config']['table_name'])) {
            $this->table = new TableGateway($this->config[$this->module]['db_config']['table_name'], $this->dbAdapter);
        }
    }
    public function upload()
    {
        // make sure $this->setData($data) has been called in user land
        if(!empty($this->data) && is_array($this->data['file'])) {
            $uploaded = $this->handler->filter($this->data['file']);
            unset($this->data['file']);
            $this->baseName = $this->filter->filter($uploaded['tmp_name']);
        }
        if($this->table instanceof TableGateway) { // apparently we need to store a record for this image
            try {
                // first lets find the relevant data
                //unset($file);// were done with this so lets clean up alittle
                $dbConfig = $this->config[$this->module]['db_config'];
                $data = []; // what were saving
                // does the config tell us which columns we need? it should!!!!
                if(!is_array($dbConfig['columns'])) {
                    throw new RuntimeException('Missing columns index in uploader configuration!!');
                }
                $columns = \array_flip($dbConfig['columns']);
                if(isset($columns[$dbConfig['image_column']])) {
                    $data[$dbConfig['image_column']] = $this->baseName;
                }
                if(isset($this->data['upload-config'])) {
                    unset($this->data['upload-config']);
                }
                if(isset($this->data['file'])) {
                    unset($this->data['file']);
                }

                foreach($this->data as $key => $value) {
                    if(is_array($value)) {
                        foreach($value as $k => $v) {
                            if(\array_key_exists($k, $columns) && $k !== $dbConfig['image_column']) {
                               
                                $data[$k] = $value[$k];
                                continue;
                            }
                        }
                    }
                    else {
                        if(isset($columns[$key]) && $key !== $dbConfig['image_column']) {
                            $data[$key] = $value;
                        }
                    }
                }
                $this->table->insert($data);
            } catch (\Throwable $th) {
                $this->logger->log(Logger::ERR, $th->getMessage());
            }
        }
    }
}