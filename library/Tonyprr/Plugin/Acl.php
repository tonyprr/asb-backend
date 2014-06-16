<?php
/*
 * Extiende Zend_Acl para nuestro sitio web
*/
class Tonyprr_Plugin_Acl extends Zend_Acl
{
	public function __construct()
	{
		// Roles
		$this->addRole(new Zend_Acl_Role('invitado') );
		$this->addRole( new Zend_Acl_Role('user') );
//		$this->addRole(new Zend_Acl_Role('user'), 'invitado' );
		$this->addRole(new Zend_Acl_Role('admin'));
 
		// Recursos de lo general a lo particular
		$this->add( new Zend_Acl_Resource('web') );
//		$this->add(new Zend_Acl_Resource('index'), 'web');
//		$this->add(new Zend_Acl_Resource('web_mi-cuenta'), 'web');
//		$this->add(new Zend_Acl_Resource('web_cliente'), 'web');
                
		$this->add(new Zend_Acl_Resource('cart'));
                
                
//		$this->add(new Zend_Acl_Resource('auth'));
//		$this->add(new Zend_Acl_Resource('auth_index'), 'auth');
		$this->add(new Zend_Acl_Resource('admin'));
//		$this->add($this->get('index'), 'admin');
 
		$this->add(new Zend_Acl_Resource('api'));
		$this->addResource('api_categoria-contenido');
		$this->addResource('api_contenido');
		$this->addResource('api_contacto');
                
		// Asignar permisos
		// guest
		$this->allow('invitado', array('web') );
		$this->allow('invitado', array('cart') );
		$this->allow('invitado', array('admin') );
		$this->allow('invitado', array('api') );
		$this->allow('invitado', array('api_categoria-contenido') );
		$this->allow('invitado', array('api_contenido') );
		$this->allow('invitado', array('api_contacto') );
		
                // user
		$this->allow('user', array('web') );
		$this->allow('user', array('cart') );
		$this->allow('user', array('admin') );
		
                $this->allow('user', array('api') );
		// admin
		$this->allow('admin');
    }
}

?>
