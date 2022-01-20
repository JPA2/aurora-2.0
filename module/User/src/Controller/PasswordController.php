<?php
namespace User\Controller;

use Application\Controller\AbstractController;
use Laminas\Db\TableGateway\TableGatewayInterface;
use Laminas\Form\Form;
use \RuntimeException;
use \DateTime;

class PasswordController extends AbstractController
{

    /**
     *
     * @var User\Model\UserTable $userTable
     */
    protected $userTable;

    public function __construct(TableGatewayInterface $table)
    {
        $this->userTable = $table;
        // Debug::dump($this->userTable, __CLASS__.'::'.__LINE__);
    }

    public function resetAction()
    {
        /*
         * TODO: create timestamp representing now
         * TODO: store now stamp in the db
         * TODO: add 86,400 seconds to that stamp and save it as expire time
         * TODO: write reset email method in Utilities\Mailer to send reset password email with link and token
         * TODO: use a /:step param to divide workflow
         * TODO: create form for resetting password
         */
        try {
            $step = $this->params('step');
            $dateTime = new DateTime('NOW');
            

            switch($step)
            {
                case 'one':
                    $startTime = $dateTime->format($this->appSettings->timeFormat);

                break;
                case 'two':

                break;
            }
            //$this->debug::dump();
            if ($step !== 'two') {
                throw new RuntimeException('Step is not two');
            }
        } catch (RuntimeException $e) {
            $this->logger->log(2, $e->getMessage());
        }
    }
}