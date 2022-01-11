<?php
namespace User\Form;

use Laminas\Form\Form;
use Laminas\Form\Element\Submit;
use Laminas\Form\Element\Text;
use Laminas\Form\Element\Textarea;
use Laminas\Form\Element\DateSelect;
use Laminas\Form\Element\Select;
use Laminas\Form\Element\File;
use Laminas\Form\Element\Csrf;
use Laminas\Form\Element\Hidden;
use Laminas\Form\Element\Number;
// filters
use Laminas\Filter\StringTrim;
use Laminas\Filter\StripTags;
use Laminas\InputFilter\FileInput;
use Laminas\InputFilter\InputFilter;
use Laminas\Validator\StringLength;


class EditProfileForm extends Form
{
    public $elementCLass = 'form-control';
    public $buttonClass = 'btn btn-primary';
    public $errorCLass = 'help-block';
    public $fileClass = 'form-control-file';
    
    
    public function __construct($name = null, $options = [])
    {
        parent::__construct('EditProfileForm', $options);
        parent::setOptions($options);
        //$this->setUseInputFilterDefaults(false);
        //var_dump($options['tmp_dir']);

        // security
        //$csrf = new Csrf('security_token');
        //$this->add($csrf);
        // profile id
        //$profileId = new Hidden('profileId');
        //$this->add($profileId);
        // userId
        //$userId = new Hidden('userId');
        //$this->add($userId);
        
        // create a fieldset for user data
//         $user = new Fieldset('user_data');
        // first Name

        //$this->add($firstName);
        $this->add([
            'name' => 'id',
            'type' => 'hidden',
        ]);
        $this->add([
            'name' => 'userId',
            'type' => 'hidden',
        ]);
        $firstName = new Text();
        $firstName->setName('firstName')
                  ->setLabel('First Name')
                  ->setAttribute('class', $this->elementCLass);
        $this->add($firstName);
        $lastName = new Text();
        $lastName->setName('lastName')
                 ->setLabel('Last Name')
                 ->setAttribute('class', $this->elementCLass);
        $this->add($lastName);
        $age = new Number();
        $age->setName('age')
            ->setLabel('Your Age')
            ->setAttribute('class', $this->elementCLass);
        $this->add($age);
        $bday = new DateSelect();
        $bday->setName('birthday')
             ->setLabel('Birthday')
             ->setAttribute('class', $this->elementCLass);
        $this->add($bday);
        $gender = new Select();
        $gender->setName('gender')
               ->setLabel('Gender')
               ->setAttribute('class', $this->elementCLass)
               ->setValueOptions([
                   'male' => 'Male',
                   'female' => 'Female',
               ]);
        $bio = new Textarea();
        $bio->setName('bio')
            ->setLabel('Biography')
            ->setAttribute('class', $this->elementCLass);

        $file = new File('profileImage');
        $file->setAttribute('id', 'profileImage');
        $file->setLabel('Profile Picture');
        $this->add($file);
        
        $this->add([
            'name' => 'submit',
            'label' => 'Submit',
            'type' => 'submit',
            'attributes' => [
                'value' => 'Submit',
                'id' => 'submitbutton',
                'class' => $this->buttonClass
            ]
        ]);
        $this->addInputFilter();
    }
    public function addInputFilter()
    {
        $inputFilter = new InputFilter();

            $inputFilter->add([
                'name' => 'firstName',
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
                    ],
                ],
            ]);
            $inputFilter->add([
                'name' => 'lastName',
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
                    ],
                ],
            ]);
            $this->setInputFilter($inputFilter);
    }
}