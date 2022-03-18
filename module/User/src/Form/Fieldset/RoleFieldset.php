<?php
declare(strict_types=1);
namespace User\Form\Fieldset;

use Laminas\Form\Fieldset;
use Laminas\Form\Element\Select;
use Laminas\Form\Exception\InvalidArgumentException;
use Laminas\InputFilter\InputFilterProviderInterface;
use User\Model\Roles;
use User\Permissions\PermissionsManager;

class RoleFieldset extends Fieldset implements InputFilterProviderInterface
{
    /**
     * @var Roles $roleModel
     */
    protected $roleModel;
    /**
     * 
     * @param Roles $roleModel 
     * @return void 
     * @throws InvalidArgumentException 
     */
    public function __construct(Roles $roleModel)
    {
        $this->roleModel = $roleModel;
        parent::__construct('role-data');
    }
    public function init()
    {
        $this->add([
            'name' => 'role',
            'type' => Select::class,
            'value_options' => [$this->roleModel->fetchSelectData()], 
        ]);
    }
    public function getInputFilterSpecification()
    {
        return [];
    }
}

