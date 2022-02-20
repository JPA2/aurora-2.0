<?php
namespace Store\Model;
use Application\Model\AbstractModel;
use Application\Model\ModelTrait;
class ProductByCategory extends AbstractModel
{
    use ModelTrait;
    public function __construct($tableGateway, $container)
    {
        parent::__construct($tableGateway, $container);
    }
}