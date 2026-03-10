<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/Views/Shared/title.jsp" />
        <title>Crear Rol</title>
        <link href="wwwroot/css/estilo2.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="/Views/Shared/headerBody.jsp" />
        <main class="container col-lg-4" style="margin-top: 40px">
            <h3 style="color: white; font-weight: bold">Agregar Nuevos Roles</h3>
            <form action="Rol" method="post">
                <input type="hidden" name="accion" 
                       value="<%=request.getAttribute("accion")%>" id="txtHidden">
                <div class="row" style="margin: 50px">
                    <div class="input-field col 14 s12">
                        <input type="text" id="txtNombre" name ="nombre" required 
                               class="validate" maxlength="30" disabled>
                        <label for="txtNombre">Rol</label>
                    </div>
                </div>
                <div class="row" style="margin: 50px">
                    <div class="col 112 s12">
                        <button type="submit" class="btn btn-info" >
                            <i class="material-icons right">save</i>Guardar
                        </button>
                        <a href="Rol" class="btn btn-danger" style="margin-left: 30px">
                            <i class="material-icons right">highlight_off</i>Cancelar
                        </a>
                    </div>
                </div>
            </form>
        </main>
        <jsp:include page="/Views/Shared/footerBody.jsp" />
    </body>
</html>
