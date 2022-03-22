<?Php 
declare(strict_types=1);
namespace Application\Form;

use Laminas\Form\Form;
use Laminas\Form\Element\Csrf;
use Laminas\Form\Element\Submit;
use Laminas\Form\Exception\InvalidArgumentException;

class BaseForm extends Form
{    
    /**
     * 
     * @param string $mode 
     * @return void 
     * @throws InvalidArgumentException 
     */
    public function __construct($name = null, $options = [])
    {
        parent::__construct($name);
        parent::setOptions($options);
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