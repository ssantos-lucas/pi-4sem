<%-- 
    Document   : sobre
    Created on : May 11, 2023, 9:07:31 AM
    Author     : carolinestelitano
--%>

<%@page import="model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="./image/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/sobre-equipe.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@200;400;600&display=swap" rel="stylesheet">
    <title>Sobre a equipe</title>
</head>

<body>
    <header class="header">
        <div class="header-container">
            <a href="index.jsp" class="logo">
                <img src="./images/FFF.svg" alt="logo da página">
            </a>
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
<!--    <header class="cabecalho">
        <nav class="navegacao">
            <ul>
                <li> <input class="search" type="text" placeholder="Procure por jogos.."> </li>
                <li> <a href="#" class="perfil">Perfil</a></li>
            </ul>
        </nav>
    </header>-->

    <section class="painel">
        <img src="./image/Logo.png" alt="Logo do site">
    </section>

    <main class="main">
        <h1 class="titulo">SOBRE A EQUIPE</h1>
        <p class="texto"> (Texto sobre a equipe) Lorem, ipsum dolor sit amet consectetur adipisicing elit. Eveniet, ad
            nostrum delectus asperiores quisquam tenetur explicabo beatae iusto, ducimus consequuntur veniam quae dicta
            saepe nam recusandae ut quibusdam reprehenderit deleniti! <br>
        </p>
    </main>
    <footer class="rodape">

    </footer>

</body>

</html>
