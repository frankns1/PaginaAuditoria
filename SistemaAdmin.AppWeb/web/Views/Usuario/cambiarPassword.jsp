<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="sistemaadmin.entidades.Usuario" %>
<% Usuario usuario = (Usuario) request.getAttribute("usuario");%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/Views/Shared/title.jsp" />
        <title>Cambiar Password</title>
        <link href="wwwroot/css/estilo2.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="/Views/Shared/headerBody.jsp" />
        <main class="container col-lg-5" style="margin-top: 40px">
            <h3 style="color: white; font-weight: bold">Cambio de Contraceña</h3>
            <form action="Usuario" method="post" onsubmit="return validarFormulario()">
                <input type="hidden" name="accion" 
                       value="<%=request.getAttribute("accion")%>" id="txtHidden">
                <input type="hidden" name="id" 
                       value="<%=usuario.getId()%>" id="txtHiddenId">
                <div class="row" style="margin-top: 20px"> 
                    <div class="input-field col 14 s12" style="margin-top: 30px">
                        <input type="text" id="txtLogin" name ="login" required 
                               class="validate" maxlength="25" 
                               value = "<%=usuario.getLogin()%>"readonly>
                        <label for="txtLogin">Username</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col 14 s12" style="margin-top: 30px">
                        <input type="text" id="txtPasswordActual" name ="passwordActual" 
                               required class="validate" 
                               minlength="5" maxlength="32">
                        <label for="txtPasswordActual"> Contraceña Actual</label>
                    </div>
                </div>  
                <div class="row">
                    <div class="input-field col 14 s12" style="margin-top: 30px">
                        <input type="password" id="txtPassword" name ="password" required 
                               class="validate" minlength="5" maxlength="32">
                        <label for="txtPassword">Nueva Contraceña</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col 14 s12" style="margin-top: 30px">
                        <input type="password" id="txtConfirmPassword_aux" 
                               name ="confirmPassword_aux" 
                               required class="validate" minlength="5" maxlength="32">
                        <label for="txtConfirmPassword_aux">Confirmar Contraceña</label>
                        <span id="txtConfirmPassword_aux_error" 
                              style="color:red;font-weight: bold" class="helper-text">
                        </span>
                    </div>
                </div>

                <div class="row" style="margin-top: 30px">
                    <div class="col 112 s12">
                        <button type="submit" class="btn btn-info">
                            <i class="material-icons right">save</i>Guardar
                        </button>
                        <a href="Home" class="btn btn-danger" style="margin-left: 30px">
                            <i class="material-icons right">highlight_off</i>Cancelar
                        </a>
                    </div>
                </div>
            </form>
        </main>
        <jsp:include page="/Views/Shared/footerBody.jsp" />
        <script>
            function validarFormulario()
            {
                var result = true;
                var txtPassword = $("#txtPassword").val();
                var txtConfirmPassword = $("#txtConfirmPassword_aux").val();

                if (txtPassword != txtConfirmPassword)
                {
                    $("#txtConfirmPassword_aux_error").empty();
                    $("#txtConfirmPassword_aux_error")
                            .append("El Contraceña y Confirmar Contraceña deben ser iguales");
                    result = false;
                } else
                {
                    $("#txtConfirmPassword_aux_error").empty();
                }

                return result;
            }
        </script>
    </body>
</html>
