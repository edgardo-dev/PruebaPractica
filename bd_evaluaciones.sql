-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-10-2020 a las 02:50:04
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_evaluaciones`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblalumnos`
--

CREATE TABLE `tblalumnos` (
  `idAlumno` int(11) NOT NULL,
  `alumnoNombre` varchar(150) NOT NULL,
  `alumnoApellido` varchar(150) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `correo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbldocentes`
--

CREATE TABLE `tbldocentes` (
  `idDocente` int(11) NOT NULL,
  `docenteNombre` varchar(150) NOT NULL,
  `docenteApellido` varchar(150) NOT NULL,
  `telefono` varchar(25) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `correo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbldocentes`
--

INSERT INTO `tbldocentes` (`idDocente`, `docenteNombre`, `docenteApellido`, `telefono`, `idUsuario`, `correo`) VALUES
(2, 'Marta ', 'Sonia', '72748596', 2, 'sonia@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblevaluacionalumno`
--

CREATE TABLE `tblevaluacionalumno` (
  `idEvaluacionAlumno` int(11) NOT NULL,
  `nota` decimal(4,2) NOT NULL,
  `idAlumno` int(11) NOT NULL,
  `idEvaluacion` int(11) NOT NULL,
  `estado` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblevaluaciones`
--

CREATE TABLE `tblevaluaciones` (
  `idEvaluacion` int(11) NOT NULL,
  `codigo` varchar(25) NOT NULL,
  `fecha` date NOT NULL,
  `idDocente` int(11) NOT NULL,
  `indicaciones` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tblevaluaciones`
--

INSERT INTO `tblevaluaciones` (`idEvaluacion`, `codigo`, `fecha`, `idDocente`, `indicaciones`) VALUES
(18, 'm0Y0f7N7', '2020-10-09', 2, 'Realice las Preguntas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblpreguntas`
--

CREATE TABLE `tblpreguntas` (
  `idPregunta` int(11) NOT NULL,
  `idEvaluacion` int(11) NOT NULL,
  `idTipoPregunta` int(11) NOT NULL,
  `pregunta` varchar(255) NOT NULL,
  `respuestaCorrecta` varchar(255) NOT NULL,
  `seleccion1` varchar(255) DEFAULT NULL,
  `seleccion2` varchar(255) DEFAULT NULL,
  `seleccion3` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tblpreguntas`
--

INSERT INTO `tblpreguntas` (`idPregunta`, `idEvaluacion`, `idTipoPregunta`, `pregunta`, `respuestaCorrecta`, `seleccion1`, `seleccion2`, `seleccion3`) VALUES
(10, 18, 2, 'PHP es Para WEB', 'Verdadero', '', '', ''),
(11, 18, 1, 'LENGUAJE PARA WEB', 'PHP', 'VB', 'JAVA', 'C');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblroles`
--

CREATE TABLE `tblroles` (
  `idRol` int(11) NOT NULL,
  `rol` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tblroles`
--

INSERT INTO `tblroles` (`idRol`, `rol`) VALUES
(1, 'Administrador'),
(2, 'Docente'),
(3, 'Estudiante');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbltipopreguntas`
--

CREATE TABLE `tbltipopreguntas` (
  `idTipo` int(11) NOT NULL,
  `tipo` varchar(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbltipopreguntas`
--

INSERT INTO `tbltipopreguntas` (`idTipo`, `tipo`) VALUES
(1, 'Selección Multiple'),
(2, 'Falso o Verdadero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblusuarios`
--

CREATE TABLE `tblusuarios` (
  `idUsuario` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `clave` varchar(255) NOT NULL,
  `idRol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tblusuarios`
--

INSERT INTO `tblusuarios` (`idUsuario`, `usuario`, `clave`, `idRol`) VALUES
(1, 'nancy.colato', '$2y$10$mxoR80ggWt5cnvQ7IHOyvuN13xaT1GhTT61Pd8V3dZt0cdB2nhHl6', 1),
(2, 'admin', '$2y$10$gIRMDAPnQP2OBOkqr9n9c.pmJN.AO5NjnIKvTSFJI1elIRFEwbg7y', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tblalumnos`
--
ALTER TABLE `tblalumnos`
  ADD PRIMARY KEY (`idAlumno`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indices de la tabla `tbldocentes`
--
ALTER TABLE `tbldocentes`
  ADD PRIMARY KEY (`idDocente`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indices de la tabla `tblevaluacionalumno`
--
ALTER TABLE `tblevaluacionalumno`
  ADD PRIMARY KEY (`idEvaluacionAlumno`),
  ADD KEY `idAlumno` (`idAlumno`),
  ADD KEY `idEvaluacion` (`idEvaluacion`);

--
-- Indices de la tabla `tblevaluaciones`
--
ALTER TABLE `tblevaluaciones`
  ADD PRIMARY KEY (`idEvaluacion`),
  ADD KEY `idDocente` (`idDocente`);

--
-- Indices de la tabla `tblpreguntas`
--
ALTER TABLE `tblpreguntas`
  ADD PRIMARY KEY (`idPregunta`),
  ADD KEY `idTipoPregunta` (`idTipoPregunta`),
  ADD KEY `idEvaluacion` (`idEvaluacion`);

--
-- Indices de la tabla `tblroles`
--
ALTER TABLE `tblroles`
  ADD PRIMARY KEY (`idRol`);

--
-- Indices de la tabla `tbltipopreguntas`
--
ALTER TABLE `tbltipopreguntas`
  ADD PRIMARY KEY (`idTipo`);

--
-- Indices de la tabla `tblusuarios`
--
ALTER TABLE `tblusuarios`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `idRol` (`idRol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tblalumnos`
--
ALTER TABLE `tblalumnos`
  MODIFY `idAlumno` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbldocentes`
--
ALTER TABLE `tbldocentes`
  MODIFY `idDocente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tblevaluacionalumno`
--
ALTER TABLE `tblevaluacionalumno`
  MODIFY `idEvaluacionAlumno` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tblevaluaciones`
--
ALTER TABLE `tblevaluaciones`
  MODIFY `idEvaluacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `tblpreguntas`
--
ALTER TABLE `tblpreguntas`
  MODIFY `idPregunta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `tblroles`
--
ALTER TABLE `tblroles`
  MODIFY `idRol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbltipopreguntas`
--
ALTER TABLE `tbltipopreguntas`
  MODIFY `idTipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tblusuarios`
--
ALTER TABLE `tblusuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tblalumnos`
--
ALTER TABLE `tblalumnos`
  ADD CONSTRAINT `tblalumnos_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `tblusuarios` (`idUsuario`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbldocentes`
--
ALTER TABLE `tbldocentes`
  ADD CONSTRAINT `tbldocentes_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `tblusuarios` (`idUsuario`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tblevaluacionalumno`
--
ALTER TABLE `tblevaluacionalumno`
  ADD CONSTRAINT `tblevaluacionalumno_ibfk_1` FOREIGN KEY (`idAlumno`) REFERENCES `tblalumnos` (`idAlumno`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tblevaluacionalumno_ibfk_2` FOREIGN KEY (`idEvaluacion`) REFERENCES `tblevaluaciones` (`idEvaluacion`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tblevaluaciones`
--
ALTER TABLE `tblevaluaciones`
  ADD CONSTRAINT `tblevaluaciones_ibfk_1` FOREIGN KEY (`idDocente`) REFERENCES `tbldocentes` (`idDocente`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tblpreguntas`
--
ALTER TABLE `tblpreguntas`
  ADD CONSTRAINT `tblpreguntas_ibfk_1` FOREIGN KEY (`idTipoPregunta`) REFERENCES `tbltipopreguntas` (`idTipo`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tblpreguntas_ibfk_2` FOREIGN KEY (`idEvaluacion`) REFERENCES `tblevaluaciones` (`idEvaluacion`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tblusuarios`
--
ALTER TABLE `tblusuarios`
  ADD CONSTRAINT `tblusuarios_ibfk_1` FOREIGN KEY (`idRol`) REFERENCES `tblroles` (`idRol`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
