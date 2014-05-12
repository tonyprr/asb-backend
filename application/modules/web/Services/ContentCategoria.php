<?php

namespace web\Services;

/**
 * Description of User
 *
 * @author aramosr
 */
class ContentCategoria {
    
    /**
     *
     * @var \Doctrine\ORM\EntityManager
     */
    private $_em = null;
    private $_entity = "\web\Entity\CmsContentCategoria";
    
    public function __construct() {
        $this->_em = \Zend_Registry::get('em');
    }
    
    /**
     * 
     * @return array
     */
    public function aList($idcontCate=1, $oLanguage=1, $estado="TODOS", $pageStart=NULL, $pageLimit=NULL) {
        $toArray = true;
        $aResult = $this->_em->getRepository($this->_entity)->listRecords($toArray, $idcontCate, $oLanguage, $estado, $pageStart, $pageLimit);
        return $aResult;
    }
    
    /**
     * 
     * @return string
     */
    public function listTree($idcatpadre = 1, $language=1, $todos = false) {
        
        $oUser = $this->_em->getRepository($this->_entity)->getTree($idcatpadre, $language, $todos);
        return $oUser;
    }
    
    /**
     * 
     * @return array
     */
    public function getById($id, $language=1, $asArray=true, $soloActivo=false) {
        $aResult = $this->_em->getRepository($this->_entity)->getById($id, $language, $asArray, $soloActivo);
        return $aResult;
    }
    
}
