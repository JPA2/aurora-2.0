<?php

declare(strict_types=1);

namespace User\Form\Fieldset;

use Laminas\Filter\StringTrim;
use Laminas\Filter\StripTags;
use Laminas\Filter\ToInt;
use Laminas\Validator\StringLength;
use Laminas\Form\Fieldset;
use Laminas\InputFilter\InputFilterProviderInterface;
use Laminas\Validator\EmailAddress;
use User\Form\UserForm;

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
    public function __construct($options = [])
    {
        parent::__construct('acct-data');
        $this->setAttribute('id', 'acct-data');
        if (!empty($options))
            $this->setOptions($options);
    }
    public function init()
    {
        $this->add([
            'name' => 'id',
            'type' => \Laminas\Form\Element\Hidden::class,
        ]);
        if ($this->options['mode'] === UserForm::CREATE_MODE) {
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
        }
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
        $filters = [
            'id' => [
                'filters' => [
                    ['name' => ToInt::class],
                ],
            ],
            'email' => [
                'required' => true,
                'filters' => [
                    ['name' => StripTags::class],
                    ['name' => StringTrim::class],
                ],
                'validators' => [
                    [
                        'name' => StringLength::class,
                        'options' => [
                            'encoding' => 'UTF-8',
                            'min'      => 1,
                            'max'      => 320, // true, we may never see an email this length, but they are still valid
                        ],
                    ],
                    // @see EmailAddress for $options
                    ['name' => EmailAddress::class,],
                ],
            ],
        ];
        if($this->options['mode'] === UserForm::CREATE_MODE) {
            $filter = [
                'userName' => [
                    'required' => true,
                    'filters' => [
                        ['name' => StripTags::class],
                        ['name' => StringTrim::class],
                    ],
                    'validators' => [
                        [
                            'name' => StringLength::class,
                            'options' => [
                                'encoding' => 'UTF-8',
                                'min'      => 1,
                                'max'      => 100, // could there be any reason why you would want a userName that is 100 chars long?
                            ],
                        ],
                    ],
                ],
            ];
            $filters = \array_merge($filters, $filter);
        }
        return $filters;
    }
}
