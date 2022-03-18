<?php
declare(strict_types=1);
namespace User\Form;

use Application\Form\BaseForm;
use Application\Form\Fieldset\SecurityFieldset;
use Laminas\Form\Form;
use User\Form\Fieldset\LoginFieldset;

class LoginForm extends BaseForm
{
    public function init()
    {
        $this
        ->add([
            'type' => SecurityFieldset::class
        ])
        ->add([
            'type' => LoginFieldset::class
        ]);
    }
}
