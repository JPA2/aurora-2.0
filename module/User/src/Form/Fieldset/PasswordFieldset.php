<?php
declare(strict_types=1);
namespace User\Form\Fieldset;

use Laminas\Captcha\Image;
use Laminas\Config\Config;
use Laminas\Form\Element\Captcha;
use Laminas\Form\Element\Password;
use Laminas\Form\Fieldset;
use Laminas\Filter\StringTrim;
use Laminas\Filter\StripTags;
use Laminas\InputFilter\InputFilterProviderInterface;
use Laminas\Validator\Identical;
use User\Filter\PasswordFilter;

class PasswordFieldset extends Fieldset implements InputFilterProviderInterface
{
    protected $config;
    public function __construct(Config $appSettings, $name = null, $options = null)
    {
        $this->appSettings = $appSettings;
        parent::__construct('reg-pwd', $options);
    }
    public function init()
    {
        $this->add([
            'name' => 'password',
            'type' => Password::class,
            'options' => [
                'label' => 'Password'
            ],
        ]);
        $this->add([
            'name' => 'conf_password',
            'type' => Password::class,
            'options' => [
                'label' => 'Confirm Password'
            ],
        ]);
        if ($this->appSettings->server->enable_captcha) {
            $this->add([
                'name' => 'captcha',
                'type' => Captcha::class,
                'options' => [
                    'label' => 'Rewrite Captcha text:',
                    'captcha' => new Image([
                        'name' => 'myCaptcha',
                        'messages' => [
                            'badCaptcha' => 'incorrectly rewritten image text'
                        ],
                        'wordLen' => 5,
                        'timeout' => 300,
                        'font' => $_SERVER['DOCUMENT_ROOT'] . '/fonts/arbli.ttf',
                        'imgDir' => $_SERVER['DOCUMENT_ROOT'] . '/modules/app/captcha/',
                        'imgUrl' => '/modules/app/captcha/',
                        'lineNoiseLevel' => 4,
                        'width' => 200,
                        'height' => 70
                    ]),
                ],
            ]);
        }
    }
    public function getInputFilterSpecification()
    {
        return [
            [
                'name' => 'password',
                'required' => true,
                'filters' => [
                    ['name' => StripTags::class],
                    ['name' => StringTrim::class],
                    ['name' => PasswordFilter::class],
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
            [
                'name' => 'conf_password',
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
                            'min' => 1,
                            'max' => 100,
                        ],
                        'name' => Identical::class,
                        'options' => [
                            'token' => 'password',
                            'messages' => [
                                Identical::NOT_SAME => 'Passwords are not the same',
                            ],
                        ],
                    ],
                ],
            ],
        ];
    }
}
