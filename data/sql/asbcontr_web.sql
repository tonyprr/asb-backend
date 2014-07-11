-- phpMyAdmin SQL Dump
-- version 4.1.8
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 07-06-2014 a las 13:27:09
-- Versión del servidor: 5.5.36-cll
-- Versión de PHP: 5.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `asbcontr_web`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cart_carrito`
--

CREATE TABLE IF NOT EXISTS `cart_carrito` (
  `__id_carrito` bigint(20) NOT NULL AUTO_INCREMENT,
  `__id_moneda` int(11) DEFAULT NULL,
  `__id_cliente` bigint(20) DEFAULT NULL,
  `__procesado` tinyint(1) DEFAULT NULL,
  `__secure_key` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__reciclar` tinyint(1) DEFAULT NULL,
  `__fecha_registro` datetime DEFAULT NULL,
  `__fecha_modificacion` datetime DEFAULT NULL,
  `__direccion_envio` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__direccion_pago` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`__id_carrito`),
  KEY `IDX_8C3C76D2B8EBCFA5` (`__id_moneda`),
  KEY `IDX_8C3C76D2177770D3` (`__id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cart_carrito__producto`
--

CREATE TABLE IF NOT EXISTS `cart_carrito__producto` (
  `__id_carrito_producto` int(11) NOT NULL AUTO_INCREMENT,
  `__id_carrito` bigint(20) DEFAULT NULL,
  `__cantidad` double NOT NULL,
  `__precio` double NOT NULL,
  `__fecha_registro` datetime DEFAULT NULL,
  `__fecha_modificacion` datetime DEFAULT NULL,
  `__idProducto` int(11) DEFAULT NULL,
  PRIMARY KEY (`__id_carrito_producto`),
  KEY `IDX_816EC1F7948D5523` (`__id_carrito`),
  KEY `IDX_816EC1F7C9EE6EC8` (`__idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cart_marca`
--

CREATE TABLE IF NOT EXISTS `cart_marca` (
  `__idMarca` int(11) NOT NULL AUTO_INCREMENT,
  `__nombre` varchar(130) COLLATE utf8_unicode_ci NOT NULL,
  `__logo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__estado` tinyint(1) NOT NULL,
  `__orden` int(11) DEFAULT NULL,
  `__fecha_actualizacion` datetime DEFAULT NULL,
  `__fecha_registro` datetime DEFAULT NULL,
  PRIMARY KEY (`__idMarca`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `cart_marca`
--

INSERT INTO `cart_marca` (`__idMarca`, `__nombre`, `__logo`, `__estado`, `__orden`, `__fecha_actualizacion`, `__fecha_registro`) VALUES
(1, 'Wilton''s', 'marca_1388299397_1.jpg', 1, 1, '2013-12-29 01:46:02', '2012-11-04 08:05:11'),
(3, 'nueva marca', 'marca_1388620480_.jpg', 1, 2, '2014-01-01 18:54:40', NULL),
(4, 'mdsdsss', 'marca_1388631762_.jpg', 1, 3, '2014-01-01 22:02:42', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cart_marca_language`
--

CREATE TABLE IF NOT EXISTS `cart_marca_language` (
  `__id_language` int(11) DEFAULT NULL,
  `__id_Marca_Language` int(11) NOT NULL AUTO_INCREMENT,
  `__detalle` longtext COLLATE utf8_unicode_ci,
  `__adjunto` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__idMarca` int(11) DEFAULT NULL,
  PRIMARY KEY (`__id_Marca_Language`),
  KEY `IDX_B0B7710080E64D77` (`__id_language`),
  KEY `IDX_B0B771004A46E613` (`__idMarca`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `cart_marca_language`
--

INSERT INTO `cart_marca_language` (`__id_language`, `__id_Marca_Language`, `__detalle`, `__adjunto`, `__idMarca`) VALUES
(1, 1, 'Marca Wilton''s...', NULL, 1),
(2, 2, '<b>Trademark</b>&nbsp;Wilton''s ...', NULL, 1),
(1, 4, 'ingresar detalle...', NULL, 3),
(1, 5, 'ingresar detalle... xccc', NULL, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cart_moneda`
--

CREATE TABLE IF NOT EXISTS `cart_moneda` (
  `__id_moneda` int(11) NOT NULL AUTO_INCREMENT,
  `__nombre` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `__iso_code` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `__signo` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `__activo` tinyint(1) NOT NULL,
  `__principal` tinyint(1) NOT NULL,
  `__conversion` double NOT NULL,
  `__fecha_actualizacion` datetime DEFAULT NULL,
  `__fecha_registro` datetime DEFAULT NULL,
  PRIMARY KEY (`__id_moneda`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `cart_moneda`
--

INSERT INTO `cart_moneda` (`__id_moneda`, `__nombre`, `__iso_code`, `__signo`, `__activo`, `__principal`, `__conversion`, `__fecha_actualizacion`, `__fecha_registro`) VALUES
(1, 'Nuevo Sol', 'SOL', 'S/.', 1, 1, 0, NULL, '2014-02-16 00:00:00'),
(2, 'Dolar', 'DOL', '$', 1, 0, 1, NULL, '2014-02-16 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cart_movimiento__stock`
--

CREATE TABLE IF NOT EXISTS `cart_movimiento__stock` (
  `__id_movimiento_stock` bigint(20) NOT NULL AUTO_INCREMENT,
  `__id_orden` int(11) DEFAULT NULL,
  `__id_movimiento_stock_tipo` int(11) DEFAULT NULL,
  `__cantidad` int(11) DEFAULT NULL,
  `__idUser` int(11) DEFAULT NULL,
  `__fecha_caducidad` datetime DEFAULT NULL,
  `__fecha_ingreso` datetime DEFAULT NULL,
  `__fecha_registro` datetime DEFAULT NULL,
  `__fecha_actualizacion` datetime DEFAULT NULL,
  `__idProducto` int(11) DEFAULT NULL,
  PRIMARY KEY (`__id_movimiento_stock`),
  KEY `IDX_1A096F3A6CF16A9A` (`__id_orden`),
  KEY `IDX_1A096F3AC9EE6EC8` (`__idProducto`),
  KEY `IDX_1A096F3AEECA34F6` (`__id_movimiento_stock_tipo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `cart_movimiento__stock`
--

INSERT INTO `cart_movimiento__stock` (`__id_movimiento_stock`, `__id_orden`, `__id_movimiento_stock_tipo`, `__cantidad`, `__idUser`, `__fecha_caducidad`, `__fecha_ingreso`, `__fecha_registro`, `__fecha_actualizacion`, `__idProducto`) VALUES
(1, NULL, 2, 5, 1, '2013-12-31 00:00:00', '2013-12-16 00:00:00', '2013-12-17 22:01:20', '2013-12-17 22:01:20', 2),
(2, NULL, 2, 2, 1, NULL, '2014-03-11 00:00:00', '2014-03-10 22:11:43', '2014-03-10 22:11:44', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cart_movimiento__stock_tipo`
--

CREATE TABLE IF NOT EXISTS `cart_movimiento__stock_tipo` (
  `__id_movimiento_stock_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `__nombre` varchar(65) COLLATE utf8_unicode_ci DEFAULT NULL,
  `signo` int(11) DEFAULT NULL,
  `__fecha_registro` datetime DEFAULT NULL,
  `__fecha_actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`__id_movimiento_stock_tipo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `cart_movimiento__stock_tipo`
--

INSERT INTO `cart_movimiento__stock_tipo` (`__id_movimiento_stock_tipo`, `__nombre`, `signo`, `__fecha_registro`, `__fecha_actualizacion`) VALUES
(1, 'Venta', -1, '2012-06-24 07:15:10', '2012-06-24 07:14:22'),
(2, 'Ingreso', 1, '2012-06-24 07:15:10', '2012-06-24 07:14:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cart_orden`
--

CREATE TABLE IF NOT EXISTS `cart_orden` (
  `__id_orden` int(11) NOT NULL AUTO_INCREMENT,
  `__id_carrito` bigint(20) DEFAULT NULL,
  `__id_cliente` bigint(20) DEFAULT NULL,
  `__id_moneda` int(11) DEFAULT NULL,
  `__id_orden_estado` int(11) DEFAULT NULL,
  `__tipo_documento` int(11) NOT NULL,
  `__direccion_envio` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `__direccion_pago` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `_sub__total` double DEFAULT NULL,
  `__total_impuesto` double DEFAULT NULL,
  `__impuesto_ratio` double DEFAULT NULL,
  `__total` double DEFAULT NULL,
  `__total_descuento` double DEFAULT NULL,
  `__total_final` double DEFAULT NULL,
  `__costo_envio` double DEFAULT NULL,
  `__cuenta_banco` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__fecha_procesado` datetime DEFAULT NULL,
  `__fecha_envio` date DEFAULT NULL,
  `__hora_envio` varchar(14) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__fecha_modificado` datetime DEFAULT NULL,
  `__codigo_voucher` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__nro_factura` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__ruc_cliente` varchar(19) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__razon_social` varchar(140) COLLATE utf8_unicode_ci DEFAULT NULL,
  `_persona__recepcion` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__fecha_deposito` date DEFAULT NULL,
  `__hora_deposito` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__id_ubigeo` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__id_orden_tipo` int(11) DEFAULT NULL,
  `__acepta_politica` tinyint(1) NOT NULL,
  `__tipo_pago` int(11) NOT NULL,
  `__codigo_transaccion` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`__id_orden`),
  KEY `IDX_BEC2A2DF948D5523` (`__id_carrito`),
  KEY `IDX_BEC2A2DF177770D3` (`__id_cliente`),
  KEY `IDX_BEC2A2DFB8EBCFA5` (`__id_moneda`),
  KEY `IDX_BEC2A2DF391D3278` (`__id_orden_estado`),
  KEY `IDX_BEC2A2DFCF0E7B73` (`__id_ubigeo`),
  KEY `IDX_BEC2A2DF9F6B78C6` (`__id_orden_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cart_orden__detalle`
--

CREATE TABLE IF NOT EXISTS `cart_orden__detalle` (
  `__id_orden_detalle` bigint(20) NOT NULL AUTO_INCREMENT,
  `__id_orden` int(11) DEFAULT NULL,
  `__producto_nombre` varchar(170) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__cantidad` double DEFAULT NULL,
  `__precio_unitario` double DEFAULT NULL,
  `__precio_total` double DEFAULT NULL,
  `__impuesto_total` double DEFAULT NULL,
  `__impuesto_ratio` double DEFAULT NULL,
  `__fecha_registro` datetime DEFAULT NULL,
  `__fecha_modificacion` datetime DEFAULT NULL,
  `__idProducto` int(11) DEFAULT NULL,
  PRIMARY KEY (`__id_orden_detalle`),
  KEY `IDX_82254A936CF16A9A` (`__id_orden`),
  KEY `IDX_82254A93C9EE6EC8` (`__idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cart_orden__estado`
--

CREATE TABLE IF NOT EXISTS `cart_orden__estado` (
  `__id_orden_estado` int(11) NOT NULL AUTO_INCREMENT,
  `__activo` tinyint(1) DEFAULT NULL,
  `__color` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__envio_email` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`__id_orden_estado`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `cart_orden__estado`
--

INSERT INTO `cart_orden__estado` (`__id_orden_estado`, `__activo`, `__color`, `__envio_email`) VALUES
(1, 1, NULL, 0),
(2, 1, NULL, 0),
(3, 1, NULL, 0),
(4, 1, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cart_orden__estado_language`
--

CREATE TABLE IF NOT EXISTS `cart_orden__estado_language` (
  `__id_orden_estado` int(11) DEFAULT NULL,
  `__id_language` int(11) DEFAULT NULL,
  `__id_OrdenEstado_Language` int(11) NOT NULL AUTO_INCREMENT,
  `__nombre` varchar(140) COLLATE utf8_unicode_ci NOT NULL,
  `__detalle` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`__id_OrdenEstado_Language`),
  KEY `IDX_C48823DF391D3278` (`__id_orden_estado`),
  KEY `IDX_C48823DF80E64D77` (`__id_language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `cart_orden__estado_language`
--

INSERT INTO `cart_orden__estado_language` (`__id_orden_estado`, `__id_language`, `__id_OrdenEstado_Language`, `__nombre`, `__detalle`) VALUES
(1, 1, 1, 'Pendiente de Cancelar', NULL),
(1, 2, 2, 'Pending Cancel', NULL),
(2, 1, 3, 'Pendiente de Verificar Voucher', NULL),
(2, 2, 4, 'Pending Check Voucher', NULL),
(3, 1, 5, 'Cancelado', NULL),
(3, 2, 6, 'Canceled', NULL),
(4, 1, 7, 'Anulado', NULL),
(4, 2, 8, 'annulled', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cart_orden__tipo`
--

CREATE TABLE IF NOT EXISTS `cart_orden__tipo` (
  `__id_orden_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `__activo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`__id_orden_tipo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `cart_orden__tipo`
--

INSERT INTO `cart_orden__tipo` (`__id_orden_tipo`, `__activo`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cart_orden__tipo_language`
--

CREATE TABLE IF NOT EXISTS `cart_orden__tipo_language` (
  `__id_orden_tipo` int(11) DEFAULT NULL,
  `__id_language` int(11) DEFAULT NULL,
  `__id_OrdenTipo_Language` int(11) NOT NULL AUTO_INCREMENT,
  `__descripcion` varchar(140) COLLATE utf8_unicode_ci NOT NULL,
  `__detalle` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`__id_OrdenTipo_Language`),
  KEY `IDX_AABC39539F6B78C6` (`__id_orden_tipo`),
  KEY `IDX_AABC395380E64D77` (`__id_language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `cart_orden__tipo_language`
--

INSERT INTO `cart_orden__tipo_language` (`__id_orden_tipo`, `__id_language`, `__id_OrdenTipo_Language`, `__descripcion`, `__detalle`) VALUES
(1, 1, 1, 'Cumpleaños', NULL),
(2, 1, 2, 'Aniversario', NULL),
(3, 1, 3, 'Nacimiento', NULL),
(4, 1, 4, 'Regalo', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cart_producto`
--

CREATE TABLE IF NOT EXISTS `cart_producto` (
  `__idProducto` int(11) NOT NULL AUTO_INCREMENT,
  `__codigo_producto` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `__precio` double DEFAULT NULL,
  `__cantidad` double DEFAULT NULL,
  `__cantidad_vendidos` double DEFAULT NULL,
  `__peso` double DEFAULT NULL,
  `__orden` int(11) DEFAULT NULL,
  `__estado` tinyint(1) NOT NULL,
  `__fechaIniPub` date DEFAULT NULL,
  `__fechaFinPub` date DEFAULT NULL,
  `__fechamodif` datetime DEFAULT NULL,
  `__fechareg` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `__idMarca` int(11) DEFAULT NULL,
  `__idContCate` int(11) DEFAULT NULL,
  `__imagen` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__adjunto` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__idTipo` int(11) DEFAULT NULL,
  `__precio1` double DEFAULT NULL,
  `__precio2` double DEFAULT NULL,
  PRIMARY KEY (`__idProducto`),
  KEY `IDX_3924497E4A46E613` (`__idMarca`),
  KEY `IDX_3924497EA07E7B24` (`__idContCate`),
  KEY `IDX_3924497E8EAB4527` (`__idTipo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `cart_producto`
--

INSERT INTO `cart_producto` (`__idProducto`, `__codigo_producto`, `__precio`, `__cantidad`, `__cantidad_vendidos`, `__peso`, `__orden`, `__estado`, `__fechaIniPub`, `__fechaFinPub`, `__fechamodif`, `__fechareg`, `__idMarca`, `__idContCate`, `__imagen`, `__adjunto`, `__idTipo`, `__precio1`, `__precio2`) VALUES
(2, 'PR00001', 10, 7, 0, NULL, 1, 1, NULL, NULL, '2014-03-10 22:11:45', NULL, 1, 2, 'producto_1377469867_2.jpg', NULL, 1, 2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cart_producto_comentario`
--

CREATE TABLE IF NOT EXISTS `cart_producto_comentario` (
  `__id_producto_comentario` bigint(20) NOT NULL AUTO_INCREMENT,
  `__id_cliente` bigint(20) DEFAULT NULL,
  `__titulo` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__comentario` longtext COLLATE utf8_unicode_ci NOT NULL,
  `__estado` tinyint(1) DEFAULT NULL,
  `__fecha_registro` datetime DEFAULT NULL,
  `__idProducto` int(11) DEFAULT NULL,
  PRIMARY KEY (`__id_producto_comentario`),
  KEY `IDX_A3BED91CC9EE6EC8` (`__idProducto`),
  KEY `IDX_A3BED91C177770D3` (`__id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cart_producto_language`
--

CREATE TABLE IF NOT EXISTS `cart_producto_language` (
  `__id_language` int(11) DEFAULT NULL,
  `__id_Producto_Language` int(11) NOT NULL AUTO_INCREMENT,
  `__nombre` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__intro` longtext COLLATE utf8_unicode_ci,
  `__ficha` longtext COLLATE utf8_unicode_ci,
  `__adjunto` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__idProducto` int(11) DEFAULT NULL,
  PRIMARY KEY (`__id_Producto_Language`),
  KEY `IDX_EC2FBEBEC9EE6EC8` (`__idProducto`),
  KEY `IDX_EC2FBEBE80E64D77` (`__id_language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `cart_producto_language`
--

INSERT INTO `cart_producto_language` (`__id_language`, `__id_Producto_Language`, `__nombre`, `__intro`, `__ficha`, `__adjunto`, `__idProducto`) VALUES
(1, 2, 'producto 1xxzzzz', '', '<p>jhd jsh js djs dsdsds vefkhsjf hdjk fjd fhjd fj hdfj djf jd fhd</p>', NULL, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cart_producto__categoria`
--

CREATE TABLE IF NOT EXISTS `cart_producto__categoria` (
  `__idContCate` int(11) NOT NULL AUTO_INCREMENT,
  `__nivel_cate` int(11) DEFAULT NULL,
  `__imagen_cate` varchar(260) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__orden_cate` int(11) NOT NULL,
  `__state_cate` tinyint(1) NOT NULL,
  `__fechamodf_cate` datetime DEFAULT NULL,
  `__fechareg_cate` datetime DEFAULT NULL,
  `__idContCate_Padre` int(11) DEFAULT NULL,
  PRIMARY KEY (`__idContCate`),
  KEY `IDX_EBA38D2ED83BB542` (`__idContCate_Padre`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `cart_producto__categoria`
--

INSERT INTO `cart_producto__categoria` (`__idContCate`, `__nivel_cate`, `__imagen_cate`, `__orden_cate`, `__state_cate`, `__fechamodf_cate`, `__fechareg_cate`, `__idContCate_Padre`) VALUES
(1, 0, NULL, 1, 1, '2012-11-03 19:11:06', '2012-11-03 19:11:10', 1),
(2, 1, NULL, 1, 1, '2012-11-03 19:17:28', '2012-11-03 19:17:32', 1),
(3, 1, NULL, 1, 1, '2014-02-19 22:48:07', '2014-02-19 22:48:07', 1),
(4, 1, NULL, 3, 1, '2014-02-19 22:51:13', '2014-02-19 22:51:13', 1),
(5, 1, NULL, 4, 1, '2014-02-19 22:58:32', '2014-02-19 22:58:32', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cart_producto__categoria_language`
--

CREATE TABLE IF NOT EXISTS `cart_producto__categoria_language` (
  `__id_language` int(11) DEFAULT NULL,
  `__id_ProductoCate_Language` int(11) NOT NULL AUTO_INCREMENT,
  `__descripcion` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `__detalle` longtext COLLATE utf8_unicode_ci,
  `__idContCate` int(11) DEFAULT NULL,
  PRIMARY KEY (`__id_ProductoCate_Language`),
  KEY `IDX_72D6DF5DA07E7B24` (`__idContCate`),
  KEY `IDX_72D6DF5D80E64D77` (`__id_language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=14 ;

--
-- Volcado de datos para la tabla `cart_producto__categoria_language`
--

INSERT INTO `cart_producto__categoria_language` (`__id_language`, `__id_ProductoCate_Language`, `__descripcion`, `__detalle`, `__idContCate`) VALUES
(1, 1, 'categoria raiz', NULL, 1),
(2, 2, 'root category', NULL, 1),
(1, 3, 'Categoría 1', '<font face="tahoma, arial, verdana, sans-serif"><span style="font-size: 12px;">​detalle de la&nbsp;</span></font><b><font color="#ff0000"><font face="tahoma, arial, verdana, sans-serif"><span style="font-size: 12px;">categoría&nbsp;1.</span></font></font></b>', 2),
(2, 4, 'Línea de Productos 1', NULL, 2),
(2, 8, 'descripcion', NULL, 1),
(2, 10, 'descripcion', NULL, 1),
(1, 11, 'descripcion x', '​', 3),
(1, 12, 'descripcion', NULL, 4),
(1, 13, 'descripcion', NULL, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cart_producto__categoria_tipo`
--

CREATE TABLE IF NOT EXISTS `cart_producto__categoria_tipo` (
  `__id_ProductoCate_Tipo` int(11) NOT NULL AUTO_INCREMENT,
  `__cantidad` decimal(10,0) DEFAULT NULL,
  `__estado` tinyint(1) DEFAULT NULL,
  `__idContCate` int(11) DEFAULT NULL,
  `__idTipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`__id_ProductoCate_Tipo`),
  KEY `IDX_2A7E5BC1A07E7B24` (`__idContCate`),
  KEY `IDX_2A7E5BC18EAB4527` (`__idTipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cart_producto__galeria`
--

CREATE TABLE IF NOT EXISTS `cart_producto__galeria` (
  `__idContGale` int(11) NOT NULL AUTO_INCREMENT,
  `__orden_gale` int(11) NOT NULL,
  `__imagen_gale` varchar(260) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__fechareg_gale` datetime DEFAULT NULL,
  `__idProducto` int(11) DEFAULT NULL,
  PRIMARY KEY (`__idContGale`),
  KEY `IDX_D5ACFFFFC9EE6EC8` (`__idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cart_producto__galeria_language`
--

CREATE TABLE IF NOT EXISTS `cart_producto__galeria_language` (
  `__id_language` int(11) DEFAULT NULL,
  `__id_ProductoGale_Language` int(11) NOT NULL AUTO_INCREMENT,
  `__titulo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__descripcion` longtext COLLATE utf8_unicode_ci,
  `__idContGale` int(11) DEFAULT NULL,
  PRIMARY KEY (`__id_ProductoGale_Language`),
  KEY `IDX_57E70AFEAD07742A` (`__idContGale`),
  KEY `IDX_57E70AFE80E64D77` (`__id_language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cart_producto__tipo`
--

CREATE TABLE IF NOT EXISTS `cart_producto__tipo` (
  `__idTipo` int(11) NOT NULL AUTO_INCREMENT,
  `__imagen` varchar(260) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__orden` int(11) NOT NULL,
  `__estado` tinyint(1) NOT NULL,
  `__fechamodf` datetime DEFAULT NULL,
  `__fechareg` datetime DEFAULT NULL,
  PRIMARY KEY (`__idTipo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `cart_producto__tipo`
--

INSERT INTO `cart_producto__tipo` (`__idTipo`, `__imagen`, `__orden`, `__estado`, `__fechamodf`, `__fechareg`) VALUES
(1, NULL, 1, 1, '2012-11-04 08:04:01', '2012-11-04 08:04:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cart_producto__tipo_language`
--

CREATE TABLE IF NOT EXISTS `cart_producto__tipo_language` (
  `__id_language` int(11) DEFAULT NULL,
  `__id_ProductoTipo_Language` int(11) NOT NULL AUTO_INCREMENT,
  `__descripcion` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `__detalle` longtext COLLATE utf8_unicode_ci,
  `__idTipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`__id_ProductoTipo_Language`),
  KEY `IDX_8FB0D1438EAB4527` (`__idTipo`),
  KEY `IDX_8FB0D14380E64D77` (`__id_language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `cart_producto__tipo_language`
--

INSERT INTO `cart_producto__tipo_language` (`__id_language`, `__id_ProductoTipo_Language`, `__descripcion`, `__detalle`, `__idTipo`) VALUES
(1, 1, 'General', NULL, 1),
(2, 2, 'General', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cms_cliente`
--

CREATE TABLE IF NOT EXISTS `cms_cliente` (
  `__id_cliente` bigint(20) NOT NULL AUTO_INCREMENT,
  `__idtipo_documento` smallint(6) DEFAULT NULL,
  `__role` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `__nombres` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `__apellido_paterno` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__apellido_materno` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__email` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `__nro_documento` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__genero` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__fecha_nacimiento` date DEFAULT NULL,
  `__telefono_casa` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__telefono_oficina` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__movil` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__clave` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__recibir_ofertas_mail` tinyint(1) DEFAULT NULL,
  `__recibir_ofertas_movil` tinyint(1) DEFAULT NULL,
  `__estado` tinyint(1) NOT NULL,
  `__foto` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__fecha_modificacion` datetime DEFAULT NULL,
  `__fecha_Registro` datetime DEFAULT NULL,
  `__id_Pais` int(11) DEFAULT NULL,
  PRIMARY KEY (`__id_cliente`),
  UNIQUE KEY `cliente_mail_idx` (`__email`),
  KEY `IDX_AAF09434FC739DE` (`__id_Pais`),
  KEY `IDX_AAF0943420C3C396` (`__idtipo_documento`),
  KEY `cliente_role_idx` (`__role`),
  KEY `cliente_nombres_idx` (`__nombres`),
  KEY `cliente_apepat_idx` (`__apellido_paterno`),
  KEY `cliente_apemat_idx` (`__apellido_materno`),
  KEY `cliente_clave_idx` (`__clave`),
  KEY `cliente_estado_idx` (`__estado`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `cms_cliente`
--

INSERT INTO `cms_cliente` (`__id_cliente`, `__idtipo_documento`, `__role`, `__nombres`, `__apellido_paterno`, `__apellido_materno`, `__email`, `__nro_documento`, `__genero`, `__fecha_nacimiento`, `__telefono_casa`, `__telefono_oficina`, `__movil`, `__clave`, `__recibir_ofertas_mail`, `__recibir_ofertas_movil`, `__estado`, `__foto`, `__fecha_modificacion`, `__fecha_Registro`, `__id_Pais`) VALUES
(1, 1, 'user', 'antonio', 'djskdj sk', 'k jk djsdk', 'tonyprr@gmail.com', '978787545', 'M', '2013-12-03', '2852847', '', '981894179', '81dc9bdb52d04dc20036dbd8313ed055', 1, 1, 1, NULL, '2014-02-16 23:38:33', NULL, 1),
(3, NULL, 'user', 'Lily', NULL, NULL, 'liliana.nolasco@gmail.com', NULL, NULL, '1980-06-12', '23232232', NULL, '', '52e16acfffa766e2225f67f047693d6c', 0, 0, 0, NULL, '2014-03-06 23:12:33', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cms_cliente__direccion`
--

CREATE TABLE IF NOT EXISTS `cms_cliente__direccion` (
  `__id_cliente_direccion` bigint(20) NOT NULL AUTO_INCREMENT,
  `_id__cliente` bigint(20) DEFAULT NULL,
  `__id_tipo_direccion` int(11) DEFAULT NULL,
  `__cod_postal` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__dirprin_despacho` tinyint(1) DEFAULT NULL,
  `__dir_despacho` tinyint(1) NOT NULL,
  `__dir_factura` tinyint(1) NOT NULL,
  `__direccion` varchar(130) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__estado` tinyint(1) DEFAULT NULL,
  `__fecha_Registro` datetime DEFAULT NULL,
  `__fecha_Modificacion` datetime DEFAULT NULL,
  `__user_modificacion` bigint(20) DEFAULT NULL,
  `__id_Pais` int(11) DEFAULT NULL,
  PRIMARY KEY (`__id_cliente_direccion`),
  KEY `IDX_20DBC7238E322433` (`_id__cliente`),
  KEY `IDX_20DBC72340EF4DF3` (`__id_tipo_direccion`),
  KEY `IDX_20DBC723FC739DE` (`__id_Pais`),
  KEY `IDX_20DBC723E49AB9DF` (`__cod_postal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cms_content`
--

CREATE TABLE IF NOT EXISTS `cms_content` (
  `__idContent` int(11) NOT NULL AUTO_INCREMENT,
  `__imagen` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__adjunto` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__orden` int(11) DEFAULT NULL,
  `__estado` tinyint(1) NOT NULL,
  `__fecha_IniPub` date DEFAULT NULL,
  `__fecha_FinPub` date DEFAULT NULL,
  `__fecha_modf` datetime DEFAULT NULL,
  `__fecha_reg` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `__idContCate` int(11) DEFAULT NULL,
  `__idTipo` int(11) DEFAULT NULL,
  `__url` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__adicional1` text COLLATE utf8_unicode_ci,
  `__adicional2` text COLLATE utf8_unicode_ci,
  `__adicional3` text COLLATE utf8_unicode_ci,
  `__adicional4` text COLLATE utf8_unicode_ci,
  `__adicional5` varchar(130) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__adicional6` varchar(130) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__adicional7` varchar(130) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__imagen2` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`__idContent`),
  KEY `IDX_A0293FB8A07E7B24` (`__idContCate`),
  KEY `IDX_A0293FB88EAB4527` (`__idTipo`),
  KEY `content_estado_idx` (`__estado`),
  KEY `content_fechainipub_idx` (`__fecha_FinPub`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=34 ;

--
-- Volcado de datos para la tabla `cms_content`
--

INSERT INTO `cms_content` (`__idContent`, `__imagen`, `__adjunto`, `__orden`, `__estado`, `__fecha_IniPub`, `__fecha_FinPub`, `__fecha_modf`, `__fecha_reg`, `__idContCate`, `__idTipo`, `__url`, `__adicional1`, `__adicional2`, `__adicional3`, `__adicional4`, `__adicional5`, `__adicional6`, `__adicional7`, `__imagen2`) VALUES
(1, 'content_1400544114_1.jpg', NULL, 2, 1, '2014-01-08', NULL, '2014-05-25 22:13:28', NULL, 6, 2, '', 'AREQUIPA 2', '<p>&bull; Departamentos d&uacute;plex de 1 dormitorio.<br />&bull; Departamento flat de 2 y 3 dormitorios.<br />&bull; Estacionamiento Techado.<br />&bull; Intercomicador autom&aacute;tico con video portero<br />&bull; sistame contraincendio.<br />&bull; Cistema para agua con capacidad de 100 M3.<br />&bull; Tanque elevado para agua de 30 m3.<br />&bull; Puerta levadiza con control remoto.<br />&bull; Amplio hall de ingreso.<br />&bull; Dos Ascensores.<br />&bull; Piscina.<br />&bull; terraza y B.B.Q.</p>', '<p>&bull; Tablero el&eacute;ctronico con llave de control termomagnetico.<br />&bull; Instalaci&oacute;n para antena TV y cable.<br />&bull; Instalaci&oacute;n para intercomunicador y tel&eacute;fono<br />&bull; Sistema contra incendios de &aacute;reas comunes.<br />&bull; Instalaci&oacute;n para therma y lavadora.<br />&bull; Cocina, lavander&iacute;a, cuarto y ba&ntilde;o de servicio.<br />&bull; Ba&ntilde;o inconporado en dormitorio principal.<br />&bull; Sala - comedor con balc&oacute;n.<br />&bull; Dos Ascensores.<br />&bull; terraza y B.B.Q.</p>', '<p>&bull; Cristales templados en mamparas y ventanas exteriores.<br />&bull; Cristales con perfiles de aluminio en ventanas interiores.<br />&bull; Muros empastados y pintura lavable.<br />&bull; Puertas principales apaneladas de madera selecta.<br />&bull; Puertas interiores contraplacadas pintadas al duco.<br />&bull; Closet en dormitorios.<br />&bull; Lavadero de acero inoxidable en cocina.<br />&bull; Reposteros altos y bajos con mesa de granito en cocina.<br />&bull; Ba&ntilde;o principal con inodoro top Piece, tablero de m&aacute;rmol, y oval&iacute;n.<br />&bull; Cer&aacute;mica Celima en cocinas y ba&ntilde;os.<br />&bull; Piso laminado en sala - comedor y dormitorios.</p>', 'Miraflores', NULL, NULL, 'content2_1401074009_1.jpg'),
(2, 'content_1400544181_2.jpg', NULL, 1, 1, '2014-01-10', NULL, '2014-05-29 14:00:09', NULL, 6, 2, '', 'AREQUIPA 1', '<p>&bull; Edificio de dos torresde 12 pisos.<br />&bull; Departamentos d&uacute;plex de 1 dormitorio<br />&bull; Departamento flat de 2 y 3 dormitorios.<br />&bull; Estacionamiento Techado<br />&bull; Intercomicador autom&aacute;tico con video portero<br />&bull; sistame contraincendio<br />&bull; Cistema para agua con capacidad de 100 M3.<br />&bull; Tanque elevado para agua de 30 m3.<br />&bull; Puerta levadiza con control remoto<br />&bull; Amplio hall de ingreso<br />&bull; Dos Ascensores<br />&bull; Piscina.<br />&bull; terraza y B.B.Q.</p>', '<p>&bull; Tablero el&eacute;ctronico con llave de control termomagnetico.<br />&bull; Instalaci&oacute;n para antena TV y cable.<br />&bull; Instalaci&oacute;n para intercomunicador y tel&eacute;fono.<br />&bull; Sistema contra incendios de &aacute;reas comunes.<br />&bull; Instalaci&oacute;n para therma y lavadora.<br />&bull; Cocina, lavander&iacute;a, cuarto y ba&ntilde;o de servicio.<br />&bull; Ba&ntilde;o inconporado en dormitorio principal.<br />&bull; Sala - comedor con balc&oacute;n.<br />&bull; Dos Ascensores.<br />&bull; Piscina.<br />&bull; terraza y B.B.Q.</p>', '<p>&bull; Cristales templados en mamparas y ventanas exteriores.<br />&bull; Cristales con perfiles de aluminio en ventanas interiores.<br />&bull; Muros empastados y pintura lavable.<br />&bull; Puertas principales apaneladas de madera selecta.<br />&bull; Puertas interiores contraplacadas pintadas al duco.<br />&bull; Closet en dormitorios.<br />&bull; Lavadero de acero inoxidable en cocina.<br />&bull; Reposteros altos y bajos con mesa de granito en cocina.<br />&bull; Ba&ntilde;o principal con inodoro top Piece, tablero de m&aacute;rmol, y oval&iacute;n.<br />&bull; Cer&aacute;mica Celima en cocinas y ba&ntilde;os.<br />&bull; Piso laminado en sala - comedor y dormitorios</p>', 'Miraflores', NULL, NULL, 'content2_1401073816_2.jpg'),
(6, 'content_1400542383_6.jpg', NULL, 1, 1, NULL, NULL, '2014-05-19 18:33:16', NULL, 12, 3, NULL, 'CONSULTORIA EN GENERAL', '', NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'content_1400542444_7.jpg', NULL, 2, 1, NULL, NULL, '2014-05-19 18:34:04', NULL, 12, 3, NULL, 'PROYECTOS', '', NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'content_1400542500_8.jpg', NULL, 3, 1, NULL, NULL, '2014-05-19 18:35:00', NULL, 12, 3, NULL, 'CONSTRUCCIÓN DE EDIFICACIÓN', '', NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'content_1400542539_9.jpg', NULL, 4, 1, NULL, NULL, '2014-05-19 18:35:39', NULL, 12, 3, NULL, 'CENTROS EMPRESARIALES', '', NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'content_1400542588_10.jpg', NULL, 5, 1, NULL, NULL, '2014-05-19 18:36:28', NULL, 12, 3, NULL, 'PROYECTOS ARQUITECTÓNICOS', '', NULL, NULL, NULL, NULL, NULL, NULL),
(11, 'content_1400542636_11.jpg', NULL, 6, 1, NULL, NULL, '2014-05-19 18:37:16', NULL, 12, 3, NULL, 'OBRAS CIVILES', '', NULL, NULL, NULL, NULL, NULL, NULL),
(12, 'content_1400549759_12.jpg', NULL, 3, 1, NULL, NULL, '2014-05-25 22:03:01', NULL, 6, 2, '', '28 DE JULIO', '<p>&bull; Departamentos d&uacute;plex de 1 dormitorio.<br />&bull; Departamento flat de 2 y 3 dormitorios.<br />&bull; Estacionamiento Techado.<br />&bull; Intercomicador autom&aacute;tico con video portero.<br />&bull; sistame contraincendio.<br />&bull; Cistema para agua con capacidad de 100 M3.<br />&bull; Tanque elevado para agua de 30 m3.<br />&bull; Puerta levadiza con control remoto.<br />&bull; Amplio hall de ingreso.<br />&bull; Dos Ascensores.<br />&bull; terraza y B.B.Q.</p>', '<p>&bull; Tablero el&eacute;ctronico con llave de control termomagnetico.<br />&bull; Instalaci&oacute;n para antena TV y cable.<br />&bull; Instalaci&oacute;n para intercomunicador y tel&eacute;fono.<br />&bull; Sistema contra incendios de &aacute;reas comunes.<br />&bull; Instalaci&oacute;n para therma y lavadora.<br />&bull; Cocina, lavander&iacute;a, cuarto y ba&ntilde;o de servicio.<br />&bull; Ba&ntilde;o inconporado en dormitorio principal.<br />&bull; Sala - comedor con balc&oacute;n.<br />&bull; Dos Ascensores.<br />&bull; terraza y B.B.Q.</p>', '<p>&bull; Cristales templados en mamparas y ventanas exteriores.<br />&bull; Cristales con perfiles de aluminio en ventanas interiores.<br />&bull; Muros empastados y pintura lavable.<br />&bull; Puertas principales apaneladas de madera selecta.<br />&bull; Puertas interiores contraplacadas pintadas al duco.<br />&bull; Closet en dormitorios.<br />&bull; Lavadero de acero inoxidable en cocina.<br />&bull; Reposteros altos y bajos con mesa de granito en cocina.<br />&bull; Ba&ntilde;o principal con inodoro top Piece, tablero de m&aacute;rmol, y oval&iacute;n.<br />&bull; Cer&aacute;mica Celima en cocinas y ba&ntilde;os.<br />&bull; Piso laminado en sala - comedor y dormitorios.</p>', 'Miraflores', NULL, NULL, 'content2_1401073078_12.jpg'),
(13, 'content_1400549891_13.jpg', NULL, 4, 1, NULL, NULL, '2014-05-25 22:19:49', NULL, 6, 2, 'http://www.youtube.com/embed/b3_dVDJe0XI', 'CENTRO EJECUTIVO', '<p>undefined</p>', '<p>undefined</p>', '<p>undefined</p>', 'San Isidro', NULL, NULL, 'content2_1401074378_13.jpg'),
(18, 'content_1401934357_18.jpg', 'content_adj_1402012410_18.png', 1, 1, NULL, NULL, '2014-06-05 18:53:29', NULL, 13, 2, '', 'EDIFICIO SAN BORJA ', 'undefined', 'undefined', 'undefined', 'San Borja', NULL, NULL, NULL),
(19, 'content_1401934449_19.jpg', NULL, 2, 1, NULL, NULL, '2014-06-04 21:14:09', NULL, 13, 2, '', 'EDIFICIO HIGUERETA ', 'undefined', 'undefined', 'undefined', 'Surco', NULL, NULL, NULL),
(20, 'content_1401934479_20.jpg', NULL, 3, 1, NULL, NULL, '2014-06-04 21:14:39', NULL, 13, 2, '', 'EDIFICIO CHACARILLA ', 'undefined', 'undefined', 'undefined', 'Surco', NULL, NULL, NULL),
(21, 'content_1401934544_21.jpg', NULL, 4, 1, NULL, NULL, '2014-06-04 21:15:44', NULL, 13, 2, '', 'EDIFICIO SAN BORJA SUR', 'undefined', 'undefined', 'undefined', 'San Borja', NULL, NULL, NULL),
(22, 'content_1401934584_22.jpg', NULL, 5, 1, NULL, NULL, '2014-06-04 21:16:24', NULL, 13, 2, '', 'EDIFICIO SAN BORJA NORTE', 'undefined', 'undefined', 'undefined', 'San Borja', NULL, NULL, NULL),
(23, 'content_1401934621_23.jpg', NULL, 6, 1, NULL, NULL, '2014-06-04 21:17:01', NULL, 13, 2, '', 'EDIFICIO MARIEL', 'undefined', 'undefined', 'undefined', 'Surco', NULL, NULL, NULL),
(24, 'content_1401934655_24.jpg', NULL, 7, 1, NULL, NULL, '2014-06-04 21:17:35', NULL, 13, 2, '', 'EDIFICIO INCLAN', 'undefined', 'undefined', 'undefined', 'Miraflores', NULL, NULL, NULL),
(25, 'content_1401934691_25.jpg', NULL, 7, 1, NULL, NULL, '2014-06-04 21:18:11', NULL, 13, 2, '', 'EDIFICIO-ALCANFORES', 'undefined', 'undefined', 'undefined', 'Miraflores', NULL, NULL, NULL),
(26, 'content_1401934727_26.jpg', NULL, 9, 1, NULL, NULL, '2014-06-04 21:18:47', NULL, 13, 2, '', 'EDIFICIO OVALO PARDO', 'undefined', 'undefined', 'undefined', 'Miraflores', NULL, NULL, NULL),
(27, 'content_1401934798_27.jpg', NULL, 10, 1, NULL, NULL, '2014-06-04 21:19:58', NULL, 13, 2, '', 'EDIFICIO PARDO II', 'undefined', 'undefined', 'undefined', 'Miraflores', NULL, NULL, NULL),
(28, 'content_1401934834_28.jpg', NULL, 11, 1, NULL, NULL, '2014-06-04 21:20:34', NULL, 13, 2, '', 'EDIFICIO MALECON BALTA', 'undefined', 'undefined', 'undefined', 'Miraflores', NULL, NULL, NULL),
(29, 'content_1401934866_29.jpg', NULL, 12, 1, NULL, NULL, '2014-06-04 21:21:06', NULL, 13, 2, '', 'EDIFICIO BOLOGNESI', 'undefined', 'undefined', 'undefined', 'Miraflores', NULL, NULL, NULL),
(30, 'content_1401934893_30.jpg', NULL, 13, 1, NULL, NULL, '2014-06-04 21:21:33', NULL, 13, 2, '', 'EDIFICIO ALEXANDER', 'undefined', 'undefined', 'undefined', 'Lince', NULL, NULL, NULL),
(31, 'content_1401934923_31.jpg', NULL, 14, 1, NULL, NULL, '2014-06-04 21:22:03', NULL, 13, 2, '', 'EDIFICIO CASA CLUB PARDO', 'undefined', 'undefined', 'undefined', 'Miraflores', NULL, NULL, NULL),
(32, 'content_1401934969_32.jpg', NULL, 15, 1, NULL, NULL, '2014-06-04 21:22:49', NULL, 13, 2, '', 'EDIFICIO RESIDENCIAL BARRANCO', 'undefined', 'undefined', 'undefined', 'Barranco', NULL, NULL, NULL),
(33, 'content_1401935016_33.jpg', NULL, 1, 1, NULL, NULL, '2014-06-05 22:02:28', NULL, 14, 2, '', 'CENTRO EMPRESARIAL LARCO', '', '', 'undefined', 'Miraflores', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cms_content_comentario`
--

CREATE TABLE IF NOT EXISTS `cms_content_comentario` (
  `__id_content_comentario` bigint(20) NOT NULL AUTO_INCREMENT,
  `__id_cliente` bigint(20) DEFAULT NULL,
  `__titulo` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__comentario` longtext COLLATE utf8_unicode_ci NOT NULL,
  `__estado` tinyint(1) DEFAULT NULL,
  `__fecha_registro` datetime DEFAULT NULL,
  `__idContent` int(11) DEFAULT NULL,
  PRIMARY KEY (`__id_content_comentario`),
  KEY `IDX_D075827DC0AB0A3E` (`__idContent`),
  KEY `IDX_D075827D177770D3` (`__id_cliente`),
  KEY `contentComen_estado_idx` (`__estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cms_content_language`
--

CREATE TABLE IF NOT EXISTS `cms_content_language` (
  `__id_language` int(11) DEFAULT NULL,
  `__id_Content_Language` int(11) NOT NULL AUTO_INCREMENT,
  `__descripcion` varchar(160) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__intro` longtext COLLATE utf8_unicode_ci,
  `__detalle` longtext COLLATE utf8_unicode_ci,
  `__imagen` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__adjunto` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__idContent` int(11) DEFAULT NULL,
  `__url` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__adicional1` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__adicional2` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`__id_Content_Language`),
  KEY `IDX_16737A20C0AB0A3E` (`__idContent`),
  KEY `IDX_16737A2080E64D77` (`__id_language`),
  KEY `contentLang_descripcion_idx` (`__descripcion`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=34 ;

--
-- Volcado de datos para la tabla `cms_content_language`
--

INSERT INTO `cms_content_language` (`__id_language`, `__id_Content_Language`, `__descripcion`, `__intro`, `__detalle`, `__imagen`, `__adjunto`, `__idContent`, `__url`, `__adicional1`, `__adicional2`) VALUES
(1, 1, 'descripcion xcx', 'xxdsds', '<p>abcd</p>', NULL, NULL, 1, NULL, NULL, NULL),
(1, 2, 'descripcion', NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL),
(1, 6, 'descripcion', NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL),
(1, 7, 'descripcion', NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL),
(1, 8, 'descripcion', NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL),
(1, 9, 'descripcion', NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL),
(1, 10, 'descripcion', NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL),
(1, 11, 'descripcion', NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL),
(1, 12, 'descripcion', NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL),
(1, 13, 'descripcion', NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL),
(1, 18, 'descripcion', NULL, NULL, NULL, NULL, 18, NULL, NULL, NULL),
(1, 19, 'descripcion', NULL, NULL, NULL, NULL, 19, NULL, NULL, NULL),
(1, 20, 'descripcion', NULL, NULL, NULL, NULL, 20, NULL, NULL, NULL),
(1, 21, 'descripcion', NULL, NULL, NULL, NULL, 21, NULL, NULL, NULL),
(1, 22, 'descripcion', NULL, NULL, NULL, NULL, 22, NULL, NULL, NULL),
(1, 23, 'descripcion', NULL, NULL, NULL, NULL, 23, NULL, NULL, NULL),
(1, 24, 'descripcion', NULL, NULL, NULL, NULL, 24, NULL, NULL, NULL),
(1, 25, 'descripcion', NULL, NULL, NULL, NULL, 25, NULL, NULL, NULL),
(1, 26, 'descripcion', NULL, NULL, NULL, NULL, 26, NULL, NULL, NULL),
(1, 27, 'descripcion', NULL, NULL, NULL, NULL, 27, NULL, NULL, NULL),
(1, 28, 'descripcion', NULL, NULL, NULL, NULL, 28, NULL, NULL, NULL),
(1, 29, 'descripcion', NULL, NULL, NULL, NULL, 29, NULL, NULL, NULL),
(1, 30, 'descripcion', NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL),
(1, 31, 'descripcion', NULL, NULL, NULL, NULL, 31, NULL, NULL, NULL),
(1, 32, 'descripcion', NULL, NULL, NULL, NULL, 32, NULL, NULL, NULL),
(1, 33, 'descripcion', NULL, NULL, NULL, NULL, 33, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cms_content__categoria`
--

CREATE TABLE IF NOT EXISTS `cms_content__categoria` (
  `__idContCate` int(11) NOT NULL AUTO_INCREMENT,
  `__nivel_cate` int(11) DEFAULT NULL,
  `__imagen_cate` varchar(260) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__orden_cate` int(11) NOT NULL,
  `__estado_cate` tinyint(1) NOT NULL,
  `_fechamodf__cate` datetime DEFAULT NULL,
  `__fechareg_cate` datetime DEFAULT NULL,
  `__idContCate_Padre` int(11) DEFAULT NULL,
  PRIMARY KEY (`__idContCate`),
  KEY `IDX_9868D64FD83BB542` (`__idContCate_Padre`),
  KEY `contentCate_nivel_idx` (`__nivel_cate`),
  KEY `contentCate_estado_idx` (`__estado_cate`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=15 ;

--
-- Volcado de datos para la tabla `cms_content__categoria`
--

INSERT INTO `cms_content__categoria` (`__idContCate`, `__nivel_cate`, `__imagen_cate`, `__orden_cate`, `__estado_cate`, `_fechamodf__cate`, `__fechareg_cate`, `__idContCate_Padre`) VALUES
(5, 0, NULL, 1, 1, NULL, '2012-11-13 22:54:54', 5),
(6, 1, NULL, 1, 1, NULL, '2012-11-13 22:55:59', 5),
(9, 0, NULL, 1, 1, NULL, '2012-12-28 00:00:00', 9),
(10, 1, NULL, 1, 1, NULL, '2012-12-28 00:00:00', 9),
(11, 0, NULL, 3, 1, NULL, NULL, 11),
(12, 1, NULL, 1, 1, '2014-04-01 00:00:00', '2014-04-01 00:00:00', 11),
(13, 1, NULL, 2, 1, NULL, NULL, 5),
(14, 1, NULL, 3, 1, NULL, NULL, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cms_content__categoria_language`
--

CREATE TABLE IF NOT EXISTS `cms_content__categoria_language` (
  `__id_language` int(11) DEFAULT NULL,
  `__id_ContentCate_Language` int(11) NOT NULL AUTO_INCREMENT,
  `__descripcion` varchar(140) COLLATE utf8_unicode_ci NOT NULL,
  `__detalle` longtext COLLATE utf8_unicode_ci,
  `__idContCate` int(11) DEFAULT NULL,
  PRIMARY KEY (`__id_ContentCate_Language`),
  KEY `IDX_722E1134A07E7B24` (`__idContCate`),
  KEY `IDX_722E113480E64D77` (`__id_language`),
  KEY `contentCateLang_descripcion_idx` (`__descripcion`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=27 ;

--
-- Volcado de datos para la tabla `cms_content__categoria_language`
--

INSERT INTO `cms_content__categoria_language` (`__id_language`, `__id_ContentCate_Language`, `__descripcion`, `__detalle`, `__idContCate`) VALUES
(1, 9, 'Categoria Proyectos', NULL, 5),
(2, 10, 'Category Projects', NULL, 5),
(1, 11, 'EN VENTA', NULL, 6),
(2, 12, 'EN VENTA eng', NULL, 6),
(1, 17, 'Categoria Banner', NULL, 9),
(2, 18, 'Category Banner', NULL, 9),
(1, 19, 'Banners', NULL, 10),
(2, 20, 'Banners', NULL, 10),
(1, 21, 'Categoria Servicios', NULL, 11),
(1, 22, 'Servicios', NULL, 12),
(1, 23, 'TERMINADOS', NULL, 13),
(1, 24, 'EN PROYECTO', NULL, 14),
(2, 25, 'TERMINADOS eng', NULL, 13),
(2, 26, 'EN PROYECTO eng', NULL, 14);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cms_content__galeria`
--

CREATE TABLE IF NOT EXISTS `cms_content__galeria` (
  `__idContGale` int(11) NOT NULL AUTO_INCREMENT,
  `__orden_gale` int(11) NOT NULL,
  `__imagen_gale` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__fechareg_gale` datetime DEFAULT NULL,
  `__idContent` int(11) DEFAULT NULL,
  `__tipo_gale` int(11) NOT NULL,
  PRIMARY KEY (`__idContGale`),
  KEY `IDX_2FF03B61C0AB0A3E` (`__idContent`),
  KEY `contentGale_estado_idx` (`__orden_gale`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=70 ;

--
-- Volcado de datos para la tabla `cms_content__galeria`
--

INSERT INTO `cms_content__galeria` (`__idContGale`, `__orden_gale`, `__imagen_gale`, `__fechareg_gale`, `__idContent`, `__tipo_gale`) VALUES
(5, 1, 'content_ga_1400550083_2_5.jpg', NULL, 2, 1),
(7, 1, 'content_ga_1400550771_12_7.jpg', NULL, 12, 1),
(9, 2, 'content_ga_1400686790_2_9.jpg', NULL, 2, 1),
(10, 2, 'content_ga_1400686808_2_10.jpg', NULL, 2, 1),
(11, 2, 'content_ga_1400686819_2_11.jpg', NULL, 2, 1),
(12, 2, 'content_ga_1400686830_2_12.jpg', NULL, 2, 1),
(13, 2, 'content_ga_1400686838_2_13.jpg', NULL, 2, 1),
(14, 2, 'content_ga_1400686848_2_14.jpg', NULL, 2, 1),
(15, 2, 'content_ga_1400686859_2_15.jpg', NULL, 2, 1),
(16, 2, 'content_ga_1400686869_2_16.jpg', NULL, 2, 1),
(17, 0, 'content_ga_1400688247_1_17.jpg', NULL, 1, 1),
(19, 3, 'content_ga_1400688284_1_19.jpg', NULL, 1, 1),
(20, 4, 'content_ga_1400688301_1_20.jpg', NULL, 1, 1),
(21, 4, 'content_ga_1400688312_1_21.jpg', NULL, 1, 1),
(22, 4, 'content_ga_1400688322_1_22.jpg', NULL, 1, 1),
(23, 4, 'content_ga_1400688335_1_23.jpg', NULL, 1, 1),
(24, 4, 'content_ga_1400688345_1_24.jpg', NULL, 1, 1),
(25, 4, 'content_ga_1400688357_1_25.jpg', NULL, 1, 1),
(26, 4, 'content_ga_1400688366_1_26.jpg', NULL, 1, 1),
(27, 4, 'content_ga_1400688378_1_27.jpg', NULL, 1, 1),
(28, 5, 'content_ga_1400688430_12_28.jpg', NULL, 12, 1),
(29, 5, 'content_ga_1400688444_12_29.jpg', NULL, 12, 1),
(30, 5, 'content_ga_1400688453_12_30.jpg', NULL, 12, 1),
(31, 5, 'content_ga_1400688464_12_31.jpg', NULL, 12, 1),
(32, 5, 'content_ga_1400688474_12_32.jpg', NULL, 12, 1),
(33, 5, 'content_ga_1400688484_12_33.jpg', NULL, 12, 1),
(34, 5, 'content_ga_1400688495_12_34.jpg', NULL, 12, 1),
(35, 5, 'content_ga_1400688510_12_35.jpg', NULL, 12, 1),
(36, 5, 'content_ga_1400688518_12_36.jpg', NULL, 12, 1),
(37, 5, 'content_ga_1400688530_12_37.jpg', NULL, 12, 1),
(38, 1, 'content_ga_1400688560_13_38.jpg', NULL, 13, 1),
(39, 2, 'content_ga_1400688572_13_39.jpg', NULL, 13, 1),
(40, 3, 'content_ga_1400688587_13_40.jpg', NULL, 13, 1),
(41, 4, 'content_ga_1400688602_13_41.jpg', NULL, 13, 1),
(42, 1, 'content_ga_1400689258_2_42.jpg', NULL, 2, 2),
(43, 2, 'content_ga_1400689270_2_43.jpg', NULL, 2, 2),
(44, 3, 'content_ga_1400689282_2_44.jpg', NULL, 2, 2),
(45, 3, 'content_ga_1400689291_2_45.jpg', NULL, 2, 2),
(46, 3, 'content_ga_1400689301_2_46.jpg', NULL, 2, 2),
(47, 1, 'content_ga_1400812778_1_47.jpg', NULL, 1, 2),
(48, 2, 'content_ga_1400816275_1_48.jpg', NULL, 1, 2),
(49, 3, 'content_ga_1400816284_1_49.jpg', NULL, 1, 2),
(50, 4, 'content_ga_1400816295_1_50.jpg', NULL, 1, 2),
(51, 5, 'content_ga_1400816306_1_51.jpg', NULL, 1, 2),
(52, 6, 'content_ga_1400816320_1_52.jpg', NULL, 1, 2),
(53, 6, 'content_ga_1400816332_1_53.jpg', NULL, 1, 2),
(54, 8, 'content_ga_1400816343_1_54.jpg', NULL, 1, 2),
(55, 9, 'content_ga_1400816354_1_55.jpg', NULL, 1, 2),
(56, 10, 'content_ga_1400816364_1_56.jpg', NULL, 1, 2),
(57, 11, 'content_ga_1400816374_1_57.jpg', NULL, 1, 2),
(58, 12, 'content_ga_1400816383_1_58.jpg', NULL, 1, 2),
(59, 13, 'content_ga_1400816393_1_59.jpg', NULL, 1, 2),
(60, 1, 'content_ga_1400816434_12_60.jpg', NULL, 12, 2),
(61, 2, 'content_ga_1400816443_12_61.jpg', NULL, 12, 2),
(62, 3, 'content_ga_1400816452_12_62.jpg', NULL, 12, 2),
(63, 4, 'content_ga_1400816460_12_63.jpg', NULL, 12, 2),
(64, 5, 'content_ga_1400816469_12_64.jpg', NULL, 12, 2),
(65, 6, 'content_ga_1400816479_12_65.jpg', NULL, 12, 2),
(66, 7, 'content_ga_1400816489_12_66.jpg', NULL, 12, 2),
(67, 8, 'content_ga_1400816498_12_67.jpg', NULL, 12, 2),
(68, 9, 'content_ga_1400816506_12_68.jpg', NULL, 12, 2),
(69, 10, 'content_ga_1400816514_12_69.jpg', NULL, 12, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cms_content__galeria_language`
--

CREATE TABLE IF NOT EXISTS `cms_content__galeria_language` (
  `__id_language` int(11) DEFAULT NULL,
  `__id_ContentGale_Language` int(11) NOT NULL AUTO_INCREMENT,
  `__titulo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__descripcion` longtext COLLATE utf8_unicode_ci,
  `__idContGale` int(11) DEFAULT NULL,
  PRIMARY KEY (`__id_ContentGale_Language`),
  KEY `IDX_FB206323AD07742A` (`__idContGale`),
  KEY `IDX_FB20632380E64D77` (`__id_language`),
  KEY `contentGaleLang_titulo_idx` (`__titulo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=70 ;

--
-- Volcado de datos para la tabla `cms_content__galeria_language`
--

INSERT INTO `cms_content__galeria_language` (`__id_language`, `__id_ContentGale_Language`, `__titulo`, `__descripcion`, `__idContGale`) VALUES
(1, 5, 'titulo', NULL, 5),
(1, 7, 'titulo', NULL, 7),
(1, 9, 'titulo', NULL, 9),
(1, 10, 'titulo', NULL, 10),
(1, 11, 'titulo', NULL, 11),
(1, 12, 'titulo', NULL, 12),
(1, 13, 'titulo', NULL, 13),
(1, 14, 'titulo', NULL, 14),
(1, 15, 'titulo', NULL, 15),
(1, 16, 'titulo', NULL, 16),
(1, 17, 'titulo', NULL, 17),
(1, 19, 'titulo', NULL, 19),
(1, 20, 'titulo', NULL, 20),
(1, 21, 'titulo', NULL, 21),
(1, 22, 'titulo', NULL, 22),
(1, 23, 'titulo', NULL, 23),
(1, 24, 'titulo', NULL, 24),
(1, 25, 'titulo', NULL, 25),
(1, 26, 'titulo', NULL, 26),
(1, 27, 'titulo', NULL, 27),
(1, 28, 'titulo', NULL, 28),
(1, 29, 'titulo', NULL, 29),
(1, 30, 'titulo', NULL, 30),
(1, 31, 'titulo', NULL, 31),
(1, 32, 'titulo', NULL, 32),
(1, 33, 'titulo', NULL, 33),
(1, 34, 'titulo', NULL, 34),
(1, 35, 'titulo', NULL, 35),
(1, 36, 'titulo', NULL, 36),
(1, 37, 'titulo', NULL, 37),
(1, 38, 'titulo', NULL, 38),
(1, 39, 'titulo', NULL, 39),
(1, 40, 'titulo', NULL, 40),
(1, 41, 'titulo', NULL, 41),
(1, 42, 'titulo', NULL, 42),
(1, 43, 'titulo', NULL, 43),
(1, 44, 'titulo', NULL, 44),
(1, 45, 'titulo', NULL, 45),
(1, 46, 'titulo', NULL, 46),
(1, 47, 'titulo', NULL, 47),
(1, 48, 'titulo', NULL, 48),
(1, 49, 'titulo', NULL, 49),
(1, 50, 'titulo', NULL, 50),
(1, 51, 'titulo', NULL, 51),
(1, 52, 'titulo', NULL, 52),
(1, 53, 'titulo', NULL, 53),
(1, 54, 'titulo', NULL, 54),
(1, 55, 'titulo', NULL, 55),
(1, 56, 'titulo', NULL, 56),
(1, 57, 'titulo', NULL, 57),
(1, 58, 'titulo', NULL, 58),
(1, 59, 'titulo', NULL, 59),
(1, 60, 'titulo', NULL, 60),
(1, 61, 'titulo', NULL, 61),
(1, 62, 'titulo', NULL, 62),
(1, 63, 'titulo', NULL, 63),
(1, 64, 'titulo', NULL, 64),
(1, 65, 'titulo', NULL, 65),
(1, 66, 'titulo', NULL, 66),
(1, 67, 'titulo', NULL, 67),
(1, 68, 'titulo', NULL, 68),
(1, 69, 'titulo', NULL, 69);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cms_content__tipo`
--

CREATE TABLE IF NOT EXISTS `cms_content__tipo` (
  `__idTipo` int(11) NOT NULL AUTO_INCREMENT,
  `__imagen` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__orden_cate` int(11) NOT NULL,
  `__estado` tinyint(1) NOT NULL,
  `__fechamodf` datetime DEFAULT NULL,
  `__fechareg` datetime DEFAULT NULL,
  PRIMARY KEY (`__idTipo`),
  KEY `contentTipo_estado_idx` (`__estado`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `cms_content__tipo`
--

INSERT INTO `cms_content__tipo` (`__idTipo`, `__imagen`, `__orden_cate`, `__estado`, `__fechamodf`, `__fechareg`) VALUES
(1, NULL, 1, 1, NULL, '2012-11-04 18:07:02'),
(2, NULL, 2, 1, NULL, '2014-04-26 06:00:00'),
(3, NULL, 3, 1, NULL, '2014-04-26 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cms_content__tipo_language`
--

CREATE TABLE IF NOT EXISTS `cms_content__tipo_language` (
  `__id_language` int(11) DEFAULT NULL,
  `__id_ContentTipo_Language` int(11) NOT NULL AUTO_INCREMENT,
  `__descripcion` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `__detalle` longtext COLLATE utf8_unicode_ci,
  `__idTipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`__id_ContentTipo_Language`),
  KEY `IDX_8DC1AE778EAB4527` (`__idTipo`),
  KEY `IDX_8DC1AE7780E64D77` (`__id_language`),
  KEY `contentTipoLang_descripcion_idx` (`__descripcion`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `cms_content__tipo_language`
--

INSERT INTO `cms_content__tipo_language` (`__id_language`, `__id_ContentTipo_Language`, `__descripcion`, `__detalle`, `__idTipo`) VALUES
(1, 1, 'General', NULL, 1),
(2, 2, 'General', NULL, 1),
(1, 3, 'Proyectos', NULL, 2),
(1, 4, 'Servicios', NULL, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cms_keys`
--

CREATE TABLE IF NOT EXISTS `cms_keys` (
  `__id_keys` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `__consumido` tinyint(1) NOT NULL,
  `__fecha_inicio` datetime NOT NULL,
  `__fecha_fin` datetime DEFAULT NULL,
  `__usuario_creacion` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`__id_keys`),
  KEY `keys_consumido_idx` (`__consumido`),
  KEY `keys_fechaInicio_idx` (`__fecha_inicio`),
  KEY `keys_fechaFin_idx` (`__fecha_fin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `cms_keys`
--

INSERT INTO `cms_keys` (`__id_keys`, `__consumido`, `__fecha_inicio`, `__fecha_fin`, `__usuario_creacion`) VALUES
('4cb72e423aeb0b2c1d049ec248b84def', 0, '2014-03-06 23:12:33', '2014-03-07 23:12:33', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cms_language`
--

CREATE TABLE IF NOT EXISTS `cms_language` (
  `__id_language` int(11) NOT NULL AUTO_INCREMENT,
  `__idioma` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `__nombre_corto` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__estado` tinyint(1) NOT NULL,
  `__principal` tinyint(1) NOT NULL,
  PRIMARY KEY (`__id_language`),
  KEY `keys_estado_idx` (`__estado`),
  KEY `keys_principal_idx` (`__principal`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `cms_language`
--

INSERT INTO `cms_language` (`__id_language`, `__idioma`, `__nombre_corto`, `__estado`, `__principal`) VALUES
(1, 'Español', 'es', 1, 1),
(2, 'English', 'en', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cms_pais`
--

CREATE TABLE IF NOT EXISTS `cms_pais` (
  `__id_Pais` int(11) NOT NULL AUTO_INCREMENT,
  `__num_pais` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__nombre` varchar(140) COLLATE utf8_unicode_ci NOT NULL,
  `__estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`__id_Pais`),
  KEY `pais_estado_idx` (`__estado`),
  KEY `pais_nombre_idx` (`__nombre`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `cms_pais`
--

INSERT INTO `cms_pais` (`__id_Pais`, `__num_pais`, `__nombre`, `__estado`) VALUES
(1, 'PE', 'Perú', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cms_tipo__direccion`
--

CREATE TABLE IF NOT EXISTS `cms_tipo__direccion` (
  `__id_tipo_direccion` int(11) NOT NULL AUTO_INCREMENT,
  `__estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`__id_tipo_direccion`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `cms_tipo__direccion`
--

INSERT INTO `cms_tipo__direccion` (`__id_tipo_direccion`, `__estado`) VALUES
(1, 1),
(2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cms_tipo__direccion_language`
--

CREATE TABLE IF NOT EXISTS `cms_tipo__direccion_language` (
  `__id_tipo_direccion` int(11) DEFAULT NULL,
  `__id_language` int(11) DEFAULT NULL,
  `__id_TipoDireccion_Language` int(11) NOT NULL AUTO_INCREMENT,
  `__nombre` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`__id_TipoDireccion_Language`),
  KEY `IDX_BCD9FE440EF4DF3` (`__id_tipo_direccion`),
  KEY `IDX_BCD9FE480E64D77` (`__id_language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `cms_tipo__direccion_language`
--

INSERT INTO `cms_tipo__direccion_language` (`__id_tipo_direccion`, `__id_language`, `__id_TipoDireccion_Language`, `__nombre`) VALUES
(1, 1, 1, 'Casa'),
(2, 1, 2, 'Oficina');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cms_tipo__documento`
--

CREATE TABLE IF NOT EXISTS `cms_tipo__documento` (
  `__idtipo_documento` smallint(6) NOT NULL AUTO_INCREMENT,
  `__longitud_tdoc` int(11) DEFAULT NULL,
  `__estado_tipodoc` tinyint(1) NOT NULL,
  `__tiempo_modif` datetime DEFAULT NULL,
  PRIMARY KEY (`__idtipo_documento`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `cms_tipo__documento`
--

INSERT INTO `cms_tipo__documento` (`__idtipo_documento`, `__longitud_tdoc`, `__estado_tipodoc`, `__tiempo_modif`) VALUES
(1, 8, 1, '2012-11-02 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cms_tipo__documento_language`
--

CREATE TABLE IF NOT EXISTS `cms_tipo__documento_language` (
  `idtipo_documento` smallint(6) DEFAULT NULL,
  `__id_language` int(11) DEFAULT NULL,
  `__id_tipoDocu_language` int(11) NOT NULL AUTO_INCREMENT,
  `__nombre_tdoc` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `__descripcion_tdoc` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `__detalle_tdoc` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`__id_tipoDocu_language`),
  KEY `IDX_DD2753CF45A700C2` (`idtipo_documento`),
  KEY `IDX_DD2753CF80E64D77` (`__id_language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `cms_tipo__documento_language`
--

INSERT INTO `cms_tipo__documento_language` (`idtipo_documento`, `__id_language`, `__id_tipoDocu_language`, `__nombre_tdoc`, `__descripcion_tdoc`, `__detalle_tdoc`) VALUES
(1, 1, 1, 'DNI', 'Documento Nacional de Identidad', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cms_ubigeo`
--

CREATE TABLE IF NOT EXISTS `cms_ubigeo` (
  `__cod_postal` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `__dpto` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `__prov` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__dist` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__cregion` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__csubregion` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__cod_dpto` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__cod_prov` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__id_Pais` int(11) DEFAULT NULL,
  PRIMARY KEY (`__cod_postal`),
  KEY `IDX_F5188083FC739DE` (`__id_Pais`),
  KEY `ubig_dpto_idx` (`__dpto`),
  KEY `ubig_prov_idx` (`__prov`),
  KEY `ubig_dist_idx` (`__dist`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `cms_ubigeo`
--

INSERT INTO `cms_ubigeo` (`__cod_postal`, `__dpto`, `__prov`, `__dist`, `__cregion`, `__csubregion`, `__cod_dpto`, `__cod_prov`, `__id_Pais`) VALUES
('150104', 'Lima', 'Lima', 'Barranco', NULL, NULL, NULL, NULL, 1),
('150116', 'Lima', 'Lima', 'Lince', NULL, NULL, NULL, NULL, 1),
('150122', 'Lima', 'Lima', 'Miraflores', NULL, NULL, NULL, NULL, 1),
('150130', 'Lima', 'Lima', 'San Borja', NULL, NULL, NULL, NULL, 1),
('150131', 'Lima', 'Lima', 'San Isidro', NULL, NULL, NULL, NULL, NULL),
('150140', 'Lima', 'Lima', 'Santiago de Surco', NULL, NULL, NULL, NULL, 1),
('150141', 'Lima', 'Lima', 'Surquillo', NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cms_user`
--

CREATE TABLE IF NOT EXISTS `cms_user` (
  `__type_docu_user` smallint(6) DEFAULT NULL,
  `__idUser` int(11) NOT NULL AUTO_INCREMENT,
  `__role` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `__name_user` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `__address_user` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `__document_user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__ocupation_user` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__phone_user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__mobile_user` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `__email_user` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `__nick_user` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `__pass_user` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `__type_user` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `__state_user` tinyint(1) NOT NULL,
  `__registration_user` datetime DEFAULT NULL,
  `__modification_date_user` datetime DEFAULT NULL,
  PRIMARY KEY (`__idUser`),
  KEY `IDX_3AF03EC5C0C1627` (`__type_docu_user`),
  KEY `user_role_idx` (`__role`),
  KEY `user_email_idx` (`__email_user`),
  KEY `user_pass_idx` (`__pass_user`),
  KEY `user_state_idx` (`__state_user`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `cms_user`
--

INSERT INTO `cms_user` (`__type_docu_user`, `__idUser`, `__role`, `__name_user`, `__address_user`, `__document_user`, `__ocupation_user`, `__phone_user`, `__mobile_user`, `__email_user`, `__nick_user`, `__pass_user`, `__type_user`, `__state_user`, `__registration_user`, `__modification_date_user`) VALUES
(1, 1, 'admin', 'Antonio', 'Salamanca', NULL, NULL, NULL, NULL, 'tonyprr@gmail.com', 'admin', '54ce18434ee5054ec75591b61624fe08', 'admin', 1, '2012-11-02 00:00:00', NULL);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cart_carrito`
--
ALTER TABLE `cart_carrito`
  ADD CONSTRAINT `cart_carrito_ibfk_1` FOREIGN KEY (`__id_cliente`) REFERENCES `cms_cliente` (`__id_cliente`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_carrito_ibfk_2` FOREIGN KEY (`__id_moneda`) REFERENCES `cart_moneda` (`__id_moneda`),
  ADD CONSTRAINT `cart_carrito_ibfk_3` FOREIGN KEY (`__id_cliente`) REFERENCES `cms_cliente` (`__id_cliente`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_carrito_ibfk_4` FOREIGN KEY (`__id_moneda`) REFERENCES `cart_moneda` (`__id_moneda`),
  ADD CONSTRAINT `cart_carrito_ibfk_5` FOREIGN KEY (`__id_cliente`) REFERENCES `cms_cliente` (`__id_cliente`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_carrito_ibfk_6` FOREIGN KEY (`__id_moneda`) REFERENCES `cart_moneda` (`__id_moneda`),
  ADD CONSTRAINT `FK_8C3C76D2177770D3` FOREIGN KEY (`__id_cliente`) REFERENCES `cms_cliente` (`__id_cliente`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_8C3C76D2B8EBCFA5` FOREIGN KEY (`__id_moneda`) REFERENCES `cart_moneda` (`__id_moneda`);

--
-- Filtros para la tabla `cart_carrito__producto`
--
ALTER TABLE `cart_carrito__producto`
  ADD CONSTRAINT `cart_carrito__producto_ibfk_1` FOREIGN KEY (`__id_carrito`) REFERENCES `cart_carrito` (`__id_carrito`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_carrito__producto_ibfk_2` FOREIGN KEY (`__idProducto`) REFERENCES `cart_producto` (`__idProducto`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_carrito__producto_ibfk_3` FOREIGN KEY (`__id_carrito`) REFERENCES `cart_carrito` (`__id_carrito`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_carrito__producto_ibfk_4` FOREIGN KEY (`__idProducto`) REFERENCES `cart_producto` (`__idProducto`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_carrito__producto_ibfk_5` FOREIGN KEY (`__id_carrito`) REFERENCES `cart_carrito` (`__id_carrito`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_carrito__producto_ibfk_6` FOREIGN KEY (`__idProducto`) REFERENCES `cart_producto` (`__idProducto`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_816EC1F7948D5523` FOREIGN KEY (`__id_carrito`) REFERENCES `cart_carrito` (`__id_carrito`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_816EC1F7C9EE6EC8` FOREIGN KEY (`__idProducto`) REFERENCES `cart_producto` (`__idProducto`) ON DELETE CASCADE;

--
-- Filtros para la tabla `cart_marca_language`
--
ALTER TABLE `cart_marca_language`
  ADD CONSTRAINT `cart_marca_language_ibfk_1` FOREIGN KEY (`__idMarca`) REFERENCES `cart_marca` (`__idMarca`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_marca_language_ibfk_2` FOREIGN KEY (`__id_language`) REFERENCES `cms_language` (`__id_language`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_marca_language_ibfk_3` FOREIGN KEY (`__idMarca`) REFERENCES `cart_marca` (`__idMarca`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_marca_language_ibfk_4` FOREIGN KEY (`__id_language`) REFERENCES `cms_language` (`__id_language`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_marca_language_ibfk_5` FOREIGN KEY (`__idMarca`) REFERENCES `cart_marca` (`__idMarca`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_marca_language_ibfk_6` FOREIGN KEY (`__id_language`) REFERENCES `cms_language` (`__id_language`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_B0B771004A46E613` FOREIGN KEY (`__idMarca`) REFERENCES `cart_marca` (`__idMarca`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_B0B7710080E64D77` FOREIGN KEY (`__id_language`) REFERENCES `cms_language` (`__id_language`) ON DELETE CASCADE;

--
-- Filtros para la tabla `cart_movimiento__stock`
--
ALTER TABLE `cart_movimiento__stock`
  ADD CONSTRAINT `cart_movimiento__stock_ibfk_1` FOREIGN KEY (`__id_orden`) REFERENCES `cart_orden` (`__id_orden`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_movimiento__stock_ibfk_2` FOREIGN KEY (`__idProducto`) REFERENCES `cart_producto` (`__idProducto`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_movimiento__stock_ibfk_3` FOREIGN KEY (`__id_movimiento_stock_tipo`) REFERENCES `cart_movimiento__stock_tipo` (`__id_movimiento_stock_tipo`),
  ADD CONSTRAINT `cart_movimiento__stock_ibfk_4` FOREIGN KEY (`__id_orden`) REFERENCES `cart_orden` (`__id_orden`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_movimiento__stock_ibfk_5` FOREIGN KEY (`__idProducto`) REFERENCES `cart_producto` (`__idProducto`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_movimiento__stock_ibfk_6` FOREIGN KEY (`__id_movimiento_stock_tipo`) REFERENCES `cart_movimiento__stock_tipo` (`__id_movimiento_stock_tipo`),
  ADD CONSTRAINT `cart_movimiento__stock_ibfk_7` FOREIGN KEY (`__id_orden`) REFERENCES `cart_orden` (`__id_orden`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_movimiento__stock_ibfk_8` FOREIGN KEY (`__idProducto`) REFERENCES `cart_producto` (`__idProducto`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_movimiento__stock_ibfk_9` FOREIGN KEY (`__id_movimiento_stock_tipo`) REFERENCES `cart_movimiento__stock_tipo` (`__id_movimiento_stock_tipo`),
  ADD CONSTRAINT `FK_1A096F3A6CF16A9A` FOREIGN KEY (`__id_orden`) REFERENCES `cart_orden` (`__id_orden`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1A096F3AC9EE6EC8` FOREIGN KEY (`__idProducto`) REFERENCES `cart_producto` (`__idProducto`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1A096F3AEECA34F6` FOREIGN KEY (`__id_movimiento_stock_tipo`) REFERENCES `cart_movimiento__stock_tipo` (`__id_movimiento_stock_tipo`);

--
-- Filtros para la tabla `cart_orden`
--
ALTER TABLE `cart_orden`
  ADD CONSTRAINT `cart_orden_ibfk_1` FOREIGN KEY (`__id_cliente`) REFERENCES `cms_cliente` (`__id_cliente`),
  ADD CONSTRAINT `cart_orden_ibfk_10` FOREIGN KEY (`__id_orden_estado`) REFERENCES `cart_orden__estado` (`__id_orden_estado`),
  ADD CONSTRAINT `cart_orden_ibfk_11` FOREIGN KEY (`__id_carrito`) REFERENCES `cart_carrito` (`__id_carrito`),
  ADD CONSTRAINT `cart_orden_ibfk_12` FOREIGN KEY (`__id_orden_tipo`) REFERENCES `cart_orden__tipo` (`__id_orden_tipo`),
  ADD CONSTRAINT `cart_orden_ibfk_13` FOREIGN KEY (`__id_moneda`) REFERENCES `cart_moneda` (`__id_moneda`),
  ADD CONSTRAINT `cart_orden_ibfk_14` FOREIGN KEY (`__id_ubigeo`) REFERENCES `cms_ubigeo` (`__cod_postal`),
  ADD CONSTRAINT `cart_orden_ibfk_2` FOREIGN KEY (`__id_orden_estado`) REFERENCES `cart_orden__estado` (`__id_orden_estado`),
  ADD CONSTRAINT `cart_orden_ibfk_3` FOREIGN KEY (`__id_carrito`) REFERENCES `cart_carrito` (`__id_carrito`),
  ADD CONSTRAINT `cart_orden_ibfk_4` FOREIGN KEY (`__id_moneda`) REFERENCES `cart_moneda` (`__id_moneda`),
  ADD CONSTRAINT `cart_orden_ibfk_5` FOREIGN KEY (`__id_cliente`) REFERENCES `cms_cliente` (`__id_cliente`),
  ADD CONSTRAINT `cart_orden_ibfk_6` FOREIGN KEY (`__id_orden_estado`) REFERENCES `cart_orden__estado` (`__id_orden_estado`),
  ADD CONSTRAINT `cart_orden_ibfk_7` FOREIGN KEY (`__id_carrito`) REFERENCES `cart_carrito` (`__id_carrito`),
  ADD CONSTRAINT `cart_orden_ibfk_8` FOREIGN KEY (`__id_moneda`) REFERENCES `cart_moneda` (`__id_moneda`),
  ADD CONSTRAINT `cart_orden_ibfk_9` FOREIGN KEY (`__id_cliente`) REFERENCES `cms_cliente` (`__id_cliente`),
  ADD CONSTRAINT `FK_BEC2A2DF177770D3` FOREIGN KEY (`__id_cliente`) REFERENCES `cms_cliente` (`__id_cliente`),
  ADD CONSTRAINT `FK_BEC2A2DF391D3278` FOREIGN KEY (`__id_orden_estado`) REFERENCES `cart_orden__estado` (`__id_orden_estado`),
  ADD CONSTRAINT `FK_BEC2A2DF948D5523` FOREIGN KEY (`__id_carrito`) REFERENCES `cart_carrito` (`__id_carrito`),
  ADD CONSTRAINT `FK_BEC2A2DF9F6B78C6` FOREIGN KEY (`__id_orden_tipo`) REFERENCES `cart_orden__tipo` (`__id_orden_tipo`),
  ADD CONSTRAINT `FK_BEC2A2DFB8EBCFA5` FOREIGN KEY (`__id_moneda`) REFERENCES `cart_moneda` (`__id_moneda`),
  ADD CONSTRAINT `FK_BEC2A2DFCF0E7B73` FOREIGN KEY (`__id_ubigeo`) REFERENCES `cms_ubigeo` (`__cod_postal`);

--
-- Filtros para la tabla `cart_orden__detalle`
--
ALTER TABLE `cart_orden__detalle`
  ADD CONSTRAINT `cart_orden__detalle_ibfk_1` FOREIGN KEY (`__id_orden`) REFERENCES `cart_orden` (`__id_orden`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_orden__detalle_ibfk_2` FOREIGN KEY (`__idProducto`) REFERENCES `cart_producto` (`__idProducto`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_orden__detalle_ibfk_3` FOREIGN KEY (`__id_orden`) REFERENCES `cart_orden` (`__id_orden`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_orden__detalle_ibfk_4` FOREIGN KEY (`__idProducto`) REFERENCES `cart_producto` (`__idProducto`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_orden__detalle_ibfk_5` FOREIGN KEY (`__id_orden`) REFERENCES `cart_orden` (`__id_orden`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_orden__detalle_ibfk_6` FOREIGN KEY (`__idProducto`) REFERENCES `cart_producto` (`__idProducto`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_82254A936CF16A9A` FOREIGN KEY (`__id_orden`) REFERENCES `cart_orden` (`__id_orden`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_82254A93C9EE6EC8` FOREIGN KEY (`__idProducto`) REFERENCES `cart_producto` (`__idProducto`) ON DELETE CASCADE;

--
-- Filtros para la tabla `cart_orden__estado_language`
--
ALTER TABLE `cart_orden__estado_language`
  ADD CONSTRAINT `cart_orden__estado_language_ibfk_1` FOREIGN KEY (`__id_orden_estado`) REFERENCES `cart_orden__estado` (`__id_orden_estado`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_orden__estado_language_ibfk_2` FOREIGN KEY (`__id_language`) REFERENCES `cms_language` (`__id_language`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_orden__estado_language_ibfk_3` FOREIGN KEY (`__id_orden_estado`) REFERENCES `cart_orden__estado` (`__id_orden_estado`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_orden__estado_language_ibfk_4` FOREIGN KEY (`__id_language`) REFERENCES `cms_language` (`__id_language`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_orden__estado_language_ibfk_5` FOREIGN KEY (`__id_orden_estado`) REFERENCES `cart_orden__estado` (`__id_orden_estado`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_orden__estado_language_ibfk_6` FOREIGN KEY (`__id_language`) REFERENCES `cms_language` (`__id_language`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_C48823DF391D3278` FOREIGN KEY (`__id_orden_estado`) REFERENCES `cart_orden__estado` (`__id_orden_estado`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_C48823DF80E64D77` FOREIGN KEY (`__id_language`) REFERENCES `cms_language` (`__id_language`) ON DELETE CASCADE;

--
-- Filtros para la tabla `cart_orden__tipo_language`
--
ALTER TABLE `cart_orden__tipo_language`
  ADD CONSTRAINT `cart_orden__tipo_language_ibfk_1` FOREIGN KEY (`__id_language`) REFERENCES `cms_language` (`__id_language`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_orden__tipo_language_ibfk_2` FOREIGN KEY (`__id_orden_tipo`) REFERENCES `cart_orden__tipo` (`__id_orden_tipo`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_AABC395380E64D77` FOREIGN KEY (`__id_language`) REFERENCES `cms_language` (`__id_language`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_AABC39539F6B78C6` FOREIGN KEY (`__id_orden_tipo`) REFERENCES `cart_orden__tipo` (`__id_orden_tipo`) ON DELETE CASCADE;

--
-- Filtros para la tabla `cart_producto`
--
ALTER TABLE `cart_producto`
  ADD CONSTRAINT `cart_producto_ibfk_1` FOREIGN KEY (`__idMarca`) REFERENCES `cart_marca` (`__idMarca`),
  ADD CONSTRAINT `cart_producto_ibfk_2` FOREIGN KEY (`__idTipo`) REFERENCES `cart_producto__tipo` (`__idTipo`),
  ADD CONSTRAINT `cart_producto_ibfk_3` FOREIGN KEY (`__idContCate`) REFERENCES `cart_producto__categoria` (`__idContCate`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_producto_ibfk_4` FOREIGN KEY (`__idMarca`) REFERENCES `cart_marca` (`__idMarca`),
  ADD CONSTRAINT `cart_producto_ibfk_5` FOREIGN KEY (`__idTipo`) REFERENCES `cart_producto__tipo` (`__idTipo`),
  ADD CONSTRAINT `cart_producto_ibfk_6` FOREIGN KEY (`__idContCate`) REFERENCES `cart_producto__categoria` (`__idContCate`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_producto_ibfk_7` FOREIGN KEY (`__idMarca`) REFERENCES `cart_marca` (`__idMarca`),
  ADD CONSTRAINT `cart_producto_ibfk_8` FOREIGN KEY (`__idTipo`) REFERENCES `cart_producto__tipo` (`__idTipo`),
  ADD CONSTRAINT `cart_producto_ibfk_9` FOREIGN KEY (`__idContCate`) REFERENCES `cart_producto__categoria` (`__idContCate`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_3924497E4A46E613` FOREIGN KEY (`__idMarca`) REFERENCES `cart_marca` (`__idMarca`),
  ADD CONSTRAINT `FK_3924497E8EAB4527` FOREIGN KEY (`__idTipo`) REFERENCES `cart_producto__tipo` (`__idTipo`),
  ADD CONSTRAINT `FK_3924497EA07E7B24` FOREIGN KEY (`__idContCate`) REFERENCES `cart_producto__categoria` (`__idContCate`) ON DELETE CASCADE;

--
-- Filtros para la tabla `cart_producto_comentario`
--
ALTER TABLE `cart_producto_comentario`
  ADD CONSTRAINT `cart_producto_comentario_ibfk_1` FOREIGN KEY (`__id_cliente`) REFERENCES `cms_cliente` (`__id_cliente`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_producto_comentario_ibfk_2` FOREIGN KEY (`__idProducto`) REFERENCES `cart_producto` (`__idProducto`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_producto_comentario_ibfk_3` FOREIGN KEY (`__id_cliente`) REFERENCES `cms_cliente` (`__id_cliente`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_producto_comentario_ibfk_4` FOREIGN KEY (`__idProducto`) REFERENCES `cart_producto` (`__idProducto`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_producto_comentario_ibfk_5` FOREIGN KEY (`__id_cliente`) REFERENCES `cms_cliente` (`__id_cliente`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_producto_comentario_ibfk_6` FOREIGN KEY (`__idProducto`) REFERENCES `cart_producto` (`__idProducto`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_A3BED91C177770D3` FOREIGN KEY (`__id_cliente`) REFERENCES `cms_cliente` (`__id_cliente`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_A3BED91CC9EE6EC8` FOREIGN KEY (`__idProducto`) REFERENCES `cart_producto` (`__idProducto`) ON DELETE CASCADE;

--
-- Filtros para la tabla `cart_producto_language`
--
ALTER TABLE `cart_producto_language`
  ADD CONSTRAINT `cart_producto_language_ibfk_1` FOREIGN KEY (`__id_language`) REFERENCES `cms_language` (`__id_language`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_producto_language_ibfk_2` FOREIGN KEY (`__idProducto`) REFERENCES `cart_producto` (`__idProducto`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_producto_language_ibfk_3` FOREIGN KEY (`__id_language`) REFERENCES `cms_language` (`__id_language`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_producto_language_ibfk_4` FOREIGN KEY (`__idProducto`) REFERENCES `cart_producto` (`__idProducto`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_producto_language_ibfk_5` FOREIGN KEY (`__id_language`) REFERENCES `cms_language` (`__id_language`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_producto_language_ibfk_6` FOREIGN KEY (`__idProducto`) REFERENCES `cart_producto` (`__idProducto`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_EC2FBEBE80E64D77` FOREIGN KEY (`__id_language`) REFERENCES `cms_language` (`__id_language`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_EC2FBEBEC9EE6EC8` FOREIGN KEY (`__idProducto`) REFERENCES `cart_producto` (`__idProducto`) ON DELETE CASCADE;

--
-- Filtros para la tabla `cart_producto__categoria`
--
ALTER TABLE `cart_producto__categoria`
  ADD CONSTRAINT `cart_producto__categoria_ibfk_1` FOREIGN KEY (`__idContCate_Padre`) REFERENCES `cart_producto__categoria` (`__idContCate`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_producto__categoria_ibfk_2` FOREIGN KEY (`__idContCate_Padre`) REFERENCES `cart_producto__categoria` (`__idContCate`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_producto__categoria_ibfk_3` FOREIGN KEY (`__idContCate_Padre`) REFERENCES `cart_producto__categoria` (`__idContCate`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_EBA38D2ED83BB542` FOREIGN KEY (`__idContCate_Padre`) REFERENCES `cart_producto__categoria` (`__idContCate`) ON DELETE CASCADE;

--
-- Filtros para la tabla `cart_producto__categoria_language`
--
ALTER TABLE `cart_producto__categoria_language`
  ADD CONSTRAINT `cart_producto__categoria_language_ibfk_1` FOREIGN KEY (`__id_language`) REFERENCES `cms_language` (`__id_language`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_producto__categoria_language_ibfk_2` FOREIGN KEY (`__idContCate`) REFERENCES `cart_producto__categoria` (`__idContCate`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_producto__categoria_language_ibfk_3` FOREIGN KEY (`__id_language`) REFERENCES `cms_language` (`__id_language`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_producto__categoria_language_ibfk_4` FOREIGN KEY (`__idContCate`) REFERENCES `cart_producto__categoria` (`__idContCate`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_producto__categoria_language_ibfk_5` FOREIGN KEY (`__id_language`) REFERENCES `cms_language` (`__id_language`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_producto__categoria_language_ibfk_6` FOREIGN KEY (`__idContCate`) REFERENCES `cart_producto__categoria` (`__idContCate`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_72D6DF5D80E64D77` FOREIGN KEY (`__id_language`) REFERENCES `cms_language` (`__id_language`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_72D6DF5DA07E7B24` FOREIGN KEY (`__idContCate`) REFERENCES `cart_producto__categoria` (`__idContCate`) ON DELETE CASCADE;

--
-- Filtros para la tabla `cart_producto__categoria_tipo`
--
ALTER TABLE `cart_producto__categoria_tipo`
  ADD CONSTRAINT `cart_producto__categoria_tipo_ibfk_1` FOREIGN KEY (`__idTipo`) REFERENCES `cart_producto__tipo` (`__idTipo`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_producto__categoria_tipo_ibfk_2` FOREIGN KEY (`__idContCate`) REFERENCES `cart_producto__categoria` (`__idContCate`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_producto__categoria_tipo_ibfk_3` FOREIGN KEY (`__idTipo`) REFERENCES `cart_producto__tipo` (`__idTipo`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_producto__categoria_tipo_ibfk_4` FOREIGN KEY (`__idContCate`) REFERENCES `cart_producto__categoria` (`__idContCate`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_producto__categoria_tipo_ibfk_5` FOREIGN KEY (`__idTipo`) REFERENCES `cart_producto__tipo` (`__idTipo`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_producto__categoria_tipo_ibfk_6` FOREIGN KEY (`__idContCate`) REFERENCES `cart_producto__categoria` (`__idContCate`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_2A7E5BC18EAB4527` FOREIGN KEY (`__idTipo`) REFERENCES `cart_producto__tipo` (`__idTipo`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_2A7E5BC1A07E7B24` FOREIGN KEY (`__idContCate`) REFERENCES `cart_producto__categoria` (`__idContCate`) ON DELETE CASCADE;

--
-- Filtros para la tabla `cart_producto__galeria`
--
ALTER TABLE `cart_producto__galeria`
  ADD CONSTRAINT `cart_producto__galeria_ibfk_1` FOREIGN KEY (`__idProducto`) REFERENCES `cart_producto` (`__idProducto`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_producto__galeria_ibfk_2` FOREIGN KEY (`__idProducto`) REFERENCES `cart_producto` (`__idProducto`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_producto__galeria_ibfk_3` FOREIGN KEY (`__idProducto`) REFERENCES `cart_producto` (`__idProducto`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_D5ACFFFFC9EE6EC8` FOREIGN KEY (`__idProducto`) REFERENCES `cart_producto` (`__idProducto`) ON DELETE CASCADE;

--
-- Filtros para la tabla `cart_producto__galeria_language`
--
ALTER TABLE `cart_producto__galeria_language`
  ADD CONSTRAINT `cart_producto__galeria_language_ibfk_1` FOREIGN KEY (`__id_language`) REFERENCES `cms_language` (`__id_language`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_producto__galeria_language_ibfk_2` FOREIGN KEY (`__idContGale`) REFERENCES `cart_producto__galeria` (`__idContGale`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_producto__galeria_language_ibfk_3` FOREIGN KEY (`__id_language`) REFERENCES `cms_language` (`__id_language`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_producto__galeria_language_ibfk_4` FOREIGN KEY (`__idContGale`) REFERENCES `cart_producto__galeria` (`__idContGale`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_producto__galeria_language_ibfk_5` FOREIGN KEY (`__id_language`) REFERENCES `cms_language` (`__id_language`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_producto__galeria_language_ibfk_6` FOREIGN KEY (`__idContGale`) REFERENCES `cart_producto__galeria` (`__idContGale`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_57E70AFE80E64D77` FOREIGN KEY (`__id_language`) REFERENCES `cms_language` (`__id_language`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_57E70AFEAD07742A` FOREIGN KEY (`__idContGale`) REFERENCES `cart_producto__galeria` (`__idContGale`) ON DELETE CASCADE;

--
-- Filtros para la tabla `cart_producto__tipo_language`
--
ALTER TABLE `cart_producto__tipo_language`
  ADD CONSTRAINT `cart_producto__tipo_language_ibfk_1` FOREIGN KEY (`__id_language`) REFERENCES `cms_language` (`__id_language`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_producto__tipo_language_ibfk_2` FOREIGN KEY (`__idTipo`) REFERENCES `cart_producto__tipo` (`__idTipo`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_producto__tipo_language_ibfk_3` FOREIGN KEY (`__id_language`) REFERENCES `cms_language` (`__id_language`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_producto__tipo_language_ibfk_4` FOREIGN KEY (`__idTipo`) REFERENCES `cart_producto__tipo` (`__idTipo`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_producto__tipo_language_ibfk_5` FOREIGN KEY (`__id_language`) REFERENCES `cms_language` (`__id_language`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_producto__tipo_language_ibfk_6` FOREIGN KEY (`__idTipo`) REFERENCES `cart_producto__tipo` (`__idTipo`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_8FB0D14380E64D77` FOREIGN KEY (`__id_language`) REFERENCES `cms_language` (`__id_language`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_8FB0D1438EAB4527` FOREIGN KEY (`__idTipo`) REFERENCES `cart_producto__tipo` (`__idTipo`) ON DELETE CASCADE;

--
-- Filtros para la tabla `cms_cliente`
--
ALTER TABLE `cms_cliente`
  ADD CONSTRAINT `cms_cliente_ibfk_1` FOREIGN KEY (`__idtipo_documento`) REFERENCES `cms_tipo__documento` (`__idtipo_documento`),
  ADD CONSTRAINT `cms_cliente_ibfk_2` FOREIGN KEY (`__id_Pais`) REFERENCES `cms_pais` (`__id_Pais`),
  ADD CONSTRAINT `cms_cliente_ibfk_3` FOREIGN KEY (`__idtipo_documento`) REFERENCES `cms_tipo__documento` (`__idtipo_documento`),
  ADD CONSTRAINT `cms_cliente_ibfk_4` FOREIGN KEY (`__id_Pais`) REFERENCES `cms_pais` (`__id_Pais`),
  ADD CONSTRAINT `cms_cliente_ibfk_5` FOREIGN KEY (`__idtipo_documento`) REFERENCES `cms_tipo__documento` (`__idtipo_documento`),
  ADD CONSTRAINT `cms_cliente_ibfk_6` FOREIGN KEY (`__id_Pais`) REFERENCES `cms_pais` (`__id_Pais`),
  ADD CONSTRAINT `FK_AAF0943420C3C396` FOREIGN KEY (`__idtipo_documento`) REFERENCES `cms_tipo__documento` (`__idtipo_documento`),
  ADD CONSTRAINT `FK_AAF09434FC739DE` FOREIGN KEY (`__id_Pais`) REFERENCES `cms_pais` (`__id_Pais`);

--
-- Filtros para la tabla `cms_cliente__direccion`
--
ALTER TABLE `cms_cliente__direccion`
  ADD CONSTRAINT `cms_cliente__direccion_ibfk_1` FOREIGN KEY (`__id_tipo_direccion`) REFERENCES `cms_tipo__direccion` (`__id_tipo_direccion`),
  ADD CONSTRAINT `cms_cliente__direccion_ibfk_10` FOREIGN KEY (`_id__cliente`) REFERENCES `cms_cliente` (`__id_cliente`) ON DELETE CASCADE,
  ADD CONSTRAINT `cms_cliente__direccion_ibfk_11` FOREIGN KEY (`__cod_postal`) REFERENCES `cms_ubigeo` (`__cod_postal`),
  ADD CONSTRAINT `cms_cliente__direccion_ibfk_12` FOREIGN KEY (`__id_Pais`) REFERENCES `cms_pais` (`__id_Pais`),
  ADD CONSTRAINT `cms_cliente__direccion_ibfk_2` FOREIGN KEY (`_id__cliente`) REFERENCES `cms_cliente` (`__id_cliente`) ON DELETE CASCADE,
  ADD CONSTRAINT `cms_cliente__direccion_ibfk_3` FOREIGN KEY (`__cod_postal`) REFERENCES `cms_ubigeo` (`__cod_postal`),
  ADD CONSTRAINT `cms_cliente__direccion_ibfk_4` FOREIGN KEY (`__id_Pais`) REFERENCES `cms_pais` (`__id_Pais`),
  ADD CONSTRAINT `cms_cliente__direccion_ibfk_5` FOREIGN KEY (`__id_tipo_direccion`) REFERENCES `cms_tipo__direccion` (`__id_tipo_direccion`),
  ADD CONSTRAINT `cms_cliente__direccion_ibfk_6` FOREIGN KEY (`_id__cliente`) REFERENCES `cms_cliente` (`__id_cliente`) ON DELETE CASCADE,
  ADD CONSTRAINT `cms_cliente__direccion_ibfk_7` FOREIGN KEY (`__cod_postal`) REFERENCES `cms_ubigeo` (`__cod_postal`),
  ADD CONSTRAINT `cms_cliente__direccion_ibfk_8` FOREIGN KEY (`__id_Pais`) REFERENCES `cms_pais` (`__id_Pais`),
  ADD CONSTRAINT `cms_cliente__direccion_ibfk_9` FOREIGN KEY (`__id_tipo_direccion`) REFERENCES `cms_tipo__direccion` (`__id_tipo_direccion`),
  ADD CONSTRAINT `FK_20DBC72340EF4DF3` FOREIGN KEY (`__id_tipo_direccion`) REFERENCES `cms_tipo__direccion` (`__id_tipo_direccion`),
  ADD CONSTRAINT `FK_20DBC7238E322433` FOREIGN KEY (`_id__cliente`) REFERENCES `cms_cliente` (`__id_cliente`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_20DBC723E49AB9DF` FOREIGN KEY (`__cod_postal`) REFERENCES `cms_ubigeo` (`__cod_postal`),
  ADD CONSTRAINT `FK_20DBC723FC739DE` FOREIGN KEY (`__id_Pais`) REFERENCES `cms_pais` (`__id_Pais`);

--
-- Filtros para la tabla `cms_content`
--
ALTER TABLE `cms_content`
  ADD CONSTRAINT `cms_content_ibfk_1` FOREIGN KEY (`__idTipo`) REFERENCES `cms_content__tipo` (`__idTipo`) ON DELETE CASCADE,
  ADD CONSTRAINT `cms_content_ibfk_2` FOREIGN KEY (`__idContCate`) REFERENCES `cms_content__categoria` (`__idContCate`) ON DELETE CASCADE,
  ADD CONSTRAINT `cms_content_ibfk_3` FOREIGN KEY (`__idTipo`) REFERENCES `cms_content__tipo` (`__idTipo`) ON DELETE CASCADE,
  ADD CONSTRAINT `cms_content_ibfk_4` FOREIGN KEY (`__idContCate`) REFERENCES `cms_content__categoria` (`__idContCate`) ON DELETE CASCADE,
  ADD CONSTRAINT `cms_content_ibfk_5` FOREIGN KEY (`__idTipo`) REFERENCES `cms_content__tipo` (`__idTipo`) ON DELETE CASCADE,
  ADD CONSTRAINT `cms_content_ibfk_6` FOREIGN KEY (`__idContCate`) REFERENCES `cms_content__categoria` (`__idContCate`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_A0293FB88EAB4527` FOREIGN KEY (`__idTipo`) REFERENCES `cms_content__tipo` (`__idTipo`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_A0293FB8A07E7B24` FOREIGN KEY (`__idContCate`) REFERENCES `cms_content__categoria` (`__idContCate`) ON DELETE CASCADE;

--
-- Filtros para la tabla `cms_content_comentario`
--
ALTER TABLE `cms_content_comentario`
  ADD CONSTRAINT `cms_content_comentario_ibfk_1` FOREIGN KEY (`__id_cliente`) REFERENCES `cms_cliente` (`__id_cliente`) ON DELETE CASCADE,
  ADD CONSTRAINT `cms_content_comentario_ibfk_2` FOREIGN KEY (`__idContent`) REFERENCES `cms_content` (`__idContent`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_D075827D177770D3` FOREIGN KEY (`__id_cliente`) REFERENCES `cms_cliente` (`__id_cliente`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_D075827DC0AB0A3E` FOREIGN KEY (`__idContent`) REFERENCES `cms_content` (`__idContent`) ON DELETE CASCADE;

--
-- Filtros para la tabla `cms_content_language`
--
ALTER TABLE `cms_content_language`
  ADD CONSTRAINT `cms_content_language_ibfk_1` FOREIGN KEY (`__id_language`) REFERENCES `cms_language` (`__id_language`) ON DELETE CASCADE,
  ADD CONSTRAINT `cms_content_language_ibfk_2` FOREIGN KEY (`__idContent`) REFERENCES `cms_content` (`__idContent`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_16737A2080E64D77` FOREIGN KEY (`__id_language`) REFERENCES `cms_language` (`__id_language`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_16737A20C0AB0A3E` FOREIGN KEY (`__idContent`) REFERENCES `cms_content` (`__idContent`) ON DELETE CASCADE;

--
-- Filtros para la tabla `cms_content__categoria`
--
ALTER TABLE `cms_content__categoria`
  ADD CONSTRAINT `cms_content__categoria_ibfk_1` FOREIGN KEY (`__idContCate_Padre`) REFERENCES `cms_content__categoria` (`__idContCate`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_9868D64FD83BB542` FOREIGN KEY (`__idContCate_Padre`) REFERENCES `cms_content__categoria` (`__idContCate`) ON DELETE CASCADE;

--
-- Filtros para la tabla `cms_content__categoria_language`
--
ALTER TABLE `cms_content__categoria_language`
  ADD CONSTRAINT `cms_content__categoria_language_ibfk_1` FOREIGN KEY (`__id_language`) REFERENCES `cms_language` (`__id_language`) ON DELETE CASCADE,
  ADD CONSTRAINT `cms_content__categoria_language_ibfk_2` FOREIGN KEY (`__idContCate`) REFERENCES `cms_content__categoria` (`__idContCate`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_722E113480E64D77` FOREIGN KEY (`__id_language`) REFERENCES `cms_language` (`__id_language`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_722E1134A07E7B24` FOREIGN KEY (`__idContCate`) REFERENCES `cms_content__categoria` (`__idContCate`) ON DELETE CASCADE;

--
-- Filtros para la tabla `cms_content__galeria`
--
ALTER TABLE `cms_content__galeria`
  ADD CONSTRAINT `cms_content__galeria_ibfk_1` FOREIGN KEY (`__idContent`) REFERENCES `cms_content` (`__idContent`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_2FF03B61C0AB0A3E` FOREIGN KEY (`__idContent`) REFERENCES `cms_content` (`__idContent`) ON DELETE CASCADE;

--
-- Filtros para la tabla `cms_content__galeria_language`
--
ALTER TABLE `cms_content__galeria_language`
  ADD CONSTRAINT `cms_content__galeria_language_ibfk_1` FOREIGN KEY (`__id_language`) REFERENCES `cms_language` (`__id_language`) ON DELETE CASCADE,
  ADD CONSTRAINT `cms_content__galeria_language_ibfk_2` FOREIGN KEY (`__idContGale`) REFERENCES `cms_content__galeria` (`__idContGale`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_FB20632380E64D77` FOREIGN KEY (`__id_language`) REFERENCES `cms_language` (`__id_language`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_FB206323AD07742A` FOREIGN KEY (`__idContGale`) REFERENCES `cms_content__galeria` (`__idContGale`) ON DELETE CASCADE;

--
-- Filtros para la tabla `cms_content__tipo_language`
--
ALTER TABLE `cms_content__tipo_language`
  ADD CONSTRAINT `cms_content__tipo_language_ibfk_1` FOREIGN KEY (`__id_language`) REFERENCES `cms_language` (`__id_language`) ON DELETE CASCADE,
  ADD CONSTRAINT `cms_content__tipo_language_ibfk_2` FOREIGN KEY (`__idTipo`) REFERENCES `cms_content__tipo` (`__idTipo`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_8DC1AE7780E64D77` FOREIGN KEY (`__id_language`) REFERENCES `cms_language` (`__id_language`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_8DC1AE778EAB4527` FOREIGN KEY (`__idTipo`) REFERENCES `cms_content__tipo` (`__idTipo`) ON DELETE CASCADE;

--
-- Filtros para la tabla `cms_tipo__direccion_language`
--
ALTER TABLE `cms_tipo__direccion_language`
  ADD CONSTRAINT `cms_tipo__direccion_language_ibfk_1` FOREIGN KEY (`__id_tipo_direccion`) REFERENCES `cms_tipo__direccion` (`__id_tipo_direccion`) ON DELETE CASCADE,
  ADD CONSTRAINT `cms_tipo__direccion_language_ibfk_2` FOREIGN KEY (`__id_language`) REFERENCES `cms_language` (`__id_language`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_BCD9FE440EF4DF3` FOREIGN KEY (`__id_tipo_direccion`) REFERENCES `cms_tipo__direccion` (`__id_tipo_direccion`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_BCD9FE480E64D77` FOREIGN KEY (`__id_language`) REFERENCES `cms_language` (`__id_language`) ON DELETE CASCADE;

--
-- Filtros para la tabla `cms_tipo__documento_language`
--
ALTER TABLE `cms_tipo__documento_language`
  ADD CONSTRAINT `cms_tipo__documento_language_ibfk_1` FOREIGN KEY (`idtipo_documento`) REFERENCES `cms_tipo__documento` (`__idtipo_documento`) ON DELETE CASCADE,
  ADD CONSTRAINT `cms_tipo__documento_language_ibfk_2` FOREIGN KEY (`__id_language`) REFERENCES `cms_language` (`__id_language`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_DD2753CF45A700C2` FOREIGN KEY (`idtipo_documento`) REFERENCES `cms_tipo__documento` (`__idtipo_documento`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_DD2753CF80E64D77` FOREIGN KEY (`__id_language`) REFERENCES `cms_language` (`__id_language`) ON DELETE CASCADE;

--
-- Filtros para la tabla `cms_ubigeo`
--
ALTER TABLE `cms_ubigeo`
  ADD CONSTRAINT `cms_ubigeo_ibfk_1` FOREIGN KEY (`__id_Pais`) REFERENCES `cms_pais` (`__id_Pais`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_F5188083FC739DE` FOREIGN KEY (`__id_Pais`) REFERENCES `cms_pais` (`__id_Pais`) ON DELETE CASCADE;

--
-- Filtros para la tabla `cms_user`
--
ALTER TABLE `cms_user`
  ADD CONSTRAINT `cms_user_ibfk_1` FOREIGN KEY (`__type_docu_user`) REFERENCES `cms_tipo__documento` (`__idtipo_documento`),
  ADD CONSTRAINT `FK_3AF03EC5C0C1627` FOREIGN KEY (`__type_docu_user`) REFERENCES `cms_tipo__documento` (`__idtipo_documento`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;