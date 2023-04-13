<%-- 
    Document   : index
    Created on : 6 de abr. de 2023, 20:49:23
    Author     : Eddy Mauricio
--%>

<%@page import="java.util.List"%>
<%@page import="model.Jogo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

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
                            <a href="#">Sobre</a>
                        </li>
                        <li>
                            <a href="#">Busca</a>
                        </li>
                        <li>
                            <a href="#">Login</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </header>

        <section class="hero">
            <img src="./images/1440x264.svg" alt="banner da página">
        </section>

        <main class="container">
            <div class="primeira">
                <span class="jogo">Jogos</span>
                <div class="dropdown">
                    <button class="dropbtn">FILTRO (GÊNERO)</button>
                    <div class="dropdown-content">
                        <a href="#">Link 1</a>
                        <a href="#">Link 2</a>
                        <a href="#">Link 3</a>
                    </div>
                </div>
            </div>
            <% List<Jogo> listaJogo = (List<Jogo>) request.getAttribute("listaJogo");%>
            
            <%
                for (Jogo jog : listaJogo) {
            %>
            
            <div class="segunda">
            <img src="<%= jog.getImagemJogo()%>" class="jogo-um" alt="Jogo um">
            <p class="first">  <%= jog.getNomeJogo()  %>  </p>
             </div>
            
            <%
               ; }
            %>
            
            <%--
<section>
            <div class="segunda">
                <img src="./images/200x200.svg" class="jogo-um" alt="Jogo um">
                <img src="./images/200x200.svg" class="jogo-dois" alt="Jogo dois">
                <img src="./images/200x200.svg" class="jogo-tres" alt="Jogo três">
            </div>
            <div class="par">
                <p class="first"> Ploc  </p>
                <p>Plec</p>
                <p class="last" >Plac</p>
            </div>
</section>
            <div class="terceira">
                <img src="./images/200x200.svg" class="jogo-quatro" alt="Jogo quatro">
                <img src="./images/200x200.svg" class="jogo-cinco" alt="Jogo cinco">
                <img src="./images/200x200.svg" class="jogo-seis" alt="Jogo seis">
            </div>
            <div class="para">
                <p class="first" >Plic</p>
                <p>Plug</p>
                <p class="last" >Pluc</p>
            </div>
            
            --%>
                        
        </main>

        <footer class="rodape">
            <img src="./images/FFF.svg" alt="logo do rodape">
        </footer>

    </body>

</html>