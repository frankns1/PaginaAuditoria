<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="sistemaadmin.entidades.Producto" %>
<% Producto producto = (Producto) request.getAttribute("producto");  %>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/Views/Shared/title.jsp" />
        <title>Eliminar</title>
        <link href="wwwroot/css/estilo2.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="/Views/Shared/headerBody.jsp" />
        <main class="container col-lg-5" style="margin-top: 40px">
            <h3 style="color: white; font-weight: bold">Desea Eliminar este Producto</h3>
            <form action="Producto" method="post">
                <input type="hidden" name="accion" 
                       value="<%=request.getAttribute("accion")%>" id="txtHidden">
                <input type="hidden" name="id" value="<%=producto.getId()%>">
                <div class="row" style="margin-top: 20px">
                    <div class="input-field col 14 s12" style="margin-top: 30px">
                        <input type="text" id="txtNombreProducto" name ="nombre" required 
                               class="validate" maxlength="30"
                               value="<%=producto.getNombreProducto()%>" disabled>
                        <label for="txtNombreProducto">Producto</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col 14 s12" style="margin-top: 30px">
                        <input type="text" id="txtMarca" name ="marca" required 
                               class="validate" maxlength="30"
                               value="<%=producto.getMarca()%>" disabled>
                        <label for="txtMarca">Marca</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col 14 s12" style="margin-top: 30px">
                        <input type="text" id="txtDescripcion" name ="descripcion" required 
                               class="validate" maxlength="25"
                               value="<%=producto.getDescripcion()%>" disabled>
                        <label for="txtLogin">Descripcion</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col 14 s12" style="margin-top: 30px">
                        <input type="text" id="txtPrecio" name ="precio" required 
                               class="validate" maxlength="25"
                               value="<%=producto.getPrecio()%>" disabled>
                        <label for="txtLogin">Precio</label>
                    </div>
                </div>
                <div class="row" style="margin-top: 30px">
                    <div class="col 112 s12">
                        <button type="submit" class="btn btn-danger">
                            <i class="material-icons right">delete</i>Eliminar
                        </button>
                        <a href="Producto" class="btn btn-warning" style="margin-left: 30px">
                            <i class="material-icons right">highlight_off</i>Cancelar
                        </a>
                    </div>
                </div>
            </form>
        </main>
        <jsp:include page="/Views/Shared/footerBody.jsp" />
    </body>
</html>
