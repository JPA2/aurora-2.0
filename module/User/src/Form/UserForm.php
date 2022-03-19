<?php
declare(strict_types=1);
namespace User\Form;

use Application\Form\BaseForm;
use Application\Form\Fieldset\SecurityFieldset;
use Application\Model\Settings;
use Laminas\Authentication\AuthenticationServiceInterface;
use User\Form\Fieldset\AcctDataFieldset;
use User\Form\Fieldset\ProfileFieldset;
use User\Model\Users;
use User\Permissions\PermissionsManager;

class UserForm extends BaseForm
{
    /**
     * @var \Laminas\Authentication\AuthenticationService $auth
     */
    protected $auth;
    /**
     * @var PermissionsManager $pm
     */
    protected $pm;
    /**
     * @var User\Model\Users $usrModel
     */
    protected $usrModel;
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
    public function __construct(
        AuthenticationServiceInterface $auth,
        PermissionsManager $pm,
        Users $usrModel,
        Settings $appSettings
    )
    {
        $this->auth = $auth;
        $this->pm = $pm;
        $this->usrModel = $usrModel;
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
        ]);

        if($this->auth->hasIdentity())
        {
            
        }

        $this->add([
            'type' => ProfileFieldset::class,
        ]);
    }
}
