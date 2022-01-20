<?php
namespace User\Form;
use Laminas\Form\Element\Email;
use Laminas\Form\Element\Hidden;
use Laminas\Form\Element\Password;
use Laminas\Validator\Identical;
use Laminas\Form\Form;
class ResetPassword extends Form 
{
    public function __construct($name = 'reset_password')
    {
        
    }
}