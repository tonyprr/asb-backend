<?php

namespace Proxies\__CG__\web\Entity;

/**
 * THIS CLASS WAS GENERATED BY THE DOCTRINE ORM. DO NOT EDIT THIS FILE.
 */
class CmsContent extends \web\Entity\CmsContent implements \Doctrine\ORM\Proxy\Proxy
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

    
    public function getIdcontent()
    {
        if ($this->__isInitialized__ === false) {
            return (int) $this->_identifier["idcontent"];
        }
        $this->__load();
        return parent::getIdcontent();
    }

    public function setImagen($imagen)
    {
        $this->__load();
        return parent::setImagen($imagen);
    }

    public function getImagen()
    {
        $this->__load();
        return parent::getImagen();
    }

    public function setImagen2($imagen2)
    {
        $this->__load();
        return parent::setImagen2($imagen2);
    }

    public function getImagen2()
    {
        $this->__load();
        return parent::getImagen2();
    }

    public function setAdjunto($adjunto)
    {
        $this->__load();
        return parent::setAdjunto($adjunto);
    }

    public function getAdjunto()
    {
        $this->__load();
        return parent::getAdjunto();
    }

    public function setUrl($url)
    {
        $this->__load();
        return parent::setUrl($url);
    }

    public function getUrl()
    {
        $this->__load();
        return parent::getUrl();
    }

    public function setAdicional1($adicional1)
    {
        $this->__load();
        return parent::setAdicional1($adicional1);
    }

    public function getAdicional1()
    {
        $this->__load();
        return parent::getAdicional1();
    }

    public function setAdicional2($adicional2)
    {
        $this->__load();
        return parent::setAdicional2($adicional2);
    }

    public function getAdicional2()
    {
        $this->__load();
        return parent::getAdicional2();
    }

    public function setAdicional3($adicional3)
    {
        $this->__load();
        return parent::setAdicional3($adicional3);
    }

    public function getAdicional3()
    {
        $this->__load();
        return parent::getAdicional3();
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

    public function setFechainipub($fechainipub)
    {
        $this->__load();
        return parent::setFechainipub($fechainipub);
    }

    public function getFechainipub()
    {
        $this->__load();
        return parent::getFechainipub();
    }

    public function setFechafinpub($fechafinpub)
    {
        $this->__load();
        return parent::setFechafinpub($fechafinpub);
    }

    public function getFechafinpub()
    {
        $this->__load();
        return parent::getFechafinpub();
    }

    public function setFechamodf($fechamodf)
    {
        $this->__load();
        return parent::setFechamodf($fechamodf);
    }

    public function getFechamodf()
    {
        $this->__load();
        return parent::getFechamodf();
    }

    public function setFechareg($fechareg)
    {
        $this->__load();
        return parent::setFechareg($fechareg);
    }

    public function getFechareg()
    {
        $this->__load();
        return parent::getFechareg();
    }

    public function addLanguage(\web\Entity\CmsContentLanguage $languages)
    {
        $this->__load();
        return parent::addLanguage($languages);
    }

    public function removeLanguage(\web\Entity\CmsContentLanguage $languages)
    {
        $this->__load();
        return parent::removeLanguage($languages);
    }

    public function getLanguages()
    {
        $this->__load();
        return parent::getLanguages();
    }

    public function addGaleria(\web\Entity\CmsContentGaleria $galeria)
    {
        $this->__load();
        return parent::addGaleria($galeria);
    }

    public function removeGaleria(\web\Entity\CmsContentGaleria $galeria)
    {
        $this->__load();
        return parent::removeGaleria($galeria);
    }

    public function getGaleria()
    {
        $this->__load();
        return parent::getGaleria();
    }

    public function addComentario(\web\Entity\CmsContentComentario $comentarios)
    {
        $this->__load();
        return parent::addComentario($comentarios);
    }

    public function removeComentario(\web\Entity\CmsContentComentario $comentarios)
    {
        $this->__load();
        return parent::removeComentario($comentarios);
    }

    public function getComentarios()
    {
        $this->__load();
        return parent::getComentarios();
    }

    public function setContcate(\web\Entity\CmsContentCategoria $contcate = NULL)
    {
        $this->__load();
        return parent::setContcate($contcate);
    }

    public function getContcate()
    {
        $this->__load();
        return parent::getContcate();
    }

    public function setTipo(\web\Entity\CmsContentTipo $tipo = NULL)
    {
        $this->__load();
        return parent::setTipo($tipo);
    }

    public function getTipo()
    {
        $this->__load();
        return parent::getTipo();
    }

    public function setAdicional4($adicional4)
    {
        $this->__load();
        return parent::setAdicional4($adicional4);
    }

    public function getAdicional4()
    {
        $this->__load();
        return parent::getAdicional4();
    }


    public function __sleep()
    {
        return array('__isInitialized__', 'idcontent', 'imagen', 'imagen2', 'adjunto', 'url', 'adicional1', 'adicional2', 'adicional3', 'adicional4', 'orden', 'estado', 'fechainipub', 'fechafinpub', 'fechamodf', 'fechareg', 'languages', 'galeria', 'comentarios', 'contcate', 'tipo');
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