<%@page import="model.Categoria"%>
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
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@200;400;600&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="./css/reset.css">
        <link rel="stylesheet" href="./css/style.css">
        <title>Inicio</title>
    </head>

    <body>
        <%@include file="includes/header.jsp"%>

        <section class="hero" style="background-image: url('./images/Banner.png')">
            <img src="./images/Banner.png" alt="banner do site">
            <div class="gradient"></div>
        </section>

        <main>
            <% SiteDAO dao = new SiteDAO(); %>
            <form method="GET" action="Controle" id="formGenero">
                <input type="hidden" name="flag" value="filtroGenero">
                <select id="barraGenero" name="genero" onchange="generoSubmit()">
                    <% 
                        List<Categoria> listaGeneros = dao.listarGeneros();
                        
                        for (Categoria categoria : listaGeneros){
                            String selected = "";
                            if (categoria.getIdCategoria().toString().equals(request.getParameter("genero"))){
                                selected = "selected";
                            }
                    %>
                    <option value="<%=categoria.getIdCategoria()%>" <%=selected%>><%=categoria.getNomeCategoria()%></option>
                    <%
                        }
                    %>
                </select>
            </form>

            <div class="jogo-container">
                <% 
                    List<Jogo> listaFiltrada = (List<Jogo>) request.getAttribute("listaJogos");
                    List<Jogo> jogos = listaFiltrada != null ? listaFiltrada : dao.listarJogos();

                    for (Jogo jog : jogos) {
                %>
                <div class="itemjogo">
                    <a href="Controle?flag=consultar&idJogo=<%= jog.getIdJogo()%>"><img src="./images/games/<%= jog.getImagemLogo()%>" class="imgjogo" alt="Jogo <%= jog.getNomeJogo()%>">
                        <p class="titulos"><%= jog.getNomeJogo()%></p></a>
                </div>
                <%
                    }
                %>
            </div>
        </main>
        <%@include file="includes/footer.jsp"%>
    </body>
    <script>
        function generoSubmit(){
            document.getElementById("formGenero").submit();
        }
    </script>
</html>