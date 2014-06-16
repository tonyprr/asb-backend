<?php
use Tonyprr\Exception\ValidacionException;

class Api_ContactoController extends Zend_Controller_Action
{

    public function init()
    {
        $this->_helper->viewRenderer->setNoRender(true);
        $this->_helper->layout->disableLayout();
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
    }

    public function postAction()
    {
            $body = $this->getRequest()->getRawBody();
            $formData = Zend_Json::decode($body);
//            var_dump($cartData);   procesar_compra
            try {
                $fNombre = $formData['nombre'];
                $fEmpresa = $formData['empresa'];
                $fEmail = $formData['email'];
                $fTelefono = $formData['telefono'];
                $fMensaje = $formData['comentario'];

                $template_email=file_get_contents(PTH_PUBLIC . '/../' . 'application' . DS. 'modules' . DS. 'web'. DS  ."templates/contacto.tpl", true);
                if($template_email==false) {
                    $result['success'] = 0;
                    $result['msg'] = "Hubo un problema al enviar el correo.";
                } else {
                        $objEmail = new \Tonyprr_Email();
                        $template_email = str_replace("{tpl_nombre}",$fNombre,$template_email);
                        $template_email = str_replace("{tpl_telefono}",$fTelefono,$template_email);
                        $template_email = str_replace("{tpl_empresa}",$fEmpresa,$template_email);
                        $template_email = str_replace("{tpl_mensaje}",  nl2br($fMensaje),$template_email);

                        $objEmail->setBodyHtml($objEmail->convertString($template_email));
                        $objEmail->addTo("tonyprr@gmail.com", $objEmail->convertString($objEmail->getName()) );
                        $objEmail->setFrom($fEmail, $objEmail->convertString($fNombre));

                        $objEmail->setSubject($objEmail->convertString('ASB - Contacto'));
                        $objEmail->send($objEmail->getMailTrans());
                        $result['success'] = 1;
                        $result['msg'] = "Se envió correctamente, en breve nos pondremos en contacto, gracias.";
                }

                $this->_helper->json->sendJson($result);
            } catch(ValidacionException $e) {
                echo Zend_Json::encode( array("success" => 0, "data" => null, "msg" => $e->getMessage()) );
            } catch(Exception $e) {
                $this->getResponse()->setHttpResponseCode(500);
                echo Zend_Json_Encoder::encode( array("success" => 0,"data" => null,"msg" => $e->getMessage()) );
            }
    }

    public function putAction()
    {
        
    }

    public function deleteAction()
    {
        // action body
    }


}









