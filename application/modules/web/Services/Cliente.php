<?php

namespace web\Services;
use \web\Entity\CmsCliente;
use web\Services\KeysService;
/**
 * Description of Cliente
 *
 * @author aramosr
 */
class Cliente {
    
    /**
     *
     * @var \Doctrine\ORM\EntityManager
     */
    private $_em = null;
    private $_entityName = "\web\Entity\CmsCliente";
    private $_pathCliente;
    
    public function __construct() {
        $this->_em = \Zend_Registry::get('em');
        $this->_pathCliente = PTH_FILES . DS . "cliente" . DS;
    }
    
    /**
     * 
     * @return array
     */
    public function aList($estado="TODOS", $asArray = true, $pageStart=NULL, $pageLimit=NULL) {
        
        $aResult = $this->_em->getRepository($this->_entityName)->listRecords($estado, $asArray, $pageStart, $pageLimit);
        return $aResult;
    }
    
    /**
     * 
     * @return array
     */
    public function getById($id, $asArray=true, $soloActivo=true) {
        $aCliente = $this->_em->getRepository($this->_entityName)->getById($id, $asArray, $soloActivo);
        return $aCliente;
    }
    
    
    public function save($formData) {
        try {
            
            $newRegister = false;
            $subioArchivo = false;

            if (is_numeric($formData['idCliente']) ) {
                $oCliente = $this->_em->find($this->_entityName, $formData['idCliente'] );
            }
            else {
                $oCliente = new \web\Entity\CmsCliente();
//                $oCliente = new $this->_entityName();
                $newRegister = true;
                
            }

            if (isset($formData['idPais'])) {
                $oPais = $this->_em->find("\web\Entity\CmsPais", $formData['idPais'] );
                if(!$oPais)
                    throw new \Exception('No existe categoría. Seleccione primero una Categoria.', 1);
                $oCliente->setPais($oPais);
            }
                
            if (isset($formData['idtipoDocumento'])) {
                $oTipoDocumento = $this->_em->find("web\Entity\CmsTipoDocumento", $formData['idtipoDocumento'] );
                if(!$oTipoDocumento)
                    throw new \Exception('No existe Tipo de Documento. Seleccione primero un Tipo de Documento.');
                $oCliente->setTipoDocumento($oTipoDocumento);
            }
            
//            if (isset($formData['idLanguage']) ) {
//                $oLanguage = $this->_em->find("\web\Entity\CmsLanguage", $formData['idLanguage'] );
//                $oCliente->setLanguage($oLanguage);
//            }
            
            $oCliente->setNombres($formData['nombres']);
            if (isset($formData['apellidoPaterno']))
                $oCliente->setApellidoPaterno($formData['apellidoPaterno']);
            if (isset($formData['apellidoMaterno']))
                $oCliente->setApellidoMaterno($formData['apellidoMaterno']);
            if (isset($formData['nroDocumento']))
                $oCliente->setNroDocumento($formData['nroDocumento']);
            if (isset($formData['genero']))
                $oCliente->setGenero($formData['genero']);
            $oCliente->setFechaNacimiento(new \DateTime($formData['fechaNacimiento']));
            $oCliente->setTelefonoCasa($formData['telefonoCasa']);
            if (isset($formData['telefonoOficina']))
                $oCliente->setTelefonoOficina($formData['telefonoOficina']);
            $oCliente->setMovil($formData['movil']);
            if (isset ($formData['clave']))
                $oCliente->setClave($formData['clave']);
            if (isset ($formData['role']))
                $oCliente->setRole ($formData['role']);
            else
                $oCliente->setRole ('user');
                
            $oCliente->setRecibirOfertasMail(isset($formData['recibirOfertasMail'])?1:0);
            $oCliente->setRecibirOfertasMovil(isset($formData['recibirOfertasMovil'])?1:0);
            
            $oCliente->setEmail($formData['email']);
            $oCliente->setEstado(isset($formData['estado'])?1:0);
            $oCliente->setFechaModificacion( new \DateTime() );
            $this->_em->persist($oCliente);
            $this->_em->flush();
                

            
            /* Subir archivo de imagen */
            $tipo = isset($_FILES['file_image']['type'])?$_FILES['file_image']['type']:'';
            if ($tipo == "image/jpg" || $tipo =="image/jpeg" || $tipo =="image/pjpeg") {
                $aInfoImg = pathinfo($_FILES['file_image']['name']);
                $nomArchivoImg = trim("cliente_" . time() . '_' . $oCliente->getIdCliente()) .'.' . 'jpg';//$aInfoImg['extension']
                @move_uploaded_file($_FILES['file_image']['tmp_name'], $this->_pathCliente . $nomArchivoImg);
                $objThumb = new \Tonyprr_Thumb();
                $res2=$objThumb->thumbjpeg_replace_fijo($this->_pathCliente . $nomArchivoImg, "", 100);
                @unlink($this->_pathCliente . trim($oCliente->getFoto()));
                @unlink($this->_pathCliente . 'thumb_' . trim($oCliente->getFoto()));
                
                $oCliente->setFoto($nomArchivoImg);
                $subioArchivo = true;
            }
            
            if ($subioArchivo == true) {
                $this->_em->persist($oCliente);
                $this->_em->flush();
            }
            return $oCliente;
        } catch(\Exception $e) {
            throw new \Exception("Error al guardar registro. ", 1);//$e->getMessage()
        }
    }
    
    public function delete($idRegistro) {
        try {
            //$oCliente = new CmsCliente();
            $oCliente = $this->_em->find('\web\Entity\CmsCliente', $idRegistro);
            if(!$oCliente)
                throw new \Exception("No exite Cliente con el ID ".$idRegistro .".",2);
            @unlink($this->_pathCliente . trim($oCliente->getFoto()));
            @unlink($this->_pathCliente . 'thumb_' . trim($oCliente->getFoto()));
            /*Eliminar archivos de su galeria*/
//            if ((sizeof($oCliente->getDirecciones()) > 0) ) {
//                foreach ($oCliente->getDirecciones() as $oFotoGale) {
//                    @unlink($this->_pathCliente . trim($oFotoGale->getImagenGale()) );
//                }
//            }
            
            $dqlList = 'DELETE \web\Entity\CmsClienteDireccion cd WHERE cd.cliente = ?1';
            $qyCliente = $this->_em->createQuery($dqlList);
            $qyCliente->setParameter(1, $oCliente);
            $result = $qyCliente->execute();
            $this->_em->remove($oCliente);
            $this->_em->flush();
        } catch(\Exception $e) {
            throw new \Exception("Error en el proceso de eliminar el Cliente.", 1);
        }
    }

    
    public function activacionCliente($user, $key) {
        try {

            $daoKeys = new KeysService();
            $oKey = $daoKeys->verificarActivo($key);
            
            $query = $this->_em->createQuery('SELECT c from ' . $this->_entityName . ' c 
                WHERE c.email = :e_mail');// AND u.estado=1
            $query->setParameter('e_mail' ,$user);
            try {
                $oCliente = $query->getSingleResult();
            } catch(\Doctrine\ORM\NoResultException $e) {
                throw new \Exception('No es un e-mail válido de usuario.',1);
            }
//            $oCliente = new CmsCliente();
            if ($oCliente->getEstado())
                throw new \Exception('El usuario ya se encuentra activo.',1);

            $objEmail = new \Tonyprr_Email();
            $mensaje = "Su usuario ha sido activado correctamente, ¡bienvenido estimado cliente!";
            $objEmail->setBodyHtml($objEmail->convertString($mensaje));
            $objEmail->setFrom($objEmail->getAccount(), $objEmail->convertString($objEmail->getName()) );
            $objEmail->addTo($user);
            $objEmail->setSubject($objEmail->convertString("Activación de Cuenta - Delibouquet"));
            $objEmail->send($objEmail->getMailTrans());

            $oCliente->setEstado(1);
            $oCliente->setFechaModificacion( new \DateTime() );
            $this->_em->persist($oCliente);
            $this->_em->flush();
            $daoKeys->consumirKey($oKey);
            
        } catch(\Doctrine\ORM\NoResultException $e) {
            if ($e->getCode() == 1) throw new \Exception($e->getMessage(),1);
            throw new \Exception('Ocurrió un error en el procesamiento, estaremos solucionandolo en breve.',1);
        }
    }
    


    public function recuperarClave($email) {
        try {

            $genClave = 'delib' . rand(10000, 99999);
            //unset ($formData['estado']);
            $clave = md5($genClave);
            
            $query = $this->_em->createQuery('SELECT c from ' . $this->_entityName . ' c 
                WHERE c.email = :e_mail');// AND u.estado=1
            $query->setParameter('e_mail', $email);
            try {
                $oCliente = $query->getSingleResult();
            } catch(\Doctrine\ORM\NoResultException $e) {
                throw new \Exception('No es un e-mail válido de usuario.',1);
            }
//            $oCliente = new CmsCliente();
            if (!$oCliente->getEstado())
                throw new \Exception('El usuario ya no está activo.', 1);

            $objEmail = new \Tonyprr_Email();
            $mensaje = "Su clave ha sido restaurada, estos son sus datos de acceso:";
            $mensaje .= "Usuario: " . $oCliente->getEmail() . '<br>'; 
            $mensaje .= "Clave: " . $genClave . ' (es recomendable que proceda a cambiarla.)<br>'; 
            $objEmail->setBodyHtml($objEmail->convertString($mensaje));
            $objEmail->setFrom($objEmail->getAccount(), $objEmail->convertString($objEmail->getName()) );
            $objEmail->addTo($email);
            $objEmail->setSubject($objEmail->convertString("Restauración de Clave - Delibouquet"));
            $objEmail->send($objEmail->getMailTrans());
            
            $oCliente->setFechaModificacion( new \DateTime() );
            $oCliente->setClave($clave);
            $this->_em->persist($oCliente);
            $this->_em->flush();
            
        } catch(\Doctrine\ORM\NoResultException $e) {
            if ($e->getCode() == 1) throw new \Exception($e->getMessage(),1);
            throw new \Exception('Ocurrió un error en el procesamiento, estaremos solucionandolo en breve.',1);
        }
    }
    
    public function cambiarClave($id, $clave, $claveNueva=null, $claveConfir=null) {
        $resp = $this->_em->getRepository($this->_entityName)->cambiarClave($id, $clave, $claveNueva, $claveConfir);
        return $resp;
    }
    
}

?>
