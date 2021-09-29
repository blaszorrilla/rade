/*
SQLyog Ultimate v12.3.2 (64 bit)
MySQL - 5.7.27-log : Database - rade
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`rade` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `rade`;

/*Table structure for table `asistencia_evento` */

DROP TABLE IF EXISTS `asistencia_evento`;

CREATE TABLE `asistencia_evento` (
  `id_asistencia_evento` int(11) NOT NULL,
  `id_evento` int(11) NOT NULL,
  `id_prefil` int(11) NOT NULL,
  PRIMARY KEY (`id_asistencia_evento`),
  KEY `id_prefil` (`id_prefil`),
  KEY `id_evento` (`id_evento`),
  CONSTRAINT `asistencia_evento_ibfk_1` FOREIGN KEY (`id_prefil`) REFERENCES `perfil` (`id_prefil`),
  CONSTRAINT `asistencia_evento_ibfk_2` FOREIGN KEY (`id_evento`) REFERENCES `evento` (`id_evento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `asistencia_evento` */

insert  into `asistencia_evento`(`id_asistencia_evento`,`id_evento`,`id_prefil`) values 
(1,1,1);

/*Table structure for table `baja_comentario_posteo` */

DROP TABLE IF EXISTS `baja_comentario_posteo`;

CREATE TABLE `baja_comentario_posteo` (
  `id_baja_comentario_posteo` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `obs` varchar(200) DEFAULT NULL,
  `id_posteo_comentario` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_baja_comentario_posteo`),
  KEY `id_posteo_comentario` (`id_posteo_comentario`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `baja_comentario_posteo_ibfk_1` FOREIGN KEY (`id_posteo_comentario`) REFERENCES `posteo_comentario` (`id_posteo_comentario`),
  CONSTRAINT `baja_comentario_posteo_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `baja_comentario_posteo` */

/*Table structure for table `baja_evento` */

DROP TABLE IF EXISTS `baja_evento`;

CREATE TABLE `baja_evento` (
  `id_baja_evento` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `obs` varchar(200) DEFAULT NULL,
  `id_evento` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_baja_evento`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_evento` (`id_evento`),
  CONSTRAINT `baja_evento_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `baja_evento_ibfk_2` FOREIGN KEY (`id_evento`) REFERENCES `evento` (`id_evento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `baja_evento` */

/*Table structure for table `baja_evento_comentario` */

DROP TABLE IF EXISTS `baja_evento_comentario`;

CREATE TABLE `baja_evento_comentario` (
  `id_baja_evento_comentario` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `obs` varchar(200) DEFAULT NULL,
  `id_evento_comentario` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_baja_evento_comentario`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_evento_comentario` (`id_evento_comentario`),
  CONSTRAINT `baja_evento_comentario_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `baja_evento_comentario_ibfk_2` FOREIGN KEY (`id_evento_comentario`) REFERENCES `evento_comentario` (`id_evento_comentario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `baja_evento_comentario` */

/*Table structure for table `baja_posteo` */

DROP TABLE IF EXISTS `baja_posteo`;

CREATE TABLE `baja_posteo` (
  `id_baja_posteo` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `obs` varchar(200) DEFAULT NULL,
  `id_posteo` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_baja_posteo`),
  KEY `id_posteo` (`id_posteo`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `baja_posteo_ibfk_1` FOREIGN KEY (`id_posteo`) REFERENCES `posteo` (`id_posteo`),
  CONSTRAINT `baja_posteo_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `baja_posteo` */

/*Table structure for table `carrera` */

DROP TABLE IF EXISTS `carrera`;

CREATE TABLE `carrera` (
  `id_carrera` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_carrera`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `carrera` */

insert  into `carrera`(`id_carrera`,`nombre`) values 
(1,'Derecho'),
(2,'Lic. en Analisis de Sistemas Informaticos'),
(3,'Ciencias Contables'),
(4,'Ciencias Administrativas'),
(5,'Comercio Exterior'),
(6,'Hoteleria y Turismo'),
(7,'Ingenieria Comercial'),
(8,'Administracion Agroecologica e Industrial'),
(9,'Ciencias de la Educacion'),
(10,'Educacion Parvularia'),
(11,'Enfermeria'),
(12,'Psicologia'),
(13,'Matematica'),
(14,'AGRONOMIA');

/*Table structure for table `ceo` */

DROP TABLE IF EXISTS `ceo`;

CREATE TABLE `ceo` (
  `id_ceo` int(11) NOT NULL,
  `ci` varchar(20) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `direccion` text,
  `telefono` varchar(20) DEFAULT NULL,
  `email` text,
  `pagina` text,
  `estado` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_ceo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ceo` */

insert  into `ceo`(`id_ceo`,`ci`,`nombre`,`apellido`,`direccion`,`telefono`,`email`,`pagina`,`estado`) values 
(1,'3416436','FACUNDO','DUETTE','SAN ROQUE','0985142358','facundoduette@gmail.com','www.rade.com','ACTIVO');

/*Table structure for table `ceo_perfil` */

DROP TABLE IF EXISTS `ceo_perfil`;

CREATE TABLE `ceo_perfil` (
  `id_prefil` int(11) NOT NULL,
  `id_ceo` int(11) NOT NULL,
  PRIMARY KEY (`id_prefil`,`id_ceo`),
  KEY `id_ceo` (`id_ceo`),
  CONSTRAINT `ceo_perfil_ibfk_1` FOREIGN KEY (`id_prefil`) REFERENCES `perfil` (`id_prefil`),
  CONSTRAINT `ceo_perfil_ibfk_2` FOREIGN KEY (`id_ceo`) REFERENCES `ceo` (`id_ceo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ceo_perfil` */

insert  into `ceo_perfil`(`id_prefil`,`id_ceo`) values 
(1,1);

/*Table structure for table `circulo` */

DROP TABLE IF EXISTS `circulo`;

CREATE TABLE `circulo` (
  `id_circulo` int(11) NOT NULL,
  `nombre` text,
  `estado` varchar(20) DEFAULT NULL,
  `id_prefil` int(11) NOT NULL,
  PRIMARY KEY (`id_circulo`),
  KEY `id_prefil` (`id_prefil`),
  CONSTRAINT `circulo_ibfk_1` FOREIGN KEY (`id_prefil`) REFERENCES `perfil` (`id_prefil`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `circulo` */

/*Table structure for table `circulo_perfil` */

DROP TABLE IF EXISTS `circulo_perfil`;

CREATE TABLE `circulo_perfil` (
  `id_circulo_perfil` int(11) NOT NULL,
  `id_prefil` int(11) NOT NULL,
  `id_circulo` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_circulo_perfil`,`id_prefil`,`id_circulo`),
  KEY `id_prefil` (`id_prefil`),
  KEY `id_circulo` (`id_circulo`),
  CONSTRAINT `circulo_perfil_ibfk_1` FOREIGN KEY (`id_prefil`) REFERENCES `perfil` (`id_prefil`),
  CONSTRAINT `circulo_perfil_ibfk_2` FOREIGN KEY (`id_circulo`) REFERENCES `circulo` (`id_circulo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `circulo_perfil` */

/*Table structure for table `circulo_posteo` */

DROP TABLE IF EXISTS `circulo_posteo`;

CREATE TABLE `circulo_posteo` (
  `id_circulo` int(11) NOT NULL,
  `id_posteo` int(11) NOT NULL,
  PRIMARY KEY (`id_circulo`,`id_posteo`),
  KEY `id_posteo` (`id_posteo`),
  CONSTRAINT `circulo_posteo_ibfk_1` FOREIGN KEY (`id_posteo`) REFERENCES `posteo` (`id_posteo`),
  CONSTRAINT `circulo_posteo_ibfk_2` FOREIGN KEY (`id_circulo`) REFERENCES `circulo` (`id_circulo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `circulo_posteo` */

/*Table structure for table `curriculum` */

DROP TABLE IF EXISTS `curriculum`;

CREATE TABLE `curriculum` (
  `id_curriculum` int(11) NOT NULL,
  `nombre` longtext,
  `info_academica` longtext,
  `info_experiencia` longtext,
  `info_idioma` longtext,
  `refe_laboral` longtext,
  `refe_personal` longtext,
  `conocimientos` longtext,
  `foto` text,
  `estado` varchar(20) DEFAULT NULL,
  `id_prefil` int(11) NOT NULL,
  `id_tipo_diseno_curri` int(11) NOT NULL,
  `apellido` longtext,
  `direccion` longtext,
  `telefono` longtext,
  `cedula` longtext,
  `fecha_nac` date DEFAULT NULL,
  PRIMARY KEY (`id_curriculum`,`id_prefil`,`id_tipo_diseno_curri`),
  KEY `id_prefil` (`id_prefil`),
  KEY `id_tipo_diseno_curri` (`id_tipo_diseno_curri`),
  CONSTRAINT `curriculum_ibfk_1` FOREIGN KEY (`id_prefil`) REFERENCES `perfil` (`id_prefil`),
  CONSTRAINT `curriculum_ibfk_2` FOREIGN KEY (`id_tipo_diseno_curri`) REFERENCES `tipo_diseno_curri` (`id_tipo_diseno_curri`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `curriculum` */

/*Table structure for table `denuncia` */

DROP TABLE IF EXISTS `denuncia`;

CREATE TABLE `denuncia` (
  `id_denuncia` int(11) NOT NULL,
  `id_tipo_denuncia` int(11) NOT NULL,
  `id_prefil` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_denuncia`),
  KEY `id_prefil` (`id_prefil`),
  KEY `id_tipo_denuncia` (`id_tipo_denuncia`),
  CONSTRAINT `denuncia_ibfk_1` FOREIGN KEY (`id_prefil`) REFERENCES `perfil` (`id_prefil`),
  CONSTRAINT `denuncia_ibfk_2` FOREIGN KEY (`id_tipo_denuncia`) REFERENCES `tipo_denuncia` (`id_tipo_denuncia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `denuncia` */

/*Table structure for table `denuncia_comentario_evento` */

DROP TABLE IF EXISTS `denuncia_comentario_evento`;

CREATE TABLE `denuncia_comentario_evento` (
  `id_denuncia` int(11) NOT NULL,
  `id_evento_comentario` int(11) NOT NULL,
  PRIMARY KEY (`id_denuncia`,`id_evento_comentario`),
  KEY `id_evento_comentario` (`id_evento_comentario`),
  CONSTRAINT `denuncia_comentario_evento_ibfk_1` FOREIGN KEY (`id_evento_comentario`) REFERENCES `evento_comentario` (`id_evento_comentario`),
  CONSTRAINT `denuncia_comentario_evento_ibfk_2` FOREIGN KEY (`id_denuncia`) REFERENCES `denuncia` (`id_denuncia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `denuncia_comentario_evento` */

/*Table structure for table `denuncia_evento` */

DROP TABLE IF EXISTS `denuncia_evento`;

CREATE TABLE `denuncia_evento` (
  `id_evento` int(11) NOT NULL,
  `id_denuncia` int(11) NOT NULL,
  PRIMARY KEY (`id_evento`,`id_denuncia`),
  KEY `id_denuncia` (`id_denuncia`),
  CONSTRAINT `denuncia_evento_ibfk_1` FOREIGN KEY (`id_evento`) REFERENCES `evento` (`id_evento`),
  CONSTRAINT `denuncia_evento_ibfk_2` FOREIGN KEY (`id_denuncia`) REFERENCES `denuncia` (`id_denuncia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `denuncia_evento` */

/*Table structure for table `denuncia_posteo` */

DROP TABLE IF EXISTS `denuncia_posteo`;

CREATE TABLE `denuncia_posteo` (
  `id_posteo` int(11) NOT NULL,
  `id_denuncia` int(11) NOT NULL,
  PRIMARY KEY (`id_posteo`,`id_denuncia`),
  KEY `id_denuncia` (`id_denuncia`),
  CONSTRAINT `denuncia_posteo_ibfk_1` FOREIGN KEY (`id_posteo`) REFERENCES `posteo` (`id_posteo`),
  CONSTRAINT `denuncia_posteo_ibfk_2` FOREIGN KEY (`id_denuncia`) REFERENCES `denuncia` (`id_denuncia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `denuncia_posteo` */

/*Table structure for table `denuncia_pregunta` */

DROP TABLE IF EXISTS `denuncia_pregunta`;

CREATE TABLE `denuncia_pregunta` (
  `id_pregunta` int(11) NOT NULL,
  `id_denuncia` int(11) NOT NULL,
  PRIMARY KEY (`id_pregunta`,`id_denuncia`),
  KEY `id_denuncia` (`id_denuncia`),
  CONSTRAINT `denuncia_pregunta_ibfk_1` FOREIGN KEY (`id_denuncia`) REFERENCES `denuncia` (`id_denuncia`),
  CONSTRAINT `denuncia_pregunta_ibfk_2` FOREIGN KEY (`id_pregunta`) REFERENCES `pregunta` (`id_pregunta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `denuncia_pregunta` */

/*Table structure for table `denuncia_respuesta` */

DROP TABLE IF EXISTS `denuncia_respuesta`;

CREATE TABLE `denuncia_respuesta` (
  `id_respuesta` int(11) NOT NULL,
  `id_denuncia` int(11) NOT NULL,
  PRIMARY KEY (`id_respuesta`,`id_denuncia`),
  KEY `id_denuncia` (`id_denuncia`),
  CONSTRAINT `denuncia_respuesta_ibfk_1` FOREIGN KEY (`id_denuncia`) REFERENCES `denuncia` (`id_denuncia`),
  CONSTRAINT `denuncia_respuesta_ibfk_2` FOREIGN KEY (`id_respuesta`) REFERENCES `respuesta` (`id_respuesta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `denuncia_respuesta` */

/*Table structure for table `dependencia_institucion` */

DROP TABLE IF EXISTS `dependencia_institucion`;

CREATE TABLE `dependencia_institucion` (
  `id_dependencia_institucion` int(11) NOT NULL,
  `institucion_sede` int(11) NOT NULL,
  `institucion_matriz` int(11) NOT NULL,
  PRIMARY KEY (`id_dependencia_institucion`),
  KEY `institucion_matriz` (`institucion_matriz`),
  KEY `institucion_sede` (`institucion_sede`),
  CONSTRAINT `dependencia_institucion_ibfk_1` FOREIGN KEY (`institucion_matriz`) REFERENCES `institucion` (`id_institucion`),
  CONSTRAINT `dependencia_institucion_ibfk_2` FOREIGN KEY (`institucion_sede`) REFERENCES `institucion` (`id_institucion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `dependencia_institucion` */

/*Table structure for table `enlace_ceo` */

DROP TABLE IF EXISTS `enlace_ceo`;

CREATE TABLE `enlace_ceo` (
  `id_enlacesistema` int(11) NOT NULL,
  `id_ceo` int(11) NOT NULL,
  PRIMARY KEY (`id_enlacesistema`,`id_ceo`),
  KEY `id_ceo` (`id_ceo`),
  CONSTRAINT `enlace_ceo_ibfk_1` FOREIGN KEY (`id_ceo`) REFERENCES `ceo` (`id_ceo`),
  CONSTRAINT `enlace_ceo_ibfk_2` FOREIGN KEY (`id_enlacesistema`) REFERENCES `enlacesistema` (`id_enlacesistema`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `enlace_ceo` */

/*Table structure for table `enlace_evento` */

DROP TABLE IF EXISTS `enlace_evento`;

CREATE TABLE `enlace_evento` (
  `id_enlacesistema` int(11) NOT NULL,
  `id_evento` int(11) NOT NULL,
  PRIMARY KEY (`id_enlacesistema`,`id_evento`),
  KEY `id_evento` (`id_evento`),
  CONSTRAINT `enlace_evento_ibfk_1` FOREIGN KEY (`id_enlacesistema`) REFERENCES `enlacesistema` (`id_enlacesistema`),
  CONSTRAINT `enlace_evento_ibfk_2` FOREIGN KEY (`id_evento`) REFERENCES `evento` (`id_evento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `enlace_evento` */

insert  into `enlace_evento`(`id_enlacesistema`,`id_evento`) values 
(24,1),
(47,2),
(81,3);

/*Table structure for table `enlace_institucion` */

DROP TABLE IF EXISTS `enlace_institucion`;

CREATE TABLE `enlace_institucion` (
  `id_enlacesistema` int(11) NOT NULL,
  `id_institucion` int(11) NOT NULL,
  PRIMARY KEY (`id_enlacesistema`,`id_institucion`),
  KEY `id_institucion` (`id_institucion`),
  CONSTRAINT `enlace_institucion_ibfk_1` FOREIGN KEY (`id_enlacesistema`) REFERENCES `enlacesistema` (`id_enlacesistema`),
  CONSTRAINT `enlace_institucion_ibfk_2` FOREIGN KEY (`id_institucion`) REFERENCES `institucion` (`id_institucion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `enlace_institucion` */

insert  into `enlace_institucion`(`id_enlacesistema`,`id_institucion`) values 
(46,3);

/*Table structure for table `enlace_perfil` */

DROP TABLE IF EXISTS `enlace_perfil`;

CREATE TABLE `enlace_perfil` (
  `id_enlacesistema` int(11) NOT NULL,
  `id_prefil` int(11) NOT NULL,
  PRIMARY KEY (`id_enlacesistema`,`id_prefil`),
  KEY `id_prefil` (`id_prefil`),
  CONSTRAINT `enlace_perfil_ibfk_1` FOREIGN KEY (`id_prefil`) REFERENCES `perfil` (`id_prefil`),
  CONSTRAINT `enlace_perfil_ibfk_2` FOREIGN KEY (`id_enlacesistema`) REFERENCES `enlacesistema` (`id_enlacesistema`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `enlace_perfil` */

/*Table structure for table `enlace_posteo` */

DROP TABLE IF EXISTS `enlace_posteo`;

CREATE TABLE `enlace_posteo` (
  `id_enlacesistema` int(11) NOT NULL,
  `id_posteo` int(11) NOT NULL,
  PRIMARY KEY (`id_enlacesistema`,`id_posteo`),
  KEY `id_posteo` (`id_posteo`),
  CONSTRAINT `enlace_posteo_ibfk_1` FOREIGN KEY (`id_posteo`) REFERENCES `posteo` (`id_posteo`),
  CONSTRAINT `enlace_posteo_ibfk_2` FOREIGN KEY (`id_enlacesistema`) REFERENCES `enlacesistema` (`id_enlacesistema`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `enlace_posteo` */

insert  into `enlace_posteo`(`id_enlacesistema`,`id_posteo`) values 
(41,1),
(82,2),
(88,3),
(89,6);

/*Table structure for table `enlace_pregunta` */

DROP TABLE IF EXISTS `enlace_pregunta`;

CREATE TABLE `enlace_pregunta` (
  `id_enlacesistema` int(11) NOT NULL,
  `id_pregunta` int(11) NOT NULL,
  KEY `id_pregunta` (`id_pregunta`),
  KEY `id_enlacesistema` (`id_enlacesistema`),
  CONSTRAINT `enlace_pregunta_ibfk_1` FOREIGN KEY (`id_pregunta`) REFERENCES `pregunta` (`id_pregunta`),
  CONSTRAINT `enlace_pregunta_ibfk_2` FOREIGN KEY (`id_enlacesistema`) REFERENCES `enlacesistema` (`id_enlacesistema`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `enlace_pregunta` */

insert  into `enlace_pregunta`(`id_enlacesistema`,`id_pregunta`) values 
(15,1),
(21,2),
(22,3),
(29,4),
(39,5),
(48,6),
(49,7),
(50,8),
(51,9),
(57,10),
(59,11),
(61,12),
(62,13),
(68,14),
(77,15),
(78,16),
(90,17),
(96,18);

/*Table structure for table `enlace_registro` */

DROP TABLE IF EXISTS `enlace_registro`;

CREATE TABLE `enlace_registro` (
  `id_enlacesistema` int(11) NOT NULL,
  `id_registro` int(11) NOT NULL,
  PRIMARY KEY (`id_enlacesistema`,`id_registro`),
  KEY `id_registro` (`id_registro`),
  CONSTRAINT `enlace_registro_ibfk_1` FOREIGN KEY (`id_registro`) REFERENCES `registro` (`id_registro`),
  CONSTRAINT `enlace_registro_ibfk_2` FOREIGN KEY (`id_enlacesistema`) REFERENCES `enlacesistema` (`id_enlacesistema`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `enlace_registro` */

insert  into `enlace_registro`(`id_enlacesistema`,`id_registro`) values 
(9,5),
(27,6),
(31,7),
(30,8),
(32,9),
(53,13),
(60,14),
(64,15),
(66,16),
(69,17),
(73,18),
(71,19),
(72,19),
(75,20),
(79,21),
(80,22),
(84,25),
(86,26),
(92,27),
(94,28);

/*Table structure for table `enlacesistema` */

DROP TABLE IF EXISTS `enlacesistema`;

CREATE TABLE `enlacesistema` (
  `id_enlacesistema` int(11) NOT NULL,
  `id_tipo` int(11) NOT NULL,
  `nombre` text,
  `url` text,
  `direccion` text,
  `estado` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_enlacesistema`),
  KEY `id_tipo` (`id_tipo`),
  CONSTRAINT `enlacesistema_ibfk_1` FOREIGN KEY (`id_tipo`) REFERENCES `tipo` (`id_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `enlacesistema` */

insert  into `enlacesistema`(`id_enlacesistema`,`id_tipo`,`nombre`,`url`,`direccion`,`estado`) values 
(1,1,'CEO','/rade/ceo=registro2018','views/pagina/ceo/ceo.jsp','ACTIVO'),
(2,1,'LOGIN','/rade/login','views/pagina/login/login.jsp','ACTIVO'),
(3,1,'REGISTRO','/rade/registro','views/pagina/registro/registro.jsp','ACTIVO'),
(4,1,'PERFIL','/rade/capo','views/pagina/perfil/perfil.jsp','ACTIVO'),
(5,2,'INSTITUCION','/rade/utic','views/pagina/perfil/perfil.jsp','ACTIVO'),
(6,1,'TERMINOS','/rade/terminos','views/pagina/terminos/terminos.jsp','ACTIVO'),
(7,1,'RESTABLECER','/rade/restablecer','views/pagina/restablecer_pass/restablecer.jsp','ACTIVO'),
(8,1,'RESTABLECER','/rade/activacion=a40340w14mpdh3b56w56q01a85066x556jwuv3sm4198wr9718uv','views/pagina/restablecer_pass/restablecer.jsp','ACTIVO'),
(9,3,'PERFIL','/rade/activacion=au86yi5888ac5gk455x2qyn2l406l8762o7d6p66iu2pd26uc71','views/pagina/login/validacion.jsp','INACTIVO'),
(10,3,'PERFIL','/rade/blas','views/pagina/perfil/perfil.jsp','ACTIVO'),
(11,1,'RESTABLECER','/rade/activacion=a57y32tivr8z8xf1t465lj0u521tr6cf937hhgwfrw32d5ig77y','views/pagina/restablecer_pass/nuevo_pass.jsp','INACTIVO'),
(12,1,'CONFIRMACION','/rade/confirmacion','views/pagina/registro/confirmacion.jsp','ACTIVO'),
(13,3,'PREGUNTAS','/rade/pregunta','views/pagina/pregunta/pregunta.jsp','ACTIVO'),
(14,3,'Archivos principal','/rade/archivos','views/pagina/archivos/principal.jsp','ACTIVO'),
(15,1,'Pregunta','/rade/pregunta/me-leen---me--ven----','views/pagina/pregunta/pregunta_ver.jsp','ACTIVO'),
(16,1,'evento','/rade/evento','views/pagina/evento/evento.jsp','ACTIVO'),
(17,1,'AsistenciaEvento','/rade/eventoasistencia','views/pagina/evento/eventoasistencia.jsp','ACTIVO'),
(18,1,'Vistaevento','/rade/evento/-titulo2','views/pagina/evento/eventover.jsp','ACTIVO'),
(19,1,'Verevento','/rade/eventoguardar','views/pagina/evento/evento_guardar.jsp','ACTIVO'),
(20,1,'Miseventos','/rade/misevento','views/pagina/evento/miseventos.jsp','ACTIVO'),
(21,1,'Pregunta','/rade/pregunta/Pregunta-2','views/pagina/pregunta/pregunta_ver.jsp','ACTIVO'),
(22,1,'Pregunta','/rade/pregunta/RADE-ya-funciona-','views/pagina/pregunta/pregunta_ver.jsp','ACTIVO'),
(23,1,'Vistaevento','/rade/evento/Olimpiadas-UTIC-2018','views/pagina/evento/eventover.jsp','ACTIVO'),
(24,1,'EVENTO','/rade/evento/a','views/pagina/evento/eventover.jsp','ACTIVO'),
(25,1,'SOLICITUDES','/rade/solicitudes','views/pagina/perfil/solicitudes.jsp','ACTIVO'),
(26,1,'INSTITUCION','/rade/institucion','views/pagina/perfil/institucion.jsp','ACTIVO'),
(27,3,'PERFIL','/rade/activacion=a2vq0e0qv1j5351p5651ldgxqt93a1v8z36yc4358jaqq116rs6','views/pagina/login/validacion.jsp','INACTIVO'),
(28,3,'PERFIL','/rade/elfacu','views/pagina/perfil/perfil.jsp','ACTIVO'),
(29,1,'Pregunta','/rade/pregunta/RADE-ya-funciona--------','views/pagina/pregunta/pregunta_ver.jsp','ACTIVO'),
(30,3,'PERFIL','/rade/activacion=a06wr541j24tm65fs7805akh8298197l0o10sn501om44703v6r','views/pagina/login/validacion.jsp','ACTIVO'),
(31,3,'PERFIL','/rade/activacion=a4fkl4v6j4st68f36y1pf065vphhjov5nrv7oiw946b24949thl','views/pagina/login/validacion.jsp','ACTIVO'),
(32,3,'PERFIL','/rade/activacion=a5qlcu5peqb930y1d86x4i5b2cs6j7e2ck55j73g1ks2az421bl','views/pagina/login/validacion.jsp','ACTIVO'),
(33,1,'RESTABLECER','/rade/activacion=ak03807rk5h0h5p981b437gov411g80kr9wr96za956s0t9o6ka','views/pagina/restablecer_pass/nuevo_pass.jsp','ACTIVO'),
(34,3,'CURRICULUM','/rade/archivos/curriculum1','views/pagina/archivos/curriculum.jsp','ACTIVO'),
(35,3,'memo','/rade/archivos/memo','views/pagina/archivos/nuevo_memo.jsp','ACTIVO'),
(36,3,'SERVERLET','/rade/archivos/Informe','/Informe','ACTIVO'),
(37,3,'SERVERLET','/rade/archivos/memoo','/Memoo','ACTIVO'),
(38,3,'vista','/rade/archivos/mis-archivos','views/pagina/archivos/vistas.jsp','ACTIVO'),
(39,1,'Pregunta','/rade/pregunta/probando----','views/pagina/pregunta/pregunta_ver.jsp','ACTIVO'),
(40,1,'POSTEO','/rade/posteo','/views/pagina/posteo/posteo.jsp','ACTIVO'),
(41,1,'Posteos','/rade/posteo/probando--posteo--','views/pagina/posteo/posteo_comentario.jsp','ACTIVO'),
(42,3,'INFORME PREGUNTA','/rade/informepregunta','views/pagina/pregunta/informe1.jsp','ACTIVO'),
(43,3,'INFORME TEMAS','/rade/informetema','views/pagina/pregunta/informe2.jsp','ACTIVO'),
(44,1,'INFORME INSTITUCION','/rade/informeInstitucion','views/pagina/perfil/informeInstitucion.jsp','ACTIVO'),
(45,1,'INFORME USUARIO','/rade/informeUsuario','views/pagina/registro/informeUsuario.jsp','ACTIVO'),
(46,2,'INSTITUCION','/rade/sancarlos','views/pagina/perfil/perfil.jsp','ACTIVO'),
(47,1,'EVENTO','/rade/evento/siiiiiiiiiiii','views/pagina/evento/eventover.jsp','ACTIVO'),
(48,1,'Pregunta','/rade/pregunta/Lunes-26-','views/pagina/pregunta/pregunta_ver.jsp','ACTIVO'),
(49,1,'Pregunta','/rade/pregunta/Sslss','views/pagina/pregunta/pregunta_ver.jsp','ACTIVO'),
(50,1,'Pregunta','/rade/pregunta/Lunes','views/pagina/pregunta/pregunta_ver.jsp','ACTIVO'),
(51,1,'Pregunta','/rade/pregunta/Otro','views/pagina/pregunta/pregunta_ver.jsp','ACTIVO'),
(52,1,'RESTABLECER','','views/pagina/restablecer_pass/nuevo_pass.jsp','ACTIVO'),
(53,3,'PERFIL','/rade/activacion=ax085uad14it595w2i09k11vw1w4u8nndu2grxp270h0c27zc30','views/pagina/login/validacion.jsp','INACTIVO'),
(54,3,'PERFIL','/rade/juanito','views/pagina/perfil/perfil.jsp','ACTIVO'),
(55,1,'RESTABLECER','','views/pagina/restablecer_pass/nuevo_pass.jsp','ACTIVO'),
(56,3,'PERFIL','','views/pagina/login/validacion.jsp','ACTIVO'),
(57,1,'Pregunta','/rade/pregunta/Lunes-presento-','views/pagina/pregunta/pregunta_ver.jsp','ACTIVO'),
(58,3,'PERFIL','','views/pagina/login/validacion.jsp','ACTIVO'),
(59,1,'Pregunta','/rade/pregunta/Que-preguntas-hara-usted-a-su-empleador-','views/pagina/pregunta/pregunta_ver.jsp','ACTIVO'),
(60,3,'PERFIL','/rade/activacion=a13x686lh97mxmz165j977c7weyt5w4l797gue9r53jv89jvs8k','views/pagina/login/validacion.jsp','INACTIVO'),
(61,1,'Pregunta','/rade/pregunta/ss-','views/pagina/pregunta/pregunta_ver.jsp','ACTIVO'),
(62,1,'Pregunta','/rade/pregunta/ASDDAS-','views/pagina/pregunta/pregunta_ver.jsp','ACTIVO'),
(63,3,'PERFIL','/rade/FacuCeo','views/pagina/perfil/perfil.jsp','ACTIVO'),
(64,3,'PERFIL','','views/pagina/login/validacion.jsp','ACTIVO'),
(65,1,'RESTABLECER','/rade/activacion=a589yxc0an950pw9s899muce03u2329nkv33rsoqigv8m081j50','views/pagina/restablecer_pass/nuevo_pass.jsp','ACTIVO'),
(66,3,'PERFIL','/rade/activacion=avkey6au9l1rbw4w8o752ko945l11lv7n6l1t4g382mh8riln11','views/pagina/login/validacion.jsp','INACTIVO'),
(67,3,'PERFIL','/rade/Fer','views/pagina/perfil/perfil.jsp','ACTIVO'),
(68,1,'Pregunta','/rade/pregunta/pruebaa','views/pagina/pregunta/pregunta_ver.jsp','ACTIVO'),
(69,3,'PERFIL','/rade/activacion=a50i3jfk2qgu41ne16ht916w39e35235j96ia74estie7ufq2c6','views/pagina/login/validacion.jsp','INACTIVO'),
(70,3,'PERFIL','/rade/aaaa','views/pagina/perfil/perfil.jsp','ACTIVO'),
(71,3,'PERFIL','/rade/activacion=a8537v6682z80scb0v26748xzd085ch3a6lwn6157d7w5v303qh','views/pagina/login/validacion.jsp','ACTIVO'),
(72,3,'PERFIL','/rade/activacion=ar4727p8h9c8350f49f0rqqi61j9rc4z5m4z1auw6938q2s3d25','views/pagina/login/validacion.jsp','ACTIVO'),
(73,3,'PERFIL','/rade/activacion=a00n5j91e2dpy506hl1i35i813jy250283734x45q9gnw2vfziv','views/pagina/login/validacion.jsp','INACTIVO'),
(74,3,'PERFIL','/rade/guilleramirez','views/pagina/perfil/perfil.jsp','ACTIVO'),
(75,3,'PERFIL','/rade/activacion=a7dg3quw54rh81pu7lh51fx9867vysk07b45k9jtx9nmcse2fg5','views/pagina/login/validacion.jsp','INACTIVO'),
(76,3,'PERFIL','/rade/sonia','views/pagina/perfil/perfil.jsp','ACTIVO'),
(77,1,'Pregunta','/rade/pregunta/cual-es-minimo-puntaje-para-aprobar-el-modulo-','views/pagina/pregunta/pregunta_ver.jsp','ACTIVO'),
(78,1,'Pregunta','/rade/pregunta/Continuando','views/pagina/pregunta/pregunta_ver.jsp','ACTIVO'),
(79,3,'PERFIL','/rade/activacion=aw1t1c2to25b2bdmfx76u05irw1f611pt987245dt4l1n3kvh7d','views/pagina/login/validacion.jsp','ACTIVO'),
(80,3,'PERFIL','/rade/activacion=ap17waht41m05bqw555h8jm1o687sgw713c36vbmb04765i5d2f','views/pagina/login/validacion.jsp','ACTIVO'),
(81,1,'EVENTO','/rade/evento/CONTINUACION-RADE','views/pagina/evento/eventover.jsp','ACTIVO'),
(82,1,'Posteos','/rade/posteo/CLASES-NORMALES','views/pagina/posteo/posteo_comentario.jsp','ACTIVO'),
(83,3,'PERFIL','/rade/activacion=a7755r5ruv756y96mhd3thgdo29gylt7668gb8dlvsx4r50w092','views/pagina/login/validacion.jsp','ACTIVO'),
(84,3,'PERFIL','/rade/activacion=apt0gavbqi0206ycdv4u2ygf23h3a16lowij3dhmn5qo9q3i07p','views/pagina/login/validacion.jsp','INACTIVO'),
(85,3,'PERFIL','/rade/blas2','views/pagina/perfil/perfil.jsp','ACTIVO'),
(86,3,'PERFIL','/rade/activacion=afe0169ax5ml187l4z5yvk52abeh5l8h6t7du9ih1qsg862uwb1','views/pagina/login/validacion.jsp','INACTIVO'),
(87,3,'PERFIL','/rade/juanperez','views/pagina/perfil/perfil.jsp','ACTIVO'),
(88,1,'Posteos','/rade/posteo/saludo--','views/pagina/posteo/posteo_comentario.jsp','ACTIVO'),
(89,1,'Posteos','/rade/posteo/Inicio-de-clases','views/pagina/posteo/posteo_comentario.jsp','ACTIVO'),
(90,1,'Pregunta','/rade/pregunta/Cantidad-de-alumnos','views/pagina/pregunta/pregunta_ver.jsp','ACTIVO'),
(91,3,'Asistencia Evento','/rade/miseventos','views/pagina/evento/eventoasistencia.jsp','ACTIVO'),
(92,3,'PERFIL','/rade/activacion=a09r75k55k4h71uy5m18ig1950nm0m77q3n04dc72n8hy90vy4p','views/pagina/login/validacion.jsp','INACTIVO'),
(93,3,'PERFIL','/rade/blas3','views/pagina/perfil/perfil.jsp','ACTIVO'),
(94,3,'PERFIL','/rade/activacion=a0xujv4n98t3ci3386z00ffepsm200i33259k64ih7534o59a4j','views/pagina/login/validacion.jsp','INACTIVO'),
(95,3,'PERFIL','/rade/blaszorrilla','views/pagina/perfil/perfil.jsp','ACTIVO'),
(96,1,'Pregunta','/rade/pregunta/hola','views/pagina/pregunta/pregunta_ver.jsp','ACTIVO');

/*Table structure for table `evento` */

DROP TABLE IF EXISTS `evento`;

CREATE TABLE `evento` (
  `id_evento` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `titulo` text,
  `contenido` text,
  `ubicacion` longtext,
  `estado` varchar(20) DEFAULT NULL,
  `id_permiso` int(11) NOT NULL,
  `id_prefil` int(11) NOT NULL,
  PRIMARY KEY (`id_evento`),
  KEY `id_prefil` (`id_prefil`),
  KEY `id_permiso` (`id_permiso`),
  CONSTRAINT `evento_ibfk_1` FOREIGN KEY (`id_prefil`) REFERENCES `perfil` (`id_prefil`),
  CONSTRAINT `evento_ibfk_2` FOREIGN KEY (`id_permiso`) REFERENCES `permiso` (`id_permiso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `evento` */

insert  into `evento`(`id_evento`,`fecha`,`titulo`,`contenido`,`ubicacion`,`estado`,`id_permiso`,`id_prefil`) values 
(1,'2018-11-23 00:00:00','a','<p>s</p>','s','ACTIVO',1,1),
(2,'2018-11-25 20:00:00','siiiiiiiiiiii','<p>sdfffffffffffffffffffffff</p>','dfsfdsfsdfsdsdf','ACTIVO',1,1),
(3,'2019-03-18 18:45:00','CONTINUACION RADE','<p>CONTINUA RADE EL JUEVES</p>','','ACTIVO',1,2);

/*Table structure for table `evento_comentario` */

DROP TABLE IF EXISTS `evento_comentario`;

CREATE TABLE `evento_comentario` (
  `id_evento_comentario` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `texto` text,
  `id_evento` int(11) NOT NULL,
  PRIMARY KEY (`id_evento_comentario`),
  KEY `id_evento` (`id_evento`),
  CONSTRAINT `evento_comentario_ibfk_1` FOREIGN KEY (`id_evento`) REFERENCES `evento` (`id_evento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `evento_comentario` */

/*Table structure for table `foto_perfil` */

DROP TABLE IF EXISTS `foto_perfil`;

CREATE TABLE `foto_perfil` (
  `id_foto_perfil` int(11) NOT NULL,
  `imagen` longblob,
  `estado` varchar(20) DEFAULT NULL,
  `id_prefil` int(11) NOT NULL,
  PRIMARY KEY (`id_foto_perfil`),
  KEY `id_prefil` (`id_prefil`),
  CONSTRAINT `foto_perfil_ibfk_1` FOREIGN KEY (`id_prefil`) REFERENCES `perfil` (`id_prefil`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `foto_perfil` */

/*Table structure for table `institucion` */

DROP TABLE IF EXISTS `institucion`;

CREATE TABLE `institucion` (
  `id_institucion` int(11) NOT NULL,
  `id_ceo` int(11) NOT NULL,
  `ciudad` text,
  `fecha` datetime DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `direccion` text,
  `telefono` varchar(20) DEFAULT NULL,
  `ubicacion` text,
  `email` text,
  `estado` varchar(20) DEFAULT NULL,
  `id_tipo_institucion` int(11) NOT NULL,
  PRIMARY KEY (`id_institucion`),
  KEY `id_ceo` (`id_ceo`),
  KEY `id_tipo_institucion` (`id_tipo_institucion`),
  CONSTRAINT `institucion_ibfk_1` FOREIGN KEY (`id_ceo`) REFERENCES `ceo` (`id_ceo`),
  CONSTRAINT `institucion_ibfk_2` FOREIGN KEY (`id_tipo_institucion`) REFERENCES `tipo_institucion` (`id_tipo_institucion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `institucion` */

insert  into `institucion`(`id_institucion`,`id_ceo`,`ciudad`,`fecha`,`nombre`,`direccion`,`telefono`,`ubicacion`,`email`,`estado`,`id_tipo_institucion`) values 
(1,1,'ENCARNACION','2018-09-17 19:55:31','UNIVERSIDAD TECNOLOGICA INTERCONTINENTAL','CURUPAYTY ENTRE MALLORQUIN E ESTIGARRIBIA','021-223349',' ','utic@gmail.com','ACTIVO',1),
(2,1,'ENCARNACION','2018-09-17 21:21:16','UNIVERSIDAD AUTONOMA DE ENCARNACION','PADRE KREUSSER','021-283736',' ','unae@gmail.com','INACTIVO',2),
(3,1,'ENCARNACION','2018-11-25 18:19:47','SAN CARLOS','CALLE JORGE MEMMEL','012313','','sancarlos@gmail.com','INACTIVO',1);

/*Table structure for table `institucion_perfil` */

DROP TABLE IF EXISTS `institucion_perfil`;

CREATE TABLE `institucion_perfil` (
  `id_institucion` int(11) NOT NULL,
  `id_prefil` int(11) NOT NULL,
  PRIMARY KEY (`id_institucion`,`id_prefil`),
  KEY `id_prefil` (`id_prefil`),
  CONSTRAINT `institucion_perfil_ibfk_1` FOREIGN KEY (`id_prefil`) REFERENCES `perfil` (`id_prefil`),
  CONSTRAINT `institucion_perfil_ibfk_2` FOREIGN KEY (`id_institucion`) REFERENCES `institucion` (`id_institucion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `institucion_perfil` */

insert  into `institucion_perfil`(`id_institucion`,`id_prefil`) values 
(1,2),
(3,5);

/*Table structure for table `interfaz` */

DROP TABLE IF EXISTS `interfaz`;

CREATE TABLE `interfaz` (
  `id_interfaz` int(11) NOT NULL,
  `nombre` text,
  `codigo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_interfaz`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `interfaz` */

/*Table structure for table `memo` */

DROP TABLE IF EXISTS `memo`;

CREATE TABLE `memo` (
  `id_memo` int(11) NOT NULL,
  `id_prefil` int(11) NOT NULL,
  `para` longtext,
  `de` longtext,
  `cargo` longtext,
  `fecha` date DEFAULT NULL,
  `asunto` longtext,
  `nombre_empresa` longtext,
  `texto` longtext,
  `estado` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_memo`),
  KEY `id_prefil` (`id_prefil`),
  CONSTRAINT `memo_ibfk_1` FOREIGN KEY (`id_prefil`) REFERENCES `perfil` (`id_prefil`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `memo` */

insert  into `memo`(`id_memo`,`id_prefil`,`para`,`de`,`cargo`,`fecha`,`asunto`,`nombre_empresa`,`texto`,`estado`) values 
(1,1,'Facundo','Luis Duette','Gerente General','2018-10-27','Importante','Rade Inc.','El área de ventas llevará a cabo su reunión mensual el día 22 de Abril del 2018. En la reunión se discutirán los temas referentes al incremento de ventas que se ha alcanzado en el último trimestre. \n\nEs muy importante contar con su presencia. \n\nSaludos a UD.','INACTIVO'),
(2,1,'Lic. Facundo Fabian Duette','Ing. Marlene Candia Sosa','Docente','2018-11-27','Notas','Universidad Tecnologica Intercontinental','El área de ventas llevará a cabo su reunión mensual el día 22 de Abril del 2018. En la reunión se discutirán los temas referentes al incremento de ventas que se ha alcanzado en el último trimestre. \n\nEs muy importante contar con su presencia. \n\nSaludos a UD.','INACTIVO'),
(3,1,'Olga Fortiz','Marlene Candia','Docente','2018-11-27','Evaluación de alumnos de la UTIC','UTIC','Video conferencia 17 hs para evaluar el modulo de taller de programación','ACTIVO'),
(4,1,'Facundo','Blas','no tengo','1997-10-15','jhdjashdj','asadbfjksah','jahkjfhakjsdhajksdhjakshdjkahsdjkahskjdhakjsdhajkshdkajshdkjahskjdhaskjdhjakhsdjkahsjkdhajshdajkshdjkahskjhasjkdhakjshdjkahskjhdkajshjdhasjkdhajkshdkajhs','ACTIVO');

/*Table structure for table `pass` */

DROP TABLE IF EXISTS `pass`;

CREATE TABLE `pass` (
  `id_pass` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `passdatos` text,
  `estado` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_pass`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `pass_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pass` */

insert  into `pass`(`id_pass`,`id_usuario`,`fecha`,`passdatos`,`estado`) values 
(1,1,'2018-09-17 19:54:15','capo','ACTIVO'),
(2,2,'2018-09-18 15:01:45','utic','ACTIVO'),
(3,3,'2018-11-14 19:30:34','blas2018','INACTIVO'),
(4,3,'2018-11-16 18:34:03','blas12345','INACTIVO'),
(5,4,'2018-11-20 18:59:51','facundoduette','ACTIVO'),
(6,5,'2018-11-25 18:19:47','123','ACTIVO'),
(7,6,'2018-11-26 17:56:18','juanito123','ACTIVO'),
(8,7,'2018-11-26 21:36:00','facundoduette','ACTIVO'),
(9,3,'2018-11-26 22:28:25','blas1234','ACTIVO'),
(10,8,'2018-11-26 22:33:01','ferfer2018','ACTIVO'),
(11,9,'2018-11-27 19:51:01','12345678','ACTIVO'),
(12,10,'2018-11-27 20:20:34','benitez108','ACTIVO'),
(13,11,'2018-11-27 20:51:13','amordemami','ACTIVO'),
(14,12,'2019-03-18 23:26:02','blasblas','ACTIVO'),
(15,13,'2019-03-20 16:14:02','juanjuan','ACTIVO'),
(16,14,'2019-03-27 17:19:08','blasblas','ACTIVO'),
(17,15,'2019-03-27 17:49:01','blasblas','ACTIVO');

/*Table structure for table `pass_enlace` */

DROP TABLE IF EXISTS `pass_enlace`;

CREATE TABLE `pass_enlace` (
  `id_pass_enlace` int(11) NOT NULL,
  `id_enlacesistema` int(11) NOT NULL,
  `id_pass` int(11) NOT NULL,
  `estado` varchar(20) DEFAULT NULL,
  `conteo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_pass_enlace`,`id_enlacesistema`,`id_pass`),
  KEY `id_pass` (`id_pass`),
  KEY `id_enlacesistema` (`id_enlacesistema`),
  CONSTRAINT `pass_enlace_ibfk_1` FOREIGN KEY (`id_pass`) REFERENCES `pass` (`id_pass`),
  CONSTRAINT `pass_enlace_ibfk_2` FOREIGN KEY (`id_enlacesistema`) REFERENCES `enlacesistema` (`id_enlacesistema`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pass_enlace` */

insert  into `pass_enlace`(`id_pass_enlace`,`id_enlacesistema`,`id_pass`,`estado`,`conteo`) values 
(1,11,3,'ACTIVO',2),
(2,33,4,'ACTIVO',1),
(3,52,4,'ACTIVO',1);

/*Table structure for table `perfil` */

DROP TABLE IF EXISTS `perfil`;

CREATE TABLE `perfil` (
  `id_prefil` int(11) NOT NULL,
  `usuario` text,
  `fecha` datetime DEFAULT NULL,
  `id_tipo_perfil` int(11) NOT NULL,
  PRIMARY KEY (`id_prefil`),
  KEY `id_tipo_perfil` (`id_tipo_perfil`),
  CONSTRAINT `perfil_ibfk_1` FOREIGN KEY (`id_tipo_perfil`) REFERENCES `tipo_perfil` (`id_tipo_perfil`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `perfil` */

insert  into `perfil`(`id_prefil`,`usuario`,`fecha`,`id_tipo_perfil`) values 
(1,'@capo','2018-09-17 20:06:18',3),
(2,'@utic','2018-09-18 15:02:25',1),
(3,'blas','2018-11-14 19:30:34',2),
(4,'elfacu','2018-11-20 18:59:51',2),
(5,'sancarlos','2018-11-25 18:19:47',1),
(6,'juanito','2018-11-26 17:56:18',2),
(7,'FacuCeo','2018-11-26 21:36:00',2),
(8,'Fer','2018-11-26 22:33:01',2),
(9,'aaaa','2018-11-27 19:51:01',2),
(10,'guilleramirez','2018-11-27 20:20:35',2),
(11,'sonia','2018-11-27 20:51:14',2),
(12,'blas2','2019-03-18 23:26:02',2),
(13,'juanperez','2019-03-20 16:14:02',2),
(14,'blas3','2019-03-27 17:19:08',2),
(15,'blaszorrilla','2019-03-27 17:49:01',2);

/*Table structure for table `perfil_carrera` */

DROP TABLE IF EXISTS `perfil_carrera`;

CREATE TABLE `perfil_carrera` (
  `id_prefil` int(11) NOT NULL,
  `id_universidad_carrera` int(11) NOT NULL,
  `codigo` text,
  PRIMARY KEY (`id_prefil`,`id_universidad_carrera`),
  KEY `id_universidad_carrera` (`id_universidad_carrera`),
  CONSTRAINT `perfil_carrera_ibfk_1` FOREIGN KEY (`id_prefil`) REFERENCES `perfil` (`id_prefil`),
  CONSTRAINT `perfil_carrera_ibfk_2` FOREIGN KEY (`id_universidad_carrera`) REFERENCES `universidad_carrera` (`id_universidad_carrera`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `perfil_carrera` */

/*Table structure for table `permiso` */

DROP TABLE IF EXISTS `permiso`;

CREATE TABLE `permiso` (
  `id_permiso` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_permiso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `permiso` */

insert  into `permiso`(`id_permiso`,`nombre`) values 
(1,'Publico'),
(2,'Borrador');

/*Table structure for table `posteo` */

DROP TABLE IF EXISTS `posteo`;

CREATE TABLE `posteo` (
  `id_posteo` int(11) NOT NULL,
  `id_temas` int(11) NOT NULL,
  `id_permiso` int(11) NOT NULL,
  `id_prefil` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `titulo` varchar(60) DEFAULT NULL,
  `texto` longtext,
  `estado` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_posteo`),
  KEY `id_prefil` (`id_prefil`),
  KEY `id_temas` (`id_temas`),
  KEY `id_permiso` (`id_permiso`),
  CONSTRAINT `posteo_ibfk_1` FOREIGN KEY (`id_prefil`) REFERENCES `perfil` (`id_prefil`),
  CONSTRAINT `posteo_ibfk_2` FOREIGN KEY (`id_temas`) REFERENCES `temas` (`id_temas`),
  CONSTRAINT `posteo_ibfk_3` FOREIGN KEY (`id_permiso`) REFERENCES `permiso` (`id_permiso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `posteo` */

insert  into `posteo`(`id_posteo`,`id_temas`,`id_permiso`,`id_prefil`,`fecha`,`titulo`,`texto`,`estado`) values 
(1,8,1,1,'2018-11-24 15:55:43','probando, posteo  ','primera prueba...1232','INACTIVO'),
(2,8,1,2,'2019-03-18 18:50:37','CLASES NORMALES','CUANDO HAY CLASES?\'??','INACTIVO'),
(3,1,1,1,'2019-03-26 11:58:11','saludo  ','hola compasssssss','ACTIVO'),
(4,3,1,3,'2019-03-12 16:26:11','Puesta en marcha','Cuando se defiende el trabajo final?','ACTIVO'),
(5,5,1,4,'2019-02-06 16:27:38','Fase preliminar','Informamos que el proyecto rade se encuentra en la fase preliminar de finalizacion','ACTIVO'),
(6,8,1,2,'2019-03-26 16:37:15','Inicio de clases','Inicio de clases de todas las carreras en la sede de Encarnaci&oacute;n, lunes 26 de marzo del 2019','ACTIVO');

/*Table structure for table `posteo_comentario` */

DROP TABLE IF EXISTS `posteo_comentario`;

CREATE TABLE `posteo_comentario` (
  `id_posteo_comentario` int(11) NOT NULL,
  `id_prefil` int(11) NOT NULL,
  `id_posteo` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `texto` text,
  `estado` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_posteo_comentario`),
  KEY `id_prefil` (`id_prefil`),
  KEY `id_posteo` (`id_posteo`),
  CONSTRAINT `posteo_comentario_ibfk_1` FOREIGN KEY (`id_prefil`) REFERENCES `perfil` (`id_prefil`),
  CONSTRAINT `posteo_comentario_ibfk_2` FOREIGN KEY (`id_posteo`) REFERENCES `posteo` (`id_posteo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `posteo_comentario` */

insert  into `posteo_comentario`(`id_posteo_comentario`,`id_prefil`,`id_posteo`,`fecha`,`texto`,`estado`) values 
(1,1,1,'2018-11-24 15:56:00','prueba cometario','INACTIVO'),
(2,1,1,'2018-11-24 20:02:16','s','ACTIVO');

/*Table structure for table `pregunta` */

DROP TABLE IF EXISTS `pregunta`;

CREATE TABLE `pregunta` (
  `id_pregunta` int(11) NOT NULL,
  `titulo` varchar(60) DEFAULT NULL,
  `texto` varchar(200) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  `id_temas` int(11) NOT NULL,
  `id_prefil` int(11) NOT NULL,
  `id_permiso` int(11) NOT NULL,
  PRIMARY KEY (`id_pregunta`),
  KEY `id_prefil` (`id_prefil`),
  KEY `id_temas` (`id_temas`),
  KEY `id_permiso` (`id_permiso`),
  CONSTRAINT `pregunta_ibfk_1` FOREIGN KEY (`id_prefil`) REFERENCES `perfil` (`id_prefil`),
  CONSTRAINT `pregunta_ibfk_2` FOREIGN KEY (`id_temas`) REFERENCES `temas` (`id_temas`),
  CONSTRAINT `pregunta_ibfk_3` FOREIGN KEY (`id_permiso`) REFERENCES `permiso` (`id_permiso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pregunta` */

insert  into `pregunta`(`id_pregunta`,`titulo`,`texto`,`fecha`,`estado`,`id_temas`,`id_prefil`,`id_permiso`) values 
(1,'me leen ? me  ven ?  ','<p>BIENVENIDOS A RADE&nbsp;</p>','2018-11-17 16:16:50','ACTIVO',6,1,1),
(2,'Pregunta 2','<p>Jfkdkkdjf</p>','2018-11-19 21:32:12','ACTIVO',4,1,1),
(3,'RADE ya funciona?','<p>Explique me si ya funciona la plataforma radE</p>','2018-11-19 22:13:40','ACTIVO',2,1,1),
(4,'RADE ya funciona ?      ','<p>publico?<span style=\"text-decoration: underline;\"> siiii&nbsp;</span></p>','2018-11-20 19:05:22','ACTIVO',4,4,1),
(5,'probando    ','<p>es una prueba&nbsp;</p>','2018-11-24 15:20:08','ACTIVO',5,1,1),
(6,'Lunes 26 ','<p>Soy una prueba&nbsp;</p>','2018-11-26 11:32:40','INACTIVO',4,1,1),
(7,'Sslss','<p>Sss</p>','2018-11-26 11:40:45','INACTIVO',4,4,1),
(8,'Lunes','<p>Sss</p>','2018-11-26 11:43:01','ACTIVO',4,1,1),
(9,'Otro','<p>Dds</p>','2018-11-26 11:57:48','ACTIVO',5,1,2),
(10,'Lunes presento ','<p>que presento&nbsp;</p>','2018-11-26 19:43:53','INACTIVO',5,1,2),
(11,'Que preguntas hara usted a su empleador?','<p>??</p>','2018-11-26 21:30:33','ACTIVO',8,1,1),
(12,'ss ','<p>sss</p>','2018-11-26 21:33:22','ACTIVO',4,1,2),
(13,'ASDDAS ','<p>DSDSDS</p>','2018-11-26 21:34:39','INACTIVO',4,2,2),
(14,'pruebaa','<p>SADDSADSADAS</p>','2018-11-27 00:18:42','ACTIVO',1,8,2),
(15,'cual es minimo puntaje para aprobar el modulo ','<p>cuales son los criterios para la aprobacion de un modulo&nbsp;</p>','2018-11-27 20:51:34','ACTIVO',1,1,1),
(16,'Continuando','<p>Rade continua?</p>','2019-03-14 02:35:03','ACTIVO',1,3,1),
(17,'Cantidad de alumnos','<p>Cual es la cantidad de alumnos actuales del tercer a&ntilde;o de la carrera de informatica?</p>','2019-03-26 16:38:01','ACTIVO',1,2,1),
(18,'hola','<p>alguien sabe si hay clases?</p>','2021-09-14 17:34:05','ACTIVO',8,1,1);

/*Table structure for table `puntuacion_posteo` */

DROP TABLE IF EXISTS `puntuacion_posteo`;

CREATE TABLE `puntuacion_posteo` (
  `id_puntuacion_posteo` int(11) NOT NULL,
  `id_prefil` int(11) NOT NULL,
  `id_posteo` int(11) NOT NULL,
  `puntos` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`id_puntuacion_posteo`),
  KEY `id_prefil` (`id_prefil`),
  KEY `id_posteo` (`id_posteo`),
  CONSTRAINT `puntuacion_posteo_ibfk_1` FOREIGN KEY (`id_prefil`) REFERENCES `perfil` (`id_prefil`),
  CONSTRAINT `puntuacion_posteo_ibfk_2` FOREIGN KEY (`id_posteo`) REFERENCES `posteo` (`id_posteo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `puntuacion_posteo` */

insert  into `puntuacion_posteo`(`id_puntuacion_posteo`,`id_prefil`,`id_posteo`,`puntos`,`fecha`) values 
(1,1,1,3,'2018-11-24 19:59:39'),
(2,2,5,1,'2019-03-26 16:36:25');

/*Table structure for table `puntuacion_respuesta` */

DROP TABLE IF EXISTS `puntuacion_respuesta`;

CREATE TABLE `puntuacion_respuesta` (
  `id_puntuacion_respuesta` int(11) NOT NULL,
  `punto_respuesta` varchar(20) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `id_respuesta` int(11) NOT NULL,
  `id_prefil` int(11) NOT NULL,
  PRIMARY KEY (`id_puntuacion_respuesta`),
  KEY `id_prefil` (`id_prefil`),
  KEY `id_respuesta` (`id_respuesta`),
  CONSTRAINT `puntuacion_respuesta_ibfk_1` FOREIGN KEY (`id_prefil`) REFERENCES `perfil` (`id_prefil`),
  CONSTRAINT `puntuacion_respuesta_ibfk_2` FOREIGN KEY (`id_respuesta`) REFERENCES `respuesta` (`id_respuesta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `puntuacion_respuesta` */

insert  into `puntuacion_respuesta`(`id_puntuacion_respuesta`,`punto_respuesta`,`fecha`,`id_respuesta`,`id_prefil`) values 
(1,'5','2018-11-17 16:56:49',1,1),
(2,'4','2018-11-23 01:07:49',3,1),
(3,'5','2018-11-20 18:49:29',3,2),
(4,'5','2018-11-20 18:49:38',3,3),
(5,'5','2018-11-20 18:49:56',6,2),
(6,'5','2018-11-25 17:47:55',3,4),
(7,'5','2018-11-21 12:04:38',8,1),
(8,'5','2018-11-24 15:20:42',11,1),
(9,'5','2018-11-25 16:09:33',12,4),
(10,'1','2018-11-25 17:47:09',9,4),
(11,'5','2018-11-25 20:14:12',13,1),
(12,'4','2018-11-25 22:43:36',14,4),
(13,'5','2018-11-25 22:44:24',1,4),
(14,'4','2018-11-26 11:34:02',15,1),
(15,'5','2018-11-26 11:36:23',15,2),
(16,'1','2018-11-26 11:41:24',24,4),
(17,'5','2018-11-26 11:55:36',25,1),
(18,'1','2018-11-26 19:48:04',9,1),
(19,'4','2018-11-27 19:12:32',25,8),
(20,'1','2018-11-27 20:54:35',31,1);

/*Table structure for table `registro` */

DROP TABLE IF EXISTS `registro`;

CREATE TABLE `registro` (
  `id_registro` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `nombre` text,
  `apellido` text,
  `ci` text,
  `ciudad` text,
  `sexo` varchar(20) DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL,
  `correo` text,
  `estado` varchar(20) DEFAULT NULL,
  `id_universidad_carrera` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_registro`),
  KEY `id_universidad_carrera` (`id_universidad_carrera`),
  CONSTRAINT `registro_ibfk_1` FOREIGN KEY (`id_universidad_carrera`) REFERENCES `universidad_carrera` (`id_universidad_carrera`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `registro` */

insert  into `registro`(`id_registro`,`fecha`,`nombre`,`apellido`,`ci`,`ciudad`,`sexo`,`fecha_nac`,`correo`,`estado`,`id_universidad_carrera`) values 
(1,'2018-09-18 10:16:09','david','portillo','david','ENCARNACION','masculino','2018-09-18','david@gmail.com','ACTIVO',1),
(5,'2018-09-20 16:50:55','Blas','Zorrilla','4492378','ENCARNACION','Masculino','1997-09-15','blassalvador03@gmail.com','ACTIVO',1),
(6,'2018-11-20 18:55:17','Facundo Fabian','Duette','5248926','ENCARNACION','MASCULINO','1997-10-15','facundofabianduette@gmail.com','ACTIVO',14),
(7,'2018-11-20 19:00:20','Fernando ','Ibañez','4650284','ENCARNACION','MASCULINO','1993-04-19','ferchuu10@gmail.com','INACTIVO',1),
(8,'2018-11-20 19:04:11','Yoshio','Suenaga','3845849','ENCARNACION','MASCULINO','1989-12-21','Yoshio.Suenaga21@gmail.com','ACEPTADO',1),
(9,'2018-11-21 10:13:25','Blas','Salvador','4492378','ENCARNACION','MASCULINO','1997-09-15','blassalvador03@gmail.com','ACEPTADO',1),
(10,'2018-11-25 19:44:00','DFASFAS','FASF','234234','FASF','MASCULINO','2018-11-25','ASFAS@gmail.com','INACTIVO',9),
(11,'2018-11-25 19:45:31','Fernando','Ibañez ','4650284','Encarnación ','MASCULINO','1993-04-19','ferchuu10@gmail.com','ACEPTADO',1),
(12,'2018-11-25 20:42:41','asf','asfaf','2342','afaf','MASCULINO','2018-11-25','blassalvador03@gmail.com','ACEPTADO',5),
(13,'2018-11-26 17:55:05','juan ','perez','4492378','encarnacion','MASCULINO','2018-11-26','blassalvador03@gmail.com','ACTIVO',1),
(14,'2018-11-26 18:57:12','Facundo','Duette','12345','Asuncion','MASCULINO','1997-09-15','facundofabianduette@gmail.com','ACTIVO',14),
(15,'2018-11-26 21:38:31','Fernando','Ibañez','4650284','Encarnacion','MASCULINO','1993-04-19','ferchuu10@gmail.com','ACEPTADO',1),
(16,'2018-11-26 22:31:14','Fernando','Ibañez','4650284','Encarnación ','MASCULINO','1993-04-19','ferchuu10@gmail.com','ACTIVO',1),
(17,'2018-11-27 19:44:19','aaa','aaaa','2342','asdfasf','MASCULINO','2018-11-27','blassalvador03@gmail.com','ACTIVO',1),
(18,'2018-11-27 20:02:09','Guillermo','Ramirez','4034067','Encarnacion','MASCULINO','1991-06-25','ramirez_000@hotmail.com','ACTIVO',3),
(19,'2018-11-27 20:16:09','Marlene','Can dia Sosa','12345','Capitan Miranda','FEMENINO','1980-04-14','mcandiasosa@hotmail.com','ACEPTADO',1),
(20,'2018-11-27 20:49:42','Sonia ','Ullon','3571436','Encarnacion','FEMENINO','2018-11-27','soely201@hotmail.com','ACTIVO',7),
(21,'2019-03-14 16:28:21','Blas','Zorrilla','null','null','MASCULINO','1997-09-15','blassalvador03@gmail.com','ACEPTADO',1),
(22,'2019-03-14 16:39:06','dfa','Zorrilla','null','null','MASCULINO','1997-09-15','blassalvador03@gmail.com','ACEPTADO',11),
(23,'2019-03-18 22:23:38','xxxxx','xxxx','444','Encarnacion','MASCULINO','2019-03-28','blassalvador03@gmail.com','ACEPTADO',8),
(24,'2019-03-18 23:05:22','BLAS ','ZORRILLA','4492378','ENC','MASCULINO','2019-03-20','blassalvador03@gmail.com','ACEPTADO',1),
(25,'2019-03-18 23:12:03','blas','zorrilla','4492378','ENC','MASCULINO','2019-03-28','blassalvador03@gmail.com','ACTIVO',1),
(26,'2019-03-20 16:13:18','juan','perez','42','enc','MASCULINO','2019-03-29','blassalvador03@gmail.com','ACTIVO',9),
(27,'2019-03-27 17:06:01','Blas','Zorrilla','4492378','Encarnacion','MASCULINO','1997-09-15','blassalvador03@gmail.com','ACTIVO',1),
(28,'2019-03-27 17:47:42','Blas ','Zorrilla','4492378','Encarnacion','MASCULINO','1997-09-15','blassalvador03@gmail.com','ACTIVO',1),
(29,'2021-09-14 21:20:01','juan','perez','3152356','Encarnacion','MASCULINO','1990-09-14','hola@gmail.com','PENDIENTE',11);

/*Table structure for table `registro_perfil` */

DROP TABLE IF EXISTS `registro_perfil`;

CREATE TABLE `registro_perfil` (
  `id_prefil` int(11) NOT NULL,
  `id_registro` int(11) NOT NULL,
  PRIMARY KEY (`id_prefil`,`id_registro`),
  KEY `id_registro` (`id_registro`),
  CONSTRAINT `registro_perfil_ibfk_1` FOREIGN KEY (`id_registro`) REFERENCES `registro` (`id_registro`),
  CONSTRAINT `registro_perfil_ibfk_2` FOREIGN KEY (`id_prefil`) REFERENCES `perfil` (`id_prefil`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `registro_perfil` */

insert  into `registro_perfil`(`id_prefil`,`id_registro`) values 
(3,5),
(4,6),
(6,13),
(7,14),
(8,16),
(9,17),
(10,18),
(11,20),
(12,25),
(13,26),
(14,27),
(15,28);

/*Table structure for table `respuesta` */

DROP TABLE IF EXISTS `respuesta`;

CREATE TABLE `respuesta` (
  `id_respuesta` int(11) NOT NULL,
  `id_pregunta` int(11) NOT NULL,
  `texto` longtext,
  `estado` varchar(20) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `id_prefil` int(11) NOT NULL,
  PRIMARY KEY (`id_respuesta`),
  KEY `id_prefil` (`id_prefil`),
  KEY `id_pregunta` (`id_pregunta`),
  CONSTRAINT `respuesta_ibfk_1` FOREIGN KEY (`id_prefil`) REFERENCES `perfil` (`id_prefil`),
  CONSTRAINT `respuesta_ibfk_2` FOREIGN KEY (`id_pregunta`) REFERENCES `pregunta` (`id_pregunta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `respuesta` */

insert  into `respuesta`(`id_respuesta`,`id_pregunta`,`texto`,`estado`,`fecha`,`id_prefil`) values 
(1,1,'<p>SI&nbsp;</p>','ACTIVO','2018-11-24 15:17:59',1),
(2,1,'<p>respuesta 2</p>','ACTIVO','2018-11-17 20:37:50',2),
(3,3,'<p>Si funciona voten mi respuesta jeje</p>','ACTIVO','2018-11-19 23:06:35',1),
(4,2,'<p>...</p>','ACTIVO','2018-11-20 10:52:45',1),
(5,2,'<p>??</p>','ACTIVO','2018-11-20 10:52:50',1),
(6,3,'<p>Mbore jeje</p>','INACTIVO','2018-11-20 18:49:09',2),
(7,3,'<p>eka&ntilde;y</p>','ACTIVO','2018-11-20 18:49:49',3),
(8,3,'<p>no sirve para nada, tarda demasiado para el registro,<strong> mierda....!!!!&nbsp;</strong></p>','ACTIVO','2018-11-20 19:00:49',4),
(9,4,'<p>claro&nbsp;</p>','INACTIVO','2018-11-26 19:47:55',1),
(10,1,'<p>sdsadsa</p>','INACTIVO','2018-11-24 15:18:20',1),
(11,5,'<p>respuesta&nbsp;</p>','ACTIVO','2018-11-24 16:13:12',1),
(12,5,'<p>sadasasdassddas</p>','ACTIVO','2018-11-25 16:09:29',4),
(13,5,'<p>Hfjdjs</p>','ACTIVO','2018-11-25 20:14:05',1),
(14,4,'<p>siiiiiiiiiiiiiii</p>','ACTIVO','2018-11-25 22:43:43',4),
(15,6,'<p>Funcioma?</p>','ACTIVO','2018-11-26 11:33:59',1),
(16,6,'<p>Si funciona</p>\n<p>&nbsp;</p>','ACTIVO','2018-11-26 11:36:38',2),
(17,6,'<p>Si</p>','ACTIVO','2018-11-26 11:37:12',2),
(18,2,'<p>No Si</p>','INACTIVO','2018-11-26 11:37:33',2),
(19,5,'<p>Sii</p>','INACTIVO','2018-11-26 11:38:23',2),
(20,5,'<p>Si</p>','INACTIVO','2018-11-26 11:38:47',2),
(21,6,'<p>Si</p>','ACTIVO','2018-11-26 11:39:24',2),
(22,7,'<p>Ssss</p>','ACTIVO','2018-11-26 11:40:53',4),
(23,7,'<p>Sss</p>','ACTIVO','2018-11-26 11:40:57',4),
(24,7,'<p>Sss</p>','ACTIVO','2018-11-26 11:41:30',4),
(25,8,'<p>10 ????</p>','ACTIVO','2018-11-26 11:55:07',1),
(26,8,'<p>2 ??</p>','ACTIVO','2018-11-26 11:55:57',1),
(27,8,'<p>3</p>','ACTIVO','2018-11-26 11:43:56',2),
(28,8,'<p>4</p>','ACTIVO','2018-11-26 11:44:03',2),
(29,8,'<p>??</p>','ACTIVO','2018-11-26 11:54:52',1),
(30,4,'<p>si funciona</p>','ACTIVO','2018-11-27 14:39:18',1),
(31,15,'<p>20 puntos de trabajos practicos 30 puntos de examen parcial&nbsp; y 50 puntos de examen final si&nbsp;</p>','ACTIVO','2018-11-27 20:56:45',1);

/*Table structure for table `rol` */

DROP TABLE IF EXISTS `rol`;

CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `rol` */

insert  into `rol`(`id_rol`,`nombre`,`estado`) values 
(1,'ADMINISTRADOR','ACTIVO'),
(2,'ESTUDIANTE','ACTIVO'),
(3,'INSTITUCION','ACTIVO');

/*Table structure for table `rol_interfaz` */

DROP TABLE IF EXISTS `rol_interfaz`;

CREATE TABLE `rol_interfaz` (
  `id_rol` int(11) NOT NULL,
  `id_interfaz` int(11) NOT NULL,
  PRIMARY KEY (`id_rol`,`id_interfaz`),
  KEY `id_interfaz` (`id_interfaz`),
  CONSTRAINT `rol_interfaz_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`),
  CONSTRAINT `rol_interfaz_ibfk_2` FOREIGN KEY (`id_interfaz`) REFERENCES `interfaz` (`id_interfaz`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `rol_interfaz` */

/*Table structure for table `temas` */

DROP TABLE IF EXISTS `temas`;

CREATE TABLE `temas` (
  `id_temas` int(11) NOT NULL,
  `tema` varchar(100) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_temas`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `temas` */

insert  into `temas`(`id_temas`,`tema`,`estado`) values 
(1,'Informatica','ACTIVO'),
(2,'Derecho y Ciencias Sociales','ACTIVO'),
(3,'Ciencias Contables y Administrativas','ACTIVO'),
(4,'Deportes ','ACTIVO'),
(5,'Eventos Sociales','ACTIVO'),
(6,'Matematicas y Ciencias Exactas','ACTIVO'),
(7,'Medicina y Salud','ACTIVO'),
(8,'Otros','ACTIVO');

/*Table structure for table `tipo` */

DROP TABLE IF EXISTS `tipo`;

CREATE TABLE `tipo` (
  `id_tipo` int(11) NOT NULL,
  `nombre` text,
  PRIMARY KEY (`id_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tipo` */

insert  into `tipo`(`id_tipo`,`nombre`) values 
(1,'CEO'),
(2,'INTITUCION'),
(3,'PERFIL');

/*Table structure for table `tipo_denuncia` */

DROP TABLE IF EXISTS `tipo_denuncia`;

CREATE TABLE `tipo_denuncia` (
  `id_tipo_denuncia` int(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_denuncia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tipo_denuncia` */

/*Table structure for table `tipo_diseno_curri` */

DROP TABLE IF EXISTS `tipo_diseno_curri`;

CREATE TABLE `tipo_diseno_curri` (
  `id_tipo_diseno_curri` int(11) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `color` char(20) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_diseno_curri`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tipo_diseno_curri` */

insert  into `tipo_diseno_curri`(`id_tipo_diseno_curri`,`nombre`,`color`) values 
(1,'curriculum rojo','rojo'),
(2,'curriculum azul','azul');

/*Table structure for table `tipo_institucion` */

DROP TABLE IF EXISTS `tipo_institucion`;

CREATE TABLE `tipo_institucion` (
  `id_tipo_institucion` int(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_institucion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tipo_institucion` */

insert  into `tipo_institucion`(`id_tipo_institucion`,`descripcion`) values 
(1,'SEDE'),
(2,'CAMPUS'),
(3,'MATRIZ');

/*Table structure for table `tipo_perfil` */

DROP TABLE IF EXISTS `tipo_perfil`;

CREATE TABLE `tipo_perfil` (
  `id_tipo_perfil` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_perfil`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tipo_perfil` */

insert  into `tipo_perfil`(`id_tipo_perfil`,`nombre`) values 
(1,'INSTITUCION'),
(2,'ALUMNO'),
(3,'CEO');

/*Table structure for table `universidad_carrera` */

DROP TABLE IF EXISTS `universidad_carrera`;

CREATE TABLE `universidad_carrera` (
  `id_universidad_carrera` int(11) NOT NULL,
  `id_carrera` int(11) NOT NULL,
  `id_institucion` int(11) NOT NULL,
  PRIMARY KEY (`id_universidad_carrera`),
  KEY `id_carrera` (`id_carrera`),
  KEY `id_institucion` (`id_institucion`),
  CONSTRAINT `universidad_carrera_ibfk_1` FOREIGN KEY (`id_carrera`) REFERENCES `carrera` (`id_carrera`),
  CONSTRAINT `universidad_carrera_ibfk_2` FOREIGN KEY (`id_institucion`) REFERENCES `institucion` (`id_institucion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `universidad_carrera` */

insert  into `universidad_carrera`(`id_universidad_carrera`,`id_carrera`,`id_institucion`) values 
(1,2,1),
(2,1,1),
(3,3,1),
(4,4,1),
(5,5,1),
(6,6,1),
(7,7,1),
(8,8,1),
(9,9,1),
(10,10,1),
(11,11,1),
(12,12,1),
(13,13,1),
(14,14,3);

/*Table structure for table `usuario` */

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `usu` text,
  `estado` varchar(20) DEFAULT NULL,
  `tipo` varchar(20) DEFAULT NULL,
  `id_rol` int(11) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `id_rol` (`id_rol`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `usuario` */

insert  into `usuario`(`id_usuario`,`usu`,`estado`,`tipo`,`id_rol`) values 
(1,'capo','ACTIVO','CEO',1),
(2,'UTIC','ACTIVO','INSTITUCION',1),
(3,'blas','ACTIVO','PERFIL',2),
(4,'elfacu','ACTIVO','PERFIL',2),
(5,'sancarlos','ACTIVO','INSTITUCION',3),
(6,'juanito','ACTIVO','PERFIL',2),
(7,'FacuCeo','ACTIVO','PERFIL',2),
(8,'Fer','ACTIVO','PERFIL',2),
(9,'aaaa','ACTIVO','PERFIL',2),
(10,'guilleramirez','ACTIVO','PERFIL',2),
(11,'sonia','ACTIVO','PERFIL',2),
(12,'blas2','ACTIVO','PERFIL',2),
(13,'juanperez','ACTIVO','PERFIL',2),
(14,'blas3','ACTIVO','PERFIL',2),
(15,'blaszorrilla','ACTIVO','PERFIL',2);

/*Table structure for table `usuario_ceo` */

DROP TABLE IF EXISTS `usuario_ceo`;

CREATE TABLE `usuario_ceo` (
  `id_usuario` int(11) NOT NULL,
  `id_ceo` int(11) NOT NULL,
  PRIMARY KEY (`id_usuario`,`id_ceo`),
  KEY `id_ceo` (`id_ceo`),
  CONSTRAINT `usuario_ceo_ibfk_1` FOREIGN KEY (`id_ceo`) REFERENCES `ceo` (`id_ceo`),
  CONSTRAINT `usuario_ceo_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `usuario_ceo` */

insert  into `usuario_ceo`(`id_usuario`,`id_ceo`) values 
(1,1);

/*Table structure for table `usuario_institucion` */

DROP TABLE IF EXISTS `usuario_institucion`;

CREATE TABLE `usuario_institucion` (
  `id_institucion` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_institucion`,`id_usuario`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `usuario_institucion_ibfk_1` FOREIGN KEY (`id_institucion`) REFERENCES `institucion` (`id_institucion`),
  CONSTRAINT `usuario_institucion_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `usuario_institucion` */

insert  into `usuario_institucion`(`id_institucion`,`id_usuario`) values 
(1,2),
(3,5);

/*Table structure for table `usuario_registro` */

DROP TABLE IF EXISTS `usuario_registro`;

CREATE TABLE `usuario_registro` (
  `id_registro` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_registro`,`id_usuario`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `usuario_registro_ibfk_1` FOREIGN KEY (`id_registro`) REFERENCES `registro` (`id_registro`),
  CONSTRAINT `usuario_registro_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `usuario_registro` */

insert  into `usuario_registro`(`id_registro`,`id_usuario`) values 
(5,3),
(6,4),
(13,6),
(14,7),
(16,8),
(17,9),
(18,10),
(20,11),
(25,12),
(26,13),
(27,14),
(28,15);

/* Function  structure for function  `cant_evento_asis` */

/*!50003 DROP FUNCTION IF EXISTS `cant_evento_asis` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `cant_evento_asis`(id INT) RETURNS int(11)
BEGIN
    SET @cant=(SELECT  IFNULL(COUNT(`id_asistencia_evento`),0) FROM `asistencia_evento` WHERE id_evento=id);
    RETURN @cant;
    END */$$
DELIMITER ;

/* Function  structure for function  `caracter_especial` */

/*!50003 DROP FUNCTION IF EXISTS `caracter_especial` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `caracter_especial`(CAMPO varchar(200)) RETURNS varchar(200) CHARSET latin1
BEGIN
SET CAMPO = (SELECT REPLACE(CAMPO,'Á','A'));	
SET CAMPO = (SELECT REPLACE(CAMPO,'É','E'));	
SET CAMPO = (SELECT REPLACE(CAMPO,'Í','I'));	
SET CAMPO = (SELECT REPLACE(CAMPO,'Ó','O'));	
SET CAMPO = (SELECT REPLACE(CAMPO,'Ú','U'));	
SET CAMPO = (SELECT REPLACE(CAMPO,'Ñ','N'));	
SET CAMPO = (SELECT REPLACE(CAMPO,'ã','a'));	
SET CAMPO = (SELECT REPLACE(CAMPO,'ä','a'));	
SET CAMPO = (SELECT REPLACE(CAMPO,'å','a'));	
SET CAMPO = (SELECT REPLACE(CAMPO,'æ','a'));	
SET CAMPO = (SELECT REPLACE(CAMPO,'ç','c'));	
SET CAMPO = (SELECT REPLACE(CAMPO,'è','e'));	
SET CAMPO = (SELECT REPLACE(CAMPO,'é','e'));	
SET CAMPO = (SELECT REPLACE(CAMPO,'ê','e'));	
SET CAMPO = (SELECT REPLACE(CAMPO,'ë','e'));	
SET CAMPO = (SELECT REPLACE(CAMPO,'ì','i'));
SET CAMPO = (SELECT REPLACE(CAMPO,'í','i'));	
SET CAMPO = (SELECT REPLACE(CAMPO,'î','i'));	
SET CAMPO = (SELECT REPLACE(CAMPO,'ï','i'));	
SET CAMPO = (SELECT REPLACE(CAMPO,'ð','o'));	
SET CAMPO = (SELECT REPLACE(CAMPO,'ñ','n'));	
SET CAMPO = (SELECT REPLACE(CAMPO,'ò','o'));	
SET CAMPO = (SELECT REPLACE(CAMPO,'ó','o'));	
SET CAMPO = (SELECT REPLACE(CAMPO,'ô','o'));	
SET CAMPO = (SELECT REPLACE(CAMPO,'õ','o'));	
SET CAMPO = (SELECT REPLACE(CAMPO,'ö','o'));	
SET CAMPO = (SELECT REPLACE(CAMPO,'ø','o'));	
SET CAMPO = (SELECT REPLACE(CAMPO,'ù','u'));	
SET CAMPO = (SELECT REPLACE(CAMPO,'ú','u'));	
SET CAMPO = (SELECT REPLACE(CAMPO,'û','u'));	
SET CAMPO = (SELECT REPLACE(CAMPO,'ý','y'));	
SET CAMPO = (SELECT REPLACE(CAMPO,'ý','y'));	
SET CAMPO = (SELECT REPLACE(CAMPO,'þ','b'));	
SET CAMPO = (SELECT REPLACE(CAMPO,'ÿ','y'));	
SET CAMPO = (SELECT REPLACE(CAMPO,'ƒ','f'));	
SET CAMPO = (SELECT REPLACE(CAMPO,'š','s'));		
SET CAMPO = (SELECT REPLACE(CAMPO,'.',' '));	
SET CAMPO = (SELECT REPLACE(CAMPO,' ','-'));	
SET CAMPO = (SELECT REPLACE(CAMPO,',','-'));
SET CAMPO = (SELECT REPLACE(CAMPO,';','-'));
SET CAMPO = (SELECT REPLACE(CAMPO,'/','-'));
SET CAMPO = (SELECT REPLACE(CAMPO,'´','-'));
SET CAMPO = (SELECT REPLACE(CAMPO,'(','-'));
SET CAMPO = (SELECT REPLACE(CAMPO,')','-'));
SET CAMPO = (SELECT REPLACE(CAMPO,'&','-'));
SET CAMPO = (SELECT REPLACE(CAMPO,'\\','-'));
SET CAMPO = (SELECT REPLACE(CAMPO,'¡','-'));
SET CAMPO = (SELECT REPLACE(CAMPO,'¡','-'));
SET CAMPO = (SELECT REPLACE(CAMPO,'¡','-'));
SET CAMPO = (SELECT REPLACE(CAMPO,'!','-'));
SET CAMPO = (SELECT REPLACE(CAMPO,'#','-'));
SET CAMPO = (SELECT REPLACE(CAMPO,':','-'));
SET CAMPO = (SELECT REPLACE(CAMPO,'$','-'));
SET CAMPO = (SELECT REPLACE(CAMPO,'%','-'));
SET CAMPO = (SELECT REPLACE(CAMPO,'[','-'));
SET CAMPO = (SELECT REPLACE(CAMPO,'*','-'));
SET CAMPO = (SELECT REPLACE(CAMPO,'@','-'));
SET CAMPO = (SELECT REPLACE(CAMPO,'{','-'));
SET CAMPO = (SELECT REPLACE(CAMPO,'}','-'));
SET CAMPO = (SELECT REPLACE(CAMPO,'\'','-'));
return CAMPO;
    END */$$
DELIMITER ;

/* Function  structure for function  `contadorArchivo` */

/*!50003 DROP FUNCTION IF EXISTS `contadorArchivo` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `contadorArchivo`() RETURNS int(11)
BEGIN
	
	SET @valor=(SELECT IFNULL(MAX(`id_curriculum`),0)+1 AS codigo FROM `curriculum`);
	RETURN @valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `contadorAsistenciaevento` */

/*!50003 DROP FUNCTION IF EXISTS `contadorAsistenciaevento` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `contadorAsistenciaevento`() RETURNS int(11)
BEGIN
	SET @valor=(SELECT IFNULL(MAX(id_evento),0)+1 AS codigo FROM evento);
	RETURN @valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `contadorCarrera` */

/*!50003 DROP FUNCTION IF EXISTS `contadorCarrera` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `contadorCarrera`() RETURNS int(11)
BEGIN
	SET @valor=(SELECT IFNULL(MAX(id_carrera),0)+1 AS codigo FROM carrera);
	RETURN @valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `contadorComentario` */

/*!50003 DROP FUNCTION IF EXISTS `contadorComentario` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `contadorComentario`() RETURNS int(11)
BEGIN
	SET @valor=(SELECT IFNULL(MAX(id_posteo_comentario),0)+1 AS codigo FROM posteo_comentario);
	RETURN @valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `contadorEnlace` */

/*!50003 DROP FUNCTION IF EXISTS `contadorEnlace` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `contadorEnlace`() RETURNS int(11)
BEGIN
	SET @valor=(SELECT IFNULL(MAX(id_enlacesistema),0)+1 AS codigo FROM enlacesistema);
	RETURN @valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `contadorenlacesistema` */

/*!50003 DROP FUNCTION IF EXISTS `contadorenlacesistema` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `contadorenlacesistema`() RETURNS int(11)
BEGIN
	SET @valor=(SELECT IFNULL(MAX(id_enlacesistema),0)+1 AS codigo FROM enlacesistema);
	RETURN @valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `contadorevento` */

/*!50003 DROP FUNCTION IF EXISTS `contadorevento` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `contadorevento`() RETURNS int(11)
BEGIN
	SET @valor=(SELECT IFNULL(MAX(id_evento),0)+1 AS codigo FROM evento);
	RETURN @valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `contadorInstitucion` */

/*!50003 DROP FUNCTION IF EXISTS `contadorInstitucion` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `contadorInstitucion`() RETURNS int(11)
BEGIN
	SET @valor=(SELECT IFNULL(MAX(id_institucion),0)+1 AS codigo FROM institucion);
	RETURN @valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `contadorMemo` */

/*!50003 DROP FUNCTION IF EXISTS `contadorMemo` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `contadorMemo`() RETURNS int(11)
BEGIN
	SET @valor=(SELECT IFNULL(MAX(`id_memo`),0)+1 AS codigo FROM `memo`);
	RETURN @valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `contadorPass` */

/*!50003 DROP FUNCTION IF EXISTS `contadorPass` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `contadorPass`() RETURNS int(11)
BEGIN
	SET @valor=(SELECT IFNULL(MAX(id_pass),0)+1 AS codigo FROM pass);
	RETURN @valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `contadorPassEnlace` */

/*!50003 DROP FUNCTION IF EXISTS `contadorPassEnlace` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `contadorPassEnlace`() RETURNS int(11)
BEGIN
	SET @valor=(SELECT IFNULL(MAX(id_pass_enlace),0)+1 AS codigo FROM pass_enlace);
	RETURN @valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `contadorPerfil` */

/*!50003 DROP FUNCTION IF EXISTS `contadorPerfil` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `contadorPerfil`() RETURNS int(11)
BEGIN
	SET @valor=(SELECT IFNULL(MAX(id_prefil),0)+1 AS codigo FROM perfil);
	RETURN @valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `contadorPosteo` */

/*!50003 DROP FUNCTION IF EXISTS `contadorPosteo` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `contadorPosteo`() RETURNS int(11)
BEGIN
	SET @valor=(SELECT IFNULL(MAX(id_posteo),0)+1 AS codigo FROM posteo);
	RETURN @valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `contadorPregunta` */

/*!50003 DROP FUNCTION IF EXISTS `contadorPregunta` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `contadorPregunta`() RETURNS int(11)
BEGIN
	SET @valor=(SELECT IFNULL(MAX(id_pregunta),0)+1 AS codigo FROM pregunta);
	RETURN @valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `contadorPuntuacion` */

/*!50003 DROP FUNCTION IF EXISTS `contadorPuntuacion` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `contadorPuntuacion`() RETURNS int(11)
BEGIN
	SET @valor=(SELECT IFNULL(MAX(id_puntuacion_respuesta),0)+1 AS codigo FROM puntuacion_respuesta);
	RETURN @valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `contadorRegistro` */

/*!50003 DROP FUNCTION IF EXISTS `contadorRegistro` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `contadorRegistro`() RETURNS int(11)
BEGIN
	SET @valor=(SELECT IFNULL(MAX(id_registro),0)+1 AS codigo FROM registro);
	RETURN @valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `contadorRespuesta` */

/*!50003 DROP FUNCTION IF EXISTS `contadorRespuesta` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `contadorRespuesta`() RETURNS int(11)
BEGIN
	SET @valor=(SELECT IFNULL(MAX(id_respuesta),0)+1 AS codigo FROM respuesta);
	RETURN @valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `contadorUnivCarrera` */

/*!50003 DROP FUNCTION IF EXISTS `contadorUnivCarrera` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `contadorUnivCarrera`() RETURNS int(11)
BEGIN
    SET @valor=(SELECT IFNULL(MAX(id_universidad_carrera),0)+1 AS codigo FROM universidad_carrera);
   RETURN @valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `contadorUsuario` */

/*!50003 DROP FUNCTION IF EXISTS `contadorUsuario` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `contadorUsuario`() RETURNS int(11)
BEGIN
	SET @valor=(SELECT IFNULL(MAX(id_usuario),0)+1 AS codigo FROM usuario);
	RETURN @valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `contador_puntaje_posteo` */

/*!50003 DROP FUNCTION IF EXISTS `contador_puntaje_posteo` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `contador_puntaje_posteo`() RETURNS int(11)
BEGIN
    set @v=(SELECT IFNULL(MAX(`id_puntuacion_posteo`),0) +1 FROM `puntuacion_posteo`);
	RETURN @v;
    END */$$
DELIMITER ;

/* Function  structure for function  `contado_asistenciaevento` */

/*!50003 DROP FUNCTION IF EXISTS `contado_asistenciaevento` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `contado_asistenciaevento`() RETURNS int(11)
BEGIN
	SET @valor=(SELECT IFNULL(MAX(id_asistencia_evento),0)+1 AS codigo FROM asistencia_evento);
	RETURN @valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `posteo_puntaje` */

/*!50003 DROP FUNCTION IF EXISTS `posteo_puntaje` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `posteo_puntaje`(id int) RETURNS int(11)
BEGIN
    set @valor=(SELECT IFNULL(SUM(`puntos`),0) FROM `puntuacion_posteo` WHERE `id_posteo`=id);
	return @valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `puntuacionRespuesta` */

/*!50003 DROP FUNCTION IF EXISTS `puntuacionRespuesta` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `puntuacionRespuesta`(respuesta int,prefil int) RETURNS int(11)
BEGIN
	SET @valor=(SELECT id_puntuacion_respuesta FROM puntuacion_respuesta WHERE id_respuesta=respuesta AND id_prefil=prefil);
	RETURN @valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `verificaCorreo` */

/*!50003 DROP FUNCTION IF EXISTS `verificaCorreo` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `verificaCorreo`(correo1 VARCHAR(100),URL1 TEXT) RETURNS varchar(2) CHARSET latin1
BEGIN
	SET @registro = (SELECT id_registro FROM registro WHERE estado='ACTIVO' AND correo=correo1 LIMIT 1);
	SET @institucion = (SELECT id_institucion FROM institucion WHERE estado='ACTIVO' AND email=correo1 LIMIT 1);
	SET @ceo = (SELECT id_ceo FROM ceo WHERE estado='ACTIVO' AND email=correo1 LIMIT 1);
	SET @valor = "NO";
	IF(@registro > 0)THEN
		SET @existe= (verificaCorreoRegistro(correo1));
		IF(@existe > 0)THEN	/* VERIFICA SI EXISTE UN ENLACE DE REESTABLECER PASS ACTIVO, APARTIR DEL ESTADO DEL PASS*/
			SET @idenlacesis = (contadorenlacesistema());
			INSERT INTO enlacesistema(id_enlacesistema,id_tipo,nombre,url,direccion,estado) VALUES(@idenlacesis,1,'RESTABLECER',URL1,'views/pagina/restablecer_pass/nuevo_pass.jsp','ACTIVO');
			SET @idvalor = (SELECT usuario_registro.id_usuario FROM  registro INNER JOIN usuario_registro ON usuario_registro.`id_registro`=registro.`id_registro` WHERE registro.correo=correo1 LIMIT 1);
			SET @idpass = (SELECT IFNULL(MAX(id_pass),0) FROM pass WHERE id_usuario=@idvalor AND estado='ACTIVO');	/* OBTENGO EL ID DEL PASS ACTIVO PARA VINCULAR CON ENLACESISTEMA Y REALIZAR EL CONTEO DE REENVIO DE CORREO*/
				IF(@idpass>0) THEN 
				INSERT INTO pass_enlace(id_pass_enlace,id_enlacesistema,id_pass,estado,conteo) VALUES(contadorPassEnlace(),@idenlacesis,@idpass,'ACTIVO',1);
				END IF;
			
			UPDATE pass SET estado='INACTIVO' WHERE id_usuario=@idvalor;
			SET @valor = "SI";
		END IF;
	ELSEIF(@institucion > 0)THEN
		INSERT INTO enlacesistema(id_enlacesistema,id_tipo,nombre,url,direccion,estado) VALUES(contadorenlacesistema(),1,'RESTABLECER',URL1,'views/pagina/restablecer_pass/nuevo_pass.jsp','ACTIVO');
		SET @valor = "SI";
	ELSEIF(@ceo > 0)THEN
		INSERT INTO enlacesistema(id_enlacesistema,id_tipo,nombre,url,direccion,estado) VALUES(contadorenlacesistema(),1,'RESTABLECER',URL1,'views/pagina/restablecer_pass/nuevo_pass.jsp','ACTIVO');
		SET @valor = "SI";
	END IF;
	RETURN @valor ;
    END */$$
DELIMITER ;

/* Function  structure for function  `verificaCorreoRegistro` */

/*!50003 DROP FUNCTION IF EXISTS `verificaCorreoRegistro` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `verificaCorreoRegistro`(correo1 text) RETURNS int(11)
BEGIN
	set @valor11 = (SELECT COUNT(1) AS total FROM pass 
	INNER JOIN usuario ON usuario.id_usuario=pass.id_usuario 
	INNER JOIN usuario_registro ON usuario_registro.`id_usuario`=usuario.id_usuario
	INNER JOIN registro ON registro.id_registro=usuario_registro.`id_registro`
	WHERE registro.estado='ACTIVO' AND correo=correo1 AND pass.estado='ACTIVO');
	return @valor11;
    END */$$
DELIMITER ;

/* Function  structure for function  `verificapass` */

/*!50003 DROP FUNCTION IF EXISTS `verificapass` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `verificapass`(usuario INT,pass TEXT) RETURNS varchar(2) CHARSET latin1
BEGIN
	SET @valor=(SELECT COUNT(1) FROM pass WHERE estado='ACTIVO' AND passdatos=pass AND id_usuario=usuario);
	SET @dato="";
	IF(@valor>0)THEN
		SET @dato="SI";
	ELSE
		SET @dato="NO";
	END IF;
	RETURN @dato;
    END */$$
DELIMITER ;

/* Function  structure for function  `verificaPassRegistro` */

/*!50003 DROP FUNCTION IF EXISTS `verificaPassRegistro` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `verificaPassRegistro`(correo1 text) RETURNS varchar(250) CHARSET latin1
BEGIN
	SET @yx = "NO"; 
	SET @x1 =ifnull((SELECT pass.id_pass FROM pass 
	INNER JOIN usuario ON usuario.id_usuario=pass.id_usuario
	INNER JOIN usuario_registro ON usuario_registro.id_usuario=usuario.id_usuario
	INNER JOIN registro ON registro.id_registro=usuario_registro.id_registro
	WHERE registro.correo=correo1 AND registro.estado='ACTIVO' AND usuario.estado='ACTIVO' ORDER BY pass.id_pass DESC LIMIT 1),0);
	SET @x2 = IFNULL((SELECT conteo FROM pass_enlace WHERE id_pass=@x1 AND estado='ACTIVO'),0);
	IF(@x2>0 AND @x2<3)THEN
		
		set @xy1 = (SELECT id_pass_enlace FROM pass_enlace WHERE id_pass=@x1 AND estado='ACTIVO');
		SET @yx=(SELECT enlacesistema.url FROM enlacesistema INNER JOIN pass_enlace ON pass_enlace.`id_enlacesistema`=enlacesistema.`id_enlacesistema` WHERE pass_enlace.`id_pass_enlace`=@xy1);
		set @resulx1 = @x2+1;
		update pass_enlace set conteo=@resulx1 where id_pass_enlace=@xy1;
	END IF;
	RETURN @yx;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `abmArchivo` */

/*!50003 DROP PROCEDURE IF EXISTS  `abmArchivo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `abmArchivo`(codigo int(11), nombre longtext, info_academica LONGTEXT, info_experiencia LONGTEXT, info_idioma LONGTEXT, refe_laboral LONGTEXT, refe_personal LONGTEXT, conocimientos LONGTEXT, foto text, id_perfil int(11), id_tipo_diseno int(11), apellido LONGTEXT, direccion LONGTEXT, telefono LONGTEXT, cedula LONGTEXT, fecha_nac date, estado varchar(20) ,tipo varchar(1))
BEGIN
	IF(tipo="A")THEN
			SET @valorcurriculum=(SELECT contadorArchivo());
			INSERT INTO `curriculum`(`id_curriculum`,`nombre`,`info_academica`,`info_experiencia`,`info_idioma`,`refe_laboral`,`refe_personal`,`conocimientos`,`foto`,`id_prefil`,`id_tipo_diseno_curri`,`apellido`,`direccion`,`telefono`,`cedula`,`fecha_nac`,`estado`)
			 VALUES(@valorcurriculum,nombre,info_academica,info_experiencia,info_idioma,refe_laboral,refe_personal,conocimientos,foto,id_perfil,id_tipo_diseno,apellido,direccion,telefono,cedula,fecha_nac,estado);	
		ELSEIF (tipo='M') THEN 
			UPDATE  `curriculum` SET `nombre`=nombre,`info_academica`=info_academica,`info_experiencia`=info_experiencia,`info_idioma`=info_idioma,`refe_laboral`=refe_laboral,`refe_personal`=refe_personal,`conocimientos`=conocimientos,`foto`=foto,`apellido`=apellido,`direccion`=direccion,`telefono`=telefono,`cedula`=cedula,`fecha_nac`=fecha_nac WHERE `id_curriculum`=codigo;
	        ELSEIF (tipo='B') THEN 
			UPDATE  `curriculum` SET `estado`=estado WHERE `id_curriculum`=codigo;
		END IF;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `abmAsistenciaevento` */

/*!50003 DROP PROCEDURE IF EXISTS  `abmAsistenciaevento` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `abmAsistenciaevento`(tipo VARCHAR(1),codigo INT,id_prefil INT,id_evento INT )
BEGIN
		IF(tipo='A')THEN
			SET @valorAsistenciaevento=(SELECT contado_asistenciaevento());
			INSERT INTO `asistencia_evento`(id_asistencia_evento,id_evento,id_prefil) 
			VALUES(@valorAsistenciaevento,id_evento,id_prefil);	
			END IF;
		
	        
	END */$$
DELIMITER ;

/* Procedure structure for procedure `abmCarrera` */

/*!50003 DROP PROCEDURE IF EXISTS  `abmCarrera` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `abmCarrera`(tipo VARCHAR(1), tipo_acceso VARCHAR(15), id_institucion INT, nombre TEXT)
BEGIN
	SET @valor=(contadorCarrera());
	SET @valCarr=(contadorUnivCarrera());
	IF(tipo_acceso="CEO")THEN
	IF(tipo="A")THEN
	INSERT INTO carrera(id_carrera,nombre) VALUES (@valor,nombre);
	INSERT INTO universidad_carrera(id_universidad_carrera,id_carrera,id_institucion) VALUES (@valCarr,@valor,id_institucion);
	END IF;
	END IF;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `abmceodatos` */

/*!50003 DROP PROCEDURE IF EXISTS  `abmceodatos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `abmceodatos`(tipo VARCHAR(1),tipo_acceso VARCHAR(15),codigo INT,nombre1 TEXT,apellido1 TEXT,direccion1 TEXT,telefono1 VARCHAR(20),pagina1 TEXT)
BEGIN
	/*set @cod = (verifcaperfilcodigo(tipo_acceso,codigo)); */
	IF(tipo_acceso="CEO")THEN	/*ingresa cuando se va ha manipular datos del perfil del usuario*/
		IF(tipo="M")THEN /*ingresa cuando se va a modificar datos del perfil*/
			UPDATE ceo SET nombre=nombre1,apellido=apellido1,direccion=direccion1,telefono=telefono1,pagina=pagina1 WHERE id_ceo=codigo;
		END IF;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `abmComentario` */

/*!50003 DROP PROCEDURE IF EXISTS  `abmComentario` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `abmComentario`(tipo VARCHAR(1),codigo INT,id_prefil INT,id_posteo INT,fecha DATE,texto TEXT,punto INT,estado VARCHAR (20))
BEGIN
		IF(tipo="A")THEN
			SET @valorcomentario=(contadorComentario());
			INSERT INTO posteo_comentario(id_posteo_comentario,id_prefil,id_posteo,fecha,texto,estado) VALUES(@valorcomentario,id_prefil,id_posteo,NOW(),texto,estado);	
		ELSEIF (tipo='M') THEN 
			UPDATE  posteo_comentario SET fecha=NOW(),texto=texto WHERE id_posteo_comentario=codigo;
	        ELSEIF (tipo='B') THEN 
			UPDATE  posteo_comentario SET estado=estado WHERE id_posteo_comentario=codigo;
		END IF;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `abmComentarioEvento` */

/*!50003 DROP PROCEDURE IF EXISTS  `abmComentarioEvento` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `abmComentarioEvento`(tipo VARCHAR(1),codigo INT,id_prefil INT,id_evento INT,fecha DATE,texto TEXT,estado VARCHAR (20))
BEGIN
		IF(tipo="A")THEN
			SET @valorcomentario=(contadorComentarioEvento());
			INSERT INTO evento_comentario(id_evento_comentario,id_prefil,id_evento,fecha,texto,estado) VALUES(@valorcomentario,id_prefil,id_evento,NOW(),texto,estado);	
		ELSEIF (tipo='M') THEN 
			UPDATE  evento_comentario SET fecha=NOW(),texto=texto WHERE id_evento_comentario=codigo;
	        ELSEIF (tipo='B') THEN 
			UPDATE  evento_comentario SET estado=estado WHERE id_evento_comentario=codigo;
		END IF;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `abmevento` */

/*!50003 DROP PROCEDURE IF EXISTS  `abmevento` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `abmevento`(tipo VARCHAR(1),codigo INT, id_permiso INT,fecha DATETIME,titulo TEXT,contenido TEXT,ubicacion LONGTEXT,estado VARCHAR(20),id_perfil INT)
BEGIN
		IF(tipo="A")THEN
			SET @id_evento=`contadorevento`();
			SET @id_enlace=`contadorEnlacesistema`();
			INSERT INTO evento(id_evento,id_permiso,fecha,titulo,contenido,ubicacion,estado,id_prefil) 
			VALUES(@id_evento,id_permiso,fecha,titulo,contenido,ubicacion,estado,id_perfil);
			SET @enl=(SELECT CONCAT('/rade/evento/',REPLACE(titulo,' ','-'))AS reem);
			INSERT INTO enlacesistema(id_enlacesistema, id_tipo, nombre, url, direccion, estado)
			VALUES (@id_enlace, 1, 'EVENTO', @enl, 'views/pagina/evento/eventover.jsp','ACTIVO');
			INSERT INTO enlace_evento(id_enlacesistema, id_evento) VALUES (@id_enlace, @id_evento);
		END IF;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `abmInstitucion` */

/*!50003 DROP PROCEDURE IF EXISTS  `abmInstitucion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `abmInstitucion`(tipo VARCHAR(1), tipo_acceso VARCHAR(15), id_institucion INT, id_ceo INT,nombre VARCHAR(100), ciudad1 TEXT, direccion TEXT, telefono VARCHAR(20), correo TEXT, usuario TEXT, pass TEXT, tipo_institucion INT,estado VARCHAR(20))
BEGIN
	SET @valor=(contadorInstitucion());
	SET @valorUsuario=(contadorUsuario());
	SET @valorPass=(contadorPass());
	SET @valorEnl=(contadorenlacesistema());
	SET @valorPer=(contadorPerfil());
	IF(tipo_acceso="CEO")THEN
		IF(tipo="A")THEN
	
	INSERT INTO institucion (id_institucion,id_ceo,fecha,nombre,ciudad,direccion,telefono,ubicacion,email,estado,id_tipo_institucion) VALUES(contadorInstitucion(),1,NOW(),nombre,ciudad1,direccion,telefono,'',correo,estado,tipo_institucion);
	INSERT INTO usuario(id_usuario,usu,estado,tipo,id_rol) VALUES(@valorUsuario,usuario,'ACTIVO','INSTITUCION',3);
	INSERT INTO pass(id_pass,id_usuario,fecha,passdatos,estado) VALUES(@valorPass,@valorUsuario,NOW(),pass,'ACTIVO');
	INSERT INTO enlacesistema(id_enlacesistema,id_tipo,nombre,url,direccion,estado) VALUES (@valorEnl,2,'INSTITUCION',CONCAT('/rade/',usuario),'views/pagina/perfil/perfil.jsp','ACTIVO');
	INSERT INTO enlace_institucion(id_enlacesistema,id_institucion) VALUES (@valorEnl, @valor);
	INSERT INTO perfil(id_prefil,usuario,fecha,id_tipo_perfil) VALUES (@valorPer,usuario,NOW(),1);
	INSERT INTO institucion_perfil(id_institucion,id_prefil) VALUES (@valor,@valorPer);
	INSERT INTO usuario_institucion(id_institucion,id_usuario) VALUES(@valor,@valorUsuario);
	
		END IF;
	END IF;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `abminstituciondatos` */

/*!50003 DROP PROCEDURE IF EXISTS  `abminstituciondatos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `abminstituciondatos`(tipo VARCHAR(1),tipo_acceso VARCHAR(15),codigo INT,nombre1 TEXT,direccion1 TEXT,telefono1 VARCHAR(20))
BEGIN
	/*set @cod = (verifcaperfilcodigo(tipo_acceso,codigo)); */
	IF(tipo_acceso="INSTITUCION")THEN	/*ingresa cuando se va ha manipular datos del perfil del usuario*/
		IF(tipo="M")THEN /*ingresa cuando se va a modificar datos del perfil*/
			UPDATE institucion SET nombre=nombre1,direccion=direccion1,telefono=telefono1 WHERE id_institucion=codigo;
		END IF;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `abmMemo` */

/*!50003 DROP PROCEDURE IF EXISTS  `abmMemo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `abmMemo`(codigo int(11), id_perfil int(11), para longtext, de LONGTEXT, cargo LONGTEXT, fecha date, asunto LONGTEXT, nombre_empresa LONGTEXT, texto LONGTEXT, estado varchar(20), tipo varchar(1))
BEGIN
		IF(tipo="A")THEN
			SET @valormemo=(SELECT contadorMemo());
			INSERT INTO memo (`id_memo`,`id_prefil`,`para`,`de`,`cargo`,`fecha`,`asunto`,`nombre_empresa`,`texto`,`estado`)
			 VALUES(@valormemo, id_perfil, para, de, cargo, fecha, asunto, nombre_empresa, texto, estado);	
		ELSEIF (tipo='M') THEN 
			UPDATE  `memo` SET `para`=para,`de`=ide,`cargo`=cargo,`fecha`=fecha,`asunto`=asunto,`nombre_empresa`=nombre_empresa,`texto`=texto WHERE `id_memo`=codigo;
	        ELSEIF (tipo='B') THEN 
			UPDATE  `memo` SET `estado`=estado WHERE `id_memo`=codigo;
		END IF;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `abmperfildatos` */

/*!50003 DROP PROCEDURE IF EXISTS  `abmperfildatos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `abmperfildatos`(tipo VARCHAR(1),tipo_acceso VARCHAR(15),codigo INT,nombre1 TEXT,apellido1 TEXT,sexo1 VARCHAR(20),institucion1 INT)
BEGIN
	/*set @cod = (verifcaperfilcodigo(tipo_acceso,codigo)); */
	IF(tipo_acceso="PERFIL")THEN	/*ingresa cuando se va ha manipular datos del perfil del usuario*/
		IF(tipo="M")THEN /*ingresa cuando se va a modificar datos del perfil*/
			UPDATE registro 
			SET nombre=nombre1,apellido=apellido1,sexo=sexo1,id_universidad_carrera=institucion1 
			WHERE id_registro=codigo;
		END IF;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `abmPosteo` */

/*!50003 DROP PROCEDURE IF EXISTS  `abmPosteo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `abmPosteo`(tipo VARCHAR(1),codigo INT,id_temas INT,id_permiso INT,id_prefil INT ,fecha DATE,titulo VARCHAR(60),texto LONGTEXT,punto INT,estado VARCHAR (20))
BEGIN
		IF(tipo="A")THEN
			SET @valorposteo=(contadorPosteo());
			SET @valorenlace=(contadorEnlace());
			INSERT INTO posteo(id_posteo,id_temas,id_permiso,id_prefil,fecha,titulo,texto,estado) 
			VALUES(@valorposteo,id_temas,id_permiso,id_prefil,NOW(),titulo,texto,estado);
			SET @enl=(SELECT CONCAT('/rade/posteo/',caracter_especial(titulo))AS reem);
			INSERT INTO enlacesistema(id_enlacesistema, id_tipo, nombre, url, direccion, estado)
			VALUES (@valorenlace, 1, 'Posteos', @enl, 'views/pagina/posteo/posteo_comentario.jsp','ACTIVO');
			INSERT INTO enlace_posteo(id_enlacesistema, id_posteo) VALUES (@valorenlace, @valorposteo);
		ELSEIF (tipo='M') THEN 
			UPDATE  `posteo` SET id_temas=id_temas,id_permiso=id_permiso,titulo=titulo,texto=texto WHERE `id_posteo`=codigo;
			
			
			SET @val1=(SELECT id_enlacesistema FROM `enlace_posteo` WHERE `id_posteo`=codigo);
			
			SET @val2=(SELECT CONCAT('/rade/posteo/',caracter_especial(titulo))AS reem);
			
			UPDATE enlacesistema SET url=@val2 WHERE id_enlacesistema=@val1;
			
		ELSEIF (tipo='B') THEN 
			UPDATE  posteo SET estado=estado WHERE id_posteo=codigo;
		END IF;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `abmPregunta` */

/*!50003 DROP PROCEDURE IF EXISTS  `abmPregunta` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `abmPregunta`(tipo VARCHAR(1),codigo INT,id_temas INT,id_permiso INT,id_prefil INT ,fecha DATE,titulo VARCHAR(60),texto LONGTEXT,estado VARCHAR (20))
BEGIN
		IF(tipo="A")THEN
			SET @valorpregunta=(contadorPregunta());
			SET @valorenlace=(contadorEnlace());
			INSERT INTO pregunta(id_pregunta,id_temas,id_permiso,id_prefil,fecha,titulo,texto,estado) VALUES(@valorpregunta,id_temas,id_permiso,id_prefil,NOW(),titulo,texto,estado);
			SET @enl=(SELECT CONCAT('/rade/pregunta/',REPLACE(REPLACE(titulo,' ','-'),'?','-'))AS reem);
			INSERT INTO enlacesistema(id_enlacesistema, id_tipo, nombre, url, direccion, estado)
			VALUES (@valorenlace, 1, 'Pregunta', @enl, 'views/pagina/pregunta/pregunta_ver.jsp','ACTIVO');
			INSERT INTO enlace_pregunta(id_enlacesistema, id_pregunta) VALUES (@valorenlace, @valorpregunta);
		ELSEIF (tipo='M') THEN 
			UPDATE  pregunta SET id_temas=id_temas,id_permiso=id_permiso,titulo=titulo,texto=texto WHERE id_pregunta=codigo;
			set @val1=(SELECT id_enlacesistema FROM enlace_pregunta WHERE id_pregunta=codigo);
			set @val2=(SELECT CONCAT('/rade/pregunta/',REPLACE(REPLACE(titulo,' ','-'),'?','-'))AS reem);
			UPDATE enlacesistema SET url=@val2 WHERE id_enlacesistema=@val1;
		ELSEIF (tipo='B') THEN 
			UPDATE  pregunta SET estado=estado WHERE id_pregunta=codigo;
		END IF;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `abmPuntuacion` */

/*!50003 DROP PROCEDURE IF EXISTS  `abmPuntuacion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `abmPuntuacion`(punto varchar(20),id_respuesta int,id_prefil int)
BEGIN
		SET @existe=(puntuacionRespuesta(id_respuesta,id_prefil));
		SET @valorpuntuacion=(contadorPuntuacion());
		IF(@existe is null)THEN
			
INSERT INTO puntuacion_respuesta (id_puntuacion_respuesta,punto_respuesta,fecha,id_respuesta,id_prefil) VALUES (@valorpuntuacion,punto,NOW(),id_respuesta,id_prefil);	
			
		ELSEIF (@existe is not null) THEN 
			UPDATE  puntuacion_respuesta SET punto_respuesta=punto,fecha=now() WHERE id_puntuacion_respuesta=@existe;
		END IF;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `abmRegistro` */

/*!50003 DROP PROCEDURE IF EXISTS  `abmRegistro` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `abmRegistro`(tipo VARCHAR(1),codigo INT,universidad INT,nombre TEXT,apellido TEXT,ci TEXT, ciudad TEXT, sexo TEXT,fecha DATE,correo TEXT,estado VARCHAR(20))
BEGIN
IF(tipo="A")THEN
	SET @valorregistro=(contadorregistro());
	INSERT INTO registro(id_registro,id_universidad_carrera,fecha,nombre,apellido,ci,ciudad,sexo,fecha_nac,correo,estado) VALUES(contadorRegistro(),universidad,NOW(),nombre,apellido,ci,ciudad,sexo,fecha,correo,estado);
END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `abmRespuesta` */

/*!50003 DROP PROCEDURE IF EXISTS  `abmRespuesta` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `abmRespuesta`(tipo VARCHAR(1),codigo INT,id_prefil INT,id_pregunta INT,fecha DATE,texto longTEXT,estado VARCHAR (20))
BEGIN
		IF(tipo="A")THEN
			SET @valorrespuesta=(contadorRespuesta());
			INSERT INTO respuesta(id_respuesta,id_prefil,id_pregunta,fecha,texto,estado) VALUES(@valorrespuesta,id_prefil,id_pregunta,NOW(),texto,estado);	
		ELSEIF (tipo='M') THEN 
			UPDATE  respuesta SET fecha=NOW(),texto=texto WHERE id_respuesta=codigo;
	        ELSEIF (tipo='B') THEN 
			UPDATE  respuesta SET estado='INACTIVO' WHERE id_respuesta=codigo;
		END IF;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `abmValidarusuario` */

/*!50003 DROP PROCEDURE IF EXISTS  `abmValidarusuario` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `abmValidarusuario`(tip VARCHAR(1), codigo INT, usuario TEXT,estado TEXT, tipo TEXT, id_rol INT, pass TEXT )
BEGIN
	SET @datos = contadorUsuario();
	SET @valorpass=(contadorpass());
	SET @valorperfil=(contadorPerfil());
	SET @valorenlacesistema=(contadorenlacesistema());
	SET @valorEnlaceUrl=(SELECT IFNULL (`id_enlacesistema`,0) FROM `enlace_registro` WHERE `id_registro`=codigo);
	IF(tip="A")THEN
		INSERT INTO usuario(id_usuario,usu,estado,tipo,id_rol) VALUES (contadorUsuario(),usuario,'ACTIVO','PERFIL',2);
		INSERT INTO pass(id_pass,id_usuario,fecha,passdatos,estado) VALUES (@valorpass,@datos,NOW(),pass,'ACTIVO');
		INSERT INTO usuario_registro (id_registro, id_usuario) VALUES (codigo,@datos);
		INSERT INTO perfil (id_prefil,usuario,fecha,id_tipo_perfil) VALUES (@valorperfil,usuario,NOW(),2); 
		INSERT INTO registro_perfil (id_prefil,id_registro) VALUES (@valorperfil,codigo);
		UPDATE registro SET estado='ACTIVO' WHERE id_registro=codigo;
		INSERT INTO `enlacesistema`(`id_enlacesistema`,id_tipo,nombre,url,direccion,estado) VALUES (@valorenlacesistema,3,'PERFIL',CONCAT('/rade/',usuario),'views/pagina/perfil/perfil.jsp','ACTIVO');
		UPDATE enlacesistema SET estado='INACTIVO' WHERE id_enlacesistema=@valorEnlaceUrl;
		
	END IF; 
	END */$$
DELIMITER ;

/* Procedure structure for procedure `cambiarPass` */

/*!50003 DROP PROCEDURE IF EXISTS  `cambiarPass` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `cambiarPass`(tipo varchar(1), id_pass int, id_usuario int, fecha date, passdatos text, estado text)
BEGIN
	SET @valorpass=(contadorpass());
	SET @valorenlacesis=(contadorenlacesistema());
	SET @idvalor = (SELECT usuario_registro.id_usuario FROM  registro INNER JOIN usuario_registro ON usuario_registro.`id_registro`=registro.`id_registro` LIMIT 1);
	SET @valorEnlaceUrl=(SELECT e.id_enlacesistema FROM enlacesistema AS e INNER JOIN pass_enlace ON e.`id_enlacesistema`=pass_enlace.`id_enlacesistema` LIMIT 1);	
	IF(tipo="M")THEN
		INSERT INTO pass(id_pass,id_usuario,fecha,passdatos,estado) values (@valorpass,@idvalor,now(),passdatos,'ACTIVO');
		UPDATE enlacesistema SET estado="INACTIVO" WHERE id_enlacesistema=@valorEnlaceUrl;
	end if;
	
	END */$$
DELIMITER ;

/* Procedure structure for procedure `Filtro_perfil` */

/*!50003 DROP PROCEDURE IF EXISTS  `Filtro_perfil` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Filtro_perfil`(valor VARCHAR(20), codigo INT)
BEGIN
	(SELECT `perfil`.`id_prefil`, `perfil`.`usuario`, 
IF((valor='CEO'),`ceo_perfil`.`id_ceo`,
IF((valor='INSTITUCION'),`institucion_perfil`.`id_institucion`,
IF((valor='PERFIL'),`registro_perfil`.`id_registro`,''))) AS `id` 
FROM  `perfil`  
LEFT JOIN `ceo_perfil` ON `ceo_perfil`.`id_prefil`=`perfil`.`id_prefil` 
LEFT JOIN `institucion_perfil` ON `institucion_perfil`.`id_prefil`=`perfil`.`id_prefil`   
LEFT JOIN `registro_perfil`  ON `registro_perfil`.`id_prefil`=`perfil`.`id_prefil`  WHERE 
(IF((valor='CEO'),`ceo_perfil`.`id_ceo`,
IF((valor='INSTITUCION'),`institucion_perfil`.`id_institucion`,
IF((valor='PERFIL'),`registro_perfil`.`id_registro`,''))))=codigo);
END */$$
DELIMITER ;

/* Procedure structure for procedure `guardar_puntaje_posteo` */

/*!50003 DROP PROCEDURE IF EXISTS  `guardar_puntaje_posteo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `guardar_puntaje_posteo`(perfil int, punto int,posteo int)
BEGIN
	delete from `puntuacion_posteo` where `id_prefil`=perfil and `id_posteo`=posteo;
	insert into `puntuacion_posteo`(`id_puntuacion_posteo`,`id_prefil`,`id_posteo`,`puntos`,`fecha`)
	 VALUES(`contador_puntaje_posteo`(), perfil, posteo, punto,now());
	END */$$
DELIMITER ;

/* Procedure structure for procedure `modificar_estado_registro` */

/*!50003 DROP PROCEDURE IF EXISTS  `modificar_estado_registro` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `modificar_estado_registro`( id INT , estado VARCHAR(20), url TEXT)
BEGIN
	SET @datos = contadorenlacesistema();
	UPDATE `registro` SET `estado`=estado WHERE `id_registro`=id;
	INSERT INTO enlacesistema(id_enlacesistema,id_tipo,nombre,url,direccion,estado) VALUES(@datos,3,'PERFIL',url,'views/pagina/login/validacion.jsp','ACTIVO');
	INSERT INTO enlace_registro(id_enlacesistema,id_registro) VALUES(@datos,id);
	END */$$
DELIMITER ;

/* Procedure structure for procedure `validarCorreo` */

/*!50003 DROP PROCEDURE IF EXISTS  `validarCorreo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `validarCorreo`(correo TEXT, url TEXT, OUT valor VARCHAR(2),OUT codigo INT)
BEGIN
	
	DECLARE id_acces INT;
	DECLARE codpass INT;
	DECLARE conteo INT;
	SET conteo=0;
	SET @datos = contadorenlacesistema();
	SET @contador=contadorPassEnlace();
	SET valor='NO';
	SET codigo=0;
		IF EXISTS(SELECT id_registro FROM registro WHERE correo=correo) THEN 
			SET id_acces=(SELECT usuario_registro.id_usuario FROM usuario_registro LEFT JOIN usuario ON usuario_registro.id_usuario=usuario.id_usuario WHERE usuario.estado='ACTIVO' ORDER BY usuario_registro.id_usuario DESC LIMIT 1);
			SET codpass=(SELECT id_pass FROM pass WHERE id_usuario=id_acces AND estado='ACTIVO' LIMIT 1);
			SET codigo=id_acces;
			IF EXISTS (SELECT id_pass_enlace FROM pass_enlace WHERE id_pass_enlace=codpass) THEN
				SET conteo=(SELECT IFNULL(MAX(conteo),0)+1 AS codigo FROM pass_enlace);
			END IF;
			IF (conteo<4) THEN
				INSERT INTO enlacesistema (id_enlacesistema, id_tipo,nombre,url,direccion,estado) VALUES (@datos,3,'RESTABLECER CONTRASEÑA',url,'views/pagina/restablecer_pass/restablecer.jsp','ACTIVO');
				INSERT INTO pass_enlace (id_pass_enlace, id_enlacesistema,id_pass,estado,conteo) VALUES (@contador, @datos, codpass,'ACTIVO',conteo); 
				SET valor='SI';
			ELSE 
				SET valor='LM';
	
			END IF;
		END IF; 
	END */$$
DELIMITER ;

/*Table structure for table `acceso` */

DROP TABLE IF EXISTS `acceso`;

/*!50001 DROP VIEW IF EXISTS `acceso` */;
/*!50001 DROP TABLE IF EXISTS `acceso` */;

/*!50001 CREATE TABLE  `acceso`(
 `id_usuario` int(11) ,
 `usu` text ,
 `tipo` varchar(20) ,
 `id` varchar(11) 
)*/;

/*Table structure for table `filtro_curri` */

DROP TABLE IF EXISTS `filtro_curri`;

/*!50001 DROP VIEW IF EXISTS `filtro_curri` */;
/*!50001 DROP TABLE IF EXISTS `filtro_curri` */;

/*!50001 CREATE TABLE  `filtro_curri`(
 `id_curriculum` int(11) ,
 `nombre` longtext ,
 `info_academica` longtext ,
 `info_experiencia` longtext ,
 `info_idioma` longtext ,
 `refe_laboral` longtext ,
 `refe_personal` longtext ,
 `conocimientos` longtext ,
 `foto` text ,
 `estado` varchar(20) ,
 `id_prefil` int(11) ,
 `id_tipo_diseno_curri` int(11) ,
 `apellido` longtext ,
 `direccion` longtext ,
 `telefono` longtext ,
 `cedula` longtext ,
 `fecha_nac` date 
)*/;

/*Table structure for table `filtro_memo` */

DROP TABLE IF EXISTS `filtro_memo`;

/*!50001 DROP VIEW IF EXISTS `filtro_memo` */;
/*!50001 DROP TABLE IF EXISTS `filtro_memo` */;

/*!50001 CREATE TABLE  `filtro_memo`(
 `id_memo` int(11) ,
 `id_prefil` int(11) ,
 `para` longtext ,
 `de` longtext ,
 `cargo` longtext ,
 `fecha` date ,
 `asunto` longtext ,
 `nombre_empresa` longtext ,
 `texto` longtext ,
 `estado` varchar(20) 
)*/;

/*Table structure for table `filtro_solicitud` */

DROP TABLE IF EXISTS `filtro_solicitud`;

/*!50001 DROP VIEW IF EXISTS `filtro_solicitud` */;
/*!50001 DROP TABLE IF EXISTS `filtro_solicitud` */;

/*!50001 CREATE TABLE  `filtro_solicitud`(
 `id_registro` int(11) ,
 `carrera` varchar(100) ,
 `nombre` text ,
 `apellido` text ,
 `correo` text ,
 `institucion` int(11) ,
 `estado` varchar(20) 
)*/;

/*Table structure for table `instivistainsti` */

DROP TABLE IF EXISTS `instivistainsti`;

/*!50001 DROP VIEW IF EXISTS `instivistainsti` */;
/*!50001 DROP TABLE IF EXISTS `instivistainsti` */;

/*!50001 CREATE TABLE  `instivistainsti`(
 `id_usuario` int(11) ,
 `id_institucion` int(11) ,
 `id_ceo` int(11) ,
 `fecha` datetime ,
 `nombre` varchar(100) ,
 `direccion` text ,
 `telefono` varchar(20) ,
 `ubicacion` text ,
 `email` text ,
 `estado` varchar(20) 
)*/;

/*Table structure for table `mispreguntas` */

DROP TABLE IF EXISTS `mispreguntas`;

/*!50001 DROP VIEW IF EXISTS `mispreguntas` */;
/*!50001 DROP TABLE IF EXISTS `mispreguntas` */;

/*!50001 CREATE TABLE  `mispreguntas`(
 `id_pregunta` int(11) ,
 `id_prefil` int(11) ,
 `usuario` text ,
 `titulo` varchar(60) ,
 `tema` varchar(100) ,
 `fecha` varchar(40) ,
 `hora` varchar(13) ,
 `id_temas` int(11) ,
 `id_permiso` int(11) ,
 `url` text 
)*/;

/*Table structure for table `muropreguntas` */

DROP TABLE IF EXISTS `muropreguntas`;

/*!50001 DROP VIEW IF EXISTS `muropreguntas` */;
/*!50001 DROP TABLE IF EXISTS `muropreguntas` */;

/*!50001 CREATE TABLE  `muropreguntas`(
 `id_pregunta` int(11) ,
 `usuario` text ,
 `titulo` varchar(60) ,
 `tema` varchar(100) ,
 `fecha` int(7) ,
 `hora` varchar(13) ,
 `url` text 
)*/;

/*Table structure for table `perfilvistaperfil` */

DROP TABLE IF EXISTS `perfilvistaperfil`;

/*!50001 DROP VIEW IF EXISTS `perfilvistaperfil` */;
/*!50001 DROP TABLE IF EXISTS `perfilvistaperfil` */;

/*!50001 CREATE TABLE  `perfilvistaperfil`(
 `id_usuario` int(11) ,
 `id_registro` int(11) ,
 `fecha` datetime ,
 `nombre` text ,
 `apellido` text ,
 `sexo` varchar(20) ,
 `fecha_nac` date ,
 `correo` text ,
 `estado` varchar(20) ,
 `institucion` varchar(100) ,
 `carrera` varchar(100) 
)*/;

/*Table structure for table `todasrespuestas` */

DROP TABLE IF EXISTS `todasrespuestas`;

/*!50001 DROP VIEW IF EXISTS `todasrespuestas` */;
/*!50001 DROP TABLE IF EXISTS `todasrespuestas` */;

/*!50001 CREATE TABLE  `todasrespuestas`(
 `id_respuesta` int(11) ,
 `id_pregunta` int(11) ,
 `id_prefil` int(11) ,
 `tipo` int(11) ,
 `usuario` text ,
 `texto` longtext ,
 `fecha` varchar(40) ,
 `hora` varchar(13) 
)*/;

/*View structure for view acceso */

/*!50001 DROP TABLE IF EXISTS `acceso` */;
/*!50001 DROP VIEW IF EXISTS `acceso` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `acceso` AS (select `usuario`.`id_usuario` AS `id_usuario`,`usuario`.`usu` AS `usu`,`usuario`.`tipo` AS `tipo`,if((`usuario`.`tipo` = 'CEO'),`usuario_ceo`.`id_ceo`,if((`usuario`.`tipo` = 'INSTITUCION'),`usuario_institucion`.`id_institucion`,if((`usuario`.`tipo` = 'PERFIL'),`usuario_registro`.`id_registro`,''))) AS `id` from (((`usuario` left join `usuario_ceo` on((`usuario_ceo`.`id_usuario` = `usuario`.`id_usuario`))) left join `usuario_institucion` on((`usuario_institucion`.`id_usuario` = `usuario`.`id_usuario`))) left join `usuario_registro` on((`usuario_registro`.`id_usuario` = `usuario`.`id_usuario`))) where (`usuario`.`estado` = 'ACTIVO')) */;

/*View structure for view filtro_curri */

/*!50001 DROP TABLE IF EXISTS `filtro_curri` */;
/*!50001 DROP VIEW IF EXISTS `filtro_curri` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `filtro_curri` AS (select `curriculum`.`id_curriculum` AS `id_curriculum`,`curriculum`.`nombre` AS `nombre`,`curriculum`.`info_academica` AS `info_academica`,`curriculum`.`info_experiencia` AS `info_experiencia`,`curriculum`.`info_idioma` AS `info_idioma`,`curriculum`.`refe_laboral` AS `refe_laboral`,`curriculum`.`refe_personal` AS `refe_personal`,`curriculum`.`conocimientos` AS `conocimientos`,`curriculum`.`foto` AS `foto`,`curriculum`.`estado` AS `estado`,`curriculum`.`id_prefil` AS `id_prefil`,`curriculum`.`id_tipo_diseno_curri` AS `id_tipo_diseno_curri`,`curriculum`.`apellido` AS `apellido`,`curriculum`.`direccion` AS `direccion`,`curriculum`.`telefono` AS `telefono`,`curriculum`.`cedula` AS `cedula`,`curriculum`.`fecha_nac` AS `fecha_nac` from `curriculum`) */;

/*View structure for view filtro_memo */

/*!50001 DROP TABLE IF EXISTS `filtro_memo` */;
/*!50001 DROP VIEW IF EXISTS `filtro_memo` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `filtro_memo` AS (select `memo`.`id_memo` AS `id_memo`,`memo`.`id_prefil` AS `id_prefil`,`memo`.`para` AS `para`,`memo`.`de` AS `de`,`memo`.`cargo` AS `cargo`,`memo`.`fecha` AS `fecha`,`memo`.`asunto` AS `asunto`,`memo`.`nombre_empresa` AS `nombre_empresa`,`memo`.`texto` AS `texto`,`memo`.`estado` AS `estado` from `memo`) */;

/*View structure for view filtro_solicitud */

/*!50001 DROP TABLE IF EXISTS `filtro_solicitud` */;
/*!50001 DROP VIEW IF EXISTS `filtro_solicitud` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `filtro_solicitud` AS (select `registro`.`id_registro` AS `id_registro`,`carrera`.`nombre` AS `carrera`,`registro`.`nombre` AS `nombre`,`registro`.`apellido` AS `apellido`,`registro`.`correo` AS `correo`,`institucion`.`id_institucion` AS `institucion`,`registro`.`estado` AS `estado` from (((`registro` join `universidad_carrera` on((`universidad_carrera`.`id_universidad_carrera` = `registro`.`id_universidad_carrera`))) join `carrera` on((`carrera`.`id_carrera` = `universidad_carrera`.`id_carrera`))) join `institucion` on((`institucion`.`id_institucion` = `universidad_carrera`.`id_institucion`)))) */;

/*View structure for view instivistainsti */

/*!50001 DROP TABLE IF EXISTS `instivistainsti` */;
/*!50001 DROP VIEW IF EXISTS `instivistainsti` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `instivistainsti` AS (select `ui`.`id_usuario` AS `id_usuario`,`i`.`id_institucion` AS `id_institucion`,`i`.`id_ceo` AS `id_ceo`,`i`.`fecha` AS `fecha`,`i`.`nombre` AS `nombre`,`i`.`direccion` AS `direccion`,`i`.`telefono` AS `telefono`,`i`.`ubicacion` AS `ubicacion`,`i`.`email` AS `email`,`i`.`estado` AS `estado` from (`institucion` `i` join `usuario_institucion` `ui` on((`ui`.`id_institucion` = `i`.`id_institucion`)))) */;

/*View structure for view mispreguntas */

/*!50001 DROP TABLE IF EXISTS `mispreguntas` */;
/*!50001 DROP VIEW IF EXISTS `mispreguntas` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `mispreguntas` AS (select `pregunta`.`id_pregunta` AS `id_pregunta`,`perfil`.`id_prefil` AS `id_prefil`,`perfil`.`usuario` AS `usuario`,`pregunta`.`titulo` AS `titulo`,`temas`.`tema` AS `tema`,date_format(`pregunta`.`fecha`,'%d %b %Y') AS `fecha`,date_format(`pregunta`.`fecha`,'%H:%i:%s') AS `hora`,`temas`.`id_temas` AS `id_temas`,`permiso`.`id_permiso` AS `id_permiso`,`enlacesistema`.`url` AS `url` from ((((((`pregunta` join `perfil` on((`pregunta`.`id_prefil` = `perfil`.`id_prefil`))) join `tipo_perfil` on((`tipo_perfil`.`id_tipo_perfil` = `perfil`.`id_tipo_perfil`))) join `temas` on((`temas`.`id_temas` = `pregunta`.`id_temas`))) join `permiso` on((`permiso`.`id_permiso` = `pregunta`.`id_permiso`))) left join `enlace_pregunta` on((`pregunta`.`id_pregunta` = `enlace_pregunta`.`id_pregunta`))) left join `enlacesistema` on((`enlace_pregunta`.`id_enlacesistema` = `enlacesistema`.`id_enlacesistema`))) where (`pregunta`.`estado` = 'Activo') order by `pregunta`.`fecha` desc) */;

/*View structure for view muropreguntas */

/*!50001 DROP TABLE IF EXISTS `muropreguntas` */;
/*!50001 DROP VIEW IF EXISTS `muropreguntas` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `muropreguntas` AS (select `pregunta`.`id_pregunta` AS `id_pregunta`,`perfil`.`usuario` AS `usuario`,`pregunta`.`titulo` AS `titulo`,`temas`.`tema` AS `tema`,(to_days(now()) - to_days(`pregunta`.`fecha`)) AS `fecha`,date_format(`pregunta`.`fecha`,'%H:%i:%s') AS `hora`,`enlacesistema`.`url` AS `url` from (((((`pregunta` join `perfil` on((`pregunta`.`id_prefil` = `perfil`.`id_prefil`))) join `tipo_perfil` on((`tipo_perfil`.`id_tipo_perfil` = `perfil`.`id_tipo_perfil`))) join `temas` on((`temas`.`id_temas` = `pregunta`.`id_temas`))) left join `enlace_pregunta` on((`pregunta`.`id_pregunta` = `enlace_pregunta`.`id_pregunta`))) left join `enlacesistema` on((`enlace_pregunta`.`id_enlacesistema` = `enlacesistema`.`id_enlacesistema`))) where ((`pregunta`.`estado` = 'ACTIVO') and (`pregunta`.`id_permiso` <> '2')) order by `pregunta`.`fecha` desc) */;

/*View structure for view perfilvistaperfil */

/*!50001 DROP TABLE IF EXISTS `perfilvistaperfil` */;
/*!50001 DROP VIEW IF EXISTS `perfilvistaperfil` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `perfilvistaperfil` AS (select `ur`.`id_usuario` AS `id_usuario`,`r`.`id_registro` AS `id_registro`,`r`.`fecha` AS `fecha`,`r`.`nombre` AS `nombre`,`r`.`apellido` AS `apellido`,`r`.`sexo` AS `sexo`,`r`.`fecha_nac` AS `fecha_nac`,`r`.`correo` AS `correo`,`r`.`estado` AS `estado`,`i`.`nombre` AS `institucion`,`c`.`nombre` AS `carrera` from ((((`registro` `r` join `usuario_registro` `ur` on((`ur`.`id_registro` = `r`.`id_registro`))) join `universidad_carrera` `uc` on((`uc`.`id_universidad_carrera` = `r`.`id_universidad_carrera`))) join `institucion` `i` on((`i`.`id_institucion` = `uc`.`id_institucion`))) join `carrera` `c` on((`c`.`id_carrera` = `uc`.`id_carrera`)))) */;

/*View structure for view todasrespuestas */

/*!50001 DROP TABLE IF EXISTS `todasrespuestas` */;
/*!50001 DROP VIEW IF EXISTS `todasrespuestas` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `todasrespuestas` AS (select `respuesta`.`id_respuesta` AS `id_respuesta`,`respuesta`.`id_pregunta` AS `id_pregunta`,`perfil`.`id_prefil` AS `id_prefil`,`tipo_perfil`.`id_tipo_perfil` AS `tipo`,`perfil`.`usuario` AS `usuario`,`respuesta`.`texto` AS `texto`,date_format(`respuesta`.`fecha`,'%d %b %Y') AS `fecha`,date_format(`respuesta`.`fecha`,'%H:%i:%s') AS `hora` from ((`respuesta` join `perfil` on((`respuesta`.`id_prefil` = `perfil`.`id_prefil`))) join `tipo_perfil` on((`tipo_perfil`.`id_tipo_perfil` = `perfil`.`id_tipo_perfil`))) where (`respuesta`.`estado` = 'ACTIVO')) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
