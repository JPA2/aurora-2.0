<?php
declare(strict_types=1);
namespace User\Form;

use Application\Form\BaseForm;
use Application\Form\Fieldset\SecurityFieldset;
use Application\Model\Settings;
use Laminas\Authentication\AuthenticationService;
use User\Form\Fieldset\AcctDataFieldset;
use User\Form\Fieldset\PasswordFieldset;
use User\Form\Fieldset\ProfileFieldset;
use User\Form\Fieldset\RoleFieldset;
use User\Model\Users;
use User\Permissions\PermissionsManager;

class UserForm extends BaseForm
{
    const CREATE_MODE = 'create';
    const EDIT_MODE   = 'edit';
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
    protected $mode;

    /**
     * 
     * @param PermissionsManager $pm 
     * @param Settings $appSettings 
     * @return void 
     */
    public function __construct(

        AuthenticationService $auth,
        PermissionsManager $pm,
        Users $usrModel,
        Settings $appSettings,
        $options = []
    )
    {
        $this->auth = $auth;
        $this->pm = $pm;
        $this->usrModel = $usrModel;
        $this->appSettings = $appSettings;
        parent::__construct('user-form');
        if (!empty($options) && isset($options['mode'])) {
            parent::setOptions($options);
        }
        elseif(empty($options) || !empty($options) && !isset($options['mode'])) {
            $options['mode'] = self::CREATE_MODE;
            parent::setOptions($options);
        }    
    }
    public function init() : void
    {
        $options = $this->getOptions();
        $factory = $this->getFormFactory();
        $manager = $factory->getFormElementManager();
        $acctData = $manager->build(AcctDataFieldset::class, ['mode' => $options['mode']]);
        $this
        ->add([
            'type' => SecurityFieldset::class,
        ]);
        $this->add($acctData);
        // $this->add([
        //     'type' => AcctDataFieldset::class,
        //     'options' => [
        //         'mode' => $options['mode'],
        //     ],
        // ]);

        if($this->auth->hasIdentity() && $this->pm->isAllowed($this->usrModel, $this->usrModel, 'admin.access'))
        {
            $this->add([
                'type' => RoleFieldset::class,
            ]);
        }

        $this->add([
            'type' => ProfileFieldset::class,
        ]);
        if($options['mode'] === self::CREATE_MODE) {
            $this->add([
                'type' => PasswordFieldset::class,
            ]);
        }
    }
}
