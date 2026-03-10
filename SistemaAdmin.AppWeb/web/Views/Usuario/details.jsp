<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="sistemaadmin.entidades.Usuario" %>
<% Usuario usuario = (Usuario) request.getAttribute("usuario");  %>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/Views/Shared/title.jsp" />
        <title>Detalle </title>
        <link href="wwwroot/css/estilo2.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="/Views/Shared/headerBody.jsp" />
        <main class="container col-lg-5" style="margin-top: 40px">
            <h3 style="color: white; font-weight: bold">Detalles del Usuario</h3>
            <input type="hidden" name="accion" 
                   value="<%=request.getAttribute("accion")%>" id="txtHidden">
            <input type="hidden" name="id" value="<%=usuario.getId()%>">
            <div class="row" style="margin-top: 20px">
                <div class="input-field col 14 s12" style="margin-top: 30px">
                    <input type="text" id="txtNombre" name ="nombre" required 
                           class="validate" maxlength="30"
                           value="<%=usuario.getNombre()%>"
                           disabled>
                    <label for="txtNombre">Nombre</label>
                </div>
                <div class="input-field col 14 s12" style="margin-top: 30px">
                    <input type="text" id="txtApellido" name ="apellido" required 
                           class="validate" maxlength="30"
                           value="<%=usuario.getApellido()%>"
                           disabled>
                    <label for="txtApellido">Apellido</label>
                </div>
                <div class="input-field col 14 s12" style="margin-top: 30px">
                    <input type="text" id="txtLogin" name ="login" required 
                           class="validate" maxlength="25"
                           value="<%=usuario.getLogin()%>"
                           disabled>
                    <label for="txtLogin">Login</label>
                </div>
                <div class="input-field col 14 s12" style="margin-top: 30px">
                    <select id="slEstatus" name="estatus" class="validate"
                            disabled>
                        <option value="0" <%=usuario.getEstatus() == 0 ? "selected":""%>>--SELECCIONAR--</option>
                        <option value="1" <%=usuario.getEstatus() == 1 ? "selected":""%>>ACTIVO</option>
                        <option value="2" <%=usuario.getEstatus() == 2 ? "selected":""%>>INACTIVO</option>
                    </select>
                    <label for="slEstatus" >Estatus</label>
                </div>
                <div class="input-field col 14 s12" style="margin-top: 30px">
                    <input type="text" id="txtRol" value="<%=usuario.getRol().getNombre()%>"
                           disabled>
                    <label for="slEstatus" >Rol</label>
                </div>
            </div>
            <c:if test="${rol eq 'Administrador'}">
                <div class="row" style="margin-top: 30px">
                    <div class="col 112 s12">
                        <a href="Usuario?accion=edit&id=<%=usuario.getId()%>" class="btn btn-info">
                            <i class="material-icons right">edit</i>Modificar
                        </a>
                        <a href="Usuario" class="btn btn-danger" style="margin-left: 30px">
                            <i class="material-icons right">highlight_off</i>Ir Atras
                        </a>
                    </div>
                </div>
            </c:if>
            <c:if test="${rol eq 'Usuario'}">
                <div class="row" style="margin-top: 30px">

                    <div class="col 112 s12">
                        <a href="Usuario" class="btn btn-danger" style="margin-left: 30px">
                            <i class="material-icons right">highlight_off</i>Ir Atras
                        </a>
                    </div>
                </div>
            </c:if>
        </main>
        <jsp:include page="/Views/Shared/footerBody.jsp" />
    </body>
</html>

