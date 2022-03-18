<?php
declare(strict_types=1);
namespace User\Form;

use Application\Form\BaseForm;
use Application\Form\Fieldset\SecurityFieldset;
use User\Form\Fieldset\AcctDataFieldset;
use User\Form\Fieldset\ProfileFieldset;

class UserForm extends BaseForm
{
    public function init()
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
