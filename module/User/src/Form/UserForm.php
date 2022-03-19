<?php
declare(strict_types=1);
namespace User\Form;

use Application\Form\BaseForm;
use Application\Form\Fieldset\SecurityFieldset;
use Application\Model\Settings;
use User\Form\Fieldset\AcctDataFieldset;
use User\Form\Fieldset\ProfileFieldset;
use User\Permissions\PermissionsManager;

class UserForm extends BaseForm
{

    /**
     * @var PermissionsManager $pm
     */
    protected $pm;
    /**
     * @var Settings $appSettings
     */
    protected $appSettings;

    /**
     * 
     * @param PermissionsManager $pm 
     * @param Settings $appSettings 
     * @return void 
     */
    #[\ReturnTypeWillChange]
    public function __construct(PermissionsManager $pm, Settings $appSettings, $mode = 'create') :void
    {
        $this->pm = $pm;
        $this->appSettings = $appSettings;
    }
    #[\ReturnTypeWillChange]
    public function init() : void
    {
        $this
        ->add([
            'type' => SecurityFieldset::class,
        ])
        ->add([
            'type' => AcctDataFieldset::class,
        ])
        ->add([
            'type' => ProfileFieldset::class,
        ]);
    }
}
