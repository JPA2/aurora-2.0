<?php
namespace Application\Controller;

use Application\Controller\AbstractController;
use Laminas\Permissions\Acl\Resource\ResourceInterface;

abstract class AbstractAdminController extends AbstractController implements ResourceInterface
{
    const RESOURCE_ID = 'admin';
    /**
     * {@inheritDoc}
     * @see \Laminas\Permissions\Acl\Resource\ResourceInterface::getResourceId()
     */
    public function getResourceId()
    {
        // TODO Auto-generated method stub
        return self::RESOURCE_ID;
    }

    public function _init()
    {
        if(!$this->acl->isAllowed($this->user, $this, 'admin.access'))
        {
            $this->redirect()->toRoute('forbidden');
        }
        $adminParent = 'Application\Controller\AbstractAdminController';
        switch ($adminParent === get_parent_class(get_called_class())) {
            case true:
                $this->layout('layout/dashboard-dark');
                break;
            default:
                
                break;
        }
        return parent::_init();
    }
}