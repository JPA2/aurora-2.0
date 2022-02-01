<?php
namespace Store;
use Store\Controller\IndexController;
use Store\Controller\Factory\PasswordControllerFactory;
use Laminas\Router\Http\Segment;
return [
    'router' => [
        'routes' => [
            'store' => [
                'type' => Segment::class,
                'options' => [
                    'route' => '/store[/:action[/:category[/:subcategory[/:productId]]]]',
                    'constraints' => [
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'category' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'subcategory' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'productId' => '[a-zA-Z][a-zA-Z0-9_-]*',
                    ],
                    'defaults' => [
                        'controller' => Controller\IndexController::class,
                        'action' => 'index'
                    ]
                ]
            ],
            'shipping' => [
                'type' => Segment::class,
                'options' => [
                    'route' => '/store/shipping[/:action[/:orderId]]',
                    'constraints' => [
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'orderId' => '[a-zA-Z][a-zA-Z0-9_-]*',
                    ],
                    'defaults' => [
                        'controller' => Controller\ShippingController::class,
                        'action' => 'index'
                    ]
                ]
            ],
        ],
    ],
    'controllers' => [
        'factories' => [
            Controller\ShippingController::class => Controller\Service\ShippingControllerFactory::class,
            Controller\IndexController::class => Controller\Service\IndexControllerFactory::class
        ],
    ],
    'view_manager' => [
        'template_path_stack' => [
            'store' => __DIR__ . '/../view'
        ]
    ]
];