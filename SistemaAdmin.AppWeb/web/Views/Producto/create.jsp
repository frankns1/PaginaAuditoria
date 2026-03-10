<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="sistemaadmin.entidades.Producto" %>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/Views/Shared/title.jsp" />
        <title>Nuevos Usuario</title>
        <link href="wwwroot/css/estilo2.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="/Views/Shared/headerBody.jsp" />
        <main class="container" style="margin-top: 40px">
            <h3 style="color: white; font-weight: bold">Agregar Nuevo Usuario</h3>
            <form action="Producto" method="post" onsubmit="return validarFormulario()">
                <input type="hidden" name="accion" 
                       value="<%=request.getAttribute("accion")%>" id="txtHidden">
                <div class="row" style="margin: 50px">
                    <div class="input-field col 14 s12">
                        <input type="text" id="txtNombreProducto" name ="nombreproducto" required 
                               class="validate" maxlength="30">
                        <label for="txtNombreProducto">Producto</label>
                    </div>
                    <div class="input-field col 14 s12">
                        <input type="text" id="txtMarca" name ="marca" required 
                               class="validate" maxlength="30">
                        <label for="txtMarca">Marca</label>
                    </div>
                </div>
                <div class="row" style="margin: 50px">
                    <div class="input-field col 14 s12">
                        <input type="text" id="txtDescripcion" name ="descripcion" required 
                               class="validate" maxlength="25">
                        <label for="txtDescripcion">Descripcion</label>
                    </div>
                    <div class="input-field col 14 s12">
                        <input type="text" id="txtPrecio" name ="precio" required 
                               class="validate" maxlength="25">
                        <label for="txtPrecion">Precio</label>
                    </div>
                </div>
                <div class="row" style="margin: 50px">
                    <div class="col 112 s12" >
                        <button type="submit" class="btn btn-info">
                            <i class="material-icons right">save</i>Guardar
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
