<%-- 
    Document   : login
    Created on : May 3, 2023, 12:14:30 AM
    Author     : carolinestelitano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;400;500;700;900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="./css/reset.css"/>
        <link rel="stylesheet" href="./css/style.css">
        <title>login</title>
    </head>
    <body>
        <header class="cabecalho">
            <img src="./image/Logo.png" alt="logo do site" class="logo">
        </header>
        <main class="main">
            <section class="container">
                <span class="titulo">Iniciar Sessão</span>
                
                <form method="POST" action="Controle"> 
                    <input type="hidden" name="flag" value="login">
                    <div class="dados">
                    <p>
                        <label for="E-mail">E-mail:</label><br>
                        <input type="email" id="email" name="email" required>
                    </p>
                    <p>
                        <label for="senha">Senha:</label><br>
                        <input type="password" id="senha" name="senha" required>
                    </p>
                    <a href="#" class="esqueceusenha">Esqueceu sua senha?</a>
                    </div>
                    
                    <br><input type="submit" class="btn-entrar" value="Entrar">
                    
                    <% if(request.getAttribute("erro") != null){
                    %>
                        <p> <%=request.getAttribute("erro")%></p>
                    <%
                    }
                    %>
                    
                </form>
            </section>
            <section class="container-dois">
                <span class="titulo-secundario">Novo por aqui?</span>
                <br><input type="submit" class="btn-conta" value="Criar conta">
            </section>
        </main> 
        <footer class="rodape">
            <a href="#" class="entrecontato">Entre em contato</a>
        </footer> 
    </body>
</html>
