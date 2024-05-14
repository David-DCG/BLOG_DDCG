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
            <center>
                <h1>
                    <c:if test="${usuarios.id == 0}">Nuevo</c:if>
                    <c:if test="${usuarios.id != 0}">Editar</c:if>
                        usuario
                    </h1>
                </center>
            </div>
            <div class="container p-5 col-6 bg-dark text-white">
                <form action="inicio_usuarios" method="post">
                    <input type="hidden" name="id" value="${usuarios.id}"/>
                <table class="table table-borderless">
                    <tr>
                        <td>USUARIO:</td>
                        <td><input class="form-control" type="text" name="usuario" value="${usuarios.usuario}"/></td>
                    </tr>
                    <tr>
                        <td>PASSWORD</td>
                        <td><input class="form-control" type="text" name="password" value="${usuarios.password}"/></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input class="btn btn-success" type="submit"/></td>
                    </tr>
                </table>
            </form>
        </div>
    </body>
</html>
