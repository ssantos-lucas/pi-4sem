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
                            <%                                
                                Jogo jog = (Jogo) request.getAttribute("Jogo");
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
                                <%= jog.getDesenvolvedorList() %>
                            </p>
                            <h3 class="titulocontato">Entre em contato</h3>
                            <p class="descricao">
                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Beatae quas impedit neque. Cum
                                voluptatum
                                totam
                                eum dicta ducimus expedita molestiae amet voluptates soluta. Eligendi placeat modi ullam
                                delectus
                                expedita minus.
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
                                        if (jog.getUrlJogo().equals(null)) {
                                    %>
                                    <a href="#" class="botao"><span>Indisponível</span></a>
                                    <%
                                    } else {
                                    %>
                                    <a href="<%= jog.getUrlJogo()%>" class="botao"><span>Jogar</span></a>
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
                                            <h3 class="classificacao">+ <%= jog.getFaixaEtariaJogo()%></span></h3>
                                            <p class="genero">
                                            <h3 class="genero-dentro">
                                                Gênero:
                                            </h3>
                                            <span class="generos">Terror, ação</span>
                                            </p>
                                            <br>
                                            <p class="plataforma">
                                            <h3 class="plataforma-dentro">Plataformas:</h3>
                                            <span class="plataformas">macOS, Windows, Android</span>
                                            </p>
                                            <br>
                                            <p class="player">
                                            <h3 class="player-dentro">Jogadores:</h3>
                                            <span class="players">Singleplayer, Multiplayer</span>
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
                    <script>
                        // Aqui tem que colocar uma lógica para pegar outros 2 jogos aleatórios para dispor na tela.
                    </script>
                    <img src="./image/200x200.svg" alt="outro jogo">
                    <img src="./image/200x200.svg" alt="outro jogo">
                </div>
            </div>
        </main>
        <%@include file="includes/footer.jsp"%>

    </body>

</html>