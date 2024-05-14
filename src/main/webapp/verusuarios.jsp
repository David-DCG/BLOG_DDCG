<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="menu.jsp"%>
        <br>
        <div class="container col-6">
            <center><h1>REGISTRO DE USUARIOS</h1></center>
            <p><a href="inicio_usuarios?action=add" class="btn btn-info">Nuevo</a></p>
        </div>
        <div class="container col-6">
            <table class="table table-dark table-hover">
                <tr>
                    <th>ID</th>
                    <th>USUARIO</th>
                    <th>PASSWORD</th>
                    <th></th>
                    <th></th>
                </tr>
                <c:forEach var="item" items="${mostrarusuario}">
                    <tr>
                        <td>${item.id}</td>
                        <td>${item.usuario}</td>
                        <td>${item.password}</td>
                        <td><a href="inicio_usuarios?action=edit&id=${item.id}" class="btn btn-warning">Editar</a></td>
                        <td><a href="inicio_usuarios?action=delete&id=${item.id}" onclick="return(confirm('Esta Seguro?'))" class="btn btn-danger">Eliminar</a></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </body>
</html>
