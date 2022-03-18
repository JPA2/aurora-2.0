<?php
declare(strict_types=1);
namespace Application\Form\Fieldset;

use Laminas\Form\Fieldset;
use Laminas\Form\Element\Csrf;
use Laminas\InputFilter\InputFilterProviderInterface;
use Laminas\Validator\Csrf as CsrfValidator;

class SecurityFieldset extends Fieldset implements InputFilterProviderInterface
{
    public function __construct()
    {
        parent::__construct('security-data');
        $this->setAttribute('id', 'security-data');
    }
    public function init()
    {
        $this->add([
            'name' => 'token',
            'type' => Csrf::class,
        ]);
    }
    public function getInputFilterSpecification()
    {
        return [];
        return [
            'token' => [
                'validators' => [
                    [
                        'name' => CsrfValidator::class,
                    ],
                ],
            ],
        ];
    }
}