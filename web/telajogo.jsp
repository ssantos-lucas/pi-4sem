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
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;400;500;700;900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="./css/reset.css">
        <link rel="stylesheet" href="./css/jogo.css">
        <link rel="stylesheet" href="./css/style.css">
        <link rel="stylesheet" href="./css/includes.css">
        <script src="https://kit.fontawesome.com/d220a535d8.js" crossorigin="anonymous"></script>
        <title>Jogo</title>
    </head>

    <body>

        <main>
            <%@include file="includes/header.jsp"%>

            <section class="hero">
                <img src="./images/1440x264.svg" alt="imagem para o painel">
            </section>

            <div class="conteudo">
                <section class="infos">
                    <div class="conteiner-row">
                        <div class="conteiner-col">
                            <%                                Jogo jog = (Jogo) request.getAttribute("Jogo");
                                SiteDAO dao = new SiteDAO();
                            %>
                            <h1 class="titulojogo">
                                <%= jog.getNomeJogo()%>
                            </h1>
                            <p class="descricao">
                                <%= jog.getDescricaoJogo()%>
                            </p>
                            <h3 class="titulodesenvolvedores">
                                Desenvolvedores
                            </h3>
                            <p class="descricao">
                                <%
                                    // definindo variavel contador
                                    int cont = 0;
                                    //inicio do for each
                                    for (Desenvolvedor dev : jog.getDesenvolvedorList()) {
                                        //verificando se o contador é igual ao tamanho da lista do desenvolvedor
                                        if (cont == jog.getDesenvolvedorList().size()) {

                                %>
                                <!-- print q deve sair se o tamanho menor -->
                                <text><%= dev.getNomeDesenvolvedor()%>,</text>

                                <%
                                } else {

                                %>

                                <text><%= dev.getNomeDesenvolvedor()%>.</text>

                                <%
                                        }
                                        cont++;
                                    }
                                %>
                            </p>
                            <h3 class="titulocontato">Entre em contato</h3>
                            <p class="descricao">
                                <%
                                    for (Desenvolvedor dev : jog.getDesenvolvedorList()) {
                                        if (dev.getContatoDesenvolvedor() != null) {
                                %>
                                <text> <%= dev.getContatoDesenvolvedor()%> </text>
                                <%
                                } else {
                                %>
                                <text> <%= dev.getNomeDesenvolvedor().split(" ")[0]%> sem contato </text>
                                <%
                                        }
                                    }
                                %>    
                            </p>
                        </div>
                        <div class="conteiner-col2">
                            <div class="buttons">
                                <div class="conteiner-row-favoritar">
                                    <label for="button1" id="favoritar"><span>Favoritar</span></label>
                                    <button id="button1" class="bttn1" onclick="toggle()">
                                        <i class="fa-solid fa-heart"></i></button>
                                </div>
                                <div class="playbutton">

                                    <%
                                        if (jog.getUrlJogo() != null) {
                                    %>
                                    <a href="<%= jog.getUrlJogo()%>" class="botao"><span>Jogar</span></a>
                                    <%
                                    } else {
                                    %>
                                    <text class="botao"><span>Indisponível</span></a>
                                    <%
                                        }
                                    %>

                                </div>
                            </div>
                            <!-- <hr> -->
                            <div class="conteiner-row-especificacoes">
                                <section class="especificacoes">
                                    <div class="conteiner-row">
                                        <div class="conteiner-col1">

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
                                                Gênero:
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
                            // Adicionar método para verificar se o jogo já é favorito do usuário ou não
                            // para pintar o botão de vermelho quando a página carregar diretamente caso
                            // o jogo já seja favorito do usuário.

                            function toggle() {
                                if (botaoFavoritar.style.color == "red") {
                                    botaoFavoritar.style.color = '#a8a8a8'
                                    desfavoritar();
                                } else {
                                    botaoFavoritar.style.color = "red";
                                    favoritar();
                                }
                            }

                            function favoritar() {   // Função para armazenar no banco de dados que o usuário favoritou o jogo.

                            }

                            function desfavoritar() {    // Função para remover o jogo dos favoritos do usuário.

                            }
                        </script>
                    </div>
                </section>
                <div id="divisor">
                    <hr>
                </div>
                <div class="outros">
                    <h3 class="outros-jogos">Outros jogos:</h3>
                    <%
                        for (Desenvolvedor dev : jog.getDesenvolvedorList()) {
                            for (Jogo ljog : dev.getJogoList()) {
                    %>
                    <img src="./images/games/<%= ljog.getImagemLogo()%>" alt="<%= ljog.getNomeJogo()%>">
                    <%
                            }
                        }
                    %>
                </div>
            </div>
        </main>
        <%@include file="includes/footer.jsp"%>

    </body>

</html>