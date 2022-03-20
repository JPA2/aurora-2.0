<?php
declare(strict_types=1);
namespace Tubes;

use Laminas\ServiceManager\Factory\InvokableFactory;
use Laminas\Router\Http\Placeholder;
use Laminas\Router\Http\Segment;

return [
    'router' => [
        'routes' => [

        ],
    ],
    'controllers' => [
        'factories' => [
            Controller\IndexController::class => InvokableFactory::class,
        ],
    ],
    'view_manager' => [
        'template_path_stack' => [
            'tubes' => __DIR__ . '/../view',
        ],
    ],
];