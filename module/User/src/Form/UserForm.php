<?php
declare(strict_types=1);
namespace User\Form;

use Application\Form\BaseForm;
use Laminas\Form\Element;
use Laminas\Form\Element\Captcha;
use User\Form\Fieldset\AcctDataFieldset;
use User\Form\Fieldset\ProfileFieldset;


class UserForm extends BaseForm
{
    public function init()
    {
        $this->add([
            'type' => AcctDataFieldset::class,
        ]);
        $this->add([
            'type' => ProfileFieldset::class,
        ]);
    }
}
