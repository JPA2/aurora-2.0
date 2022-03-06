<?php
declare(strict_types=1);
namespace Uploader\Fieldset;

use Laminas\Form\Fieldset;
use Laminas\InputFilter\InputFilterProviderInterface;

class UploaderAwareFieldset extends Fieldset
{
    public function __construct()
    {
        parent::__construct('upload-config', $options = null);
        $this->setAttribute('id', 'upload-config');
    }
    public function init()
    {
        $this->add([
            'name' => 'module',
            'type' => \Laminas\Form\Element\Hidden::class,
        ]);
        $this->add([
            'name' => 'type',
            'type' => \Laminas\Form\Element\Hidden::class,
        ]);
        $this->add([
            'name' => 'endpoint',
            'type' => \Laminas\Form\Element\Hidden::class,
            'attributes' => [
                'value' => '/upload/admin-upload',
            ],
        ]);
    }
}