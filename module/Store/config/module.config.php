<?php

namespace Store;

use Laminas\Router\Http\Segment;
use Laminas\Router\Http\Literal;
use Laminas\Router\Http\Placeholder;
use Uploader\Adapter\TableGatewayAdapter;
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
                    ],
                ],
            ],
            'admin.store' => [
                'type' => Placeholder::class,
                'may_terminate' => true,
                'options' => [
                    'route' => '/admin/store',
                ],
                'child_routes' => [
                    'overview' => [
                        'type' => Literal::class,
                        'may_terminate' => true,
                        'options' => [
                            'route' => '/admin/store/overview',
                            'defaults' => [
                                'controller' => Controller\AdminController::class,
                                'action' => 'overview',
                            ],
                        ],
                    ],
                    'manage.product' => [
                        'type' => Segment::class,
                        'may_terminate' => true,
                        'options' => [
                            'route' => '/admin/store/products[/:action[/:step[/:id]]]',
                            'constraints' => [
                                'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'step' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id' => '[a-zA-Z][a-zA-Z0-9_-]*',
                            ],
                            'defaults' => [
                                'controller' => Controller\AdminProductsController::class,
                                'action' => 'manage',
                            ],
                        ],
                    ],
                    'create.category' => [
                        'type' => Segment::class,
                        'may_terminate' => true,
                        'options' => [
                            'route' => '/admin/store/categories[/:action[/:step[/:id]]]',
                            'constraints' => [
                                'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'step' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id' => '[a-zA-Z][a-zA-Z0-9_-]*',
                            ],
                            'defaults' => [
                                'controller' => Controller\AdminProductsController::class,
                                'action' => 'manage-gategories',
                            ],
                        ],
                    ],
                ],
            ],
        ],
    ],
    'navigation' => [
        'static' => [
            [
                'label' => 'Store',
                'route' => 'store',
                'class' => 'nav-link',
                'resource' => 'user', // todo: add store resource and privileges
                'privilege' => 'view',
                'action' => 'index',
            ],
        ],
        'admin' => [
            [
                'label' => 'Manage Store',
                'uri' => '/admin/store',
                'resource' => 'admin',
                'privilege' => 'admin.access',
                'name' => 'Manage Store',
                'order' => -10,
                'iconClass' => 'mdi mdi-laptop',
                'pages' =>
                [
                    [
                        'label' => 'Store Overview',
                        'route' => 'admin.store/overview',
                        'resource' => 'admin',
                        'privilege' => 'admin.access',
                    ],
                    [
                        'label' => 'Add Category',
                        'route' => 'admin.store/create.category',
                        'resource' => 'admin',
                        'privilege' => 'admin.access'
                    ],
                    [
                        'label' => 'Add Product',
                        'route' => 'admin.store/manage.product',
                        'action' => 'manage',
                        'resource' => 'admin',
                        'privilege' => 'admin.access'
                    ],
                ],
            ]
        ],
    ],
    'view_manager' => [
        'template_path_stack' => [
            'store' => __DIR__ . '/../view'
        ],
    ],
    'upload_manager' => [
        'store' => [
            'adapter' => TableGatewayAdapter::class,
            // if not using the type configuration below the uploader will use a image_dir key for the directory name to upload too
            //'image_dir' => 'images',
            'type' => [
                'products' => [
                    'upload_path' => '/products/images',
                ],
                'categories' => [
                    'upload_path' => '/categories/images',
                ],
            ],
            'db_config' => [
                'table_name' => 'store_images',
                'image_column' => 'fileName', // if the record is to be saved this key must be present and must math the key in the columns below
                'columns' => [
                    'userId',
                    'productId',
                    'categoryId',
                    'type',
                    'fileName',
                    'active',
                ],
            ],
        ],
    ],
];
