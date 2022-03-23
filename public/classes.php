<?php
use Laminas\Stdlib\ArrayObject;
use Laminas\Filter\StringToLower;
include __DIR__ . '/../vendor/autoload.php';


class Example extends ArrayObject
{

}
$example = new Example([], Example::ARRAY_AS_PROPS);
$filter = new StringToLower();
$string = 'This is a test string';
$example->someVar = $filter->filter($string);
$example->something = 'something else';