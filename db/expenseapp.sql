-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 28-09-2021 a las 03:52:19
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `expenseapp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `color` varchar(7) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `name`, `color`) VALUES
(1, 'comida', '#DE1F59'),
(2, 'hogar', '#DE1FAA'),
(3, 'ropa', '#B01FDE'),
(4, 'Juegos', '#681FDE'),
(5, 'Viajes', '#1FAADE'),
(6, 'Claro', '#681FDE'),
(7, 'Internet', '#58D68D'),
(8, 'Otros', '#A6ACAF'),
(9, 'Servicios Publicos', '#11e4a8');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expenses`
--

DROP TABLE IF EXISTS `expenses`;
CREATE TABLE IF NOT EXISTS `expenses` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `category_id` int(5) NOT NULL,
  `amount` float(10,2) NOT NULL,
  `date` date NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user_expense` (`id_user`),
  KEY `id_category_expense` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `expenses`
--

INSERT INTO `expenses` (`id`, `title`, `category_id`, `amount`, `date`, `id_user`) VALUES
(1, 'prueba', 3, 12.40, '2020-03-21', 5),
(2, 'starbucks', 1, 60.00, '2020-03-21', 5),
(4, 'Regalo de cumpleaños mamá', 2, 1200.00, '2020-03-22', 5),
(5, 'Nintendo Switch', 4, 4600.00, '2020-03-26', 5),
(6, 'Viaje a Nueva York', 5, 20000.00, '2020-01-25', 5),
(7, 'Chocolates Ferrero', 1, 140.00, '2020-03-27', 5),
(10, 'sdsdsd', 1, 2323.00, '2020-04-03', 5),
(11, 'sadas', 1, 232.00, '2020-04-03', 5),
(12, 'sadas', 3, 11.00, '2020-04-03', 5),
(13, 'sdsd', 5, 23.00, '2020-04-03', 5),
(14, 'sdsd', 5, 23.00, '2020-04-03', 5),
(19, 'Chilis', 1, 300.00, '2020-01-01', 5),
(20, 'juego de Halo', 4, 1100.00, '2020-04-04', 5),
(21, 'Uñas', 3, 200.00, '2020-04-09', 5),
(23, 'pastillas para la tos', 2, 21.00, '2020-06-06', 5),
(24, 'Ropa nueva', 3, 300.00, '2020-06-04', 5),
(25, 'juego Nintendo', 2, 200.00, '2020-07-12', 5),
(27, 'Plata Claro', 6, 74000.00, '2021-09-15', 8),
(28, 'Datos de celular', 6, 54500.00, '2021-09-15', 8),
(29, 'Internet Tigo', 7, 113000.00, '2021-09-15', 8),
(30, 'Plata Casco', 8, 65000.00, '2021-09-30', 8),
(31, 'Plata tarjeta somos', 8, 92000.00, '2021-09-30', 8),
(32, 'plata Gym', 8, 92000.00, '2021-10-01', 8),
(33, 'Agaval', 8, 92000.00, '2021-09-30', 8),
(34, 'Pasajes Moto', 5, 80000.00, '2021-09-30', 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('user','admin') NOT NULL,
  `budget` float(10,2) NOT NULL,
  `photo` varchar(300) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `budget`, `photo`, `name`) VALUES
(5, 'marcos', '$2y$10$0aOmd1LTFHtBLCEtDrJgy.xxs7FArnOlzHXLrviwP85LWS.XbxsNO', 'user', 100.00, 'd8eb8c58160f13143d4c6ef11c34b57a.png', 'Marcos Rivas'),
(6, 'lena', '$2y$10$C/MX.IRvzrNuMyo4pk5uU.bCD20hSWChoCM1bp4n3kEzO2TYamSI.', 'user', 16000.00, '', 'Lenis'),
(7, 'omar', '$2y$10$2YzZ9yzk2rSLbcbfBGkcIuWZ1HzjcNT8lTcgeidTiYbq2yzcNVxuq', 'user', 20000.00, '', 'El Pozos'),
(8, 'emurillo', '$2y$10$0aOmd1LTFHtBLCEtDrJgy.xxs7FArnOlzHXLrviwP85LWS.XbxsNO', 'user', 1300000.00, 'e8468d1e38e3256d75cb0e214df4ea35.jpg', 'Elkin Murillo'),
(10, 'sara1991', '$2y$10$N7gHEdmd1dcdsOseo5nsm.aiqWZSUhxqH1OXs6pccMNFQjmqAN33.', 'user', 0.00, '', ''),
(11, 'administrador', '$2y$10$E6qFbKH/uY404Oh1AEmfTOSFBfPAjGhQRPVrhvcWl0VCaNV39D3Ry', 'admin', 0.00, '', '');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `id_category_expense` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `id_user_expense` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
