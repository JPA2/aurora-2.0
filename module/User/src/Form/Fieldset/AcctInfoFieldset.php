<?php
declare(strict_types=1);
namespace User\Form\Fieldset;

use Laminas\Config\Config;
use Laminas\Form\Exception\InvalidArgumentException;
use Laminas\Form\Fieldset;

class AcctInfoFieldset extends Fieldset
{
    /**
     * @var \Laminas\Config\Config $config
     */
    protected $config;
    /**
     * 
     * @param mixed $name 
     * @param Config $config 
     * @param mixed $options 
     * @return void 
     * @throws InvalidArgumentException 
     */
    public function __construct($name = null, $options = null)
    {
        parent::__construct('acct-info', $options);
    }
    public function init()
    {
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
}