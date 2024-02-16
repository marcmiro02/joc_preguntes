-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-02-2024 a las 22:29:24
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `joc_preguntes`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadistiques_usuari`
--

CREATE TABLE `estadistiques_usuari` (
  `id_estadistica` int(11) NOT NULL,
  `preguntes_encertades` int(11) DEFAULT NULL,
  `preguntes_fallades` int(11) DEFAULT NULL,
  `punts` int(11) DEFAULT NULL,
  `id_usuari` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estadistiques_usuari`
--

INSERT INTO `estadistiques_usuari` (`id_estadistica`, `preguntes_encertades`, `preguntes_fallades`, `punts`, `id_usuari`) VALUES
(1, 36, 39, 1350, 1),
(2, 0, 0, 0, 2),
(3, 7, 17, 200, 3),
(4, 28, 36, 1900, 4),
(5, NULL, NULL, NULL, 9),
(6, 0, 0, 0, 10),
(7, 0, 0, 0, 11),
(8, 32, 8, 1350, 12),
(9, 27, 3, 1350, 13),
(10, 0, 0, 0, 14),
(11, 16, 7, 0, 15),
(12, 28, 12, 1500, 16),
(13, 3, 17, 150, 17);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formulen`
--

CREATE TABLE `formulen` (
  `id_pregunta` int(11) NOT NULL,
  `id_informacio` int(11) NOT NULL,
  `acertada` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `informacio_partida`
--

CREATE TABLE `informacio_partida` (
  `id_informacio` int(11) NOT NULL,
  `ID_usuari` int(11) DEFAULT NULL,
  `ID_pregunta` int(11) DEFAULT NULL,
  `ID_partida` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mode_de_joc`
--

CREATE TABLE `mode_de_joc` (
  `ID_Mode` int(11) NOT NULL,
  `Nom` varchar(255) DEFAULT NULL,
  `Num_Usuaris` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mode_de_joc`
--

INSERT INTO `mode_de_joc` (`ID_Mode`, `Nom`, `Num_Usuaris`) VALUES
(1, 'Anselmo VS Anselmo', 2),
(2, 'Màgia Anselma', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `obte`
--

CREATE TABLE `obte` (
  `Id_usuari` int(11) NOT NULL,
  `id_partida` int(11) NOT NULL,
  `id_puntuacio` int(11) NOT NULL,
  `ID_obte` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partida`
--

CREATE TABLE `partida` (
  `id_partida` int(11) NOT NULL,
  `id_modejoc` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `partida`
--

INSERT INTO `partida` (`id_partida`, `id_modejoc`) VALUES
(1, 1),
(3, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(2, 2),
(4, 2),
(16, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntes`
--

CREATE TABLE `preguntes` (
  `id_pregunta` int(11) NOT NULL,
  `enunciat` varchar(255) DEFAULT NULL,
  `ID_tematica` int(11) DEFAULT NULL,
  `dificultat` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `preguntes`
--

INSERT INTO `preguntes` (`id_pregunta`, `enunciat`, `ID_tematica`, `dificultat`) VALUES
(1, '¿Qué lenguaje de programación es conocido por su uso en desarrollo web?', 1, 2),
(2, '¿Qué componente de hardware almacena datos a largo plazo?', 2, 1),
(3, '¿Cuál es el personaje principal de la saga \"The Legend of Zelda\"?', 3, 3),
(4, '¿Qué función cumple un ratón de computadora?', 4, 1),
(5, '¿Qué tipo de software permite la interacción con el hardware de la computadora?', 5, 2),
(6, '¿Cuál es un lenguaje de programación orientado a objetos?', 1, 1),
(7, '¿Qué significa HTML en programación web?', 1, 1),
(8, '¿Cuál es el símbolo utilizado para comentarios en el lenguaje de programación Python?', 1, 1),
(9, '¿Qué es un bucle \"for\" en programación?', 1, 1),
(10, '¿Cuál es la función principal de una tarjeta de sonido?', 2, 1),
(11, '¿Cuál es la función de la BIOS en una computadora?', 2, 1),
(12, '¿Qué es un disco SSD en términos de hardware de almacenamiento?', 2, 2),
(13, '¿Qué componente esencial es responsable de procesar datos en una computadora?', 2, 2),
(14, '¿Cuál es el género de videojuegos al que pertenece el juego \"FIFA\"?', 3, 1),
(15, '¿Cuál es el personaje principal de la saga \"Final Fantasy\"?', 3, 1),
(16, '¿Cuál es el año de lanzamiento de la consola de videojuegos PlayStation 4?', 3, 1),
(17, '¿Cuál es el nombre del estudio de desarrollo de videojuegos detrás de la serie \"The Elder Scrolls\"?', 3, 2),
(18, '¿Cuál de los siguientes lenguajes de programación es de tipado dinámico?', 1, 2),
(19, '¿Qué componente de hardware se encarga de procesar los datos en una computadora?', 2, 1),
(20, '¿Cuál es el objetivo principal de un firewall en un sistema informático?', 5, 2),
(21, '¿En qué año se lanzó la primera versión estable de Android?', 5, 2),
(22, '¿Cuál de los siguientes es un ejemplo de software de código abierto?', 5, 1),
(23, '¿Quién es el creador del lenguaje de programación Python?', 1, 2),
(24, '¿Qué es un algoritmo en el contexto de la informática?', 1, 1),
(25, '¿Cuál es el propósito principal de una GPU en una computadora?', 2, 1),
(26, '¿Qué es un pixel en el contexto de la visualización de imágenes digitales?', 4, 1),
(27, '¿Cuál es el sistema de gestión de bases de datos más utilizado en aplicaciones web?', 5, 2),
(28, '¿Qué protocolo de internet se utiliza comúnmente para enviar correos electrónicos?', 5, 2),
(29, '¿Cuál es el nombre del creador de Facebook?', 1, 1),
(30, '¿Qué significa el acrónimo \"URL\" en el contexto de internet?', 5, 1),
(31, '¿Cuál de las siguientes opciones NO es un sistema operativo?', 5, 1),
(32, '¿Qué compañía desarrolló el sistema operativo Windows?', 5, 1),
(33, '¿Qué componente de hardware se utiliza para almacenar temporalmente datos en una computadora?', 2, 1),
(34, '¿Cuál es el estándar de conexión más comúnmente utilizado para dispositivos periféricos en computadoras de escritorio?', 4, 2),
(35, '¿Qué tipo de archivo se utiliza para almacenar hojas de cálculo en Microsoft Excel?', 5, 2),
(37, '¿Qué tipo de juego es \"League of Legends\"?', 3, 2),
(38, '¿Cuál de los siguientes lenguajes de programación es de tipado estático?', 1, 2),
(39, '¿Qué siglas representan al estándar de codificación de caracteres utilizado en la mayoría de los sitios web?', 1, 2),
(40, '¿Cuál de las siguientes opciones es un lenguaje de marcado?', 1, 1),
(41, '¿Qué tipo de software se utiliza para crear presentaciones visuales?', 5, 1),
(42, '¿Cuál es el nombre del inventor del teléfono?', 2, 2),
(43, '¿Qué componente de hardware se utiliza para visualizar información en una computadora portátil?', 4, 1),
(44, '¿Qué siglas representan al protocolo de transferencia de archivos utilizado para la descarga de archivos de internet?', 5, 2),
(45, '¿Qué tipo de dispositivo es un router?', 2, 2),
(46, '¿Qué es un servidor web?', 5, 2),
(47, '¿Quién desarrolló el sistema operativo iOS?', 5, 2),
(48, '¿Cuál de los siguientes lenguajes de programación es interpretado?', 1, 2),
(49, '¿Qué componente de hardware se encarga de procesar la información en una computadora?', 2, 2),
(50, '¿Cuál es el navegador web más utilizado?', 5, 1),
(51, '¿Qué siglas representan al protocolo de transferencia de hipertexto?', 5, 2),
(52, '¿Cuál es el tipo de memoria que se pierde cuando se apaga la computadora?', 2, 1),
(53, '¿Qué significa la sigla CPU en informática?', 2, 1),
(54, '¿Quién es el creador del sistema operativo Windows?', 5, 2),
(55, '¿Cuál de los siguientes no es un lenguaje de programación orientado a objetos?', 1, 2),
(56, '¿Qué función cumple un router en una red informática?', 2, 2),
(57, '¿Qué significa USB?', 4, 1),
(58, '¿Qué es un algoritmo?', 1, 2),
(59, '¿Cuál es el objetivo principal de un sistema operativo?', 5, 1),
(60, '¿Qué es el phishing en el contexto de la seguridad informática?', 5, 2),
(61, '¿Cuál de los siguientes NO es un lenguaje de marcado?', 5, 1),
(62, '¿Cuál es la función principal de una tarjeta madre?', 2, 2),
(63, '¿Cuál de los siguientes NO es un sistema operativo móvil?', 5, 1),
(65, '¿Qué es un ataque de denegación de servicio (DDoS)?', 5, 2),
(66, '¿Cuál es el propósito de un compilador en programación?', 1, 1),
(67, '¿Cuál es el protocolo de Internet utilizado para enviar correo electrónico?', 5, 2),
(68, '¿Qué es el protocolo HTTPS?', 5, 2),
(69, '¿Cuál de los siguientes NO es un tipo de datos en programación?', 1, 1),
(71, '¿Cuál es la función principal de un router en una red informática?', 5, 2),
(72, '¿Cuál es la diferencia entre un virus y un gusano informático?', 5, 2),
(73, '¿Qué es el overclocking en términos de hardware de computadora?', 2, 2),
(74, '¿Cuál es el propósito del sistema operativo iOS?', 5, 2),
(75, '¿Qué es un bucle \"while\" en programación?', 1, 1),
(77, '¿Qué es un archivo CSV?', 5, 1),
(78, '¿Qué es un algoritmo?', 1, 1),
(79, '¿Cuál es el fundador de Microsoft?', 1, 2),
(80, '¿Qué significa la sigla \"CPU\" en informática?', 2, 1),
(81, '¿Cuál es el tipo de memoria más rápido en una computadora?', 2, 2),
(82, '¿Qué es el formato de archivo MP3?', 5, 1),
(83, '¿Cuál es el objetivo principal del lenguaje de programación Java?', 1, 2),
(84, '¿Qué significa la sigla \"IP\" en términos de redes?', 5, 1),
(85, '¿Cuál es el navegador web más utilizado en la actualidad?', 5, 1),
(86, '¿Qué es un servidor DNS?', 5, 2),
(87, '¿Cuál es el nombre completo de la empresa Apple Inc.?', 2, 2),
(89, '¿Cuál es el sistema operativo más utilizado en dispositivos móviles?', 5, 1),
(91, '¿Cuál es el componente principal de una tarjeta madre?', 2, 2),
(93, '¿Cuál es el género de videojuegos al que pertenece \"The Witcher 3: Wild Hunt\"?', 3, 2),
(94, '¿Quién es el creador del juego \"Minecraft\"?', 3, 2),
(96, '¿Qué lenguaje de programación es utilizado principalmente para el desarrollo de aplicaciones móviles en Android?', 1, 2),
(98, '¿Cuál es el navegador web más utilizado a nivel mundial?', 5, 1),
(99, '¿Qué es un archivo con extensión \".zip\"?', 5, 1),
(100, '¿Cuál es la función principal de una unidad de procesamiento central (CPU)?', 2, 2),
(101, '¿Qué es un pixel?', 2, 1),
(103, '¿Qué significa \"HTTP\" en internet?', 5, 1),
(104, '¿Cuál es el nombre del último sistema operativo desarrollado por Apple para sus computadoras?', 5, 2),
(105, '¿Qué es el Bluetooth?', 2, 1),
(106, '¿Cuál es el nombre del protagonista de la saga de videojuegos \"Metal Gear Solid\"?', 3, 2),
(150, '¿Cuál es el componente principal de una tarjeta de video?', 2, 2),
(151, '¿Qué significa la sigla RAM en informática?', 2, 2),
(152, '¿Cuál es el propósito del sistema operativo Android?', 5, 2),
(153, '¿Quién es el creador del lenguaje de programación C++?', 1, 2),
(154, '¿Qué es un servidor FTP?', 5, 2),
(155, '¿Cuál es el lenguaje de programación utilizado para el desarrollo de aplicaciones iOS?', 1, 2),
(156, '¿Cuál es el propósito principal de un sistema operativo de tiempo real?', 5, 1),
(157, '¿Qué es el almacenamiento en la nube?', 5, 1),
(158, '¿Cuál es el nombre del fundador de Amazon?', 5, 1),
(159, '¿Cuál es el propósito de un sistema de gestión de versiones (VCS)?', 5, 2),
(160, '¿Qué es un programa antivirus?', 5, 1),
(161, '¿Cuál es el propósito de una tarjeta de red en una computadora?', 2, 1),
(163, '¿Cuál es el navegador web desarrollado por Mozilla Foundation?', 5, 1),
(164, '¿Qué es el software de código abierto?', 5, 2),
(165, '¿Cuál es el propósito de un cable HDMI?', 4, 2),
(166, '¿Qué es un servidor de correo electrónico?', 5, 2),
(168, '¿Qué es un programa de edición de imágenes?', 4, 2),
(169, '¿Cuál es el nombre del fundador de Oracle Corporation?', 1, 2),
(170, '¿Qué significa la sigla SQL en bases de datos?', 5, 2),
(171, '¿Cuál es el propósito de un sistema de archivos en un sistema operativo?', 5, 2),
(172, '¿Qué es un programa de hoja de cálculo?', 5, 1),
(173, '¿Cuál es el nombre del creador de Linux?', 1, 2),
(174, '¿Qué es un programa de mensajería instantánea?', 5, 1),
(175, '¿Cuál es el propósito de un cable Ethernet en redes de computadoras?', 4, 1),
(176, '¿Qué significa la sigla VPN en redes?', 5, 2),
(177, '¿Cuál es el nombre del creador del sistema operativo Unix?', 5, 2),
(178, '¿Qué es un programa de diseño gráfico?', 4, 2),
(179, '¿Cuál es el propósito de un sistema de gestión de proyectos?', 5, 2),
(180, '¿Qué significa la sigla HTML5?', 1, 1),
(182, '¿Qué es un programa de reproducción de música?', 5, 1),
(183, '¿Cuál es el propósito de un cable USB en computadoras?', 4, 2),
(184, '¿Qué significa la sigla API en desarrollo de software?', 1, 2),
(185, '¿Cuál es el nombre del fundador de Twitter?', 5, 2),
(186, '¿Qué es un programa de procesamiento de texto?', 5, 2),
(187, '¿Cuál es el propósito de un sistema de gestión de contenidos (CMS)?', 5, 2),
(189, '¿Cuál es el nombre del fundador de WhatsApp?', 1, 2),
(190, '¿Qué es un programa de seguridad informática?', 5, 2),
(201, '¿Cuál es el propósito del lenguaje de programación Python?', 1, 2),
(202, '¿Cuál es el principal componente de una placa base (motherboard)?', 2, 2),
(203, '¿Quién es el fundador de Microsoft Corporation?', 5, 1),
(204, '¿Cuál es el propósito de un sistema de archivos en un dispositivo de almacenamiento?', 5, 2),
(206, '¿Quién es el co-fundador de Apple Inc. junto a Steve Jobs?', 1, 2),
(207, '¿Cuál es el propósito de un programa de reconocimiento de voz?', 5, 2),
(208, '¿Qué es el phishing en el contexto de seguridad informática?', 5, 2),
(209, '¿Quién es conocido como el co-creador del sistema operativo Unix?', 5, 2),
(210, '¿Cuál es el nombre del fundador de Microsoft Research?', 1, 2),
(212, '¿Cuál es el propósito del protocolo SMTP en el correo electrónico?', 5, 2),
(213, '¿Qué significa la sigla CDN en términos de internet?', 5, 2),
(214, '¿Quién es el creador de la plataforma de streaming Netflix?', 5, 2),
(215, '¿Cuál es el propósito del protocolo HTTP en la web?', 5, 2),
(216, '¿Qué es un sistema RAID en almacenamiento de datos?', 2, 2),
(217, '¿Cuál es el lenguaje de programación utilizado para desarrollo web del lado del cliente?', 1, 2),
(218, '¿Qué es un programa de controladores (drivers) en computación?', 5, 2),
(219, '¿Cuál es el fundador de la empresa de software Adobe Systems?', 5, 2),
(220, '¿Qué es un sistema de gestión de contraseñas?', 5, 1),
(221, '¿Cuál es el propósito del protocolo FTP en transferencia de archivos?', 5, 2),
(222, '¿Qué es la inteligencia artificial?', 5, 2),
(223, '¿Cuál es el componente principal de un disco duro?', 2, 2),
(224, '¿Quién es conocido como el creador del primer lenguaje de programación de alto nivel?', 1, 2),
(225, '¿Cuál es el propósito de un sistema de detección de intrusiones?', 5, 2),
(226, '¿Qué significa la sigla VPN en términos de seguridad informática?', 5, 2),
(227, '¿Quién es el fundador de la empresa de hardware Intel?', 1, 2),
(228, '¿Cuál es el propósito del sistema de archivos exFAT?', 5, 2),
(229, '¿Qué es un programa de emulación?', 5, 2),
(230, '¿Cuál es el lenguaje de programación utilizado para desarrollo web del lado del servidor?', 1, 2),
(231, '¿Qué significa la sigla API en términos de programación?', 1, 2),
(232, '¿Quién es conocido como el co-creador del lenguaje de programación UNIX?', 1, 2),
(233, '¿Cuál es el propósito de un programa de firewall?', 5, 2),
(234, '¿Qué es la realidad virtual?', 3, 1),
(235, '¿Cuál es el componente principal de una unidad central de procesamiento (CPU)?', 2, 2),
(237, '¿Cuál es el propósito del protocolo TCP en redes de computadoras?', 5, 2),
(238, '¿Qué significa la sigla IoT en términos de tecnología?', 5, 2),
(239, '¿Quién es conocido como el co-creador del lenguaje de programación Java?', 1, 2),
(240, '¿Cuál es el propósito de un programa de optimización de sistema?', 5, 2),
(241, '¿Qué es un sistema de gestión de aprendizaje (LMS)?', 5, 2),
(243, '¿Qué es un programa de reconocimiento de caracteres OCR?', 5, 2),
(244, '¿Cuál es el lenguaje de programación utilizado para desarrollo de videojuegos?', 1, 2),
(246, '¿Quién es el co-fundador de Microsoft Corporation junto a Bill Gates?', 1, 2),
(247, '¿Cuál es el propósito de un programa de compresión de archivos?', 5, 2),
(248, '¿Qué es el ransomware en el contexto de seguridad informática?', 5, 2),
(249, '¿Quién es conocido como el pionero de la inteligencia artificial?', 3, 2),
(250, '¿Cuál es el nombre del fundador de la empresa de hardware AMD?', 1, 2),
(251, '¿Qué es un sistema de gestión de base de datos NoSQL?', 5, 2),
(252, '¿Cuál es el propósito del protocolo POP en el correo electrónico?', 5, 2),
(253, '¿Qué significa la sigla LAN en redes de computadoras?', 4, 2),
(254, '¿Quién es el co-fundador de Google junto a Larry Page?', 1, 2),
(255, '¿Cuál es el propósito de un programa de edición de audio?', 4, 2),
(256, '¿Qué es un programa de reconocimiento de patrones?', 5, 2),
(257, '¿Cuál es el lenguaje de programación utilizado para desarrollo de inteligencia artificial?', 1, 2),
(259, '¿Quién es conocido como el padre de la computación cuántica?', 3, 2),
(260, '¿Cuál es el propósito de un programa de gestión de proyectos?', 5, 2),
(261, '¿Qué es un programa de diseño asistido por computadora (CAD)?', 4, 2),
(262, '¿Cuál es el fundador de la empresa de software SAP?', 1, 2),
(263, '¿Qué es un sistema de gestión de contenidos empresariales (ECM)?', 5, 2),
(267, '¿Cuál es el propósito de un programa de análisis de datos?', 5, 2),
(268, '¿Qué es la computación en la nube?', 5, 2),
(269, '¿Cuál es el componente principal de una tarjeta madre (motherboard)?', 2, 2),
(270, '¿Quién es conocido como el co-creador del lenguaje de programación PHP?', 1, 2),
(271, '¿Cuál es el propósito del protocolo IMAP en el correo electrónico?', 5, 2),
(272, '¿Qué significa la sigla QR en términos de códigos de barras?', 5, 1),
(273, '¿Quién es el fundador de la empresa de software Mozilla Corporation?', 1, 2),
(274, '¿Cuál es el propósito de un programa de control parental?', 5, 2),
(275, '¿Qué es un programa de renderizado de gráficos 3D?', 5, 1),
(276, '¿Cuál es el lenguaje de programación utilizado para desarrollo de aplicaciones Android?', 1, 2),
(278, '¿Quién es conocido como el pionero de la teoría de la información?', 3, 2),
(279, '¿Cuál es el propósito de un sistema de gestión de procesos de negocio (BPM)?', 5, 1),
(280, '¿Qué es un programa de análisis de vulnerabilidades?', 5, 1),
(281, '¿Qué es la recursividad en programación?', 1, 2),
(282, '¿Qué es la iteratividad en programación?', 1, 2),
(283, '¿Qué es el Northbridge en una placa madre?', 2, 2),
(284, '¿Qué es el Southbridge en una placa madre?', 2, 2),
(285, '¿Qué es JDBC y para qué se utiliza en Java?', 1, 2),
(286, '¿Qué es el wireless?', 1, 1),
(287, '¿Cuál es el género de Ori and The Blind Forest?', 3, 2),
(288, '¿Quién es el protagonista de Hollow Knight?', 3, 2),
(289, '¿Qué es Beat Saber?', 3, 2),
(290, '¿Qué función cumple una caja de PC?', 2, 1),
(291, '¿Qué es un thread en Java y cómo se relaciona con la concurrencia?', 1, 2),
(292, '¿Qué función cumple la llamada al sistema fork() en el lenguaje de programación C?', 1, 2),
(293, '¿Qué representan los Watts en un cargador de portátil?', 2, 1),
(294, '¿Qué es Odoo y para qué se utiliza?', 5, 2),
(295, '¿Para qué se utiliza NetBeans?', 1, 1),
(296, '¿Para qué se utiliza el networking?', 5, 2),
(297, '¿Qué es un periférico en informática?', 4, 2),
(298, '¿Cuál es considerado el Pokémon más fuerte en Pokémon GO?', 3, 1),
(299, '¿Cuál es la función de los periféricos de entrada, salida y entrada/salida en un sistema informático?', 1, 1),
(300, '¿En qué consiste la arquitectura de Von Neumann?', 2, 2),
(301, '¿Qué significan las etiquetas de consumo eléctrico (A, B, C, etc.) en los periféricos de computadora?', 4, 2),
(302, '¿De qué trata el videojuego Tower of Fantasy?', 3, 1),
(303, '¿Qué es XAMPP y para qué se utiliza?', 5, 2),
(304, '¿Qué significa RGB en ventiladores de computadora?', 2, 1),
(305, '¿Cuál es la diferencia entre cascos y auriculares en el contexto de dispositivos de audio?', 2, 1),
(306, '¿Cuál es la diferencia entre RGB y ARGB en el contexto de iluminación LED?', 2, 1),
(307, '¿Qué significa SATA y cuál es su función en una computadora?', 2, 2),
(308, '¿Quién es el jefe final de Dark Souls 3?', 3, 2),
(309, '¿Cuántas carreras hay en el modo carrera en F1 2023?', 3, 2),
(310, '¿Cuál es el nombre del mod que agrega torretas defensivas en Minecraft?', 3, 1),
(311, '¿En qué modo de juego de Rocket League se pueden usar habilidades especiales?', 3, 2),
(312, '¿Qué personaje organiza todos los \"Golpes\" en GTA V?', 3, 1),
(313, '¿En qué juego de F1 sale Antonio Lobato como narrador?', 3, 2),
(315, '¿Qué tipo de juego es The Binding of Isaac?', 3, 1),
(317, '¿Cuál es el nombre del protagonista de The Last of Us?', 3, 1),
(318, '¿Cuál es el nombre del protagonista de la serie de videojuegos Uncharted?', 3, 2),
(319, '¿Cuántas entregas tiene la serie Call of Duty?', 3, 2),
(320, '¿En qué entrega de Call of Duty se introdujo el sistema de suministros?', 3, 1),
(321, '¿Qué es un aimbot en el contexto de los videojuegos?', 3, 1),
(322, '¿Qué compañía desarrolló la serie de videojuegos Assassin\'s Creed?', 3, 1),
(323, '¿Cuál es el género del videojuego Bagman?', 3, 2),
(324, '¿En qué juego puedes domesticar dinosaurios?', 3, 2),
(325, '¿Cuál es el videojuego más vendido de la historia?', 3, 1),
(326, '¿Cuáles son los tipos de paneles de pantalla más comunes utilizados en monitores y pantallas de dispositivos electrónicos?', 4, 2),
(327, '¿Qué es WinRAR?', 5, 1),
(328, '¿Qué es un teclado de membrana?', 4, 1),
(329, '¿Qué es un teclado mecánico?', 4, 2),
(330, '¿Cuál es el nombre de la liga europea de League of Legends?', 3, 1),
(331, '¿Cuál de estos es un equipo de eSports?', 3, 1),
(332, '¿Para qué servía la bola de los ratones (mouse) antiguos?', 4, 2),
(333, '¿Cómo detectan los ratones que se están moviendo?', 4, 1),
(334, '¿Qué es Hotswap en los teclados?', 4, 2),
(335, '¿Qué son los estabilizadores en los teclados?', 4, 2),
(336, '¿Qué es hacer Tape Mod en un teclado?', 4, 2),
(337, '¿Qué es un cable RJ45?', 4, 2),
(338, '¿Qué tipo de periférico usa cable jack?', 4, 1),
(339, '¿Qué es M.2 en hardware?', 2, 2),
(341, '¿Qué es una tarjeta SD?', 2, 1),
(342, '¿Qué es una webcam?', 4, 1),
(343, '¿Qué es el perfil Cherry en las keycaps?', 4, 2),
(345, '¿Qué es DDR4?', 2, 2),
(346, '¿Qué son los Hz (frecuencia de refresco) en los monitores?', 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puntuacio`
--

CREATE TABLE `puntuacio` (
  `id_puntuacio` int(11) NOT NULL,
  `Puntuacio_General` int(255) DEFAULT NULL,
  `Id_Usuari` int(11) DEFAULT NULL,
  `id_partida` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `puntuacio`
--

INSERT INTO `puntuacio` (`id_puntuacio`, `Puntuacio_General`, `Id_Usuari`, `id_partida`) VALUES
(1, 0, 1, 17),
(2, 0, 4, 17),
(3, 250, 1, 18),
(4, 200, 3, 18),
(5, 500, 16, 22),
(6, 450, 15, 22),
(7, 450, 12, 24),
(8, 500, 13, 24),
(9, 450, 12, 25),
(10, 400, 13, 25),
(11, 450, 12, 26),
(12, 450, 13, 26),
(13, 150, 1, 27),
(14, 150, 4, 27),
(15, 150, 1, 28),
(16, 100, 4, 28),
(17, 50, 17, 29),
(18, 150, 16, 29),
(19, 250, 4, 30),
(20, 150, 1, 30),
(21, 100, 1, 31),
(22, 200, 4, 31),
(23, 100, 17, 32),
(24, 250, 4, 32);

--
-- Disparadores `puntuacio`
--
DELIMITER $$
CREATE TRIGGER `ActualizarEstadisticasDespuesDeInsertar` AFTER INSERT ON `puntuacio` FOR EACH ROW BEGIN
    -- Actualizar el total de puntos en la tabla estadistiques_usuari
    UPDATE estadistiques_usuari
    SET punts = punts + NEW.Puntuacio_General
    WHERE id_estadistica = NEW.Id_Usuari;

    -- Obtener el número de preguntas acertadas y falladas en la nueva partida
    SET @encerts = (SELECT COUNT(*) FROM formulen f WHERE f.id_pregunta = NEW.id_partida AND f.acertada = 1);
    SET @errors = (SELECT COUNT(*) FROM formulen WHERE id_pregunta = NEW.id_partida AND acertada = 0);

    -- Actualizar el total de preguntas acertadas y falladas en la tabla estadistiques_usuari
    UPDATE estadistiques_usuari
    SET preguntes_encertades = preguntes_encertades + @encerts,
        preguntes_fallades = preguntes_fallades + @errors
    WHERE id_estadistica = NEW.Id_Usuari;

    -- Actualizar la columna acertada en la tabla formulen
    UPDATE formulen
    SET acertada = (SELECT correcta FROM respostes WHERE id_pregunta = NEW.id_partida AND id_resposta = NEW.id_puntuacio)
    WHERE id_pregunta = NEW.id_partida AND id_informacio = NEW.id_usuari;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registrar`
--

CREATE TABLE `registrar` (
  `ID_informacio` int(11) NOT NULL,
  `ID_usuari` int(11) NOT NULL,
  `id_registrar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respostes`
--

CREATE TABLE `respostes` (
  `id_resposta` int(11) NOT NULL,
  `text_resposta` varchar(255) DEFAULT NULL,
  `id_pregunta` int(11) DEFAULT NULL,
  `correcta` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `respostes`
--

INSERT INTO `respostes` (`id_resposta`, `text_resposta`, `id_pregunta`, `correcta`) VALUES
(1, 'PHP', 1, 0),
(2, 'JavaScript', 1, 1),
(3, 'Python', 1, 0),
(4, 'Java', 1, 0),
(5, 'Disco Duro', 2, 1),
(6, 'Procesador', 2, 0),
(7, 'Memoria RAM', 2, 0),
(8, 'Tarjeta Gráfica', 2, 0),
(9, 'Link', 3, 1),
(10, 'Mario', 3, 0),
(11, 'Master Chief', 3, 0),
(12, 'Nathan Drake', 3, 0),
(13, 'Capturar movimientos', 4, 0),
(14, 'Navegación web', 4, 0),
(15, 'Controlar el cursor', 4, 1),
(16, 'Imprimir documentos', 4, 0),
(17, 'Sistema Operativo', 5, 1),
(18, 'Hojas de cálculo', 5, 0),
(19, 'Edición de video', 5, 0),
(20, 'Antivirus', 5, 0),
(21, 'Java', 6, 1),
(22, 'C', 6, 0),
(23, 'Python', 6, 0),
(24, 'HTML', 6, 0),
(25, 'Hypertext Markup Language', 7, 1),
(26, 'Hyper Transfer Markup Language', 7, 0),
(27, 'High Tech Markup Language', 7, 0),
(28, 'Home Tool Markup Language', 7, 0),
(29, '#', 8, 1),
(30, '//', 8, 0),
(31, '--', 8, 0),
(32, '/* */', 8, 0),
(33, 'Estructura de control repetitiva', 9, 1),
(34, 'Variable global', 9, 0),
(35, 'Función matemática', 9, 0),
(36, 'Tipo de dato', 9, 0),
(37, 'Producir sonido', 10, 1),
(38, 'Mostrar imágenes', 10, 0),
(39, 'Procesar datos', 10, 0),
(40, 'Conectar dispositivos', 10, 0),
(41, 'Iniciar el sistema operativo', 11, 1),
(42, 'Controlar el ratón', 11, 0),
(43, 'Imprimir documentos', 11, 0),
(44, 'Reproducir video', 11, 0),
(45, 'Unidad de estado sólido', 12, 1),
(46, 'Disco duro magnético', 12, 0),
(47, 'Disco compacto', 12, 0),
(48, 'Unidad de cinta', 12, 0),
(49, 'Procesador', 13, 1),
(50, 'Memoria RAM', 13, 0),
(51, 'Tarjeta de video', 13, 0),
(52, 'Disco duro', 13, 0),
(53, 'Deportes', 14, 1),
(54, 'Acción', 14, 0),
(55, 'Aventura', 14, 0),
(56, 'Estrategia', 14, 0),
(57, 'Cloud Strife', 15, 1),
(58, 'Geralt of Rivia', 15, 0),
(59, 'Ezio Auditore', 15, 0),
(60, 'Nathan Drake', 15, 0),
(61, '2013', 16, 1),
(62, '2014', 16, 0),
(63, '2015', 16, 0),
(64, '2016', 16, 0),
(65, 'Bethesda Game Studios', 17, 1),
(66, 'Ubisoft', 17, 0),
(67, 'Rockstar Games', 17, 0),
(68, 'Blizzard Entertainment', 17, 0),
(69, 'Python', 18, 1),
(70, 'Java', 18, 0),
(71, 'C++', 18, 0),
(72, 'C#', 18, 0),
(73, 'CPU', 19, 1),
(74, 'GPU', 19, 0),
(75, 'RAM', 19, 0),
(76, 'SSD', 19, 0),
(77, 'Proteger la red de accesos no autorizados', 20, 1),
(78, 'Optimizar el rendimiento del hardware', 20, 0),
(79, 'Crear copias de seguridad de los datos', 20, 0),
(80, 'Monitorizar el tráfico de red', 20, 0),
(81, '2008', 21, 0),
(82, '2005', 21, 0),
(83, '2007', 21, 1),
(84, '2009', 21, 0),
(85, 'Linux', 22, 1),
(86, 'Microsoft Office', 22, 0),
(87, 'Adobe Photoshop', 22, 0),
(88, 'Google Chrome', 22, 0),
(89, 'Guido van Rossum', 23, 1),
(90, 'Dennis Ritchie', 23, 0),
(91, 'Linus Torvalds', 23, 0),
(92, 'Tim Berners-Lee', 23, 0),
(93, 'Un conjunto de instrucciones paso a paso para resolver un problema', 24, 1),
(94, 'Un dispositivo de entrada de datos', 24, 0),
(95, 'Un tipo de dato numérico', 24, 0),
(96, 'Un tipo de archivo ejecutable', 24, 0),
(97, 'Renderizar gráficos en juegos y aplicaciones de visualización 3D', 25, 1),
(98, 'Procesar datos de entrada del usuario', 25, 0),
(99, 'Almacenar archivos de forma segura', 25, 0),
(100, 'Realizar cálculos matemáticos complejos', 25, 0),
(101, 'El elemento más pequeño de una imagen digital', 26, 1),
(102, 'Un tipo de unidad de almacenamiento', 26, 0),
(103, 'Un dispositivo de entrada', 26, 0),
(104, 'Un componente de la CPU', 26, 0),
(105, 'MySQL', 27, 1),
(106, 'Oracle', 27, 0),
(107, 'SQLite', 27, 0),
(108, 'MongoDB', 27, 0),
(109, 'SMTP', 28, 1),
(110, 'HTTP', 28, 0),
(111, 'FTP', 28, 0),
(112, 'TCP/IP', 28, 0),
(113, 'Mark Zuckerberg', 29, 1),
(114, 'Bill Gates', 29, 0),
(115, 'Tim Cook', 29, 0),
(116, 'Elon Musk', 29, 0),
(117, 'Localizador Uniforme de Recursos', 30, 1),
(118, 'Universal Resource Locator', 30, 0),
(119, 'Uniform Resource Locator', 30, 0),
(120, 'Unión de Recursos Locales', 30, 0),
(121, 'Linux', 31, 0),
(122, 'iOS', 31, 0),
(123, 'Android', 31, 0),
(124, 'Firefox', 31, 1),
(125, 'Microsoft', 32, 1),
(126, 'Apple', 32, 0),
(127, 'Google', 32, 0),
(128, 'IBM', 32, 0),
(129, 'Memoria RAM', 33, 1),
(130, 'Disco Duro', 33, 0),
(131, 'Procesador', 33, 0),
(132, 'Tarjeta de Video', 33, 0),
(133, 'USB', 34, 1),
(134, 'VGA', 34, 0),
(135, 'HDMI', 34, 0),
(136, 'Thunderbolt', 34, 0),
(137, 'XLSX', 35, 1),
(138, 'DOCX', 35, 0),
(139, 'PDF', 35, 0),
(140, 'TXT', 35, 0),
(145, 'MOBA', 37, 1),
(146, 'MMORPG', 37, 0),
(147, 'FPS', 37, 0),
(148, 'RPG', 37, 0),
(149, 'Java', 38, 0),
(150, 'Python', 38, 0),
(151, 'C++', 38, 1),
(152, 'JavaScript', 38, 0),
(153, 'UTF-8', 39, 1),
(154, 'HTTP', 39, 0),
(155, 'CSS', 39, 0),
(156, 'XML', 39, 0),
(157, 'HTML', 40, 1),
(158, 'Java', 40, 0),
(159, 'Python', 40, 0),
(160, 'CSS', 40, 0),
(161, 'Software de presentaciones', 41, 1),
(162, 'Software de diseño gráfico', 41, 0),
(163, 'Software de hoja de cálculo', 41, 0),
(164, 'Software de procesamiento de texto', 41, 0),
(165, 'Alexander Graham Bell', 42, 1),
(166, 'Thomas Edison', 42, 0),
(167, 'Nikola Tesla', 42, 0),
(168, 'Guglielmo Marconi', 42, 0),
(169, 'Pantalla', 43, 1),
(170, 'Teclado', 43, 0),
(171, 'Procesador', 43, 0),
(172, 'Disco Duro', 43, 0),
(173, 'FTP', 44, 1),
(174, 'HTTP', 44, 0),
(175, 'SMTP', 44, 0),
(176, 'TCP/IP', 44, 0),
(177, 'Dispositivo de red', 45, 1),
(178, 'Dispositivo de almacenamiento', 45, 0),
(179, 'Dispositivo de entrada', 45, 0),
(180, 'Dispositivo de salida', 45, 0),
(181, 'Un software que responde a solicitudes de clientes a través de la web', 46, 1),
(182, 'Un tipo de navegador de internet', 46, 0),
(183, 'Una herramienta para enviar correos electrónicos', 46, 0),
(184, 'Un programa para editar imágenes', 46, 0),
(185, 'Apple Inc.', 47, 1),
(186, 'Microsoft', 47, 0),
(187, 'Google', 47, 0),
(188, 'IBM', 47, 0),
(189, 'Python', 48, 1),
(190, 'Java', 48, 0),
(191, 'C++', 48, 0),
(192, 'JavaScript', 48, 0),
(193, 'Procesador', 49, 1),
(194, 'Memoria RAM', 49, 0),
(195, 'Disco Duro', 49, 0),
(196, 'Tarjeta Gráfica', 49, 0),
(197, 'Google Chrome', 50, 1),
(198, 'Mozilla Firefox', 50, 0),
(199, 'Microsoft Edge', 50, 0),
(200, 'Safari', 50, 0),
(201, 'HTTP', 51, 1),
(202, 'FTP', 51, 0),
(203, 'SMTP', 51, 0),
(204, 'TCP/IP', 51, 0),
(205, 'Memoria RAM', 52, 1),
(206, 'Memoria ROM', 52, 0),
(207, 'Memoria Cache', 52, 0),
(208, 'Memoria Virtual', 52, 0),
(209, 'Central Processing Unit', 53, 1),
(210, 'Computer Programming Unit', 53, 0),
(211, 'Central Program Unit', 53, 0),
(212, 'Control Processing Unit', 53, 0),
(213, 'Bill Gates', 54, 1),
(214, 'Steve Jobs', 54, 0),
(215, 'Linus Torvalds', 54, 0),
(216, 'Tim Berners-Lee', 54, 0),
(217, 'C', 55, 1),
(218, 'Java', 55, 0),
(219, 'Python', 55, 0),
(220, 'C++', 55, 0),
(221, 'Dirigir el tráfico de datos entre redes', 56, 1),
(222, 'Almacenar archivos de forma segura', 56, 0),
(223, 'Generar energía para la red', 56, 0),
(224, 'Administrar la memoria de la computadora', 56, 0),
(225, 'Universal Serial Bus', 57, 1),
(226, 'Ultra Secure Backup', 57, 0),
(227, 'United States of Britain', 57, 0),
(228, 'Underground System Boot', 57, 0),
(229, 'Un conjunto de instrucciones para resolver un problema', 58, 1),
(230, 'Una computadora de tamaño muy pequeño', 58, 0),
(231, 'Un tipo de virus informático', 58, 0),
(232, 'Un nuevo lenguaje de programación', 58, 0),
(233, 'Gestionar los recursos del hardware y proporcionar una interfaz para el usuario', 59, 1),
(234, 'Ejecutar aplicaciones de manera eficiente', 59, 0),
(235, 'Crear nuevos dispositivos de hardware', 59, 0),
(236, 'Procesar grandes cantidades de datos', 59, 0),
(237, 'Un método de suplantación de identidad para obtener información confidencial', 60, 1),
(238, 'Un sistema de copias de seguridad automático', 60, 0),
(239, 'Un programa antivirus', 60, 0),
(240, 'Un tipo de hardware de red', 60, 0),
(241, 'Java', 61, 1),
(242, 'XML', 61, 0),
(243, 'JSON', 61, 0),
(244, 'CSS', 61, 0),
(245, 'Conectar todos los componentes de la computadora', 62, 1),
(246, 'Ejecutar programas de software', 62, 0),
(247, 'Procesar datos', 62, 0),
(248, 'Almacenar información permanentemente', 62, 0),
(249, 'Windows', 63, 1),
(250, 'iOS', 63, 0),
(251, 'Android', 63, 0),
(252, 'Linux', 63, 0),
(257, 'Un ataque que intenta hacer que un servicio sea inaccesible para sus usuarios', 65, 1),
(258, 'Un ataque que roba información personal de los usuarios', 65, 0),
(259, 'Un tipo de virus que afecta a los dispositivos móviles', 65, 0),
(260, 'Un ataque que intenta secuestrar la navegación web de los usuarios', 65, 0),
(261, 'Convertir el código fuente en código ejecutable', 66, 1),
(262, 'Depurar errores en el código', 66, 0),
(263, 'Organizar el código en módulos', 66, 0),
(264, 'Optimizar el rendimiento del programa', 66, 0),
(265, 'SMTP (Simple Mail Transfer Protocol)', 67, 1),
(266, 'HTTP (Hypertext Transfer Protocol)', 67, 0),
(267, 'FTP (File Transfer Protocol)', 67, 0),
(268, 'DNS (Domain Name System)', 67, 0),
(269, 'Es una versión segura del protocolo HTTP que cifra la información', 68, 1),
(270, 'Es un protocolo de correo electrónico', 68, 0),
(271, 'Es un tipo de ataque informático', 68, 0),
(272, 'Es una red social', 68, 0),
(273, 'Booleano', 69, 1),
(274, 'Entero', 69, 0),
(275, 'Flotante', 69, 0),
(276, 'Cadena de caracteres', 69, 0),
(281, 'Dirigir el tráfico de datos entre diferentes redes', 71, 1),
(282, 'Proporcionar energía eléctrica a los dispositivos de red', 71, 0),
(283, 'Almacenar grandes cantidades de datos', 71, 0),
(284, 'Conectar dispositivos de entrada y salida', 71, 0),
(285, 'Un virus se adhiere a un archivo o programa, mientras que un gusano es un programa independiente', 72, 1),
(286, 'Un virus es un programa malicioso y un gusano es un dispositivo de hardware', 72, 0),
(287, 'Un virus afecta a los sistemas operativos móviles y un gusano a los sistemas de escritorio', 72, 0),
(288, 'No hay diferencia, ambos términos se refieren a lo mismo', 72, 0),
(289, 'Aumentar la velocidad de un componente más allá de sus especificaciones de fábrica', 73, 1),
(290, 'Reducir la temperatura de funcionamiento de un componente', 73, 0),
(291, 'Ampliar la memoria RAM de un dispositivo', 73, 0),
(292, 'Instalar un sistema operativo de código abierto', 73, 0),
(293, 'Proporcionar un entorno operativo para dispositivos móviles de Apple', 74, 1),
(294, 'Controlar el funcionamiento de una red local', 74, 0),
(295, 'Optimizar el rendimiento de los juegos en línea', 74, 0),
(296, 'Gestionar archivos de música y videos', 74, 0),
(297, 'Un bucle que se repite mientras se cumple una condición', 75, 1),
(298, 'Un bucle que se repite un número fijo de veces', 75, 0),
(299, 'Un bucle que ejecuta al menos una vez', 75, 0),
(300, 'Un bucle que no se repite', 75, 0),
(305, 'Archivo de valores separados por comas', 77, 1),
(306, 'Archivo de datos multimedia', 77, 0),
(307, 'Archivo de instalación de software', 77, 0),
(308, 'Archivo de imágenes de disco', 77, 0),
(309, 'Es un conjunto de instrucciones paso a paso para resolver un problema', 78, 1),
(310, 'Es un tipo de virus informático', 78, 0),
(311, 'Es una tarjeta gráfica', 78, 0),
(312, 'Es un programa de edición de imágenes', 78, 0),
(313, 'Bill Gates', 79, 1),
(314, 'Steve Jobs', 79, 0),
(315, 'Mark Zuckerberg', 79, 0),
(316, 'Larry Page', 79, 0),
(317, 'Unidad Central de Procesamiento', 80, 1),
(318, 'Central Processing Unit', 80, 0),
(319, 'Control Processing Unit', 80, 0),
(320, 'Computer Processing Unit', 80, 0),
(321, 'Memoria caché', 81, 1),
(322, 'Memoria RAM', 81, 0),
(323, 'Disco duro', 81, 0),
(324, 'Memoria ROM', 81, 0),
(325, 'Es un formato de compresión de audio', 82, 1),
(326, 'Es un formato de imagen', 82, 0),
(327, 'Es un formato de video', 82, 0),
(328, 'Es un formato de documento', 82, 0),
(329, 'Desarrollar aplicaciones multiplataforma', 83, 1),
(330, 'Crear presentaciones de diapositivas', 83, 0),
(331, 'Diseñar páginas web', 83, 0),
(332, 'Controlar el hardware de una computadora', 83, 0),
(333, 'Protocolo de Internet', 84, 1),
(334, 'Identificación Personal', 84, 0),
(335, 'Interfaz de Programación', 84, 0),
(336, 'Información Privada', 84, 0),
(337, 'Google Chrome', 85, 1),
(338, 'Mozilla Firefox', 85, 0),
(339, 'Microsoft Edge', 85, 0),
(340, 'Safari', 85, 0),
(341, 'Es un servidor que traduce nombres de dominio a direcciones IP', 86, 1),
(342, 'Es un servidor de correo electrónico', 86, 0),
(343, 'Es un servidor de almacenamiento en la nube', 86, 0),
(344, 'Es un servidor de bases de datos', 86, 0),
(345, 'Apple Inc.', 87, 1),
(346, 'Microsoft Corporation', 87, 0),
(347, 'IBM Corporation', 87, 0),
(348, 'Dell Technologies Inc.', 87, 0),
(353, 'Android', 89, 1),
(354, 'iOS', 89, 0),
(355, 'Windows', 89, 0),
(356, 'Linux', 89, 0),
(361, 'CPU', 91, 1),
(362, 'RAM', 91, 0),
(363, 'GPU', 91, 0),
(364, 'BIOS', 91, 0),
(369, 'RPG (Role-Playing Game)', 93, 1),
(370, 'FPS (First-Person Shooter)', 93, 0),
(371, 'MMORPG (Massively Multiplayer Online Role-Playing Game)', 93, 0),
(372, 'Racing', 93, 0),
(373, 'Markus Persson', 94, 1),
(374, 'Todd Howard', 94, 0),
(375, 'Hideo Kojima', 94, 0),
(376, 'Shigeru Miyamoto', 94, 0),
(381, 'Java', 96, 1),
(382, 'C++', 96, 0),
(383, 'Swift', 96, 0),
(384, 'JavaScript', 96, 0),
(389, 'Google Chrome', 98, 1),
(390, 'Mozilla Firefox', 98, 0),
(391, 'Microsoft Edge', 98, 0),
(392, 'Safari', 98, 0),
(393, 'Es un archivo comprimido que contiene uno o varios archivos', 99, 1),
(394, 'Es un archivo de audio', 99, 0),
(395, 'Es un tipo de documento de texto', 99, 0),
(396, 'Es un archivo ejecutable', 99, 0),
(397, 'Realizar cálculos y procesar datos', 100, 1),
(398, 'Almacenar datos a largo plazo', 100, 0),
(399, 'Controlar dispositivos de entrada y salida', 100, 0),
(400, 'Interpretar instrucciones de usuario', 100, 0),
(401, 'Es el elemento más pequeño de una imagen digital', 101, 1),
(402, 'Es una unidad de medida de velocidad de procesamiento', 101, 0),
(403, 'Es una unidad de almacenamiento', 101, 0),
(404, 'Es una medida de resolución de pantalla', 101, 0),
(409, 'Hypertext Transfer Protocol', 103, 1),
(410, 'Hyperlink Transfer Protocol', 103, 0),
(411, 'High Tech Transfer Protocol', 103, 0),
(412, 'Home Tool Transfer Protocol', 103, 0),
(413, 'macOS', 104, 1),
(414, 'OS X', 104, 0),
(415, 'macOS Sierra', 104, 0),
(416, 'OS X El Capitan', 104, 0),
(417, 'Es una tecnología de comunicación inalámbrica', 105, 1),
(418, 'Es una interfaz de usuario gráfica', 105, 0),
(419, 'Es un tipo de unidad de almacenamiento', 105, 0),
(420, 'Es un dispositivo de entrada', 105, 0),
(421, 'Solid Snake', 106, 1),
(422, 'Big Boss', 106, 0),
(423, 'Liquid Snake', 106, 0),
(424, 'Venom Snake', 106, 0),
(465, 'GPU (Unidad de Procesamiento Gráfico)', 150, 1),
(466, 'CPU (Unidad Central de Procesamiento)', 150, 0),
(467, 'RAM (Memoria de Acceso Aleatorio)', 150, 0),
(468, 'HDD (Disco Duro)', 150, 0),
(469, 'Random Access Memory', 151, 1),
(470, 'Read-Only Memory', 151, 0),
(471, 'Run-Length Encoding', 151, 0),
(472, 'Real-time Audio Mixing', 151, 0),
(473, 'Proporcionar un sistema operativo de código abierto para dispositivos móviles', 152, 0),
(474, 'Facilitar la gestión de bases de datos en dispositivos móviles', 152, 0),
(475, 'Proporcionar una plataforma para el desarrollo de aplicaciones móviles', 152, 1),
(476, 'Optimizar el rendimiento de la batería en dispositivos móviles', 152, 0),
(477, 'Linus Torvalds', 153, 0),
(478, 'Tim Berners-Lee', 153, 0),
(479, 'Dennis Ritchie', 153, 1),
(480, 'Ada Lovelace', 153, 0),
(481, 'File Transfer Protocol', 154, 1),
(482, 'Full Text Processing', 154, 0),
(483, 'File Type Protection', 154, 0),
(484, 'Frontend Testing Protocol', 154, 0),
(485, 'Swift', 155, 1),
(486, 'Java', 155, 0),
(487, 'Python', 155, 0),
(488, 'C++', 155, 0),
(489, 'Gestionar el tiempo de ejecución de procesos en tiempo real', 156, 1),
(490, 'Optimizar el rendimiento de juegos en línea', 156, 0),
(491, 'Crear interfaces de usuario atractivas', 156, 0),
(492, 'Facilitar la programación web', 156, 0),
(493, 'Almacenamiento de datos en dispositivos físicos', 157, 0),
(494, 'Almacenamiento de datos en servidores remotos accesibles a través de Internet', 157, 1),
(495, 'Almacenamiento de datos en discos ópticos', 157, 0),
(496, 'Almacenamiento de datos en cintas magnéticas', 157, 0),
(497, 'Jeff Bezos', 158, 1),
(498, 'Elon Musk', 158, 0),
(499, 'Mark Zuckerberg', 158, 0),
(500, 'Tim Cook', 158, 0),
(501, 'Controlar y gestionar cambios en el desarrollo de software', 159, 1),
(502, 'Optimizar el rendimiento de videojuegos', 159, 0),
(503, 'Facilitar la visualización de archivos multimedia', 159, 0),
(504, 'Automatizar procesos de diseño gráfico', 159, 0),
(505, 'Software diseñado para detectar y eliminar virus informáticos', 160, 1),
(506, 'Software para editar videos', 160, 0),
(507, 'Software para gestionar bases de datos', 160, 0),
(508, 'Software de diseño gráfico', 160, 0),
(509, 'Facilitar la conexión de una computadora a una red', 161, 1),
(510, 'Mejorar la calidad de imagen en una pantalla', 161, 0),
(511, 'Optimizar el rendimiento del procesador', 161, 0),
(512, 'Facilitar la instalación de nuevos programas', 161, 0),
(517, 'Firefox', 163, 1),
(518, 'Chrome', 163, 0),
(519, 'Safari', 163, 0),
(520, 'Edge', 163, 0),
(521, 'Software cuyo código fuente es accesible y modificable por cualquier persona', 164, 1),
(522, 'Software con licencia propietaria', 164, 0),
(523, 'Software diseñado exclusivamente para sistemas Windows', 164, 0),
(524, 'Software sin interfaz gráfica de usuario', 164, 0),
(525, 'Transmisión de datos de alta definición y audio entre dispositivos', 165, 1),
(526, 'Conexión a Internet de alta velocidad', 165, 0),
(527, 'Conexión inalámbrica a dispositivos móviles', 165, 0),
(528, 'Conexión a redes sociales', 165, 0),
(529, 'Un servidor especializado en la gestión y transferencia de correos electrónicos', 166, 1),
(530, 'Un servidor de almacenamiento en la nube', 166, 0),
(531, 'Un servidor de transmisión de videojuegos', 166, 0),
(532, 'Un servidor de base de datos', 166, 0),
(537, 'Software para modificar visualmente imágenes digitales', 168, 1),
(538, 'Software para enviar mensajes de texto en tiempo real', 168, 0),
(539, 'Software para grabar y editar música', 168, 0),
(540, 'Software para programar aplicaciones móviles', 168, 0),
(541, 'Larry Page', 169, 1),
(542, 'Elon Musk', 169, 0),
(543, 'Mark Zuckerberg', 169, 0),
(544, 'Jeff Bezos', 169, 0),
(545, 'Structured Query Language', 170, 1),
(546, 'System Quality Level', 170, 0),
(547, 'Software Quality Logic', 170, 0),
(548, 'System Question Language', 170, 0),
(549, 'Organizar y gestionar archivos en un sistema de almacenamiento', 171, 1),
(550, 'Optimizar el rendimiento de programas de edición de video', 171, 0),
(551, 'Mejorar la velocidad de conexión a Internet', 171, 0),
(552, 'Facilitar la navegación por internet', 171, 0),
(553, 'Software para realizar cálculos y análisis de datos en formato de tabla', 172, 1),
(554, 'Software para crear y editar gráficos vectoriales', 172, 0),
(555, 'Software para grabar y editar audio', 172, 0),
(556, 'Software para programar aplicaciones móviles', 172, 0),
(557, 'Linus Torvalds', 173, 1),
(558, 'Richard Stallman', 173, 0),
(559, 'Tim Berners-Lee', 173, 0),
(560, 'Larry Page', 173, 0),
(561, 'Software para enviar mensajes de texto en tiempo real', 174, 1),
(562, 'Software para grabar y editar música', 174, 0),
(563, 'Software para realizar cálculos y análisis de datos en formato de tabla', 174, 0),
(564, 'Software para programar aplicaciones móviles', 174, 0),
(565, 'Conectar una computadora a una red local o de área extensa', 175, 1),
(566, 'Mejorar la calidad de imagen en una pantalla', 175, 0),
(567, 'Conectar una impresora a una computadora', 175, 0),
(568, 'Facilitar la conexión de dispositivos Bluetooth', 175, 0),
(569, 'Virtual Private Network', 176, 1),
(570, 'Virtual Personal Network', 176, 0),
(571, 'Very Private Network', 176, 0),
(572, 'Visual Processing Node', 176, 0),
(573, 'Ken Thompson', 177, 1),
(574, 'Linus Torvalds', 177, 0),
(575, 'Richard Stallman', 177, 0),
(576, 'Dennis Ritchie', 177, 0),
(577, 'Software para crear y editar gráficos y diseños visuales', 178, 1),
(578, 'Software para gestionar proyectos de construcción', 178, 0),
(579, 'Software para programar aplicaciones móviles', 178, 0),
(580, 'Software para grabar y editar música', 178, 0),
(581, 'Organizar y gestionar tareas y recursos en un proyecto', 179, 1),
(582, 'Optimizar el rendimiento de videojuegos', 179, 0),
(583, 'Facilitar la edición de videos', 179, 0),
(584, 'Mejorar la seguridad informática', 179, 0),
(585, 'Hypertext Markup Language 5', 180, 1),
(586, 'High-Level Text Markup Language 5', 180, 0),
(587, 'Hyper Transfer Markup Language 5', 180, 0),
(588, 'Hyperlink and Text Markup Language 5', 180, 0),
(593, 'Software para reproducir y gestionar archivos de música', 182, 1),
(594, 'Software para editar videos', 182, 0),
(595, 'Software para enviar mensajes de texto en tiempo real', 182, 0),
(596, 'Software para grabar y editar música', 182, 0),
(597, 'Conectar dispositivos y transferir datos entre ellos', 183, 1),
(598, 'Optimizar el rendimiento de videojuegos', 183, 0),
(599, 'Facilitar la conexión a internet', 183, 0),
(600, 'Conectar dispositivos Bluetooth', 183, 0),
(601, 'Application Programming Interface', 184, 1),
(602, 'Advanced Programming Interface', 184, 0),
(603, 'Automated Processing Interface', 184, 0),
(604, 'Audio Production Interface', 184, 0),
(605, 'Jack Dorsey', 185, 1),
(606, 'Elon Musk', 185, 0),
(607, 'Mark Zuckerberg', 185, 0),
(608, 'Jeff Bezos', 185, 0),
(609, 'Software para crear y editar documentos de texto', 186, 1),
(610, 'Software para grabar y editar música', 186, 0),
(611, 'Software para enviar mensajes de texto en tiempo real', 186, 0),
(612, 'Software para programar aplicaciones móviles', 186, 0),
(613, 'Gestionar y organizar contenido digital de manera eficiente', 187, 1),
(614, 'Optimizar el rendimiento de videojuegos', 187, 0),
(615, 'Facilitar la conexión a internet', 187, 0),
(616, 'Conectar dispositivos Bluetooth', 187, 0),
(621, 'Jan Koum', 189, 1),
(622, 'Elon Musk', 189, 0),
(623, 'Mark Zuckerberg', 189, 0),
(624, 'Jeff Bezos', 189, 0),
(625, 'Software diseñado para detectar y eliminar amenazas de seguridad en sistemas informáticos', 190, 1),
(626, 'Software para gestionar bases de datos', 190, 0),
(627, 'Software para programar aplicaciones móviles', 190, 0),
(628, 'Software para reproducir y gestionar archivos de música', 190, 0),
(630, 'Facilitar el desarrollo rápido y eficiente de software', 201, 1),
(631, 'Gestionar la seguridad de dispositivos móviles', 201, 0),
(632, 'Optimizar la velocidad de navegación en internet', 201, 0),
(633, 'Automatizar tareas administrativas en servidores', 201, 0),
(634, 'CPU (Unidad Central de Procesamiento)', 202, 1),
(635, 'RAM (Memoria de Acceso Aleatorio)', 202, 0),
(636, 'GPU (Unidad de Procesamiento Gráfico)', 202, 0),
(637, 'HDD (Disco Duro)', 202, 0),
(638, 'Bill Gates', 203, 1),
(639, 'Steve Jobs', 203, 0),
(640, 'Elon Musk', 203, 0),
(641, 'Mark Zuckerberg', 203, 0),
(642, 'Organizar y gestionar archivos en un sistema de almacenamiento', 204, 1),
(643, 'Optimizar el rendimiento de programas de edición de video', 204, 0),
(644, 'Mejorar la velocidad de conexión a Internet', 204, 0),
(645, 'Facilitar la navegación por Internet', 204, 0),
(650, 'Steve Wozniak', 206, 1),
(651, 'Larry Page', 206, 0),
(652, 'Mark Zuckerberg', 206, 0),
(653, 'Elon Musk', 206, 0),
(654, 'Convertir voz a texto para comandos y escritura', 207, 1),
(655, 'Optimizar la reproducción de archivos de audio', 207, 0),
(656, 'Facilitar la creación de efectos de sonido en videojuegos', 207, 0),
(657, 'Mejorar la calidad de grabación en estudios de grabación', 207, 0),
(658, 'Intento de obtención de información confidencial mediante engaño', 208, 1),
(659, 'Programa antivirus para eliminar amenazas en la red', 208, 0),
(660, 'Método para optimizar la velocidad de navegación en internet', 208, 0),
(661, 'Proceso de creación de copias de seguridad automáticas', 208, 0),
(662, 'Ken Thompson', 209, 1),
(663, 'Linus Torvalds', 209, 0),
(664, 'Richard Stallman', 209, 0),
(665, 'Dennis Ritchie', 209, 0),
(666, 'Bill Gates', 210, 1),
(667, 'Steve Jobs', 210, 0),
(668, 'Elon Musk', 210, 0),
(669, 'Mark Zuckerberg', 210, 0),
(674, 'Transferir correos electrónicos salientes', 212, 1),
(675, 'Encriptar archivos en una red', 212, 0),
(676, 'Recopilar datos para análisis de mercado', 212, 0),
(677, 'Optimizar la velocidad de conexión a Internet', 212, 0),
(678, 'Content Delivery Network', 213, 1),
(679, 'Centralized Data Network', 213, 0),
(680, 'Computer Domain Name', 213, 0),
(681, 'Customer Data Network', 213, 0),
(682, 'Reed Hastings', 214, 1),
(683, 'Mark Zuckerberg', 214, 0),
(684, 'Jeff Bezos', 214, 0),
(685, 'Elon Musk', 214, 0),
(686, 'Protocolo de Transferencia de Hipertexto', 215, 1),
(687, 'Protocolo de Seguridad de Navegación', 215, 0),
(688, 'Protocolo de Transferencia de Archivos', 215, 0),
(689, 'Protocolo de Red de Alta Velocidad', 215, 0),
(690, 'Redundant Array of Independent Disks', 216, 1),
(691, 'Random Access Information Devices', 216, 0),
(692, 'Remote Access and Input Devices', 216, 0),
(693, 'Rapid Access to Information and Data', 216, 0),
(694, 'JavaScript', 217, 1),
(695, 'Java', 217, 0),
(696, 'Python', 217, 0),
(697, 'C++', 217, 0),
(698, 'Programa que permite a la computadora comunicarse con periféricos', 218, 1),
(699, 'Software para editar videos', 218, 0),
(700, 'Herramienta de diseño gráfico', 218, 0),
(701, 'Aplicación para realizar cálculos matemáticos', 218, 0),
(702, 'John Warnock', 219, 1),
(703, 'Larry Page', 219, 0),
(704, 'Mark Zuckerberg', 219, 0),
(705, 'Elon Musk', 219, 0),
(706, 'Gestor de contraseñas', 220, 1),
(707, 'Programa de edición de imágenes', 220, 0),
(708, 'Sistema operativo para dispositivos móviles', 220, 0),
(709, 'Herramienta de programación web', 220, 0),
(710, 'File Transfer Protocol', 221, 1),
(711, 'Fast Transmission Process', 221, 0),
(712, 'File Type Protection', 221, 0),
(713, 'Frontend Testing Protocol', 221, 0),
(714, 'Red privada virtual', 222, 1),
(715, 'Red personal virtual', 222, 0),
(716, 'Registro de programas visuales', 222, 0),
(717, 'Red de procesamiento visual', 222, 0),
(718, 'Alan Turing', 223, 1),
(719, 'Larry Page', 223, 0),
(720, 'Elon Musk', 223, 0),
(721, 'Mark Zuckerberg', 223, 0),
(722, 'Central Processing Unit', 224, 1),
(723, 'Central Process Unit', 224, 0),
(724, 'Computer Processing Unit', 224, 0),
(725, 'Central Processor Unit', 224, 0),
(726, 'Detectar y prevenir intrusiones en un sistema informático', 225, 1),
(727, 'Optimizar el rendimiento de videojuegos', 225, 0),
(728, 'Analizar patrones climáticos', 225, 0),
(729, 'Buscar y eliminar virus informáticos', 225, 0),
(730, 'Virtual Private Network', 226, 1),
(731, 'Visual Processing Node', 226, 0),
(732, 'Virtual Personal Network', 226, 0),
(733, 'Very Private Network', 226, 0),
(734, 'Robert Noyce', 227, 1),
(735, 'Bill Gates', 227, 0),
(736, 'Larry Page', 227, 0),
(737, 'Mark Zuckerberg', 227, 0),
(738, 'Sistema de archivos optimizado para dispositivos de almacenamiento grandes', 228, 1),
(739, 'Sistema de archivos utilizado en sistemas Linux', 228, 0),
(740, 'Sistema de archivos para discos duros externos', 228, 0),
(741, 'Sistema de archivos diseñado para almacenamiento en la nube', 228, 0),
(742, 'Software que emula el comportamiento de otro sistema o dispositivo', 229, 1),
(743, 'Programa de emulación de redes sociales', 229, 0),
(744, 'Herramienta de emulación de interfaces gráficas', 229, 0),
(745, 'Software para emular la velocidad del procesador', 229, 0),
(746, 'Java', 230, 1),
(747, 'JavaScript', 230, 0),
(748, 'Python', 230, 0),
(749, 'C#', 230, 0),
(750, 'Application Programming Interface', 231, 1),
(751, 'Advanced Programming Interface', 231, 0),
(752, 'Automated Processing Interface', 231, 0),
(753, 'Audio Production Interface', 231, 0),
(754, 'Ken Thompson', 232, 1),
(755, 'Linus Torvalds', 232, 0),
(756, 'Richard Stallman', 232, 0),
(757, 'Dennis Ritchie', 232, 0),
(758, 'Evitar el acceso no autorizado a una red o sistema informático', 233, 1),
(759, 'Mejorar la velocidad de conexión a Internet', 233, 0),
(760, 'Optimizar el rendimiento de videojuegos', 233, 0),
(761, 'Detectar y eliminar virus informáticos', 233, 0),
(762, 'Entorno de simulación que imita la realidad', 234, 1),
(763, 'Simulación de eventos históricos', 234, 0),
(764, 'Juego de realidad aumentada', 234, 0),
(765, 'Herramienta de diseño gráfico 3D', 234, 0),
(766, 'Unidad Central de Procesamiento', 235, 1),
(767, 'Unidad de Control de Procesos', 235, 0),
(768, 'Unidad de Cálculo y Procesamiento', 235, 0),
(769, 'Unidad de Computación Personal', 235, 0),
(774, 'Garantizar la entrega de datos sin pérdida y en orden', 237, 1),
(775, 'Optimizar la velocidad de conexión a Internet', 237, 0),
(776, 'Controlar el acceso a una red privada', 237, 0),
(777, 'Facilitar la transmisión de videojuegos en línea', 237, 0),
(778, 'Internet of Things', 238, 1),
(779, 'Input/Output Technology', 238, 0),
(780, 'Integrated Online Tools', 238, 0),
(781, 'Intelligent Output Techniques', 238, 0),
(782, 'James Gosling', 239, 1),
(783, 'Larry Page', 239, 0),
(784, 'Mark Zuckerberg', 239, 0),
(785, 'Elon Musk', 239, 0),
(786, 'Mejorar el rendimiento y eficiencia del sistema', 240, 1),
(787, 'Optimizar la velocidad de conexión a Internet', 240, 0),
(788, 'Programa de edición de video', 240, 0),
(789, 'Herramienta de diseño gráfico', 240, 0),
(790, 'Sistema para administrar y ofrecer cursos en línea', 241, 1),
(791, 'Herramienta de diseño asistido por computadora', 241, 0),
(792, 'Programa de edición de música', 241, 0),
(793, 'Software de gestión de proyectos', 241, 0),
(798, 'Reconocimiento óptico de caracteres', 243, 1),
(799, 'Reproducción de video en alta definición', 243, 0),
(800, 'Registro de objetos conectados', 243, 0),
(801, 'Reducción de opciones en un menú', 243, 0),
(802, 'C++', 244, 1),
(803, 'Java', 244, 0),
(804, 'Python', 244, 0),
(805, 'JavaScript', 244, 0),
(810, 'Paul Allen', 246, 1),
(811, 'Steve Wozniak', 246, 0),
(812, 'Larry Page', 246, 0),
(813, 'Mark Zuckerberg', 246, 0),
(814, 'Reducir el tamaño de archivos para ahorrar espacio de almacenamiento', 247, 1),
(815, 'Recuperar archivos eliminados accidentalmente', 247, 0),
(816, 'Modificar el código fuente de un programa', 247, 0),
(817, 'Proteger una red de acceso no autorizado', 247, 0),
(818, 'Tipo de software malicioso que secuestra datos y exige un rescate', 248, 1),
(819, 'Programa de encriptación de archivos', 248, 0),
(820, 'Software de seguridad informática', 248, 0),
(821, 'Herramienta de compresión de archivos', 248, 0),
(822, 'Alan Turing', 249, 1),
(823, 'John von Neumann', 249, 0),
(824, 'Claude Shannon', 249, 0),
(825, 'Grace Hopper', 249, 0),
(826, 'Jerry Sanders', 250, 1),
(827, 'Gordon Moore', 250, 0),
(828, 'Larry Page', 250, 0),
(829, 'Elon Musk', 250, 0),
(830, 'Sistema de gestión de bases de datos que no utiliza el modelo relacional', 251, 1),
(831, 'Sistema de gestión de bases de datos para grandes empresas', 251, 0),
(832, 'Sistema de gestión de bases de datos para aplicaciones móviles', 251, 0),
(833, 'Software de diseño gráfico en 3D', 251, 0),
(834, 'Post Office Protocol', 252, 1),
(835, 'Private Output Protocol', 252, 0),
(836, 'Personalized Operating Process', 252, 0),
(837, 'Public Online Platform', 252, 0),
(838, 'Local Area Network', 253, 1),
(839, 'Large Array Network', 253, 0),
(840, 'Low-latency Access Network', 253, 0),
(841, 'Laser Adapter Node', 253, 0),
(842, 'Sergey Brin', 254, 1),
(843, 'Larry Page', 254, 0),
(844, 'Mark Zuckerberg', 254, 0),
(845, 'Elon Musk', 254, 0),
(846, 'Editar y mejorar archivos de audio', 255, 1),
(847, 'Optimizar la velocidad de conexión a Internet', 255, 0),
(848, 'Programar aplicaciones móviles', 255, 0),
(849, 'Analizar patrones climáticos', 255, 0),
(850, 'Identificar formas y estructuras en conjuntos de datos', 256, 1),
(851, 'Reconocer patrones climáticos', 256, 0),
(852, 'Analizar datos estadísticos', 256, 0),
(853, 'Optimizar la velocidad de conexión a Internet', 256, 0),
(854, 'Python', 257, 1),
(855, 'Java', 257, 0),
(856, 'JavaScript', 257, 0),
(857, 'C++', 257, 0),
(862, 'David Deutsch', 259, 1),
(863, 'Richard Feynman', 259, 0),
(864, 'John von Neumann', 259, 0),
(865, 'David Deutsch', 259, 0),
(866, 'Facilitar la planificación, ejecución y control de proyectos', 260, 1),
(867, 'Optimizar la velocidad de conexión a Internet', 260, 0),
(868, 'Desarrollar aplicaciones móviles', 260, 0),
(869, 'Editar y mejorar archivos de audio', 260, 0),
(870, 'Software para diseñar modelos tridimensionales en computadora', 261, 1),
(871, 'Programa para escribir código fuente', 261, 0),
(872, 'Herramienta de edición de video', 261, 0),
(873, 'Sistema de gestión de bases de datos', 261, 0),
(874, 'Hasso Plattner', 262, 1),
(875, 'Larry Page', 262, 0),
(876, 'Mark Zuckerberg', 262, 0),
(877, 'Elon Musk', 262, 0),
(878, 'Sistema para organizar y gestionar contenidos empresariales', 263, 1),
(879, 'Herramienta de diseño gráfico en 3D', 263, 0),
(880, 'Programa de edición de audio', 263, 0),
(881, 'Software de reconocimiento facial', 263, 0),
(894, 'Analizar grandes conjuntos de datos para obtener información', 267, 1),
(895, 'Optimizar la velocidad de conexión a Internet', 267, 0),
(896, 'Programar aplicaciones móviles', 267, 0),
(897, 'Editar y mejorar archivos de audio', 267, 0),
(898, 'Modelo de prestación de servicios de computación a través de Internet', 268, 1),
(899, 'Modelo de procesamiento de datos distribuido', 268, 0),
(900, 'Modelo de desarrollo de software en la nube', 268, 0),
(901, 'Modelo de acceso remoto a servidores', 268, 0),
(902, 'CPU (Unidad Central de Procesamiento)', 269, 1),
(903, 'RAM (Memoria de Acceso Aleatorio)', 269, 0),
(904, 'GPU (Unidad de Procesamiento Gráfico)', 269, 0),
(905, 'HDD (Disco Duro)', 269, 0),
(906, 'Rasmus Lerdorf', 270, 1),
(907, 'Larry Page', 270, 0),
(908, 'Mark Zuckerberg', 270, 0),
(909, 'Elon Musk', 270, 0),
(910, 'Internet Message Access Protocol', 271, 1),
(911, 'Interactive Messaging Application Process', 271, 0),
(912, 'Integrated Media Advertising Platform', 271, 0),
(913, 'Internet Mail and Attachment Processing', 271, 0),
(914, 'Código de respuesta rápida', 272, 1),
(915, 'Código de redirección de consultas', 272, 0),
(916, 'Código de registro de preguntas', 272, 0),
(917, 'Código de reserva de productos', 272, 0),
(918, 'Mitchell Baker', 273, 1),
(919, 'Larry Page', 273, 0),
(920, 'Mark Zuckerberg', 273, 0),
(921, 'Elon Musk', 273, 0),
(922, 'Restringir el acceso a contenido inapropiado para ciertas edades', 274, 1),
(923, 'Optimizar la velocidad de conexión a Internet', 274, 0),
(924, 'Mejorar la calidad de imágenes en juegos', 274, 0),
(925, 'Programar aplicaciones móviles', 274, 0),
(926, 'Crear imágenes tridimensionales a partir de modelos 3D', 275, 1),
(927, 'Editar y mejorar archivos de audio', 275, 0),
(928, 'Optimizar la velocidad de conexión a Internet', 275, 0),
(929, 'Desarrollar aplicaciones móviles', 275, 0),
(930, 'Java', 276, 1),
(931, 'JavaScript', 276, 0),
(932, 'Python', 276, 0),
(933, 'C++', 276, 0),
(938, 'Claude Shannon', 278, 1),
(939, 'Alan Turing', 278, 0),
(940, 'John von Neumann', 278, 0),
(941, 'Grace Hopper', 278, 0),
(942, 'Optimizar y automatizar los procesos empresariales', 279, 1),
(943, 'Mejorar la velocidad de conexión a Internet', 279, 0),
(944, 'Crear y gestionar bases de datos', 279, 0),
(945, 'Desarrollar aplicaciones móviles', 279, 0),
(946, 'Identificar y corregir vulnerabilidades en sistemas informáticos', 280, 1),
(947, 'Optimizar la velocidad de conexión a Internet', 280, 0),
(948, 'Desarrollar aplicaciones móviles', 280, 0),
(949, 'Crear y gestionar bases de datos', 280, 0),
(950, 'Un concepto que permite a una función llamarse a sí misma', 281, 1),
(951, 'Un tipo de dato en programación', 281, 0),
(952, 'Un error común en el desarrollo de software', 281, 0),
(953, 'Un término utilizado en bases de datos', 281, 0),
(954, 'Un enfoque que utiliza bucles para repetir un bloque de código', 282, 1),
(955, 'Un principio de diseño en la ingeniería de software', 282, 0),
(956, 'Una técnica para resolver problemas matemáticos', 282, 0),
(957, 'Una función en programación que se ejecuta una vez', 282, 0),
(958, 'Un chip en la placa madre que conecta la CPU con la memoria RAM', 283, 1),
(959, 'Una interfaz de red inalámbrica', 283, 0),
(960, 'Un dispositivo de almacenamiento externo', 283, 0),
(961, 'Un componente de la tarjeta gráfica', 283, 0),
(962, 'Un chip en la placa madre que gestiona dispositivos de entrada/salida', 284, 1),
(963, 'Una tecnología de conexión de periféricos', 284, 0),
(964, 'Una herramienta de diagnóstico de hardware', 284, 0),
(965, 'Un componente de la tarjeta de sonido', 284, 0),
(966, 'Una API de Java para interactuar con bases de datos relacionales', 285, 1),
(967, 'Un formato de archivo utilizado para almacenar datos', 285, 0),
(968, 'Una técnica de compresión de datos', 285, 0),
(969, 'Un estándar de seguridad informática', 285, 0),
(970, 'Una tecnología que permite la comunicación sin cables', 286, 1),
(971, 'Un tipo de cable utilizado en redes de computadoras', 286, 0),
(972, 'Un software para gestionar redes de área local', 286, 0),
(973, 'Una técnica de compresión de datos', 286, 0),
(974, 'Plataformas y aventura', 287, 1),
(975, 'Disparos en primera persona', 287, 0),
(976, 'Juegos de rol', 287, 0),
(977, 'Juegos de estrategia', 287, 0),
(978, 'El Caballero Vacío', 288, 1),
(979, 'El Rey Pálido', 288, 0),
(980, 'El Cazador de Sueños', 288, 0),
(981, 'El Vagabundo', 288, 0),
(982, 'Un videojuego de realidad virtual de ritmo y música', 289, 1),
(983, 'Una herramienta de edición de música', 289, 0),
(984, 'Una red social para músicos', 289, 0),
(985, 'Un dispositivo de grabación de audio', 289, 0),
(986, 'Albergar y proteger los componentes internos de un ordenador', 290, 1),
(987, 'Proporcionar energía eléctrica al ordenador', 290, 0),
(988, 'Administrar la conexión a internet del ordenador', 290, 0),
(989, 'Controlar el rendimiento del procesador del ordenador', 290, 0),
(990, 'Un thread es una secuencia de ejecución que permite realizar tareas simultáneas en un programa Java, facilitando la concurrencia.', 291, 1),
(991, 'Un thread es un componente gráfico utilizado en interfaces de usuario Java para interactuar con el usuario.', 291, 0),
(992, 'Un thread es un error común de programación en Java que puede causar bloqueos en la ejecución del programa.', 291, 0),
(993, 'Un thread es un tipo de dato utilizado en Java para almacenar valores numéricos.', 291, 0),
(994, 'La llamada al sistema fork() crea un nuevo proceso hijo, que es una copia exacta del proceso padre.', 292, 1),
(995, 'La llamada al sistema fork() finaliza el proceso actual y libera los recursos del sistema.', 292, 0),
(996, 'La llamada al sistema fork() permite la comunicación entre procesos mediante la creación de tuberías.', 292, 0),
(997, 'La llamada al sistema fork() controla el acceso a los dispositivos de entrada y salida en el sistema operativo.', 292, 0),
(998, 'Los Watts representan la potencia máxima que el cargador puede suministrar al portátil.', 293, 1),
(999, 'Los Watts representan la capacidad de almacenamiento de energía del cargador.', 293, 0),
(1000, 'Los Watts representan la velocidad de carga del portátil.', 293, 0),
(1001, 'Los Watts representan la duración de la batería del portátil.', 293, 0),
(1002, 'Odoo es un sistema de gestión empresarial (ERP) de código abierto que se utiliza para gestionar diversas operaciones comerciales, como ventas, inventario, contabilidad y recursos humanos.', 294, 1),
(1003, 'Odoo es un software de diseño gráfico utilizado para crear logotipos y gráficos publicitarios.', 294, 0),
(1004, 'Odoo es un lenguaje de programación utilizado para desarrollar aplicaciones móviles.', 294, 0),
(1005, 'Odoo es un sistema operativo de código abierto similar a Linux.', 294, 0),
(1006, 'NetBeans es un entorno de desarrollo integrado (IDE) que se utiliza principalmente para desarrollar aplicaciones en Java, pero también es compatible con otros lenguajes de programación como PHP y HTML5.', 295, 1),
(1007, 'NetBeans es un programa de edición de imágenes y fotos similar a Adobe Photoshop.', 295, 0),
(1008, 'NetBeans es un software de contabilidad utilizado para gestionar las finanzas de una empresa.', 295, 0),
(1009, 'NetBeans es un navegador web desarrollado por Oracle Corporation.', 295, 0),
(1010, 'El networking se utiliza para la interconexión de dispositivos y sistemas informáticos con el fin de compartir recursos, como archivos, impresoras y conexiones a internet.', 296, 1),
(1011, 'El networking se utiliza para diseñar interfaces gráficas de usuario en aplicaciones web.', 296, 0),
(1012, 'El networking se utiliza para la creación de animaciones en 3D.', 296, 0),
(1013, 'El networking se utiliza para la edición de videos y películas.', 296, 0),
(1014, 'Un periférico es un dispositivo externo conectado a una computadora que amplía sus capacidades de entrada, salida o almacenamiento de datos.', 297, 1),
(1015, 'Un periférico es un componente interno de una computadora que procesa la información.', 297, 0),
(1016, 'Un periférico es un software utilizado para proteger la computadora de virus y malware.', 297, 0),
(1017, 'Un periférico es un sistema operativo utilizado para gestionar recursos de hardware.', 297, 0),
(1018, 'Mewtwo', 298, 1),
(1019, 'Dragonite', 298, 0),
(1020, 'Tyranitar', 298, 0),
(1021, 'Groudon', 298, 0),
(1022, 'Los periféricos de entrada permiten al usuario introducir datos en el sistema, los de salida muestran la información procesada por la computadora, y los de entrada/salida pueden realizar ambas funciones.', 299, 1),
(1023, 'Los periféricos de entrada son los dispositivos de almacenamiento, los de salida son los dispositivos de entrada y los de entrada/salida son los dispositivos de comunicación.', 299, 0),
(1024, 'Los periféricos de entrada muestran información en la pantalla, los de salida permiten al usuario introducir datos y los de entrada/salida realizan operaciones de cálculo.', 299, 0),
(1025, 'Los periféricos de entrada controlan la velocidad del sistema, los de salida almacenan datos y los de entrada/salida gestionan la seguridad del sistema.', 299, 0),
(1026, 'La arquitectura de Von Neumann es un modelo de diseño de computadoras que utiliza una unidad de procesamiento, una unidad de control, una memoria de almacenamiento y un bus de datos y de direcciones.', 300, 1),
(1027, 'La arquitectura de Von Neumann es un tipo de red de área local utilizado en entornos empresariales.', 300, 0),
(1028, 'La arquitectura de Von Neumann es un sistema operativo desarrollado por la empresa IBM.', 300, 0),
(1029, 'La arquitectura de Von Neumann es un algoritmo de compresión de datos utilizado en aplicaciones multimedia.', 300, 0),
(1030, 'Las etiquetas de consumo eléctrico (A, B, C, etc.) en los periféricos de computadora indican su eficiencia energética, siendo A la más eficiente y G la menos eficiente.', 301, 1),
(1031, 'Las etiquetas de consumo eléctrico (A, B, C, etc.) en los periféricos de computadora indican su capacidad de almacenamiento, siendo A la más alta y G la más baja.', 301, 0),
(1032, 'Las etiquetas de consumo eléctrico (A, B, C, etc.) en los periféricos de computadora indican su velocidad de procesamiento, siendo A la más rápida y G la más lenta.', 301, 0),
(1033, 'Las etiquetas de consumo eléctrico (A, B, C, etc.) en los periféricos de computadora indican su resolución de pantalla, siendo A la más alta y G la más baja.', 301, 0),
(1034, 'Tower of Fantasy es un videojuego de rol de acción en línea que combina elementos de fantasía y ciencia ficción, en el que los jugadores exploran una misteriosa torre y enfrentan diversos desafíos y enemigos.', 302, 1),
(1035, 'Tower of Fantasy es un juego de estrategia en tiempo real en el que los jugadores deben construir y defender una torre contra ataques enemigos.', 302, 0),
(1036, 'Tower of Fantasy es un juego de puzles en el que los jugadores deben resolver acertijos dentro de una torre antigua.', 302, 0),
(1037, 'Tower of Fantasy es un juego de deportes extremos en el que los jugadores compiten en una torre de escalada.', 302, 0),
(1038, 'XAMPP es un paquete de software gratuito y de código abierto que facilita la instalación y configuración de un entorno de desarrollo web local.', 303, 1),
(1039, 'XAMPP es un programa de diseño gráfico utilizado para crear gráficos vectoriales.', 303, 0),
(1040, 'XAMPP es un software de gestión de proyectos utilizado para planificar y organizar tareas en equipos de trabajo.', 303, 0),
(1041, 'XAMPP es un sistema operativo desarrollado por Microsoft Corporation.', 303, 0),
(1042, 'RGB en ventiladores de computadora se refiere a la capacidad de estos ventiladores de mostrar diferentes colores mediante luces LED que se pueden controlar para personalizar la estética de la computadora.', 304, 1),
(1043, 'RGB en ventiladores de computadora se refiere a la velocidad de rotación del ventilador, medida en revoluciones por minuto (RPM).', 304, 0),
(1044, 'RGB en ventiladores de computadora se refiere a la resolución de la imagen que se muestra en la pantalla del ordenador.', 304, 0),
(1045, 'RGB en ventiladores de computadora se refiere a la capacidad de conectarse de forma inalámbrica a otros dispositivos de la red.', 304, 0),
(1046, 'Los cascos son dispositivos de audio que cubren toda la oreja, proporcionando aislamiento del sonido externo y una experiencia de audio más inmersiva. Los auriculares son dispositivos más pequeños que se colocan dentro o sobre la oreja, siendo más compact', 305, 1),
(1047, 'No hay diferencia entre cascos y auriculares, ambos términos se refieren al mismo tipo de dispositivo de audio.', 305, 0),
(1048, 'Los cascos son dispositivos de audio diseñados para uso profesional, mientras que los auriculares son dispositivos de audio para uso personal.', 305, 0),
(1049, 'Los cascos son dispositivos de audio inalámbricos, mientras que los auriculares son dispositivos de audio con cable.', 305, 0),
(1050, 'La principal diferencia entre RGB y ARGB es la inclusión de un canal alfa (Alpha) en ARGB, que permite controlar la opacidad de cada LED individualmente.', 306, 1),
(1051, 'RGB y ARGB son términos intercambiables y se refieren al mismo tipo de iluminación LED.', 306, 0),
(1052, 'RGB se refiere a iluminación LED estática, mientras que ARGB se refiere a iluminación LED con efectos dinámicos y animaciones.', 306, 0),
(1053, 'RGB y ARGB se refieren a diferentes sistemas de conexión de iluminación LED, siendo RGB para sistemas con conexión de 3 pines y ARGB para sistemas con conexión de 4 pines.', 306, 0),
(1054, 'SATA significa Serial Advanced Technology Attachment y es un estándar de conexión para dispositivos de almacenamiento, como discos duros y unidades de estado sólido (SSD).', 307, 1),
(1055, 'SATA significa Simple Advanced Transfer Algorithm y es un tipo de algoritmo utilizado para la compresión de archivos en sistemas de almacenamiento.', 307, 0),
(1056, 'SATA significa System Access and Transfer Accelerator y es una tecnología utilizada para mejorar la velocidad de acceso a internet en computadoras.', 307, 0),
(1057, 'SATA significa System Analysis and Technical Assessment y es un software utilizado para evaluar el rendimiento de la memoria RAM en una computadora.', 307, 0),
(1058, 'El jefe final de Dark Souls 3 es Soul of Cinder, una amalgama de los antiguos héroes no muertos que han enlazado el fuego a lo largo del tiempo.', 308, 1),
(1059, 'El jefe final de Dark Souls 3 es Gwyn, Lord of Cinder, el mismo jefe final del primer Dark Souls.', 308, 0),
(1060, 'El jefe final de Dark Souls 3 es Aldrich, Devourer of Gods, un ser devorador de dioses.', 308, 0),
(1061, 'El jefe final de Dark Souls 3 es Nameless King, un antiguo guerrero renegado y hermano de Gwyn, Lord of Cinder.', 308, 0),
(1062, '23', 309, 1),
(1063, '22', 309, 0),
(1064, '18', 309, 0),
(1065, '20', 309, 0),
(1066, 'El mod que agrega torretas defensivas en Minecraft se llama \"Security Craft Mod\".', 310, 1),
(1067, 'El mod que agrega torretas defensivas en Minecraft se llama \"Defense Turret Mod\".', 310, 0),
(1068, 'El mod que agrega torretas defensivas en Minecraft se llama \"Guardian Turret Mod\".', 310, 0),
(1069, 'El mod que agrega torretas defensivas en Minecraft se llama \"Security Turret Mod\".', 310, 0),
(1070, 'Rumble.', 311, 1),
(1071, 'Special Skills.', 311, 0),
(1072, 'Power-Ups.', 311, 0),
(1073, 'Turb\".', 311, 0),
(1074, 'Lester Crest.', 312, 1),
(1075, 'Franklin Clinton.', 312, 0),
(1076, 'Julian Schools.', 312, 0),
(1077, 'Trevor Philips.', 312, 0),
(1078, 'F1 2020.', 313, 1),
(1079, 'F1 2019.', 313, 0),
(1080, 'F1 2018.', 313, 0),
(1081, 'F1 2017.', 313, 0),
(1086, 'The Binding of Isaac es un videojuego de tipo roguelike.', 315, 1),
(1087, 'The Binding of Isaac es un videojuego de acción en tercera persona.', 315, 0),
(1088, 'The Binding of Isaac es un videojuego de estrategia en tiempo real.', 315, 0),
(1089, 'The Binding of Isaac es un videojuego de plataformas de desplazamiento lateral.', 315, 0),
(1094, 'Joel.', 317, 1),
(1095, 'Ethan.', 317, 0),
(1096, 'Tommy.', 317, 0),
(1097, 'Peter.', 317, 0),
(1098, 'Nathan Drake.', 318, 1),
(1099, 'Sam Fisher.', 318, 0),
(1100, 'Lara Croft.', 318, 0),
(1101, 'Joel Miller.', 318, 0),
(1102, 'La serie Call of Duty tiene múltiples entregas, más de 42 en total.', 319, 1),
(1103, 'La serie Call of Duty tiene 32 entregas en total.', 319, 0),
(1104, 'La serie Call of Duty tiene 15 entregas en total.', 319, 0),
(1105, 'La serie Call of Duty tiene 45 entregas en total.', 319, 0),
(1106, 'Advanced Warfare.', 320, 1),
(1107, 'Modern Warfare 2.', 320, 0),
(1108, 'Black Ops.', 320, 0),
(1109, 'World at War.', 320, 0),
(1110, 'Un aimbot es un programa o dispositivo que ayuda a los jugadores a apuntar automáticamente y mejorar su precisión en los videojuegos.', 321, 1),
(1111, 'Un aimbot es un personaje o enemigo jefe en un videojuego que tiene una habilidad especial para apuntar rápidamente a los jugadores.', 321, 0),
(1112, 'Un aimbot es un modo de juego en el que los jugadores compiten entre sí para ver quién puede apuntar y disparar más rápido.', 321, 0),
(1113, 'Un aimbot es un objeto en un videojuego que los jugadores pueden usar para mejorar su precisión al disparar.', 321, 0),
(1114, 'Assassin\'s Creed fue desarrollado por Ubisoft.', 322, 1),
(1115, 'Assassin\'s Creed fue desarrollado por Electronic Arts.', 322, 0),
(1116, 'Assassin\'s Creed fue desarrollado por Rockstar Games.', 322, 0),
(1117, 'Assassin\'s Creed fue desarrollado por Activision.', 322, 0),
(1118, 'El género del videojuego Bagman es de plataformas.', 323, 1),
(1119, 'El género del videojuego Bagman es de disparos en primera persona (FPS).', 323, 0),
(1120, 'El género del videojuego Bagman es de estrategia en tiempo real (RTS).', 323, 0),
(1121, 'El género del videojuego Bagman es de rol (RPG).', 323, 0),
(1122, 'Puedes domesticar dinosaurios en el juego \"ARK: Survival Evolved\".', 324, 1),
(1123, 'Puedes domesticar dinosaurios en el juego \"FIFA\".', 324, 0),
(1124, 'Puedes domesticar dinosaurios en el juego \"Fortnite\".', 324, 0),
(1125, 'Puedes domesticar dinosaurios en el juego \"Call of Duty: Black Ops III\".', 324, 0),
(1126, 'El videojuego más vendido de la historia es \"Minecraft\".', 325, 1),
(1127, 'El videojuego más vendido de la historia es \"Tetris\".', 325, 0),
(1128, 'El videojuego más vendido de la historia es \"Grand Theft Auto V\".', 325, 0),
(1129, 'El videojuego más vendido de la historia es \"Wii Sports\".', 325, 0),
(1130, 'Los tipos de paneles de pantalla más comunes son TN (Twisted Nematic), VA (Vertical Alignment) e IPS (In-Plane Switching).', 326, 1);
INSERT INTO `respostes` (`id_resposta`, `text_resposta`, `id_pregunta`, `correcta`) VALUES
(1131, 'Los tipos de paneles de pantalla más comunes son CRT (Cathode Ray Tube), LED (Light Emitting Diode) y OLED (Organic Light Emitting Diode).', 326, 0),
(1132, 'Los tipos de paneles de pantalla más comunes son HDMI (High-Definition Multimedia Interface), DVI (Digital Visual Interface) y VGA (Video Graphics Array).', 326, 0),
(1133, 'Los tipos de paneles de pantalla más comunes son RGB (Red Green Blue), CMYK (Cyan Magenta Yellow Black) y HSL (Hue Saturation Lightness).', 326, 0),
(1134, 'WinRAR es un programa de compresión de archivos que permite comprimir y descomprimir archivos en varios formatos, como RAR, ZIP y otros.', 327, 1),
(1135, 'WinRAR es un sistema operativo desarrollado por Microsoft Corporation.', 327, 0),
(1136, 'WinRAR es una aplicación de edición de imágenes utilizada para crear y modificar archivos gráficos.', 327, 0),
(1137, 'WinRAR es un navegador web desarrollado por Mozilla Foundation.', 327, 0),
(1138, 'Un teclado de membrana es un tipo de teclado en el que las teclas están formadas por una membrana de goma que se activa al presionarla, generando una señal eléctrica.', 328, 1),
(1139, 'Un teclado de membrana es un tipo de teclado mecánico que utiliza interruptores mecánicos para registrar las pulsaciones de las teclas.', 328, 0),
(1140, 'Un teclado de membrana es un tipo de teclado retroiluminado que utiliza luces LED para iluminar las teclas.', 328, 0),
(1141, 'Un teclado de membrana es un tipo de teclado diseñado para su uso en entornos húmedos o bajo el agua.', 328, 0),
(1142, 'Un teclado mecánico es un tipo de teclado que utiliza interruptores mecánicos debajo de cada tecla para registrar las pulsaciones, ofreciendo una sensación táctil distintiva y una respuesta precisa.', 329, 1),
(1143, 'Un teclado mecánico es un tipo de teclado que utiliza membranas de goma para registrar las pulsaciones de las teclas.', 329, 0),
(1144, 'Un teclado mecánico es un tipo de teclado diseñado específicamente para juegos de mesa y de cartas.', 329, 0),
(1145, 'Un teclado mecánico es un tipo de teclado que utiliza tecnología láser para proyectar las teclas sobre una superficie plana.', 329, 0),
(1146, 'El nombre de la liga europea de League of Legends es \"LEC\" (League of Legends European Championship).', 330, 1),
(1147, 'El nombre de la liga europea de League of Legends es \"EULCS\" (European League of Legends Championship Series).', 330, 0),
(1148, 'El nombre de la liga europea de League of Legends es \"EULCS\" (European Union League of Legends Championship Series).', 330, 0),
(1149, 'El nombre de la liga europea de League of Legends es \"EUW\" (Europe West League of Legends).', 330, 0),
(1150, 'Team Liquid', 331, 1),
(1151, 'Team Fortress', 331, 0),
(1152, 'Team Sonic', 331, 0),
(1153, 'Team Unix', 331, 0),
(1154, 'La bola de los ratones antiguos servía para detectar el movimiento del ratón sobre una superficie.', 332, 1),
(1155, 'La bola de los ratones antiguos servía para controlar la velocidad del puntero en la pantalla del ordenador.', 332, 0),
(1156, 'La bola de los ratones antiguos servía para ajustar la resolución del sensor óptico.', 332, 0),
(1157, 'La bola de los ratones antiguos servía para conectar el ratón al ordenador.', 332, 0),
(1158, 'Los ratones detectan el movimiento a través de un sensor óptico o láser que registra los cambios en la superficie sobre la que se mueve el ratón.', 333, 1),
(1159, 'Los ratones detectan el movimiento mediante una conexión Bluetooth que envía señales al ordenador.', 333, 0),
(1160, 'Los ratones detectan el movimiento a través de un cable que transmite la información de movimiento al ordenador.', 333, 0),
(1161, 'Los ratones detectan el movimiento mediante un sistema de imanes que interactúan con sensores en la alfombrilla.', 333, 0),
(1162, 'Hotswap en los teclados se refiere a la capacidad de intercambiar los interruptores de las teclas sin necesidad de soldar o desoldar componentes.', 334, 1),
(1163, 'Hotswap en los teclados es una función que permite intercambiar el diseño de las teclas de forma dinámica.', 334, 0),
(1164, 'Hotswap en los teclados es una tecnología que previene el sobrecalentamiento de las teclas durante un uso prolongado.', 334, 0),
(1165, 'Hotswap en los teclados es un sistema de iluminación RGB que indica cuándo una tecla ha sido activada.', 334, 0),
(1166, 'Los estabilizadores en los teclados son componentes que ayudan a mantener la estabilidad de las teclas más largas, como la barra espaciadora o las teclas de retroceso.', 335, 1),
(1167, 'Los estabilizadores en los teclados son dispositivos que controlan la velocidad y la sensibilidad de las pulsaciones de teclas para evitar errores de escritura.', 335, 0),
(1168, 'Los estabilizadores en los teclados son luces LED que iluminan las teclas para mejorar la visibilidad en entornos oscuros.', 335, 0),
(1169, 'Los estabilizadores en los teclados son interruptores especiales que proporcionan una sensación táctil única al escribir.', 335, 0),
(1170, 'Hacer Tape Mod en un teclado es una modificación que implica aplicar cinta adhesiva (tape) en ciertas partes de los interruptores para modificar su comportamiento táctil o de sonido.', 336, 1),
(1171, 'Hacer Tape Mod en un teclado es una técnica para mejorar la conexión entre las teclas y el circuito impreso, utilizando cinta adhesiva especial.', 336, 0),
(1172, 'Hacer Tape Mod en un teclado es una modificación estética que consiste en decorar el teclado con cinta adhesiva de colores.', 336, 0),
(1173, 'Hacer Tape Mod en un teclado es una técnica para mejorar la respuesta táctil de las teclas mediante el uso de cinta adhesiva en los resortes internos.', 336, 0),
(1174, 'Un cable RJ45 es un tipo de cable de red Ethernet que se utiliza para conectar dispositivos de red, como computadoras, enrutadores o conmutadores, a una red local.', 337, 1),
(1175, 'Un cable RJ45 es un tipo de cable de alimentación que se utiliza para conectar dispositivos electrónicos a una toma de corriente.', 337, 0),
(1176, 'Un cable RJ45 es un tipo de cable de audio que se utiliza para conectar equipos de sonido a altavoces o auriculares.', 337, 0),
(1177, 'Un cable RJ45 es un tipo de cable de video que se utiliza para conectar dispositivos de video, como televisores o monitores, a reproductores multimedia.', 337, 0),
(1178, 'Los auriculares o altavoces son periféricos que usan cable jack para la conexión de audio.', 338, 1),
(1179, 'Las impresoras son periféricos que usan cable jack para la conexión de datos.', 338, 0),
(1180, 'Los teclados son periféricos que usan cable jack para la conexión de entrada.', 338, 0),
(1181, 'Las cámaras web son periféricos que usan cable jack para la conexión de video.', 338, 0),
(1182, 'M.2 es un formato de conexión para dispositivos de almacenamiento, como SSDs (Solid-State Drives) o tarjetas Wi-Fi, que ofrece velocidades de transferencia rápidas y un tamaño compacto.', 339, 1),
(1183, 'M.2 es un estándar de memoria RAM utilizado en placas base para aumentar la velocidad y la capacidad de almacenamiento del sistema.', 339, 0),
(1184, 'M.2 es un tipo de puerto USB utilizado para conectar dispositivos externos, como ratones o teclados, a un ordenador.', 339, 0),
(1185, 'M.2 es una generación de procesadores fabricados por Intel, diseñados para ofrecer un rendimiento superior en aplicaciones de alta demanda.', 339, 0),
(1190, 'Una tarjeta SD es un tipo de tarjeta de memoria utilizada en dispositivos electrónicos, como cámaras digitales, teléfonos móviles, y consolas de videojuegos, para almacenar datos de forma temporal o permanente.', 341, 1),
(1191, 'Una tarjeta SD es una tarjeta de red utilizada para conectar dispositivos a una red local o a Internet.', 341, 0),
(1192, 'Una tarjeta SD es una tarjeta de sonido utilizada para mejorar la calidad de audio en dispositivos electrónicos.', 341, 0),
(1193, 'Una tarjeta SD es una tarjeta gráfica dedicada utilizada en sistemas informáticos para procesar y renderizar gráficos de alta calidad.', 341, 0),
(1194, 'Una webcam es una cámara de vídeo pequeña y compacta que se utiliza para capturar imágenes y grabar vídeos directamente desde un ordenador, generalmente para videoconferencias, streaming en vivo o videollamadas.', 342, 1),
(1195, 'Una webcam es un tipo de micrófono utilizado para capturar y grabar audio en dispositivos electrónicos, como ordenadores o teléfonos móviles.', 342, 0),
(1196, 'Una webcam es una impresora que utiliza tinta especial para imprimir imágenes en papel.', 342, 0),
(1197, 'Una webcam es un tipo de pantalla táctil que se utiliza para interactuar con un ordenador o dispositivo electrónico.', 342, 0),
(1198, 'El perfil Cherry en las keycaps se refiere al diseño de la forma y altura de las teclas que sigue el estándar establecido por la empresa Cherry GmbH, conocida por sus interruptores mecánicos, y que es ampliamente utilizado en teclados mecánicos.', 343, 1),
(1199, 'El perfil Cherry en las keycaps se refiere al material utilizado para fabricar las teclas de los teclados mecánicos, que consiste en plástico de alta calidad y durabilidad.', 343, 0),
(1200, 'El perfil Cherry en las keycaps se refiere al tipo de iluminación LED que se utiliza para iluminar las teclas en teclados mecánicos.', 343, 0),
(1201, 'El perfil Cherry en las keycaps se refiere al método de impresión utilizado para añadir caracteres a las teclas de los teclados mecánicos.', 343, 0),
(1206, 'DDR4 es la cuarta generación de memoria de acceso aleatorio de tipo DDR (Double Data Rate), que se utiliza en ordenadores y otros dispositivos electrónicos para almacenar y acceder a datos de forma temporal.', 345, 1),
(1207, 'DDR4 es un estándar de conexión inalámbrica utilizado en dispositivos móviles y otros dispositivos electrónicos para transmitir datos a través de ondas de radio.', 345, 0),
(1208, 'DDR4 es un protocolo de comunicación utilizado en redes de computadoras para establecer conexiones seguras entre dispositivos y servidores.', 345, 0),
(1209, 'DDR4 es un tipo de conector utilizado en tarjetas gráficas y otros dispositivos de hardware para conectarlos a la placa base de un ordenador.', 345, 0),
(1210, 'La cantidad de veces que la pantalla se actualiza por segundo.', 346, 1),
(1211, 'Los Hz en los monitores son una medida de la resolución de pantalla, que indica la cantidad de píxeles que puede mostrar el monitor horizontal y verticalmente.', 346, 0),
(1212, 'Los Hz en los monitores son una medida de la calidad de imagen, que determina la claridad y nitidez de los detalles mostrados en la pantalla.', 346, 0),
(1213, 'Los Hz en los monitores son una medida de la luminosidad de la pantalla, que indica el brillo máximo que puede alcanzar el monitor.', 346, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tematica`
--

CREATE TABLE `tematica` (
  `id_tematica` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tematica`
--

INSERT INTO `tematica` (`id_tematica`, `nom`) VALUES
(1, 'Programación'),
(2, 'Hardware'),
(3, 'Videojuegos'),
(4, 'Periféricos'),
(5, 'Software');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuari`
--

CREATE TABLE `usuari` (
  `id` int(11) NOT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `correu` varchar(255) DEFAULT NULL,
  `contrasenya` varchar(255) DEFAULT NULL,
  `país` varchar(255) DEFAULT NULL,
  `telefon` varchar(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuari`
--

INSERT INTO `usuari` (`id`, `nickname`, `correu`, `contrasenya`, `país`, `telefon`) VALUES
(1, 'anselmejador', 'hola@gmail.com', '123', 'espanya', '123456789'),
(2, 'joanet_el_gran', 'joanetainternet@gmail.com', 'MCagundeu', ' rusia', '123456789'),
(3, 'antafonador', 'wad', '12345', 'ANDORRA', '126578434'),
(4, 'joanet', 'gogo@gmail.com', '12345', 'aspanya', '123456789'),
(8, 'sdf', 'fasdg', '123', 'fdjoo', '123456789'),
(9, 'daaf', 'adfafd', '123', 'adafrf', '123456789'),
(10, 'java', 'q', 'q', 'esp', '123456789'),
(11, 'postal', 'postal1234@gmail.com', '1234', 'ESP', '333333333'),
(12, 'Antafonador', 'antafonador69@gmail.com', '1234', 'Espanya', '619931234'),
(13, 'bonatarda', 'joaneta@gmail.com', '12', 'esp', '123456789'),
(14, 'mireiaPalomino', 'a', '12', 'ESP', '123456789'),
(15, 'MartiElGran', 'martinet@gmail.com', '123', 'ESP', '333333333'),
(16, 'gabriel', 'gabi', 'gabi', 'gabi', '666666666'),
(17, 'fresskowy', 'fress@gmail.com', '123', 'ESP', '976234567');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `estadistiques_usuari`
--
ALTER TABLE `estadistiques_usuari`
  ADD PRIMARY KEY (`id_estadistica`),
  ADD KEY `id_usuari` (`id_usuari`);

--
-- Indices de la tabla `formulen`
--
ALTER TABLE `formulen`
  ADD KEY `id_informacio` (`id_informacio`),
  ADD KEY `id_pregunta` (`id_pregunta`);

--
-- Indices de la tabla `informacio_partida`
--
ALTER TABLE `informacio_partida`
  ADD PRIMARY KEY (`id_informacio`),
  ADD KEY `ID_usuari` (`ID_usuari`),
  ADD KEY `ID_partida` (`ID_partida`),
  ADD KEY `ID_pregunta` (`ID_pregunta`);

--
-- Indices de la tabla `mode_de_joc`
--
ALTER TABLE `mode_de_joc`
  ADD PRIMARY KEY (`ID_Mode`);

--
-- Indices de la tabla `obte`
--
ALTER TABLE `obte`
  ADD PRIMARY KEY (`ID_obte`),
  ADD KEY `id_puntuacio` (`id_puntuacio`),
  ADD KEY `Id_usuari` (`Id_usuari`),
  ADD KEY `id_partida` (`id_partida`);

--
-- Indices de la tabla `partida`
--
ALTER TABLE `partida`
  ADD PRIMARY KEY (`id_partida`),
  ADD KEY `id_modejoc` (`id_modejoc`);

--
-- Indices de la tabla `preguntes`
--
ALTER TABLE `preguntes`
  ADD PRIMARY KEY (`id_pregunta`),
  ADD KEY `ID_tematica` (`ID_tematica`);

--
-- Indices de la tabla `puntuacio`
--
ALTER TABLE `puntuacio`
  ADD PRIMARY KEY (`id_puntuacio`),
  ADD KEY `Id_Usuari` (`Id_Usuari`),
  ADD KEY `id_partida` (`id_partida`);

--
-- Indices de la tabla `registrar`
--
ALTER TABLE `registrar`
  ADD PRIMARY KEY (`id_registrar`),
  ADD KEY `ID_usuari` (`ID_usuari`),
  ADD KEY `ID_informacio` (`ID_informacio`);

--
-- Indices de la tabla `respostes`
--
ALTER TABLE `respostes`
  ADD PRIMARY KEY (`id_resposta`),
  ADD KEY `id_pregunta` (`id_pregunta`);

--
-- Indices de la tabla `tematica`
--
ALTER TABLE `tematica`
  ADD PRIMARY KEY (`id_tematica`);

--
-- Indices de la tabla `usuari`
--
ALTER TABLE `usuari`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `informacio_partida`
--
ALTER TABLE `informacio_partida`
  MODIFY `id_informacio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `partida`
--
ALTER TABLE `partida`
  MODIFY `id_partida` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `puntuacio`
--
ALTER TABLE `puntuacio`
  MODIFY `id_puntuacio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `usuari`
--
ALTER TABLE `usuari`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `estadistiques_usuari`
--
ALTER TABLE `estadistiques_usuari`
  ADD CONSTRAINT `estadistiques_usuari_ibfk_1` FOREIGN KEY (`id_usuari`) REFERENCES `usuari` (`id`);

--
-- Filtros para la tabla `formulen`
--
ALTER TABLE `formulen`
  ADD CONSTRAINT `formulen_ibfk_1` FOREIGN KEY (`id_pregunta`) REFERENCES `preguntes` (`id_pregunta`),
  ADD CONSTRAINT `formulen_ibfk_2` FOREIGN KEY (`id_informacio`) REFERENCES `informacio_partida` (`id_informacio`);

--
-- Filtros para la tabla `informacio_partida`
--
ALTER TABLE `informacio_partida`
  ADD CONSTRAINT `informacio_partida_ibfk_3` FOREIGN KEY (`ID_partida`) REFERENCES `partida` (`id_partida`),
  ADD CONSTRAINT `informacio_partida_ibfk_4` FOREIGN KEY (`ID_usuari`) REFERENCES `usuari` (`id`),
  ADD CONSTRAINT `informacio_partida_ibfk_5` FOREIGN KEY (`ID_pregunta`) REFERENCES `preguntes` (`id_pregunta`);

--
-- Filtros para la tabla `obte`
--
ALTER TABLE `obte`
  ADD CONSTRAINT `obte_ibfk_1` FOREIGN KEY (`id_puntuacio`) REFERENCES `puntuacio` (`id_puntuacio`),
  ADD CONSTRAINT `obte_ibfk_2` FOREIGN KEY (`ID_obte`) REFERENCES `usuari` (`id`);

--
-- Filtros para la tabla `partida`
--
ALTER TABLE `partida`
  ADD CONSTRAINT `partida_ibfk_1` FOREIGN KEY (`id_modejoc`) REFERENCES `mode_de_joc` (`ID_Mode`);

--
-- Filtros para la tabla `preguntes`
--
ALTER TABLE `preguntes`
  ADD CONSTRAINT `preguntes_ibfk_1` FOREIGN KEY (`ID_tematica`) REFERENCES `tematica` (`id_tematica`);

--
-- Filtros para la tabla `puntuacio`
--
ALTER TABLE `puntuacio`
  ADD CONSTRAINT `puntuacio_ibfk_1` FOREIGN KEY (`Id_Usuari`) REFERENCES `usuari` (`id`),
  ADD CONSTRAINT `puntuacio_ibfk_2` FOREIGN KEY (`id_partida`) REFERENCES `partida` (`id_partida`);

--
-- Filtros para la tabla `registrar`
--
ALTER TABLE `registrar`
  ADD CONSTRAINT `registrar_ibfk_1` FOREIGN KEY (`ID_informacio`) REFERENCES `informacio_partida` (`id_informacio`),
  ADD CONSTRAINT `registrar_ibfk_2` FOREIGN KEY (`ID_usuari`) REFERENCES `usuari` (`id`);

--
-- Filtros para la tabla `respostes`
--
ALTER TABLE `respostes`
  ADD CONSTRAINT `respostes_ibfk_1` FOREIGN KEY (`id_pregunta`) REFERENCES `preguntes` (`id_pregunta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
