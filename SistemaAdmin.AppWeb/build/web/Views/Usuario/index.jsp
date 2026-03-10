<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="sistemaadmin.entidades.Usuario" %>
<%@page import="sistemaadmin.entidades.Rol" %>
<%@page import="java.util.ArrayList" %>
<%ArrayList<Usuario> usuarios = (ArrayList<Usuario>) request
        .getAttribute("usuarios");
    int numPage = 1;
    int numReg = 10;
    int countReg = 0;
    if(usuarios == null)
    {
        usuarios = new ArrayList();
    }
    else
        if(usuarios.size() > numReg)
        {
            double divNumPage = (double) usuarios.size() / (double) numReg;
            numPage = (int) Math.ceil(divNumPage);
        }
    String strTop_aux = request.getParameter("top_aux");
    int top_aux = 10;
    if(strTop_aux != null && strTop_aux.trim().length() > 0)
    {
        top_aux = Integer.parseInt(strTop_aux);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/Views/Shared/title.jsp" />
        <title>Usuarios</title>
        <link href="wwwroot/css/estilo.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="/Views/Shared/headerBody.jsp" /> 
        <main class="container">
            <h3 style="color: white; margin-top: 50px; font-weight: bold;">Usuarios Redistrados</h3>
            <form action="Usuario" method="post" style="margin-top: 20px">
                <input type="hidden" name="accion" value="<%request.getAttribute("accion");%>">
                <div class="row">
                    <div class="input-field col 14 s12">
                        <input type="text" id="txtNombre" name="nombre">
                        <label for="txtNombre">Nombre</label>
                    </div>
                    <div class="input-field col 14 s12">
                        <input type="text" id="txtApellido" name="apellido">
                        <label for="txtApellido">Apellido</label>
                    </div>
                    <div class="input-field col 14 s12">
                        <input type="text" id="txtLogin" name="login">
                        <label for="txtLogin">Login</label>
                    </div>
                    <div class="input-field col 14 s12">
                        <jsp:include page="/Views/Rol/select.jsp" >
                            <jsp:param name="id" value="0"/>
                        </jsp:include>
                    </div>
                    <div class="input-field col 14 s12">
                        <jsp:include page="/Views/Shared/selectTop.jsp">
                            <jsp:param name="top_aux" value="<%=top_aux%>"/>
                        </jsp:include>
                    </div>
                </div>
                <c:if test="${rol eq 'Usuario'}">
                    <div class="row" style="margin-top: 30px">
                        <div class="input-field col 16 s12">
                            <button type="submit" class="btn btn-info">Buscar</button>
                        </div>
                    </div>
                </c:if>
                <c:if test="${rol eq 'Administrador'}">
                    <div class="row" style="margin-top: 30px">
                        <div class="input-field col 16 s12">
                            <button type="submit" class="btn btn-info">Buscar</button>
                            <a href="Usuario?accion=create" class="btn btn-info">Nuevo</a>
                        </div>
                    </div>
                </c:if>

            </form>

            <div class="row">
                <div class="table-responsive">
                    <table class="table table-hover table-sm"  style="margin-top: 50px">
                        <thead class="table-dark">
                            <tr>
                                <th>Nombre</th>
                                <th>Apellido</th>
                                <th>Username</th>
                                <th>Estatus</th>
                                <th>Rol</th>
                                <th>Fecha de Registro</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                    for(Usuario usuario:usuarios)
                                    {
                                       int tempNumPage = numPage;
                                       if(numPage > 1)
                                       {
                                            countReg++;
                                            double divTempNumPage = (double) countReg / (double) numReg;
                                            tempNumPage = (int) Math.ceil(divTempNumPage);
                                       }
                                       String estatus = "";
                                       switch(usuario.getEstatus())
                                       {
                                            case 1:
                                                estatus = "ACTIVO";
                                                break;
                                            case 2:
                                                estatus = "INACTIVO";
                                                break;
                                            default:
                                                estatus = "";
                                       }
                            %>
                            <tr data-page="<%=tempNumPage%>">
                                <td><%=usuario.getNombre()%></td>
                                <td><%=usuario.getApellido()%></td>
                                <td><%=usuario.getLogin()%></td>
                                <td><%=estatus%></td>
                                <td><%=usuario.getRol().getNombre()%></td>
                                <td><%=usuario.getFechaRegistro()%></td>
                                <td>
                                    <c:if test="${rol eq 'Administrador'}">
                                        <div style="display: flex">
                                            <a href="Usuario?accion=edit&id=<%=usuario.getId()%>" 
                                               title="Mofificar" class="btn btn-success" style="margin: 7px">
                                                <i class="material-icons">edit</i>
                                            </a>
                                            <a href="Usuario?accion=details&id=<%=usuario.getId()%>" 
                                               title="Ver" class="btn btn-info" style="margin: 7px">
                                                <i class="material-icons">description</i>
                                            </a>

                                            <a href="Usuario?accion=delete&id=<%=usuario.getId()%>" 
                                               title="Eliminar" class="btn btn-danger" style="margin: 7px">
                                                <i class="material-icons">delete</i>
                                            </a>
                                        </div>
                                    </c:if>
                                    <c:if test="${rol eq 'Usuario'}">
                                        <div style="display: flex">
                                            <a href="Usuario?accion=details&id=<%=usuario.getId()%>" 
                                               title="Ver" class="btn btn-info" style="margin: 7px">
                                                <i class="material-icons">description</i>
                                            </a>
                                        </div>
                                    </c:if>
                                </td>
                            </tr> 
                            <%}%>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="row">
                <div class="col 112 s12">
                    <jsp:include page="/Views/Shared/paginacion.jsp">
                        <jsp:param name="numPage" value="<%=numPage%>"/>
                    </jsp:include> 
                </div>
            </div>
        </main>
        <jsp:include page="/Views/Shared/footerBody.jsp" />
    </body>
</html>

