<?php
namespace Store\Model;
use Application\Model\AbstractModel;
use Application\Model\ModelTrait;
class Category extends AbstractModel
{
    use ModelTrait;
    public function __construct($tableGateway, $container)
    {
        parent::__construct($tableGateway, $container);
    }
}