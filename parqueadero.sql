-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-07-2022 a las 08:35:48
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `parqueadero`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planes`
--

CREATE TABLE `planes` (
  `id` int(11) NOT NULL,
  `tipo_plan` varchar(80) COLLATE utf8_bin NOT NULL,
  `cupo` smallint(6) NOT NULL,
  `pases` smallint(6) NOT NULL,
  `costo` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `planes`
--

INSERT INTO `planes` (`id`, `tipo_plan`, `cupo`, `pases`, `costo`) VALUES
(1, 'mensual', 25, 96, 0.26),
(2, 'semestral', 50, 576, 0.087),
(3, 'anual', 80, 1052, 0.076);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(80) COLLATE utf8_bin NOT NULL,
  `apellido` varchar(80) COLLATE utf8_bin NOT NULL,
  `fecha_compra` date NOT NULL,
  `tipo_pase_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `fecha_compra`, `tipo_pase_id`) VALUES
(1, 'Juan', 'Oña', '2022-03-12', 2),
(2, 'Pedro', 'Ramirez', '2021-08-02', 3),
(3, 'Ana', 'Cruz', '2022-07-01', 1),
(4, 'Hector', 'Reyes', '2022-05-12', 2),
(5, 'VIctoria', 'Arjona', '2022-03-20', 1),
(6, 'Pedro', 'Ramirez', '2022-06-20', 1),
(7, 'Karen', 'Perez', '2022-04-03', 2),
(8, 'Michael', 'Hernandez', '2022-06-28', 2),
(9, 'Monica', 'Almeida', '2022-06-20', 1),
(10, 'Luis', 'Hernandez', '2022-07-05', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `planes`
--
ALTER TABLE `planes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tipo_pase_id` (`tipo_pase_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `planes`
--
ALTER TABLE `planes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`tipo_pase_id`) REFERENCES `planes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
