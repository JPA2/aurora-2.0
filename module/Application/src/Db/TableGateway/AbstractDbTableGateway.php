<?php
namespace Application\Db\TableGateway;
use Laminas\EventManager\EventManager;
use Laminas\Db\ResultSet\ResultSet;
use Laminas\Db\TableGateway\AbstractTableGateway;
use Laminas\Db\TableGateway\Feature\FeatureSet;
use Laminas\Db\TableGateway\Feature\EventFeature;
use Laminas\Db\TableGateway\Feature\GlobalAdapterFeature;
use Laminas\Db\TableGateway\Feature\MetadataFeature;


abstract class AbstractDbTableGateway extends AbstractTableGateway
{
    /**
     * Name of the database table
     * @var string $table
     */
    public $table;
    public function __construct($table, EventManager $eventManager, ResultSet $resultSetPrototype = null)
    {
        $this->table = $table;
        $this->featureSet = new FeatureSet();
        $this->featureSet->addFeature(new GlobalAdapterFeature());
        $this->featureSet->addFeature(new MetadataFeature());
        $this->featureSet->addFeature(new EventFeature($eventManager));
        if($resultSetPrototype instanceof ResultSet)
        {
            $this->resultSetPrototype = $resultSetPrototype;
        }
        //$this->initialize();
    }
    public function setResultSetPrototype($resultSetPrototype)
    {
        $this->resultSetPrototype = $resultSetPrototype;
    }
}