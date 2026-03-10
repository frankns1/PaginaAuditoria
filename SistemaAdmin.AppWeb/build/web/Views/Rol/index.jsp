<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="sistemaadmin.entidades.Rol" %>
<%@page import="java.util.ArrayList" %>
<%ArrayList<Rol> roles = (ArrayList<Rol>) request.getAttribute("roles");
    int numPage = 1;
    int numReg = 10;
    int countReg = 0;
    if(roles == null)
    {
        roles = new ArrayList();
    }
    else
        if(roles.size() > numReg)
        {
            double divNumPage = (double) roles.size() / (double) numReg;
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
        <title>Roles</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link href="wwwroot/css/estilo.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="/Views/Shared/headerBody.jsp" /> 
        <main class="container">
            <h3 style="color: white; margin-right: 5px; margin-top: 50px;font-weight: bold">Roles Registrados</h3>
            <form action="Rol" method="post" style="margin-top: 30px">
                <input type="hidden" name="accion" value="<%request.getAttribute("accion");%>">
                <div class="row">
                    <div class="input-field col 16 s12">
                        <input type="text" id="txtNombre" name="nombre">
                        <label for="txtNombre">Nombre</label>
                    </div>
                    <div class="input-field col 13 s12">
                        <jsp:include page="/Views/Shared/selectTop.jsp">
                            <jsp:param name="top_aux" value="<%=top_aux%>"/>
                        </jsp:include>
                    </div>
                </div>
                <c:if test="${rol eq 'Administrador'}">
                    <div class="row" style="margin-top: 30px">
                        <div class="input-field col 16 s12">
                            <button type="submit" class="btn btn-info">Buscar</button>
                            <a href="Rol?accion=create" class="btn btn-info">Nuevo</a>
                        </div>
                    </div>
                </c:if>
                <c:if test="${rol eq 'Usuario'}">
                    <div class="row" style="margin-top: 30px">
                        <div class="input-field col 16 s12">
                            <button type="submit" class="btn btn-info">Buscar</button>
                        </div>
                    </div>
                </c:if>

            </form>

            <div class="row">
                <div class="table-responsive">
                    <table class="table table-hover table-sm" style="margin-top: 50px">
                        <thead class="table-dark" style="margin-right: 50px">
                            <tr>
                                <th>Nombre</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                            for(Rol rol:roles)
                            {
                               int tempNumPage = numPage;
                               if(numPage > 1)
                               {
                                    countReg++;
                                    double divTempNumPage = (double) countReg / (double) numReg;
                                    tempNumPage = (int) Math.ceil(divTempNumPage);
                               }
                            %>
                            <tr data-page="<%=tempNumPage%>">
                                <td><%=rol.getNombre()%></td>
                                <c:if test="${rol eq 'Administrador'}">
                                    <td>
                                        <div style="display: flex">
                                            <a href="Rol?accion=edit&id=<%=rol.getId()%>" 
                                               title="Mofificar" class="btn btn-success" style="margin: 7px">
                                                <i class="material-icons">edit</i>
                                            </a>
                                            <a href="Rol?accion=details&id=<%=rol.getId()%>" 
                                               title="Ver" class="btn btn-info" style="margin: 7px">
                                                <i class="material-icons">description</i>
                                            </a>
                                            <a href="Rol?accion=delete&id=<%=rol.getId()%>" 
                                               title="Eliminar" class="btn btn-danger" style="margin: 7px">
                                                <i class="material-icons">delete</i>
                                            </a>
                                        </div>
                                    </td>
                                </c:if>
                                <c:if test="${rol eq 'Usuario'}">
                                    <td>
                                        <div style="display: flex">
                                            <a href="Rol?accion=details&id=<%=rol.getId()%>" 
                                               title="Ver" class="btn btn-info" style="margin: 7px">
                                                <i class="material-icons">description</i>
                                            </a>
                                        </div>
                                    </td>
                                </c:if>
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
