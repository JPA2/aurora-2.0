<?php

declare(strict_types=1);

namespace Application\Filter;

use Laminas\Filter\FilterInterface;
use InvalidArgumentException;
use RuntimeException;
use function abs;
use function is_string;
use function mb_strlen;
use function strrpos;
use function substr;
use function sprintf;

class FqcnToControllerName implements FilterInterface
{
    protected $encoding = 'UTF-8';
    public function filter($value): string
    {
        if(!is_string($value)) {
            throw new InvalidArgumentException(sprintf('Expecting string $value but recieved: %s', [gettype($value)]));
        }
        // extract actual controller class name
        $length = mb_strlen($value, $this->encoding);
        $lastPosition = strrpos($value, '\\');
        
        $startSlicePosition = $lastPosition - $length + 1;
        $sliceLength = abs($startSlicePosition);

        $value = substr($value, $startSlicePosition, $sliceLength);
        if($sliceLength !== mb_strlen($value, $this->encoding)) {
            throw new RuntimeException('$value could not be filtered');
        }
        else {
            return $value;
        }
    }
}
