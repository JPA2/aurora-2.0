<?php
declare(strict_types=1);

namespace Uploader;
use Laminas\ModuleManager\Feature\FormElementProviderInterface;
use Laminas\ModuleManager\Feature\ControllerProviderInterface;
use Laminas\ModuleManager\Feature\ServiceProviderInterface;
use Uploader\Adapter\Factory\TableGatewayAdapterFactory;
use Uploader\Adapter\TableGatewayAdapter;
use Uploader\AdapterPluginManager;
use Uploader\AdapterPluginManagerFactory;
use Uploader\Controller\Factory\UploadControllerFactory;
use Uploader\Controller\UploadController;
use Uploader\Fieldset\Factory\UploaderAwareFieldsetFactory;
use Uploader\Fieldset\UploaderAwareMultiFile;
use Uploader\Uploader;
use Uploader\UploaderFactory;

class Module implements 
ControllerProviderInterface,
ServiceProviderInterface,
FormElementProviderInterface
{
    /**
     * Retrieve default Uploader config.
     *
     * @return array
     */
    public function getConfig()
    {
        return include __DIR__ . '/../config/module.config.php';
    }
    public function getServiceConfig()
    {
        return [
            'factories' => [
                Uploader::class => UploaderFactory::class,
                AdapterPluginManager::class => AdapterPluginManagerFactory::class,
            ],
        ];
    }
    public function getControllerConfig()
    {
        return [
            'factories' => [
                Controller\UploadController::class => Controller\Factory\UploadControllerFactory::class,
            ],
        ];
    }
    public function getFormElementConfig()
    {
        return [
            'factories' => [
                Fieldset\UploaderAwareFieldset::class => Fieldset\Factory\UploaderAwareFieldsetFactory::class,
                Fieldset\UploaderAwareMultiFile::class => Fieldset\Factory\UploaderAwareMultiFileFactory::class,
            ],
        ];
    }
}