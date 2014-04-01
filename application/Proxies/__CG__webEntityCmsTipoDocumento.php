<?php

namespace Proxies\__CG__\web\Entity;

/**
 * THIS CLASS WAS GENERATED BY THE DOCTRINE ORM. DO NOT EDIT THIS FILE.
 */
class CmsTipoDocumento extends \web\Entity\CmsTipoDocumento implements \Doctrine\ORM\Proxy\Proxy
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

    
    public function getIdtipoDocumento()
    {
        if ($this->__isInitialized__ === false) {
            return (int) $this->_identifier["idtipoDocumento"];
        }
        $this->__load();
        return parent::getIdtipoDocumento();
    }

    public function setLongitudTdoc($longitudTdoc)
    {
        $this->__load();
        return parent::setLongitudTdoc($longitudTdoc);
    }

    public function getLongitudTdoc()
    {
        $this->__load();
        return parent::getLongitudTdoc();
    }

    public function setEstadoTipodoc($estadoTipodoc)
    {
        $this->__load();
        return parent::setEstadoTipodoc($estadoTipodoc);
    }

    public function getEstadoTipodoc()
    {
        $this->__load();
        return parent::getEstadoTipodoc();
    }

    public function setTiempoModif($tiempoModif)
    {
        $this->__load();
        return parent::setTiempoModif($tiempoModif);
    }

    public function getTiempoModif()
    {
        $this->__load();
        return parent::getTiempoModif();
    }

    public function addLanguage(\web\Entity\CmsTipoDocumentoLanguage $languages)
    {
        $this->__load();
        return parent::addLanguage($languages);
    }

    public function removeLanguage(\web\Entity\CmsTipoDocumentoLanguage $languages)
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
        return array('__isInitialized__', 'idtipoDocumento', 'longitudTdoc', 'estadoTipodoc', 'tiempoModif', 'languages');
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