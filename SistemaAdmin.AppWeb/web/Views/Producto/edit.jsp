<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="sistemaadmin.entidades.Producto" %>
<% Producto producto = (Producto) request.getAttribute("producto");  %>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/Views/Shared/title.jsp" />
        <title>Modificar</title>
        <link href="wwwroot/css/estilo2.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="/Views/Shared/headerBody.jsp" />
        <main  class="container col-lg-4">
            <h3 style="margin-top: 30px; color: white; font-weight: bold; margin-left: 20px">Desesa Modificar Este Producto</h3>
            <form action="Producto" method="post" onsubmit="return validarFormulario()">
                <input type="hidden" name="accion" 
                       value="<%=request.getAttribute("accion")%>" id="txtHidden">
                <input type="hidden" name="id" value="<%=producto.getId()%>">
                <div class="form-group">
                    <div class="input-field col 14 s12" style="margin-top: 30px">
                        <input type="text" id="txtNombreProducto" name ="nombreproducto" required 
                               class="validate" maxlength="30"
                               value="<%=producto.getNombreProducto()%>">
                        <label for="txtNombreProducto">Producto</label>
                    </div>
                    <div class="input-field col 14 s12" style="margin-top: 20px">
                        <input type="text" id="txtMarca" name ="marca" required 
                               class="validate" maxlength="30"
                               value="<%=producto.getMarca()%>">
                        <label for="txtMarca">Marca</label>
                    </div>
                    <div class="input-field col 14 s12" style="margin-top: 20px">
                        <input type="text" id="txtDescripcion" name ="descripcion" required 
                               class="validate" maxlength="25"
                               value="<%=producto.getDescripcion()%>">
                        <label for="txtLogin">Descripcion</label>
                    </div>
                    <div class="input-field col 14 s12" style="margin-top: 20px">
                        <input type="text" id="txtPrecio" name ="precio" required 
                               class="validate" maxlength="25"
                               value="<%=producto.getPrecio()%>">
                        <label for="txtPrecio">Precio</label>
                    </div>
                </div>
                <div class="row" style=" margin-right: 50px;">
                    <div class="col 112 s12">
                        <button type="submit" class="btn btn-info" style="margin-left: 15px">
                            <i class="material-icons right">edit</i>Guardar
                        </button>
                        <a href="Producto" class="btn btn-danger" style="margin-left: 30px">
                            <i class="material-icons right">highlight_off</i>Cancelar
                        </a>
                    </div>
                </div>
            </form>
        </main>
        <jsp:include page="/Views/Shared/footerBody.jsp" />
    </body>
</html>
