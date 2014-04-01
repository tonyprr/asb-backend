<?php

class Core_Store_Cart_Item
{
    private $_product = null;
 
    private $_quantity = 0;
 
    private $_subTotal = null;
 
    public function __construct(Core_Store_Product $product = null, $qty = null)
    {
        $this->_product = $product;
        $this->_quantity = (int)$qty;
        $this->_calculateImporte();
    }
 
    public function getProduct()
    {
        return $this->_product;
    }
 
    public function setProduct(Core_Store_Product $product)
    {
        $this->_product = $product;
        $this->_calculateImporte();
    }
 
    public function getId()
    {
        return $this->_product->getId();
    }
 
    public function setId($value)
    {
        $this->_product->setId((int)$value);
    }
 
    public function getName()
    {
        return $this->_product->getName();
    }
 
    public function setName($value)
    {
        $this->_product->setName($value);
    }
 
    public function getPrice()
    {
        return $this->_product->getPrice();
    }
 
    public function setPrice($value)
    {
        $this->_product->setPrice((double)$value);
    }
 
    public function getQuantity()
    {
        return $this->_quantity;
    }
 
    public function setQuantity($value)
    {
        $this->_quantity = (int)$value;
        $this->_calculateImporte();
    }
 
    public function getWeight()
    {
        return $this->_product->getWeight();
    }
 
    public function setWeight($value)
    {
        $this->_product->setWeight((double)$value);
    }
 
    public function getImage()
    {
        return $this->_product->getImage();
    }
 
    public function setImage($value)
    {
        $this->_product->setImage($value);
    }
 
    private function _calculateImporte()
    {
        $this->getSubTotal();
    }
 
    public function getImporte()
    {
        return $this->_subTotal;
    }
   
    public function getSubTotal()
    {
        if ($this->getPrice() != 0 && null !== $this->getPrice()) {
            $this->setSubTotal($this->getQuantity() * $this->getPrice());
            return $this->_subTotal;
        }
        return 0;
    }
 
    public function setSubTotal($value)
    {
        $this->_subTotal = (double)$value;
    }
}