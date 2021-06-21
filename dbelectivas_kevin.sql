-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-06-2021 a las 23:33:19
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbelectivas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `programa` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`id`, `nombre`, `programa`) VALUES
(1, 'ALBERTO FLORES GARCIA', 'INGENIERIA MECATRONICA'),
(2, 'JOSE GONZALO LIZARDO GONZALES', '2016670112'),
(3, 'KEVIN ALEXIS SANTOS HERNANDEZ', 'SISTEMAS COMPUTACIONALES');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `constancia`
--

CREATE TABLE `constancia` (
  `id` int(11) NOT NULL,
  `actividad` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `horas` int(11) DEFAULT NULL,
  `archivo` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `observaciones` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `valida` tinyint(4) DEFAULT NULL,
  `observaciones_encargado` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `creditos` float DEFAULT NULL,
  `alumno_id` int(11) NOT NULL,
  `denominacion_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `constancia`
--

INSERT INTO `constancia` (`id`, `actividad`, `fecha_inicio`, `fecha_fin`, `horas`, `archivo`, `observaciones`, `valida`, `observaciones_encargado`, `creditos`, `alumno_id`, `denominacion_id`) VALUES
(1, 'Curso de Android', '2021-05-31', '2021-06-04', 64, 'constancia.pdf', 'Ninguna', 1, 'Ninguna', 4, 1, 50),
(2, 'Curso de React', '2021-05-03', '2021-05-03', 40, 'constancia_2.pdf', 'Ninguna', 1, 'Ninguna', 2.5, 1, 50),
(3, 'Curso de Angular', '2021-05-03', '2021-06-25', 40, 'costancia_2.pdf', 'Me podría validar la constancia', 1, 'Ninguna', 0, 2, 50),
(4, 'Club de Algoritmia y Programación', '2021-02-01', '2021-05-31', 150, 'algoritmia_2021_2.pdf', 'Validar la constancia. Cualquier duda me come', 0, 'Esta fuera del periodo en que ingreso a la U.', 0, 3, 50);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `constancia_electiva`
--

CREATE TABLE `constancia_electiva` (
  `id` int(11) NOT NULL,
  `creditos` float DEFAULT NULL,
  `constancia_id` int(11) DEFAULT NULL,
  `electiva_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `constancia_electiva`
--

INSERT INTO `constancia_electiva` (`id`, `creditos`, `constancia_id`, `electiva_id`) VALUES
(1, 4, 1, 1),
(2, 2.5, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `denominacion`
--

CREATE TABLE `denominacion` (
  `id` int(11) NOT NULL,
  `eje_tematico` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `modalidad` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `factor` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ejemplos` text COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `denominacion`
--

INSERT INTO `denominacion` (`id`, `eje_tematico`, `modalidad`, `descripcion`, `factor`, `ejemplos`) VALUES
(1, 'Programacion', 'Escolarizada', 'Programacion de dispositivos moviles', 'L', 'kmlmakxsa'),
(2, 'minos', 'la mia', 'la que le puse', 'esta', 'mirame<br><b>bien</b>'),
(50, 'Inquietudes  vocacionales  propias', 'Independientes', '1 crédito  por cada 20  horas', '20', 'Emprendedores: incubación de empresas\r\nTalleres\r\nCur...'),
(69, 'DATOS ACTUALIZADO', 'En línea 1', '1 crédito por cada 50 horas', '3', 'Talleres\r\nCursos\r\nDiplomados\r\nClases'),
(71, 'Inquietudes  vocacionales  propias', 'Docencia', '1 crédito  por cada 16  horas', '20', 'Talleres\r\nCursos\r\nDiplomados\r\nClases'),
(72, 'Inquietudes  vocacionales  propias', 'Docencia', '1 crédito  por cada 16  horas', '16', 'Simposio de Metalúrgica'),
(73, 'Sin eje temático', 'Sin modalidad', 'Sin descrpción', '0', 'Ninguno'),
(74, 'Énfasis en la profesion', 'Independientes', '1 credito por cada 20 horas', '20', 'Concursos\r\nAsistencia a congresos\r\nSimuladores');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `electiva`
--

CREATE TABLE `electiva` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `creditos` float DEFAULT NULL,
  `creditos_acumulados` float DEFAULT NULL,
  `alumno_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `electiva`
--

INSERT INTO `electiva` (`id`, `nombre`, `creditos`, `creditos_acumulados`, `alumno_id`) VALUES
(1, 'ELECTIVA 1', 20, 6.5, 1),
(2, 'ELECTIVA 2', 7, 0, 2),
(3, 'ELECTIVA 2', 7, 0, 2),
(4, 'ELECTIVA 3', 7, 0, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `constancia`
--
ALTER TABLE `constancia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_constancia_alumno_idx` (`alumno_id`),
  ADD KEY `fk_constancia_denominacion1_idx` (`denominacion_id`);

--
-- Indices de la tabla `constancia_electiva`
--
ALTER TABLE `constancia_electiva`
  ADD PRIMARY KEY (`id`),
  ADD KEY `constancia_id` (`constancia_id`),
  ADD KEY `electiva_id` (`electiva_id`);

--
-- Indices de la tabla `denominacion`
--
ALTER TABLE `denominacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `electiva`
--
ALTER TABLE `electiva`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_electiva_alumno1_idx` (`alumno_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumno`
--
ALTER TABLE `alumno`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `constancia`
--
ALTER TABLE `constancia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `constancia_electiva`
--
ALTER TABLE `constancia_electiva`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `denominacion`
--
ALTER TABLE `denominacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT de la tabla `electiva`
--
ALTER TABLE `electiva`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `constancia`
--
ALTER TABLE `constancia`
  ADD CONSTRAINT `fk_constancia_alumno` FOREIGN KEY (`alumno_id`) REFERENCES `alumno` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_constancia_denominacion1` FOREIGN KEY (`denominacion_id`) REFERENCES `denominacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `constancia_electiva`
--
ALTER TABLE `constancia_electiva`
  ADD CONSTRAINT `constancia_electiva_ibfk_1` FOREIGN KEY (`constancia_id`) REFERENCES `constancia` (`id`),
  ADD CONSTRAINT `constancia_electiva_ibfk_2` FOREIGN KEY (`electiva_id`) REFERENCES `electiva` (`id`);

--
-- Filtros para la tabla `electiva`
--
ALTER TABLE `electiva`
  ADD CONSTRAINT `fk_electiva_alumno1` FOREIGN KEY (`alumno_id`) REFERENCES `alumno` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
