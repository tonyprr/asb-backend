<?php
use web\Services\ContentCategoria;
use Tonyprr\Exception\ValidacionException;

class Api_CategoriaContenidoController extends Zend_Controller_Action
{

    public function init()
    {
        $this->_helper->viewRenderer->setNoRender(true);
        $this->_helper->layout->disableLayout();

//        $bootstrap = $this->getInvokeArg('bootstrap');   
//        $options = $bootstrap->getOption('resources');   
//        $contextSwitch = $this->_helper->getHelper('contextSwitch'); 
//        $contextSwitch->addActionContext('index', array('xml','json'))->initContext();
        
    }

    public function indexAction()
    {
        if ($this->_request->isGet()) {
            $this->_forward('get');
        } else {
            $this->getResponse()->setHttpResponseCode(500);
        }
    }

    public function getAction()
    {
        try {
            $data = $this->getRequest()->getParams();
            $pageStart = isset($data['start'])?$data['start']:NULL;
            $pageLimit = isset($data['limit'])?$data['limit']:NULL;
            $idcontCate = isset($data['idcontcate'])?$data['idcontcate']:NULL;
            $srvCategoriaContenido = new ContentCategoria();

            if ($data['operacion'] == "lista") {
                list($aCategoriaContenidos, $total) = $srvCategoriaContenido->aList($idcontCate, 1 ,1, $pageStart, $pageLimit);
                $result['data'] = $aCategoriaContenidos;
            } else if ($data['operacion'] == "getById") {
                $aCategoriaContenido = $srvCategoriaContenido->getById($idcontCate, 1, true, true);
                $result['data'] = $aCategoriaContenido;
                $total = 1;
            }
            
            $result['success'] = 1;
            $result['total'] = $total;
            echo Zend_Json::encode($result);
        } catch(ValidacionException $e) {
            echo Zend_Json::encode( array("success" => 0, "data" => null, "msg" => $e->getMessage()) );
        } catch(\Exception $e) {
            echo Zend_Json_Encoder::encode( array("success" => 0,"data" => null,"msg" => "Error: ".$e->getMessage()) );
        }
    }

    public function postAction()
    {
        // action body
//        echo Zend_Json::encode($this->_todo);
//        $this->getResponse()->setBody('Hello World');
//        $this->getResponse()->setHttpResponseCode(200);
    }

    public function putAction()
    {
        
    }

    public function deleteAction()
    {
        // action body
    }


}









