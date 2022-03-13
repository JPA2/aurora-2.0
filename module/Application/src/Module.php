<?php
declare(strict_types=1);
namespace Application;

use Application\Controller\AdminController;
use Application\Controller\Factory\AdminControllerFactory;
use Application\Model\Settings;
use Application\Model\ModuleSettings;
use Application\Utils\Mailer;
use Laminas\Db\Adapter\AdapterInterface;
use Laminas\Db\Adapter\Adapter as dbAdapter;
use Laminas\Session;
use Laminas\Mvc\MvcEvent;
use Laminas\Db\TableGateway\TableGateway;
use Laminas\Db\TableGateway\Feature\RowGatewayFeature;
use Laminas\Session\Config\SessionConfig;
use Laminas\Session\Service\SessionConfigFactory;
use Laminas\Session\SaveHandler\DbTableGateway;
use Laminas\Session\SaveHandler\DbTableGatewayOptions;
use Laminas\Session\SessionManager;
use Laminas\Session\Service\SessionManagerFactory;
use Laminas\Session\Validator\RemoteAddr;
use Laminas\Session\Validator\HttpUserAgent;
use Laminas\Log\Logger;
use Laminas\Log\Filter\Priority;
use Laminas\Log\Writer\Db as Dbwriter;
use Laminas\Log\Writer\FirePhp;
use Laminas\Log\Formatter\Db as DbFormatter;
use Laminas\Log\Formatter\FirePhp as FireBugformatter;
use Laminas\Config\Config;
use Laminas\ModuleManager\Feature\ViewHelperProviderInterface;
use Laminas\ModuleManager\Feature\ConfigProviderInterface;
use Laminas\ModuleManager\Feature\ServiceProviderInterface;
use Laminas\ModuleManager\Feature\ControllerProviderInterface;
use Laminas\ServiceManager\Factory\InvokableFactory;

class Module implements 
ConfigProviderInterface,
ServiceProviderInterface,
ControllerProviderInterface,
ViewHelperProviderInterface
{
    public function getConfig(): array
    {
        /** @var array $config */
        return include __DIR__ . '/../config/module.config.php';
    }
    public function onBootstrap(MvcEvent $e)
    {
        $application = $e->getApplication();
        //$this->bootstrapListeners($e);
        $sm = $e->getApplication()->getServiceManager();
        \Laminas\Db\TableGateway\Feature\GlobalAdapterFeature::setStaticAdapter($sm->get(AdapterInterface::class));
        $this->bootstrapSettings($e);
        $this->boostrapSessions($e);
        $this->bootstrapLogging($e);
        $this->boostrapTranslation($e);
        
    }
    public function boostrapSessions($e)
    {
        $sm = $e->getApplication()->getServiceManager();
        $config = $sm->get('Config');
        $dbOptions = [
            'idColumn'       => 'id', 
            'nameColumn'     => 'name',
            'modifiedColumn' => 'modified',
            'lifetimeColumn' => 'lifetime',
            'dataColumn'     => 'data',
        ];
        
        /**
         * @var \Laminas\Session\SessionManager $sessionManager
         */
        $sessionManager = $sm->get(SessionManager::class);
        $saveHandler = new DbTableGateway(
                                            new TableGateway(
                                                            $config['db']['sessions_table_name'], 
                                                            $sm->get(AdapterInterface::class)), 
                                                            new DbTableGatewayOptions($dbOptions)
                                                            );
        $sessionManager->setSaveHandler($saveHandler);
    }
    public function bootstrapListeners($e)
    {
        // $app = $e->getApplication();
        // $ajaxListener = new AjaxListener();
        // $ajaxListener->attach($app->getEventManager(), -99);
    }
    public function bootstrapSettings($e)
    {
        $sm = $e->getApplication()->getServiceManager();
        $settings = $sm->get(Settings::class);
        $handler = new Config($settings->fetchall());
        $sm->setService('AuroraSettings', $handler);
        date_default_timezone_set($handler->timeZone);
    }
    /**
     * 
     * @param $e \Laminas\Mvc\MvcEvent
     */
    public function boostrapTranslation($e)
    {
        // get an instance of the service manager
        $sm = $e->getApplication()->getServiceManager();
        $settings = $sm->get('AuroraSettings');
        if($settings->enableTranslation) {
       // var_dump($sm->get('router'));
        /**
         * 
         * @var $request \Laminas\Http\PhpEnvironment\Request
         */
        $request = $sm->get('request');
        // get the laguages sent by the client 
        $string = $request->getServer('HTTP_ACCEPT_LANGUAGE');
        //var_dump($string);
        // this should be delimeter for the first two prefrences set in the browser
        $needle = ';';
        // find its position
        $position = strpos($string, $needle);
        // return everything before the needle
        $substring = substr($string, 0, $position);
        // get an array of locales with the primary at offest 0
        $locales = explode(',', $substring);        
        /**
         * 
         * @var $translator \Laminas\I18n\Translator\Translator
         */
        $translator = $sm->get('MvcTranslator');
        // set the primary locale as requested by the client
        $translator->setLocale($locales[0]);
        // set option two as the fallback
        $translator->setFallbackLocale([$locales[1]]);
        /**
         * 
         * @var $renderer \Laminas\View\Renderer\PhpRenderer
         */
        $renderer = $sm->get('ViewRenderer');
        // attach the Il8n standard helpers for translation
        $renderer->getHelperPluginManager()->configure(
            (new \Laminas\I18n\ConfigProvider())->getViewHelperConfig()
            );
        }
    }
    /*
     * @var $e Laminas\\Mvc\Event
     */
    public function bootstrapLogging($e)
    {
        $sm = $e->getapplication()->getServiceManager();
        $settings = $sm->get('AuroraSettings');
        $config = $sm->get('config');
        $logger = $sm->get('Laminas\Log\Logger');
        $writer = new Dbwriter(new dbAdapter($config['db']), 'log');
        $standardLogFilter = new Priority(Logger::DEBUG);
        $writer->addFilter($standardLogFilter);

        if($settings->firebugDebug)
        {
            $firePhpWriter = new FirePhp();
            $debugFilter = new Priority(Logger::DEBUG);
            $firePhpWriter->addFilter($debugFilter);
            $writer->addFilter($debugFilter);
            $logger->addWriter($firePhpWriter);
        }
        
        $dbFormatter = new DbFormatter();
        $dbFormatter->setDateTimeFormat($settings->timeFormat);
        $writer->setFormatter($dbFormatter);
        $logger->addWriter($writer);
        if($settings->enableErrorLogging) {
            Logger::registerErrorHandler($logger);
        }
    }
    public function getServiceConfig()
    {
        return [
            'factories' => [
                Laminas\Session\SessionManager::class => Laminas\Session\Service\SessionManagerFactory::class,
                Laminas\Session\Config\SessionConfig::class => Laminas\Session\Service\SessionConfigFactory::class,
                Model\Settings::class => Model\Factory\SettingsFactory::class,
                Utils\Mailer::class => function($container) {
                    $settings = $container->get('AuroraSettings');
                    $request = $container->get('request');
                    return new Mailer($settings, $request, $container);
                },
            ],
        ];
    }
    public function getControllerConfig()
    {
        return [
            'factories' => [
                Controller\AdminController::class => Controller\Factory\AdminControllerFactory::class,
            ],
        ];
    }
    public function getViewHelperConfig()
    {
    	return [
    			'aliases' => [
    					'iconifiedcontrol' => View\Helper\IconifiedControl::class,
    					'IconifiedControl' => View\Helper\IconifiedControl::class,
    					'iconifiedControl' => View\Helper\IconifiedControl::class,
                        'BootstrapForm'    => View\Helper\BootstrapForm::class,
                        'bootstrapform'    => View\Helper\BootstrapForm::class,
                        'bootstrapForm'    => View\Helper\BootstrapForm::class,
                        'BootstrapFormCollection' => View\Helper\BootstrapFormCollection::class,
                        'bootstrapformcollection' => View\Helper\BootstrapFormCollection::class,
                        'bootstrapFormCollection' => View\Helper\BootstrapFormCollection::class,
                        'BootstrapFormRow' => View\Helper\BootstrapFormRow::class,
                        'bootstrapformrow' => View\Helper\BootstrapFormRow::class,
                        'bootstrapFormRow' => View\Helper\BootstrapFormRow::class,
    			],
    			'factories' => [
    					View\Helper\IconifiedControl::class => View\Helper\Service\IconifiedControlFactory::class,
                        View\Helper\BootstrapForm::class => InvokableFactory::class,
                        View\Helper\BootstrapFormCollection::class => InvokableFactory::class,
                        View\Helper\BootstrapFormRow::class => InvokableFactory::class,
    			],
    	];
    }
}