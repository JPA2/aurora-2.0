<?php
namespace Store\Model;
class Product
{
    protected $id;
    protected $cost = 0.00;
    protected $weight = 0.00;
    /**
     * 
     * @var mixed
     */
    protected $sku;

    public function __construct()
    {
        
    }
    public function setId($id)
    {
        $this->id = $id;
    }
    public function getId()
    {
        return $this->id;
    }
    public function setCost($cost)
    {
        $this->cost = $cost;
    }
    public function getCost()
    {
        return $this->cost;
    }
    public function getWeight()
    {
        return $this->weight;
    }
    public function getSku()
    {
        return $this->sku;
    }
}