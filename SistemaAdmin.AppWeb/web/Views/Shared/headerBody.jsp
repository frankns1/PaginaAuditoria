<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="sistemaadmin.appweb.utils.*"%>
<%@page import="sistemaadmin.entidades.Rol" %>
<%@page import="sistemaadmin.accesoadatos.RolDAL" %>
<%@page import="jakarta.servlet.http.HttpServletRequest"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <h1 style="color: white">AdminUser</h1>
                <%if (SessionUser.isAuth(request)) {  
                 var sessionU = SessionUser.getUser(request);
                %>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent" style="margin-left: 80px">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="Home">Inicio</a>
                        </li>  
                        <li class="nav-item">
                            <a class="nav-link active" href="Producto">Productos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="Usuario">Usuarios</a>
                        </li> 
                    </ul>
                    <c:if test="${rol eq 'Administrador'}"> 
                        <ul class="navbar-nav" style="margin-right: 80px">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="fas fa-user" style="margin-right: 10px ;"></i>Admistrador <%=sessionU%>
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="Usuario?accion=cambiarpass">Cambiar Contraceña</a></li>
                                    <li><a class="dropdown-item" href="Usuario?accion=login">cerrar sesion</a></li>

                                </ul>
                            </li>
                        </ul>
                    </c:if>
                    <c:if test="${rol eq 'Usuario'}"> 
                        <ul class="navbar-nav" style="margin-right: 80px">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="fas fa-user" style="margin-right: 10px ;"></i><%=sessionU%>
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="Usuario?accion=cambiarpass">Cambiar Contraceña</a></li>
                                    <li><a class="dropdown-item" href="Usuario?accion=login">cerrar sesion</a></li>

                                </ul>
                            </li>
                        </ul>
                    </c:if>
                </div>
            </div>
            <% } %>
        </nav>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    </body>
</html>
