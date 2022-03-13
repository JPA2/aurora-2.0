<?php
namespace User;

use Laminas\Router\Http\Segment;
use Laminas\Router\Http\Literal;
use Laminas\ServiceManager\Factory\InvokableFactory;
return [
    'db' => [
        'users_table_name' => 'users',
        'user_roles_table_name' => 'user_roles',
    ],
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
            'admin.user' => [
                'type' => Segment::class,
                'options' => [
                    'route' => '/admin/user[/:action[/:id]]',
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
    'navigation' => [
        'static' => [
            [
                'label' => 'Users',
                'route' => 'user',
                'class' => 'nav-link',
                'resource' => 'users',
                'privilege' => 'user.view.list'
            ],
            [
                'label' => 'Profile',
                'route' => 'profile',
                'class' => 'nav-link',
                'action' => 'view',
                'resource' => 'users',
                'privilege' => 'view'
            ],
            [
                'label' => 'Login',
                'route' => 'user',
                'class' => 'nav-link',
                'action' => 'login',
                'resource' => 'users',
                'privilege' => 'login.view'
            ],
            [
                'label' => 'Logout',
                'route' => 'user',
                'class' => 'nav-link',
                'action' => 'logout',
                'resource' => 'users',
                'privilege' => 'logout'
            ],
            [
                'label' => 'Register',
                'route' => 'user.register',
                'class' => 'nav-link',
                'action' => 'index',
                'resource' => 'users',
                'privilege' => 'register.view'
            ]
        ],
        'admin' => [
            [
                'label' => 'Manage Users',
                'route' => 'admin.user',
                'iconClass' => 'mdi mdi-account-multiple text-primary',
                // 'controller' => 'admin',
                'action' => 'index',
                'resource' => 'admin',
                'privilege' => 'admin.access'
            ],
            [
                'label' => 'Logout',
                'route' => 'user',
                'iconClass' => 'mdi mdi-logout text-success',
                'action' => 'logout',
                'resource' => 'user',
                'privilege' => 'logout',
                'order' => 100
            ]
        ]
    ],
    'controllers' => [
        Controller\AdminController::class => Controller\Factory\AdminControllerFactory::class,
        Controller\ErrorController::class => InvokableFactory::class,
        Controller\PasswordController::class => Controller\Service\PasswordControllerFactory::class,
        Controller\WidgetController::class => Controller\Factory\WidgetControllerFactory::class,
    ],
    'service_manager' => [
        'aliases' => [
            //TODO: remove these ASAP
            'Model\UserTable'       => Model\Users::class,
            'User\Model\UserTable'  => Model\Users::class,
            'User\Model\RolesTable' => Model\Roles::class,
            'Acl'                   => Permissions\PermissionsManager::class,
        ],
        'factories' => [
            Model\Users::class => Model\Factory\UsersFactory::class,
            Model\Roles::class => Model\Factory\RolesFactory::class,
            Permissions\PermissionsManager::class => Permissions\Factory\PermissionsManagerFactory::class,
        ],
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