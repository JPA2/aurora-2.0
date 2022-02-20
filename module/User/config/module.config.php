<?php
namespace User;

use Laminas\Router\Http\Segment;
use Laminas\Router\Http\Literal;
use Laminas\ServiceManager\Factory\InvokableFactory;
use User\Controller\PasswordController;
use User\Controller\Service\PasswordControllerFactory;

return [
    'router' => [
        'routes' => [
            'user' => [
                'type' => Segment::class,
                'options' => [
                    'route' => '/user[/:action[/:userName]]',
                    'constraints' => [
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'userName' => '[a-zA-Z][a-zA-Z0-9_-]*'
                    ],
                    'defaults' => [
                        'controller' => Controller\UserController::class,
                        'action' => 'index'
                    ]
                ]
            ],
            'profile' => [
                'type' => Segment::class,
                'options' => [
                    'route' => '/user/profile[/:action[/:userName]]',
                    'constraints' => [
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'userName' => '[a-zA-Z][a-zA-Z0-9_-]*'
                    ],
                    'defaults' => [
                        'controller' => Controller\ProfileController::class,
                        'action' => 'view'
                    ]
                ]
            ],
            'password' => [
                'type' => Segment::class,
                'options' => [
                    'route' => '/user/password[/:action[/:step]]',
                    'constraints' => [
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'step' => '[a-zA-Z][a-zA-Z0-9_-]*'
                    ],
                    'defaults' => [
                        'controller' => Controller\PasswordController::class,
                        'action' => 'index'
                    ]
                ]
            ],
            'user.register' => [
                'type' => Segment::class,
                'options' => [
                    'route' => '/user/register[/:action[/:id]]',
                    'constraints' => [
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+'
                    ],
                    'defaults' => [
                        'controller' => Controller\RegisterController::class,
                        'action' => 'index'
                    ]
                ]
            ],
            'user.verify' => [
                'type' => Segment::class,
                'options' => [
                    'route' => '/user/register/verify',
                    'constraints' => [
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+'
                    ],
                    'defaults' => [
                        'controller' => Controller\RegisterController::class,
                        'action' => 'verify'
                    ]
                ]
            ],
            'user.admin' => [
                'type' => Segment::class,
                'options' => [
                    'route' => '/user/admin[/:action[/:id]]',
                    'constraints' => [
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+'
                    ],
                    'defaults' => [
                        'controller' => Controller\AdminController::class,
                        'action' => 'index'
                    ],
                ],
            ],
            'widgets' => [
                'type' => Segment::class,
                'options' => [
                    'route' => '/user/widgets[/:action[/:group[/:page[/:itemsPerPage]]]]',
                    'constraints' => [
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'group' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'page' => '[0-9]+',
                        'itemsPerPage' => '[0-9]+'
                    ],
                    'defaults' => [
                        'controller' => Controller\WidgetController::class,
                        'action' => 'list'
                    ],
                ],
            ],
        ],
    ],
    'controllers' => [
        'factories' => [
            Controller\ErrorController::class => InvokableFactory::class,
            Controller\PasswordController::class => Controller\Service\PasswordControllerFactory::class,
            Controller\WidgetController::class => Controller\Service\WidgetControllerFactory::class,
        ]
    ],
    'navigation' => [
        'static' => [
            [
                'label' => 'Users',
                'route' => 'user',
                'class' => 'nav-link',
                'resource' => 'user',
                'privilege' => 'user.view.list'
            ],
            [
                'label' => 'Profile',
                'route' => 'profile',
                'class' => 'nav-link',
                'action' => 'view',
                'resource' => 'user',
                'privilege' => 'view'
            ],
            [
                'label' => 'Login',
                'route' => 'user',
                'class' => 'nav-link',
                'action' => 'login',
                'resource' => 'user',
                'privilege' => 'login.view'
            ],
            [
                'label' => 'Logout',
                'route' => 'user',
                'class' => 'nav-link',
                'action' => 'logout',
                'resource' => 'user',
                'privilege' => 'logout'
            ],
            [
                'label' => 'Register',
                'route' => 'user.register',
                'class' => 'nav-link',
                'action' => 'index',
                'resource' => 'user',
                'privilege' => 'register.view'
            ]
        ],
        'admin' => [
            [
                'label' => 'Admin Users',
                'route' => 'user.admin',
                'class' => 'nav-link',
                // 'controller' => 'admin',
                'action' => 'index',
                'resource' => 'admin',
                'privilege' => 'admin.access'
            ],
            [
                'label' => 'Logout',
                'route' => 'user',
                'class' => 'nav-link',
                'action' => 'logout',
                'resource' => 'user',
                'privilege' => 'logout',
                'order' => 100
            ]
        ]
    ],
    'view_manager' => [
        'template_path_stack' => [
            'user' => __DIR__ . '/../view'
        ]
    ],
    'widgets' => [
        'member_list' => [
            'items_per_page' => 2,
            'display_groups' => 'all',
            'widget_name' => 'Member List',
        ],
        'admin_member_list' => [
            'items_per_page' => 5,
            'display_groups' => 'admin',
            'widget_name' => 'Administrators',
        ],
    ],
];