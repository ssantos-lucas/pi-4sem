<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="./image/favicon.ico" type="image/x-icon">
        <link rel="stylesheet" href="./css/reset.css">
        <link rel="stylesheet" href="./css/mensagens.css">
        <link rel="stylesheet" href="./css/login.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@200;400;500;600&display=swap" rel="stylesheet">
        <title>login</title>
    </head>
    <body>
        <header>
            <a href="index.jsp"><img src="./images/Capilogo.png" alt="logo do site" class="img-logo"></a>
        </header>
        <main class="main">
            <section class="container" id="section">
                <span class="titulo" id="titulo">Iniciar Sessão</span>
                <div class="feedback-usuario">
                    <% if (request.getAttribute("erro") != null) {
                    %>
                    <p class="msg"><%=request.getAttribute("erro")%></p>
                    <%
                        }
                    %>
                </div>

                <form method="POST" action="Controle"> 
                    <input type="hidden" name="flag" value="login">
                    <div class="dados">
                        
                        <p>
                            <label class="digite" for="E-mail">E-mail:</label><br>
                            <input class="input" type="email" id="email" name="email" required>
                        </p>
                        <p id="senha">
                            <label class="digite" for="senha">Senha:</label><br>
                            <input class="input" type="password" id="senha" name="senha" required>
                            <a href="contato.jsp" class="esqueceu">Esqueceu sua senha?</a>
                        </p>
                    </div>

                    <br><input type="submit" class="btn-entrar" value="Entrar">     
                </form>
            </section>
            <section class="container dois">
                <span>Novo por aqui?</span>
                <hr>
                <a href="cadastro.jsp" class="btn-criarconta">Criar Conta</a>
            </section>
            <span class="contato">
                <a href="contato.jsp">Entre em contato</a>
            </span>
        </main> 
    </body>
</html>