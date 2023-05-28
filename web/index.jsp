<%@page import="model.Usuario"%>
<%@page import="model.Jogo"%>
<%@page import="model.SiteDAO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="ISO-8859-1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;400;500;700;900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="./css/reset.css">
        <link rel="stylesheet" href="./css/style.css">
        <link rel="stylesheet" href="./css/includes.css">
        <title>Jogos</title>
    </head>

    <body>
        <%@include file="includes/header.jsp"%>
        
        <section class="hero">
            <img src="./images/1440x264.svg" alt="imagem do painel">
        </section>

        <main>
            <!-- genero -->
            <div class="jogo-container">
                <%
                    SiteDAO dao = new SiteDAO();
                    List<Jogo> jogos = dao.listarJogos();

                    for (Jogo jog : jogos) {
                %>
                <div class="itemjogo">
                    <a href="Controle?flag=consultar&idJogo=<%= jog.getIdJogo()%>"><img src="./images/games/<%= jog.getImagemLogo() %>" class="imgjogo" alt="Jogo <%= jog.getNomeJogo() %>"></a>
                    <p class="titulos"><%= jog.getNomeJogo() %></p>
                </div>
                <%
                }
                %>
            </div>
        </main>
        <%@include file="includes/footer.jsp"%>
    </body>
</html>