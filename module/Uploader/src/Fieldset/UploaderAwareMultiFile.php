<?php
declare(strict_types=1);
namespace Uploader\Fieldset;

use Laminas\Form\Element\File;
use Laminas\Filter\File as FileFilter;
use Laminas\Form\Fieldset;

class UploaderAwareMultiFile extends Fieldset
{
    public function __construct($name = null,  $options = null)
    {
        parent::__construct('uploader-multi-file');
    }
    public function init()
    {
        $this->add([
            'name' => 'file-upload',
            'type' => \Laminas\Form\Element\File::class,
            'attributes' => [
                'multiple' => true,
            ],
            'options' => [
                'messages' => [
                    'To select multiple files please use Ctrl+click while selecting files.',
                ],
                'order' => 1,
            ],
        ]);
    }
}
