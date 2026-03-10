<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="sistemaadmin.appweb.utils.*"%>
<% if (SessionUser.isAuth(request) == false) {
         response.sendRedirect("Usuario?accion=login");
    }
%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <jsp:include page="/Views/Shared/title.jsp" />
        <title>Inicio</title>
        <!--LINK CSS-->
        <link href="wwwroot/css/estilo3.css" rel="stylesheet" type="text/css"/>

    </head>

    <body>
        <jsp:include page="/Views/Shared/headerBody.jsp" />  
        <!--HEADER-->
        <header class="header header-img">
            <!--TEXTO-HEADER-->
            <div class="texto-header contenedor">

                <h2>Bienvenidos</h2>
                <h3>Al Sistema de Administracion y Mantenimiento</h3>

            </div>

        </header>

        <!--MAIN ANUNCIOS-->
        <main class="anuncios section">

            <div class="contenedor">

                <div class="alinear-texto">

                    <h3>Servicios</h3>

                </div>

                <!--CONTENEDOR-ANUNCIOS-->
                <div class="contenedor-anuncios margin-top">

                    <div class="anuncio">

                        <div class="contenedor-img">
                            <img src="wwwroot/img/image3.jpg" alt=""/>

                        </div>

                        <div class="contenido-anuncio anuncio-especial">
                            <h3>Mantenimento</h3>
                        </div>

                    </div>

                    <div class="anuncio">

                        <div class="contenedor-img">
                            <img src="wwwroot/img/image4.jpg" alt=""/>

                        </div>

                        <div class="contenido-anuncio anuncio-especial">
                            <h3>Adminstracion</h3>
                        </div>

                    </div>

                    <div class="anuncio">

                        <div class="contenedor-img">
                           <img src="wwwroot/img/image5.jpg" alt=""/>
                        </div>

                        <div class="contenido-anuncio anuncio-especial">
                            <h3>Seguridad</h3>
                        </div>

                    </div>

                </div>

            </div>

        </main>

        <!--SECTION CONTACTO-->
        <section class="contacto-index section">

            <div class="contenedor-contacto-index">
                <div class="titulo-contacto-index">
                    <h3>Administracion</h3>
                </div>

                <div class="texto-contacto-index">
                    <h4>Sistema de Mantenimiento de Usuarios y Productos</h4>
                </div>
            </div>

        </section>

        <!--SECTION NOSOTROS-->
        <section class="nosotros section">

            <div class="contenedor">

                <div class="alinear-texto">

                    <h3>NOSOTROS</h3>

                </div>

                <div class="contenedor-nosotros">

                    <div class="nosotros-icono">

                        <div class="icono">

                            <img src="wwwroot/img/seguridad.png" alt="Seguridad""/>
                        </div>

                        <h4>Máxima Seguridad</h4>

                        <p></p>

                    </div>

                    <div class="nosotros-icono">

                        <div class="icono">

                            <img src="wwwroot/img/barato.png" alt="Calida"/>
                        </div>

                        <h4>Calidad</h4>

                        <p></p>

                    </div>

                    <div class="nosotros-icono">

                        <div class="icono">
                            <img src="wwwroot/img/settings.png" alt="Entrega Rapida"/>
                        </div>

                        <h4>Facil Manejo</h4>

                        <p></p>

                    </div>

                    <div class="contenedor-boton-anuncio none">

                        <a href="nosotros.html" class="boton-anuncio">Saber más sobre nosotros</a>

                    </div>

                </div>

            </div>

        </section>

        <!--FOOTER-->
        <footer>

            <!--BARRA-->
            <div class="barra">

                <div class="contenedor-barra contenedor footer">

                    <p class="copyright">&copy; Copyright 2024 - Todos los Derechos Reservados</p>

                </div>

            </div>

        </footer>

    </body>

</html>
