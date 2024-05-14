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
                    <c:if test="${posts.id == 0}">Nuevo</c:if>
                    <c:if test="${posts.id != 0}">Editar</c:if>
                        post
                    </h1>
                </center>
            </div>
            <div class="container p-5 col-6 bg-dark text-white">
                <form action="inicio_posts" method="post">
                    <input type="hidden" name="id" value="${posts.id}"/>
                <table class="table table-borderless">
                    <tr>
                        <td>FECHA:</td>
                        <td><input class="form-control" type="date" name="fecha" value="${posts.fecha}"/></td>
                    </tr>
                    <tr>
                        <td>TITULO:</td>
                        <td><input class="form-control" type="text" name="titulo" value="${posts.titulo}"/></td>
                    </tr>
                    <tr>
                        <td>CONTENIDO</td>
                        <td><textarea class="form-control" name="contenido" rows="4" cols="20">
                                ${posts.contenido}
                            </textarea></td>
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
