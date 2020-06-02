-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-06-2020 a las 10:02:42
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.4



/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `web_avanzada_video`

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--
create database web_avanzada_video;
use web_avanzada_video;

CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL,
  `usuario` varchar(255) DEFAULT NULL,
  `comentario` varchar(255) DEFAULT NULL,
  `videoId` int(11) DEFAULT NULL
) DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`id`, `usuario`, `comentario`, `videoId`) VALUES
(1, 'Jacob', 'Hola Que tal', 1),
(2, 'jacob', 'otro comentario', 1),
(3, 'Jacob', 'Muy buen video', 1),
(4, 'Jacob', 'no aparece el comentario\r\n', 1),
(5, 'Jacob', 'Santa julia rifa!!!', 5),
(6, 'Erick', 'Talento Regional Leon, Gto.', 5),
(7, 'Erick', 'Un saludo al sonidero Super denge de Don Pedro!!', 5),
(8, 'Erick', 'Un saludo al sonidero Super denge de Don Pedro!!', 5),
(9, 'Erick', 'Un saludo al sonidero Super denge de Don Pedro!!', 5),
(10, 'Amauri', 'No esta chido\r\n', 1),
(11, '', 'que buen video', 5),
(19, 'jacobelgamer@gmail.com', 'Este es un comentario', 10),
(20, 'jacobelgamer@gmail.com', 'Este es un comentario', 10),
(21, 'jacobelgamer@gmail.com', 'Este es un comentario', 10),
(22, 'jacobelgamer@gmail.com', 'Este es un comentario', 10),
(23, 'jacobelgamer@gmail.com', 'Este es un comentario', 10),
(24, 'jacobelgamer@gmail.com', 'Este es un comentario', 10),
(25, 'jacobelgamer@gmail.com', 'Este es un comentario', 10),
(26, 'jacobelgamer@gmail.com', 'Este es un comentario', 10),
(27, 'jacobelgamer@gmail.com', 'Este es un comentario', 10),
(28, 'jacobelgamer@gmail.com', 'Este es un comentario', 10),
(29, 'jacobelgamer@gmail.com', 'Este es un comentario', 10),
(30, 'jacobelgamer@gmail.com', 'Este es un comentario', 10),
(31, 'jacobelgamer@gmail.com', 'Este es un comentario', 10),
(32, 'jacobelgamer@gmail.com', 'Este es un comentario', 10),
(33, 'jacobelgamer@gmail.com', 'Este es un comentario', 10),
(34, 'jacobelgamer@gmail.com', 'Este es un comentario', 10),
(35, 'jacobelgamer@gmail.com', 'Este es un comentario', 10),
(36, 'jacobelgamer@gmail.com', 'Este es un comentario', 10),
(37, 'jacobelgamer@gmail.com', 'Este es un comentario', 10),
(38, 'jacobelgamer@gmail.com', 'comentario dos', 10),
(39, 'jacobelgamer@gmail.com', 'comentario dos', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rating`
--

CREATE TABLE `rating` (
  `id` int(11) NOT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `videoId` int(11) DEFAULT NULL,
  `valor` int(11) DEFAULT NULL
)DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rating`
--

INSERT INTO `rating` (`id`, `correo`, `videoId`, `valor`) VALUES
(1, 'jacobelgamer@gmail.com', 10, 4),
(3, 'jacob@jacob.com', 1, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `correo` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellidos` varchar(255) NOT NULL,
  `password` varchar(20) NOT NULL
) DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`correo`, `nombre`, `apellidos`, `password`) VALUES
('jacob@jacob.com', 'jacob', 'maldonado', '1234'),
('jacobelgamer@gmail.com', 'Jacob', 'Maldonado', '1234');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `video`
--

CREATE TABLE `video` (
  `id` int(11) NOT NULL,
  `url` varchar(2000) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `img` varchar(2000) DEFAULT NULL,
  `correo` varchar(255) NOT NULL,
  `descripcion` char(200) DEFAULT NULL
) DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `video`
--

INSERT INTO `video` (`id`, `url`, `nombre`, `img`, `correo`, `descripcion`) VALUES
(1, 'https://www.youtube.com/watch?v=IJ30aOMjrck', '3 horas garen', 'xd', 'jacob@jacob.com', 'un gameplay completo de garen'),
(2, 'https://www.youtube.com/watch?v=O47OhYDEfb0', 'first stream', NULL, 'jacob@jacob.com', NULL),
(3, 'https://www.youtube.com/watch?v=FHkDkMOmDcQ', 'arurf is back', NULL, 'jacob@jacob.com', NULL),
(4, 'https://www.youtube.com/watch?v=16uJxCV6N3c', 'fnc vs vit', NULL, 'jacob@jacob.com', NULL),
(5, 'https://www.youtube.com/watch?v=MtcPEmNJkS8', 'cumbia mirando a la luna', NULL, 'jacob@jacob.com', NULL),
(10, 'https://www.youtube.com/watch?v=PVubvo6H8Oc', 'Un dia en la vida de un ingeniero editado', NULL, 'jacobelgamer@gmail.com', 'se ve como es la vida de este ingeniero en una noche, completamente comentado');

--
-- Disparadores `video`
--
DELIMITER $$
CREATE TRIGGER `deletecascade` BEFORE DELETE ON `video` FOR EACH ROW BEGIN
    delete from comentarios where videoId = old.id; 
    delete from rating where videoId = old.id;
END
$$
DELIMITER ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_comment_vid` (`videoId`);

--
-- Indices de la tabla `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_rating_vid` (`videoId`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`correo`);

--
-- Indices de la tabla `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id`),
  ADD KEY `correo` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de la tabla `rating`
--
ALTER TABLE `rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `video`
--
ALTER TABLE `video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`videoId`) REFERENCES `video` (`id`);

--
-- Filtros para la tabla `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`videoId`) REFERENCES `video` (`id`);

--
-- Filtros para la tabla `video`
--
ALTER TABLE `video`
  ADD CONSTRAINT `video_ibfk_1` FOREIGN KEY (`correo`) REFERENCES `usuario` (`correo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
