<?php
namespace Store\Form\Fieldset;

use Application\Form\Fieldset\FieldsetTrait;
use Laminas\Form\Fieldset;
use Laminas\InputFilter\InputFilterProviderInterface;
use Laminas\Db\TableGateway\AbstractTableGateway;
class ProductImages extends Fieldset
{
    use FieldsetTrait;
    public function __construct(AbstractTableGateway $db)
    {
        $this->db = $db;
        parent::__construct($name = null, $options = null);
    }
    public function init()
    {
        $this->add([
            'name' => 'userId',
            'type' => \Laminas\Form\Element\Hidden::class,
        ]);
        $this->add([
            'name' => 'productId',
            'type' => \Laminas\Form\Element\Hidden::class,
        ]);
        $this->add([
            'name' => 'categoryId',
            'type' => \Laminas\Form\Element\Hidden::class,
        ]);
        // createdDate autogen timestamp
        $this->add([
            'name' => 'uploadedTime',
            'type' => \Laminas\Form\Element\Hidden::class,
        ]);
        $this->add([
            'name' => 'fileName',
            'type' => \Laminas\Form\Element\Text::class,
            'options' => [
                'label' => 'Image Name:',
            ],
        ]);
        // active bool checkbox
        $this->add([
            'name' => 'active',
            'type' => \Laminas\Form\Element\Checkbox::class,
            'attributes' => [
                //'class' => 'form-check',
            ],
            'options' => [
                'label' => 'Is Image active?',
            ],
        ]);
    }
    public function getInputFilterSpecification()
    {
        return [];
    }
}