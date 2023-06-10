
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;400;500;700;900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="./css/reset.css">
        <link rel="stylesheet" href="./css/style.css">
        <link rel="stylesheet" href="./css/perfil.css">
        <link rel="stylesheet" href="./css/includes.css">
        <link rel="stylesheet" href="./css/mensagens.css">
        <title>Perfil</title>
    </head>
    <body>
        <%@include file="includes/header.jsp"%>
        <main>
            <%if (uLogado == null) {
                // Se usuário não estiver logado, redirecionar para home
                %>
                <script>
                    window.location.replace("/GameHub/");
                </script></main></body></html>
                <%
                return;
            }%>
            <h2 id="perfilh2">Perfil</h2>
            <form class="perfil" method="POST" action="Controle">
                <input type="hidden" name="flag" value="editarPerfil">
                <br>
                <p>
                    <label for="email">E-mail:</label>
                    <input id="email" type="text" name="email" value="<%=uLogado.getEmailUsuario()%>" readonly> 
                </p>
                <br>
                <p>
                    <label for="nome">Nome:</label>
                    <input id="nome" type="text" name="nome" value="<%=uLogado.getNomeUsuario()%>"> 
                </p>
                <br>
                <p>
                    <label for="nascimento">Data de Nascimento:</label>
                    <%
                        Date dataNascimento = uLogado.getDataNascUsuario();
                        String dataFormatada = dataNascimento != null ?
                                new SimpleDateFormat("yyyy-MM-dd").format(dataNascimento)
                                : "";
                    %>
                    <input id="nascimento" type="date" name="nascimento" value="<%=dataFormatada%>"> 
                </p>
                <div class="feedback-usuario">
                    <% if(request.getAttribute("erroData") != null) {
                        %><p><%=request.getAttribute("erroData")%></p><%
                    }
                    %>
                </div>
                <br>
                <p>
                    <label for="estado">Estado:</label>
                    <%
                        String estado = uLogado.getEstadoUsuario() != null ? uLogado.getEstadoUsuario() : "";
                    %>
                    <input id="estado" type="text" name="estado" value="<%=estado%>"> 
                </p>
                <br>
                <input type="submit" value="Salvar" id="saveBttn"> 
            </form>
                <br>
                <h2 id="favoritosh2">Favoritos</h2>
        </main>
        <%@include file="includes/footer.jsp"%>
    </body>
</html>
