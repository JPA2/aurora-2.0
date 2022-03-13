<?php
declare(strict_types=1);
namespace User\Form\Fieldset;

use Laminas\Config\Config;
use Laminas\Form\Fieldset;
class PasswordFieldset extends Fieldset
{
    protected $config;
    public function __construct(Config $config, $name = null, $options = null)
    {
        $this->config = $config;
        parent::__construct('acct-psswd', $options);
    }
    public function init()
    {
        $this->add([
            'name' => 'password',
            'type' => \Laminas\Form\Element\Password::class,
            'options' => [
                'label' => 'Password'
            ]
        ]);
        $this->add([
            'name' => 'conf_password',
            'type' => \Laminas\Form\Element\Password::class,
            'options' => [
                'label' => 'Confirm Password'
            ]
        ]);

        if ($this->config['enableCaptcha']) {
            $this->add([
                'name' => 'captcha',
                'type' => \Laminas\Form\Element\Captcha::class,
                'options' => [
                    'label' => 'Rewrite Captcha text:',
                    'captcha' => new \Laminas\Captcha\Image([
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
                ]
            ]);
        }
    }

}