<?Php
declare(strict_types=1);
namespace User\Form\Fieldset;

use Application\Model\Settings;
//use Laminas\Filter\FilterProviderInterface;
use Laminas\Form\Fieldset;
use Laminas\Form\Element\Hidden;
use Laminas\Form\Element\Text;
use Laminas\InputFilter\InputFilterProviderInterface;
use Laminas\Filter\DateTimeFormatter;
use Laminas\Form\Exception\InvalidArgumentException;

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
    public function __construct(Settings $appSettings = null, $name = null, $options = null)
    {
        $this->appSettings = $appSettings;
        parent::__construct('profile-data', $options);
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
            'type' => \Laminas\Form\Element\Number::class,
            'options' => [
                'label' => 'Your Age',
            ],
        ]);
        $this->add([
            'name' => 'birthday',
            'type' => \Laminas\Form\Element\Date::class,
            'options' => [
                'label' => 'Birthday',
            ],
        ]);
        $this->add([
            'name' => 'bio',
            'type' => \Laminas\Form\Element\Textarea::class,
            'options' => [
                'label' => 'Biography',
            ],
        ]);

    }
    public function getInputFilterSpecification()
    {
        return [
            'birthday' => [// This key corresponds to the name key from init
                'required' => true, // Should the input be required?
                'filters' => [// there should be 1 array for each filter
                    [
                        'name' => DateTimeFormatter::class, // This is usually the "type" key, not sure why they changed it
                        'options' => [// This is for any options that will be passed as the filters $options
                            // this sets the filters format to what is set in the app settings file
                            'format' => $this->appSettings->server->time_format,  
                        ],
                    ],
                ],
            ],
        ];
    }
}