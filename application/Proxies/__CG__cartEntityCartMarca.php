<?php

namespace Proxies\__CG__\cart\Entity;

/**
 * THIS CLASS WAS GENERATED BY THE DOCTRINE ORM. DO NOT EDIT THIS FILE.
 */
class CartMarca extends \cart\Entity\CartMarca implements \Doctrine\ORM\Proxy\Proxy
{
    private $_entityPersister;
    private $_identifier;
    public $__isInitialized__ = false;
    public function __construct($entityPersister, $identifier)
    {
        $this->_entityPersister = $entityPersister;
        $this->_identifier = $identifier;
    }
    /** @private */
    public function __load()
    {
        if (!$this->__isInitialized__ && $this->_entityPersister) {
            $this->__isInitialized__ = true;

            if (method_exists($this, "__wakeup")) {
                // call this after __isInitialized__to avoid infinite recursion
                // but before loading to emulate what ClassMetadata::newInstance()
                // provides.
                $this->__wakeup();
            }

            if ($this->_entityPersister->load($this->_identifier, $this) === null) {
                throw new \Doctrine\ORM\EntityNotFoundException();
            }
            unset($this->_entityPersister, $this->_identifier);
        }
    }

    /** @private */
    public function __isInitialized()
    {
        return $this->__isInitialized__;
    }

    
    public function getIdmarca()
    {
        if ($this->__isInitialized__ === false) {
            return (int) $this->_identifier["idmarca"];
        }
        $this->__load();
        return parent::getIdmarca();
    }

    public function setNombre($nombre)
    {
        $this->__load();
        return parent::setNombre($nombre);
    }

    public function getNombre()
    {
        $this->__load();
        return parent::getNombre();
    }

    public function setLogo($logo)
    {
        $this->__load();
        return parent::setLogo($logo);
    }

    public function getLogo()
    {
        $this->__load();
        return parent::getLogo();
    }

    public function setEstado($estado)
    {
        $this->__load();
        return parent::setEstado($estado);
    }

    public function getEstado()
    {
        $this->__load();
        return parent::getEstado();
    }

    public function setOrden($orden)
    {
        $this->__load();
        return parent::setOrden($orden);
    }

    public function getOrden()
    {
        $this->__load();
        return parent::getOrden();
    }

    public function setFechaActualizacion($fechaActualizacion)
    {
        $this->__load();
        return parent::setFechaActualizacion($fechaActualizacion);
    }

    public function getFechaActualizacion()
    {
        $this->__load();
        return parent::getFechaActualizacion();
    }

    public function setFechaRegistro($fechaRegistro)
    {
        $this->__load();
        return parent::setFechaRegistro($fechaRegistro);
    }

    public function getFechaRegistro()
    {
        $this->__load();
        return parent::getFechaRegistro();
    }

    public function addLanguage(\cart\Entity\CartMarcaLanguage $languages)
    {
        $this->__load();
        return parent::addLanguage($languages);
    }

    public function removeLanguage(\cart\Entity\CartMarcaLanguage $languages)
    {
        $this->__load();
        return parent::removeLanguage($languages);
    }

    public function getLanguages()
    {
        $this->__load();
        return parent::getLanguages();
    }


    public function __sleep()
    {
        return array('__isInitialized__', 'idmarca', 'nombre', 'logo', 'estado', 'orden', 'fechaActualizacion', 'fechaRegistro', 'languages');
    }

    public function __clone()
    {
        if (!$this->__isInitialized__ && $this->_entityPersister) {
            $this->__isInitialized__ = true;
            $class = $this->_entityPersister->getClassMetadata();
            $original = $this->_entityPersister->load($this->_identifier);
            if ($original === null) {
                throw new \Doctrine\ORM\EntityNotFoundException();
            }
            foreach ($class->reflFields as $field => $reflProperty) {
                $reflProperty->setValue($this, $reflProperty->getValue($original));
            }
            unset($this->_entityPersister, $this->_identifier);
        }
        
    }
}