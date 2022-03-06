<?php
namespace Uploader;

return [
    'router' => [
        'routes' => [
            'upload' => [
                'type' => \Laminas\Router\Http\Segment::class,
                'options' => [
                    'route' => '/upload[/:action]',
                    'constraints' => [
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                    ],
                    'defaults' => [
                        'controller' => Controller\UploadController::class,
                        'action' => 'admin-upload',
                    ],
                ],
            ],
        ],
    ],
    'upload_manager' => [
        'role' => 'admin',
        'privilege' => 'admin.access',
    ],
    'view_manager' => [
        'template_path_stack' => [
            'uploader' => __DIR__ . '/../view'
        ]
    ],
];