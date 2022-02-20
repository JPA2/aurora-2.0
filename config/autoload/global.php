<?php
use Laminas\Session;
/**
 * Global Configuration Override
 *
 * You can use this file for overriding configuration values from modules, etc.
 * You would place values in here that are agnostic to the environment and not
 * sensitive to security.
 *
 * NOTE: In practice, this file will typically be INCLUDED in your source
 * control, so do not include passwords or other sensitive information in this
 * file.
 */

return [
    'session' => [
        'validators' => [
        ],
    ],
    'session_config' => [
        'use_cookies' => true,
        'gc_maxlifetime' => 86400,
        'remember_me_seconds' => 86400,
        'cookie_httponly' => true,
        'cookie_samesite' => 'Strict',
        //'cookie_secure' => true,
    ],
    'session_storage' => [
        'type' => \Laminas\Session\Storage\SessionArrayStorage::class,
    ],
    'session_validators' => [
                \Laminas\Session\Validator\RemoteAddr::class,
                \Laminas\Session\Validator\HttpUserAgent::class,
    ],
];
