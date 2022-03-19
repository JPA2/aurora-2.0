<?Php 
declare(strict_types=1);
namespace Application\Form;

use Laminas\Form\Form;
use Laminas\Form\Element\Csrf;
use Laminas\Form\Element\Submit;
use Laminas\Form\Exception\InvalidArgumentException;

class BaseForm extends Form
{    
    const CREATE = 'create';
    const EDIT   = 'edit';
    /**
     * Which mode is the form in? there is two valid options, create and edit
     * @var string $mode
     */
    protected $mode;
    /**
     * 
     * @param string $mode 
     * @return void 
     * @throws InvalidArgumentException 
     */
    public function __construct($mode = self::CREATE)
    {
        $this->mode = $mode;
        parent::__construct();
    }
    #[\ReturnTypeWillChange]
    public function setMode($mode) : void
    {
        $this->mode = $mode;
    }
    #[\ReturnTypeWillChange]
    public function getMode() : string
    {
        return $this->mode;
    }
    public function addSubmit()
    {
        $this->add([
            'name' => 'submit',
            'type' => Submit::class,
            'attributes' => [
                'value' => 'Submit',
                'id' => 'submitbutton'
            ]
        ]);
    }
}