<?php
declare(strict_types=1);
namespace Uploader;

use Laminas\Authentication\AuthenticationService;
use Laminas\Db\TableGateway\Feature\EventFeature;
use Laminas\Log\Logger;
use Laminas\Permissions\Acl\Acl;
use Uploader\Adapter\AbstractAdapter;
use Uploader\Adapter\AdapterInterface;
use RuntimeException;
use function array_key_exists;

class Uploader
{
    /**
     * @var \Laminas\Permissions\Acl\Acl $acl;
     */
    protected $acl;
    /**
     * @var \Laminas\Authentication\AuthenticationService;
     */
    protected $auth;
    /**
     * The actual key to match against
     * @var string $fieldsetKey
     */
    protected $fieldsetKey = 'upload-config';
    /**
     * 
     * @var \Uploader\Adapter\AbstractAdapter $adapter
     */
    protected $adapter;

    /**
     * Data to be processed
     * Should contain the $_POST and $_FILES data that has been 
     * $data = array_merge_recursive($_POST, $_FILES);
     * @var array $data
     */
    protected $data = [];
    /**
     * @var array $config
     */
    protected $config = [];
    /**
     * 
     * @param \Uploader\Adapter\AbstractAdapter $adapter
     * @return void 
     */
    public function __construct(
        AdapterInterface $adapter, 
        Acl $acl, 
        AuthenticationService $auth
        )
    {
        $this->adapter = $adapter;
        $this->acl = $acl;
        $this->auth = $auth;
    }
    public function setData(array $data)
    {
        // at this point we should know what module is trying to upload
        $this->adapter->setModule($data[$this->fieldsetKey]['module']);
        $this->adapter->setType($data[$this->fieldsetKey]['type']);
        unset($data[$this->fieldsetKey]);
        $this->adapter->setData($data);
    }
    public function upload()
    {
        $this->adapter->getEventManager()->attach(__FUNCTION__, function($e){
            $event = $e->getName();
            $target = get_class($e->getTarget());
            $params = $e->getParams();
        });
        $this->adapter->upload();
    }
    public function getPublicPath()
    {
        return $this->adapter->getPublicPath();
    }
}