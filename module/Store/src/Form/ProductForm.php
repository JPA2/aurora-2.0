<?php

namespace Store\Form;

use Laminas\Form\Form;
use Store\Form\Fieldset\ProductInfo;

class ProductForm extends Form
{
    public function init()
    {
        $this->add([
            // you are not required to set a name here as the fieldset overrides it during construction
            'type' => \Uploader\Fieldset\UploaderAwareFieldset::class,
        ]);
        $this->add([
            'name' => 'product-info',
            'type' => \Store\Form\Fieldset\ProductInfo::class
        ]);
        // submit
        $this->add(
            [
                'name' => 'send',
                'type' => \Laminas\Form\Element\Button::class,
                'attributes' => [
                    'type'  => 'submit',
                ],
                'options' => [
                    'label' => '<i class="fas fa-save"></i>Save',
                    'label_options' => [
                        'disable_html_escape' => true,
                    ],
                ],
            ]
        );
    }
}
