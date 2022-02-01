<?php
namespace Application\Model;

use RuntimeException;
use Laminas\Db\TableGateway\TableGateway;
use Application\Permissions\PermissionsManager as Acl;
use Laminas\Permissions\Acl\Resource\ResourceInterface;
use Laminas\Db\Sql\Select;

class ModuleSettings
{
    /**
     * 
     * @var TableGateway $tbl
     */
    protected $tbl;
    public function __construct(TableGateway $tbl)
    {
        $this->tbl = $tbl;
    }
}