<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="model.Categoria"%>
<%@page import="model.Desenvolvedor"%>
<%@page import="model.SiteDAO"%>
<%@page import="model.Jogo"%>
<%@page import="model.Usuario"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="pt-br">

    <head>
        <meta charset="ISO-8859-1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./css/reset.css">      
        <link rel="stylesheet" href="./css/jogo.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;400;500;700;900&display=swap" rel="stylesheet">
        <script src="https://kit.fontawesome.com/d220a535d8.js" crossorigin="anonymous"></script>
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@200;400;600&display=swap" rel="stylesheet">
        <title>Jogo</title>
    </head>

    <body>

        <main>
            <%@include file="includes/header.jsp"%>

            <% Jogo jog = (Jogo) request.getAttribute("Jogo");%>
            <section class="hero" 
                     style="background-image: url(&quot;./images/games/<%= jog.getImagemCorpo()%>&quot;)">
                <img src="./images/games/<%= jog.getImagemCorpo()%>" alt=" <%= jog.getNomeJogo()%>">
                <div class="gradient"></div>
            </section>
            <div class="conteudo">
                <section class="infos">
                    <div class="container-row">
                        <div class="container-col">

                            <h1 class="titulojogo">
                                <%= jog.getNomeJogo()%>
                            </h1>
                            <p class="descricao">
                                <%= jog.getDescricaoJogo()%>
                            </p>
                            <h3 class="titulodesenvolvedores">
                                Desenvolvedores
                            </h3>
                            <ul class="contatos-desenvolvedores descricao">
                                <%
                                    for (Desenvolvedor dev : jog.getDesenvolvedorList()) {
                                        if (dev.getContatoDesenvolvedor() != null) {
                                            String link;
                                            if (dev.getContatoDesenvolvedor().contains("@")) {
                                                link = "mailto:" + dev.getContatoDesenvolvedor();
                                            } else {
                                                link = dev.getContatoDesenvolvedor();
                                            }
                                %>
                                <li><a href="<%= link%>" target="_blank"><%= dev.getNomeDesenvolvedor()%></a></li>
                                    <%
                                    } else {
                                    %>
                                <li><%= dev.getNomeDesenvolvedor()%></li>
                                    <%
                                            }
                                        }
                                    %>    
                            </ul>
                        </div>
                        <div class="container-col2">
                            <div class="buttons">
                                <% if(uLogado != null) { %>
                                <div class="container-row-favoritar">
                                    <label for="button1" id="favoritar"><span>Favoritar</span></label>
                                    <button id="button1" class="bttn1" onclick="toggle(); favoritar(<% uLogado.getIdUsuario(); %>, <% jog.getIdJogo(); %>);">
                                        <i class="fa-solid fa-heart"></i></button>
                                </div>
                                <% } %>
                                <div class="playbutton">

                                    <%
                                        if (jog.getUrlJogo() != null) {
                                    %>
                                    <a href="<%= jog.getUrlJogo()%>" class="botao"><span>Jogar</span></a>
                                    <%
                                    } else {
                                    %>
                                    <text class="botao"><span>Indispon�vel</span></a>
                                    <%
                                        }
                                    %>

                                </div>
                            </div>
                            <div class="container-row-especificacoes">
                                <section class="especificacoes">
                                    <div class="container-row">
                                        <div class="container-col1">

                                            <%
                                                if (jog.getFaixaEtariaJogo() == 0) {
                                            %>

                                            <h3 class="classificacao">Livre</span></h3>

                                            <%
                                            } else {
                                            %>

                                            <h3 class="classificacao">+ <%= jog.getFaixaEtariaJogo()%></span></h3>

                                            <%
                                                }
                                            %>

                                            <p class="genero">
                                            <h3 class="genero-dentro">
                                                G�nero:
                                            </h3>
                                            <%
                                                for (Categoria cat : jog.getCategoriaList()) {
                                                    if (cat.getTipoCategoria() == 1) {
                                            %>
                                            <span class="generos"><%= cat.getNomeCategoria()%></span>
                                            <%
                                                    }
                                                }
                                            %>
                                            </p>
                                            <br>
                                            <p class="plataforma">
                                            <h3 class="plataforma-dentro">Plataformas:</h3>
                                            <%
                                                for (Categoria cat : jog.getCategoriaList()) {
                                                    if (cat.getTipoCategoria() == 3) {
                                            %>
                                            <span class="plataformas"><%= cat.getNomeCategoria()%></span>
                                            <%
                                                    }
                                                }
                                            %>
                                            </p>
                                            <br>
                                            <p class="player">
                                            <h3 class="player-dentro">Jogadores:</h3>
                                            <%
                                                for (Categoria cat : jog.getCategoriaList()) {
                                                    if (cat.getTipoCategoria() == 2) {

                                            %>
                                            <span class="players"><%= cat.getNomeCategoria()%></span>
                                            <%
                                                    }
                                                }
                                            %>
                                            <br>
                                        </div>
                                    </div>
                                </section>
                            </div>
                        </div>
                        <script>
                            var botaoFavoritar = document.getElementById('button1');
                            // Adicionar m�todo para verificar se o jogo j� � favorito do usu�rio ou n�o
                            // para pintar o bot�o de vermelho quando a p�gina carregar diretamente caso
                            // o jogo j� seja favorito do usu�rio.

                            function toggle() {
                                if (botaoFavoritar.style.color == "red") {
                                    botaoFavoritar.style.color = '#a8a8a8';
//                                    desfavoritar();
                                } else {
                                    botaoFavoritar.style.color = "red";
//                                    favoritar();
                                }
                            }

                            function favoritar(int idUsuario, int idJogo) {
                                var xhttp = new XMLHttpRequest();
                                xhttp.onreadystatechange = function () {
                                    if (this.readyState == 4 && this.status == 200) {
                                        // A resposta do arquivo .java foi recebida com sucesso
                                        console.log(this.responseText);
                                    }
                                };
                                xhttp.open("POST", "Controle.java", true);
                                xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                xhttp.send("flag=" + "favoritar");
                                xhttp.send("idUsuario=" + idUsuario);
                                xhttp.send("idJogo=" + idJogo);
                            }
                        </script>
                    </div>
                </section>
                <div id="divisor">
                    <hr>
                </div>
                <h3 class="outros-titulo">Outros jogos</h3>
                <div class="outros">
                    <%
                        Set<Jogo> jogos = new HashSet<>();
                        for (Desenvolvedor dev : jog.getDesenvolvedorList()) {
                            jogos.addAll(dev.getJogoList());
                        }
                        for (Jogo ljog : jogos) {
                    %>
                    <div class="outros-img">
                        <a href="Controle?flag=consultar&idJogo=<%= ljog.getIdJogo() %>" title="<%= ljog.getNomeJogo()%>">
                            <img src="./images/games/<%= ljog.getImagemLogo()%>" alt="<%= ljog.getNomeJogo()%>">
                        </a>
                    </div>
                    <% } %>
                </div>
            </div>
        </main>
        <%@include file="includes/footer.jsp"%>
    </body>
</html>