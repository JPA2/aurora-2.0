<?php
declare(strict_types=1);
namespace User\Form\Fieldset;

use Laminas\Filter\StringTrim;
use Laminas\Filter\StripTags;
use Laminas\Filter\ToInt;
//use Laminas\InputFilter\InputFilterInterface;
use Laminas\Validator\StringLength;
use Laminas\Form\Fieldset;
use User\Model\Users;
use Laminas\Hydrator\ArraySerializableHydrator;
use Laminas\InputFilter\InputFilterProviderInterface;

class AcctDataFieldset extends Fieldset implements InputFilterProviderInterface
{
    /**
     * @var User\Model\Users $usrModel
     */
    /**
     * 
     * @param mixed $name 
     * @param Config $config 
     * @param mixed $options 
     * @return void 
     * @throws InvalidArgumentException 
     */
    public function __construct(Users $usrModel, $name = null, $options = null)
    {
        $this->usrModel = $usrModel;
        parent::__construct('acct-data', $options);
        $this->setAttribute('id', 'acct-data');
    }
    public function init()
    {
        //$this->setHydrator(new ArraySerializableHydrator());
        //$this->setObject($this->usrModel);
        $this->add([
            'name' => 'id',
            'type' => \Laminas\Form\Element\Hidden::class,
        ]);
        $this->add([
            'name' => 'regDate',
            'type' => \Laminas\Form\Element\Hidden::class,
        ]);
        $this->add([
            'name' => 'userName',
            'type' => \Laminas\Form\Element\Text::class,
            'options' => [
                'label' => 'User Name'
            ]
        ]);
        $this->add([
            'name' => 'email',
            'type' => \Laminas\Form\Element\Text::class,
            'options' => [
                'label' => 'Email'
            ]
        ]);
    }
    public function getInputFilterSpecification()
    {
        return [
            [
                'name' => 'id',
                'required' => true,
                'filters' => [
                    ['name' => ToInt::class],
                ],
            ],
            [
                'name' => 'email',
                'required' => false,
                'filters' => [
                    ['name' => StripTags::class],
                    ['name' => StringTrim::class],
                ],
                'validators' => [
                    [
                        'name' => StringLength::class,
                        'options' => [
                            'encoding' => 'UTF-8',
                            'min' => 1,
                            'max' => 100,
                        ],
                    ],
                ],
            ],
        ];
    }
}