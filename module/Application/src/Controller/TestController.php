<?php
declare(strict_types=1);
namespace Application\Controller;

use Application\Controller\AbstractController;
use Application\Model\Settings;
use User\Model\Users;

class TestController extends AbstractController
{
    protected $usrModel;
    public function __construct(Users $usrModel, Settings $appSettings, ?array $config)
    {
        $this->usrModel = $usrModel;
        $this->appSettings = $appSettings;
        $this->config = $config;
    }
    public function indexAction()
    {
        $users = $this->usrModel->fetchall();
    }
}