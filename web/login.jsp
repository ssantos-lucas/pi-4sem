<%-- 
    Document   : login
    Created on : May 3, 2023, 12:14:30 AM
    Author     : carolinestelitano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="./image/favicon.ico" type="image/x-icon">
        <link rel="stylesheet" href="./css/reset.css">
        <link rel="stylesheet" href="./css/tela-login.css">
        <link rel="stylesheet" href="./css/mensagens.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@200;400;600&display=swap" rel="stylesheet">
        <title>login</title>
    </head>
    <body>
        <header class="cabecalho">
            <a href="index.jsp">
                <img src="./images/Logo.png" alt="logo do site" class="logo">
            </a>
        </header>
        <main class="main">
            <section class="container">
                <span class="titulo">Iniciar Sessão</span>
                
                <form method="POST" action="Controle"> 
                    <input type="hidden" name="flag" value="login">
                    <div class="dados">
                    <div class="feedback-usuario">
                        <% if(request.getAttribute("erro") != null){ 
                        %>
                        <p><%=request.getAttribute("erro")%></p>
                        <%
                        }
                        %>
                    </div>
                    
                    <p>
                        <label for="E-mail">E-mail:</label><br>
                        <input class="input" type="email" id="email" name="email" required>
                    </p>
                    <p>
                        <label for="senha">Senha:</label><br>
                        <input class="input" type="password" id="senha" name="senha" required>
                        <a href="#" class="esquece-usenha">Esqueceu sua senha?</a>
                    </p>
                    
                    </div>
                    
                    <br><input type="submit" class="btn-entrar" value="Entrar">     
                </form>
            </section>
            <section class="container dois">
                <span class="titulo-secundario">Novo por aqui?</span>
                <br>
                <!--<input type="submit" class="btn-conta" value="Criar conta">-->
                <a href="cadastro.jsp"> Criar Conta</a>
            </section>
                    
            <span class="contato">
                <a href="#" class="entrecontato">Entre em contato</a>
            </span>
        </main> 
        <footer class="rodape">
            
        </footer> 
    </body>
</html>
