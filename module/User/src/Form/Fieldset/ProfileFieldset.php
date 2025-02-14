<?Php

declare(strict_types=1);

namespace User\Form\Fieldset;

use Application\Model\Settings;
use Laminas\Form\Fieldset;
use Laminas\Form\Element\Hidden;
use Laminas\Form\Element\Text;
use Laminas\Form\Element\Date;
use Laminas\Form\Element\Textarea;
use Laminas\InputFilter\InputFilterProviderInterface;
use Laminas\Filter\DateTimeFormatter;
use Laminas\Filter\StringTrim;
use Laminas\Filter\StripTags;
use Laminas\Filter\ToInt;
use Laminas\Form\Exception\InvalidArgumentException;
use Laminas\Validator\StringLength;
use Laminas\Validator\Between;
use Laminas\Validator\Digits;
use User\Form\UserForm;

class ProfileFieldset extends Fieldset implements InputFilterProviderInterface
{
    /**
     * @var \Application\Model\Settings $appSettings
     */
    protected $appSettings;
    /**
     * 
     * @param Settings $appSettings 
     * @param mixed $name 
     * @param mixed $options 
     * @return void 
     * @throws InvalidArgumentException 
     */
    public function __construct(Settings $appSettings = null, $options = [])
    {
        $this->appSettings = $appSettings;
        parent::__construct('profile-data');
        $this->setAttribute('id', 'profile-data');
        if(!empty($options)) {
            $this->setOptions($options);
        }
    }
    public function init()
    {
        $this->add([
            'name' => 'id',
            'type' => Hidden::class,
        ]);
        $this->add([
            'name' => 'firstName',
            'type' => Text::class,
            'options' => [
                'label' => ' First Name',
            ],
        ]);
        $this->add([
            'name' => 'lastName',
            'type' => Text::class,
            'options' => [
                'label' => 'Last Name',
            ],
        ]);
        $this->add([
            'name' => 'age',
            'type' => Text::class,
            'options' => [
                'label' => 'Your Age',
            ],
        ]);
        $this->add([
            'name' => 'birthday',
            'type' => Date::class,
            'options' => [
                'label' => 'Birthday',
            ],
        ]);
        $this->add([
            'name' => 'bio',
            'type' => Textarea::class,
            'options' => [
                'label' => 'Biography',
            ],
        ]);
    }
    public function getInputFilterSpecification()
    {
        $options = $this->getOptions();
        return [
            'firstName' => [
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
            ],
            'lastName' => [
                'required' => true,
                'filters' => [
                    ['name' => StripTags::class], // absolutely have to strips these or sql injection is more likely
                    ['name' => StringTrim::class], // trims any trailing whitespace from the value
                ],
                'validators' => [
                    [
                        // only valid for entries between 1 and 100
                        'name' => StringLength::class,
                        'options' => [
                            'encoding' => 'UTF-8',
                            'min' => 1,
                            'max' => 100,
                        ],
                    ],
                ],
            ],
            'age' => [
                'required' => true,
                'filters' => [
                    ['name' => StripTags::class], // absolutely have to strips these or sql injection is more likely
                    ['name' => StringTrim::class], // trims any trailing whitespace from the value
                    // Makes sure that we get an Integer value from getData()
                    ['name' => ToInt::class],
                ],
                'validators' => [
                    ['name' => Digits::class,],
                    [
                        'name' => Between::class,
                        'options' => [
                            'inclusive' => true,
                            'min' => 13,
                            'max' => 120,
                            'messages' => [
                                Between::NOT_BETWEEN => 'You do not meet the age requirements.'
                            ],
                        ],
                    ],
                ],
            ],
            'birthday' => [ // This key corresponds to the name key from init
                'required' => true, // Should the input be required?
                'filters' => [ // there should be 1 array for each filter
                    [
                        'name' => DateTimeFormatter::class, // This is usually the "type" key, not sure why they changed it
                        'options' => [ // This is for any options that will be passed as the filters $options
                            // this sets the filters format to what is set in the app settings file
                            'format' => $this->appSettings->server->time_format,
                        ],
                    ],
                ],
            ],
            // 'bio' => [
            //     'required' => isset($options['mode']) && $options['mode'] === UserForm::CREATE_MODE ? false : true,
            // ],
        ];
    }
}
