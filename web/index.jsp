<%-- 
    Document   : index
    Created on : 6 de abr. de 2023, 20:49:23
    Author     : Eddy Mauricio
--%>

<%@page import="model.Usuario"%>
<%@page import="model.Jogo"%>
<%@page import="model.SiteDAO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;400;500;700;900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="./css/reset.css">
        <link rel="stylesheet" href="./css/style.css">
        <title>Jogos</title>
    </head>

    <body>
        <header class="header">
            <div class="header-container">
                <a href="#" class="logo"><img src="./images/FFF.svg" alt="logo da página"></a>
                <nav class="itens">
                    <ul>
                        <li>
                            <a href="sobre.jsp">Sobre</a>
                        </li>
                        <li>
                            <a href="#">Busca</a>
                        </li>
                        <li>
                            <%
                                Usuario uLogado = (Usuario)session.getAttribute("usuarioLogado");
                                if(uLogado != null){
                            %>
                            <span><%=uLogado.getNomeUsuario()%></span>
                            <%
                                } else {
                            %>
                            <a href="login.jsp">Login</a>
                            <%
                            }
                            %>
                        </li>
                    </ul>
                </nav>
            </div>
        </header>

        <section class="hero">
            <img src="./images/1440x264.svg" alt="banner da página">
        </section>

        <main class="container">
            <div class="tudo">
                <%
                    SiteDAO dao = new SiteDAO();
                    List<Jogo> jogos = dao.listarJogos();

                    for (Jogo jog : jogos) {
                %>
                <div class="">
                    <img src="./images/games/<%= jog.getImagemLogo() %>" class="jogo-um" alt="Jogo <%= jog.getNomeJogo() %>">
                    <p class="titulos"><%= jog.getNomeJogo() %></p>
                </div>
                <%
                }
                %>
            </div>
        </main>


        <footer class="rodape">
            <img src="./images/FFF.svg" alt="logo do rodape">
        </footer>

    </body>

</html>