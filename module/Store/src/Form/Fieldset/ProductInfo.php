<?php
namespace Store\Form\Fieldset;

use Application\Form\Fieldset\FieldsetTrait;
use Laminas\Form\Fieldset;
use Laminas\InputFilter\InputFilterProviderInterface;
use Store\Db\TableGateway\CategoriesTable;
class ProductInfo extends Fieldset
{
    use FieldsetTrait;
    public function __construct(CategoriesTable $categoriesTable)
    {
        $this->categoriesTable = $categoriesTable;
        $this->categoryValueOptions = $this->categoriesTable->fetchSelectValueOptions();
        parent::__construct($name = null, $options = null);
    }
    public function init()
    {
        $this->add([
            'name' => 'id',
            'type' => \Laminas\Form\Element\Hidden::class,
        ]);
        $this->add([
            'name' => 'userId',
            'type' => \Laminas\Form\Element\Hidden::class,
        ]);
        // createdDate autogen timestamp
        $this->add([
            'name' => 'createdDate',
            'type' => \Laminas\Form\Element\Hidden::class,
        ]);
        $this->add([
            'name' => 'name',
            'type' => \Laminas\Form\Element\Text::class,
            'attributes' => [
                //'class' => 'form-control',
            ],
            'options' => [
                'label' => 'Product Name:',
            ],
        ]);
        $this->add([
            'name' => 'categoryId',
            'type' => \Laminas\Form\Element\Select::class,
            'attributes' => [
                //'class' => 'form-control',
            ],
            'options' => [
                'label' => 'Product Category:',
                'value_options' => $this->categoryValueOptions,
            ],
        ]);
        $this->add([
            'name' => 'description',
            'type' => \Laminas\Form\Element\Textarea::class,
            'attributes' => [
                //'class' => 'form-control',
            ],
            'options' => [
                'label' => 'Product Description:'
            ],
        ]);
        // cost decimal 10,2
        $this->add([
            'name' => 'cost',
            'type' => \Laminas\Form\Element\Number::class,
            'attributes' => [
                'step' => '.01',
            ],
            'options' => [
                'label' => 'Product Cost:'
            ],
        ]);
        // weight decimal 
        $this->add([
            'name' => 'weight',
            'type' => \Laminas\Form\Element\Number::class,
            'attributes' => [
                'step' => '.01',
            ],
            'options' => [
                'label' => 'Product Weight:',
            ],
        ]);
        // manufacturer text
        $this->add([
            'name' => 'manufacturer',
            'type' => \Laminas\Form\Element\Text::class,
            'attributes' => [
                //'class' => 'form-control',
            ],
            'options' => [
                'label' => 'Product Manufaturer:',
            ],
        ]);
        // sku text
        $this->add([
            'name' => 'sku',
            'type' => \Laminas\Form\Element\Text::class,
            'attributes' => [
                //'class' => 'form-control',
            ],
            'options' => [
                'label' => 'Product SKU:'
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
                'label' => 'Is product active?',
            ],
        ]);
        // onSale bool checkbox
        $this->add([
            'name' => 'onSale',
            'type' => \Laminas\Form\Element\Checkbox::class,
            'attributes' => [
                //'class' => 'form-check',
            ],
            'options' => [
                'label' => 'On Sale?',
            ],
        ]);
        // discount decimal 3,2
        $this->add([
            'name' => 'discount',
            'type' => \Laminas\Form\Element\Number::class,
            'attributes' => [
                'width' => '50%',
            ],
            'options' => [
                'label' => 'Discount Amount:'
            ],
        ]);
        // saleStartDate datepicker
        $this->add([
            'name' => 'saleStartDate',
            'type' => \Laminas\Form\Element\DateSelect::class,
            'attributes' => [
                //'class' => 'form-control',
            ],
            'options' => [
                'label' => 'Sale Start Date:',
                'year_attributes' => [
                    'min_year' => -1,
                    'max_year' => 0,
                ],
                'month_attributes' => [],
                'day_attributes' => [],
            ],
        ]);
        // saleEndDate datepicker
        $this->add([
            'name' => 'saleEndDate',
            'type' => \Laminas\Form\Element\DateSelect::class,
            'attributes' => [
                //'class' => 'form-control',
            ],
            'options' => [
                'label' => 'Sale End Date:',
                'year_attributes' => [
                    'min_year' => -1,
                    'max_year' => 0,
                ],
                'month_attributes' => [],
                'day_attributes' => [],
            ],
        ]);
    }
    public function getInputFilterSpecification()
    {
        return [];
    }
}