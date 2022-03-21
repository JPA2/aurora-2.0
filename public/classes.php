<?php

class Example 
{
    public function __construct()
    {
        
    }
    public function __set($name, $value)
    {
        $this->{$name} = $value;
    }
    public function __get($name)
    {
        return $this->{$name};
    }
    public function __isset($name)
    {
        if(isset($this->{$name})) {
            return true;
        }
        else {
            return false;
        }
    }
}
$example = new Example();
$example->someVar = 'This is a test';
$example->something = 'something else';