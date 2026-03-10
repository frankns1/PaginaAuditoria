<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="sistemaadmin.entidades.Producto" %>
<%@page import="java.util.ArrayList" %>
<%ArrayList<Producto> productos = (ArrayList<Producto>) request.getAttribute("productos");
    int numPage = 1;
    int numReg = 10;
    int countReg = 0;
    if(productos == null)
    {
        productos = new ArrayList();
    }
    else
        if(productos.size() > numReg)
        {
            double divNumPage = (double) productos.size() / (double) numReg;
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
        <title>Carros</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link href="wwwroot/css/estilo.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="/Views/Shared/headerBody.jsp" /> 
        <main class="container">
            <h3 style="color: white; margin-right: 5px; margin-top: 50px;font-weight: bold">Producto Registrados</h3>
            <form action="Producto" method="post" style="margin-top: 20px">
                <input type="hidden" name="accion" value="<%request.getAttribute("accion");%>">
                <div class="row">
                    <div class="input-field col 14 s12">
                        <input type="text" id="txtNombreProducto" name="nombreproducto">
                        <label for="txtNombreProducto">Producto</label>
                    </div>
                    <div class="input-field col 14 s12">
                        <input type="text" id="txtMarca" name="marca">
                        <label for="txtMarca">Marca</label>
                    </div>
                    <div class="input-field col 14 s12">
                        <jsp:include page="/Views/Shared/selectTop.jsp">
                            <jsp:param name="top_aux" value="<%=top_aux%>"/>
                        </jsp:include>
                    </div>
                </div>
                <div class="row" style="margin-top: 30px">
                    <div class="input-field col 16 s12">
                        <button type="submit" class="btn btn-info">Buscar</button>
                        <a href="Producto?accion=create" class="btn btn-info">Nuevo</a>
                    </div>
                </div>
            </form>
            <div class="row">
                <div class="table-responsive">
                    <table class="table table-hover table-sm" style="margin-top: 50px">
                        <thead class="table-dark" style="margin-right: 50px">
                            <tr>
                                <th>Producto</th>
                                <th>Marca</th>
                                <th>Descripcion</th>
                                <th>Precio</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                            for(Producto producto:productos)
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
                                <td><%=producto.getNombreProducto()%></td>
                                <td><%=producto.getMarca()%></td>
                                <td><%=producto.getDescripcion()%></td>
                                <td><%=producto.getPrecio()%></td>
                                <c:if test="${rol eq 'Administrador'}">
                                    <td>
                                        <div style="display: flex">
                                            <a href="Producto?accion=edit&id=<%=producto.getId()%>" 
                                               title="Mofificar" class="btn btn-success" style="margin: 7px">
                                                <i class="material-icons">edit</i>
                                            </a>
                                            <a href="Producto?accion=details&id=<%=producto.getId()%>" 
                                               title="Ver" class="btn btn-info" style="margin: 7px">
                                                <i class="material-icons">description</i>
                                            </a>
                                            <a href="Producto?accion=delete&id=<%=producto.getId()%>" 
                                               title="Eliminar" class="btn btn-danger" style="margin: 7px">
                                                <i class="material-icons">delete</i>
                                            </a>
                                        </div>
                                    </td>
                                </tr> 
                            </c:if>
                            <c:if test="${rol eq 'Usuario'}">
                            <td>
                                <div style="display: flex">
                                    <a href="Producto?accion=edit&id=<%=producto.getId()%>" 
                                       title="Mofificar" class="btn btn-success" style="margin: 7px">
                                        <i class="material-icons">edit</i>
                                    </a>
                                    <a href="Producto?accion=details&id=<%=producto.getId()%>" 
                                       title="Ver" class="btn btn-info" style="margin: 7px">
                                        <i class="material-icons">description</i>
                                    </a>
                                </div>
                            </td>
                            </tr> 
                        </c:if>
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

