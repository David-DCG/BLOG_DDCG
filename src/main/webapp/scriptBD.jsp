<%-- 
    Document   : script Base de Datos
    Created on : 14 may. de 2024, 11:50:05
    Author     : David Daniel Condori Gomez

    CREATE DATABASE IF NOT EXISTS `bd_blog` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
    USE `bd_blog`;

    CREATE TABLE IF NOT EXISTS `posts` (
      `id` int NOT NULL AUTO_INCREMENT,
      `fecha` date NOT NULL,
      `titulo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
      `contenido` text NOT NULL,
      PRIMARY KEY (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

    INSERT INTO `posts` (`id`, `fecha`, `titulo`, `contenido`) VALUES
            (1, '2024-05-14', 'El ALTO', 'Ya llegue a El Alto                                \r\n                            '),
            (2, '2024-05-14', 'De Ocasion', 'En venta un terreno de 250 m2 con todo sus papeles al dia                                \r\n                            ');

    CREATE TABLE IF NOT EXISTS `usuarios` (
      `id` int NOT NULL AUTO_INCREMENT,
      `usuario` varchar(20) NOT NULL DEFAULT '0',
      `password` varchar(255) NOT NULL DEFAULT '0',
      PRIMARY KEY (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

    INSERT INTO `usuarios` (`id`, `usuario`, `password`) VALUES
            (1, 'David', '12345'),
            (2, 'Daniel', '67890');
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
