<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <title>Login</title>
        <link href="wwwroot/css/estilo1.css" rel="stylesheet" type="text/css"/>
        <link href="wwwroot/css/estilo1.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container-form sign-up">
            <div class="welcome-back">
                <div class="message">
                    <h2>Bienvenidos</h2>
                    <p style="font-size: 1.7rem;">Al Sistema de Administracion de Usuarios</p>
                </div>
            </div>
            <form class="card" style="margin-top: 200px" action="Usuario?accion=login" method="post">
                <input type="hidden" name="accion" 
                       value="<%=request.getAttribute("accion")%>" id="txtHidden">
                <h2>Inicio de Sesion</h2>
                <div class="form-group">
                    <label for="txtLogin">Usuario</label>
                    <input class="form-control" type="text" id="txtLogin" name ="login" required 
                           class="validate" placeholder="Ejemplo Usuario1">

                </div>
                <div class="form-group">
                    <label for="txtPassword">Contraceña</label>
                    <input class="form-control"  type="password" id="txtPassword" name ="password" required 
                           class="validate" placeholder="Contraceña">
                </div>

                <input class="btn btn-warning btn-block" type="submit" name="accion" value="Ingresar">
                <%
                    if(request.getAttribute("error") != null)
                    {
                %>
                <div class="row">
                    <div class="col 112 s12">
                        <span style="color:red;font-weight: bold;">
                            <%=request.getAttribute("error") %> 
                        </span>
                    </div>
                </div>
                <% } %>

            </form>
        </div>


        <jsp:include page="/Views/Shared/footerBody.jsp" />
        <script src="wwwroot/js/script.js" type="text/javascript"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    </body>
</html>