<?php
namespace Store\Form;
use Laminas\Form\Form;

class ProductForm extends Form
{
    public function __construct($name, $options = null)
    {
        parent::__construct($name, $options);

        $this->build();
    }
    public function build()
    {
        $data = new \Laminas\form\Fieldset('product-data');
        //$data->setAttribute('class', 'form-group');
        $data->add([
            'name' => 'id',
            'type' => \Laminas\Form\Element\Hidden::class,
        ]);
        $data->add([
            'name' => 'userId',
            'type' => \Laminas\Form\Element\Hidden::class,
        ]);
        // createdDate autogen timestamp
        $data->add([
            'name' => 'createdDate',
            'type' => \Laminas\Form\Element\Hidden::class,
        ]);
        $data->add([
            'name' => 'name',
            'type' => \Laminas\Form\Element\Text::class,
            'attributes' => [
                //'class' => 'form-control',
            ],
            'options' => [
                'label' => 'Product Name:',
            ],
        ]);
        $data->add([
            'name' => 'category',
            'type' => \Laminas\Form\Element\Select::class,
            'attributes' => [
                //'class' => 'form-control',
            ],
            'options' => [
                'label' => 'Product Category:',
                'value_options' => [],
            ],
        ]);
        $data->add([
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
        $data->add([
            'name' => 'cost',
            'type' => \Laminas\Form\Element\Number::class,
            'attributes' => [
                //'class' => 'form-control',
            ],
            'options' => [
                'label' => 'Product Cost:'
            ],
        ]);
        // weight decimal 
        $data->add([
            'name' => 'weight',
            'type' => \Laminas\Form\Element\Number::class,
            'attributes' => [
                //'class' => 'form-control',
            ],
            'options' => [
                'label' => 'Product Weight:',
            ],
        ]);
        // manufacturer text
        $data->add([
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
        $data->add([
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
        $data->add([
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
        $data->add([
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
        $data->add([
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
        $data->add([
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
        $data->add([
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
        $this->add($data);
        // submit
        $this->add(
            [
                'name' => 'send',
                'type' => \Laminas\Form\Element\Button::class,
                'attributes' => [
                    'class' => 'btn btn-primary',
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