<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
        <header>
            <a href="index.jsp"><img src="./images/CapiLogo.png" alt="logo do site" class="img-logo"></a>
        </header>
        <main class="main">
            <section class="container" id="section">
                <span class="titulo" id="titulo">Iniciar Sessão</span>

                <form method="POST" action="Controle"> 
                    <input type="hidden" name="flag" value="login">
                    <div class="dados">
                        <script>
                            function aumentarSection() {
                                login = document.getElementById("section");
                                titulo = document.getElementById("titulo");
                                login.style.height = "325px";
                                titulo.style.paddingBottom = "0px";
                            }
                        </script>
                        <div class="feedback-usuario">
                            <% if (request.getAttribute("erro") != null) {
                            %>
                            <p><%=request.getAttribute("erro")%></p>
                            <script>
                                aumentarSection();
                            </script>
                            <%
                                }
                            %>
                        </div>
                        <p>
                            <label for="E-mail">E-mail:</label><br>
                            <input class="input" type="email" id="email" name="email" required>
                        </p>
                        <p id="senha">
                            <label for="senha">Senha:</label><br>
                            <input class="input" type="password" id="senha" name="senha" required>
                            <a href="contato.jsp" class="esqueceu">Esqueceu sua senha?</a>
                        </p>
                    </div>

                    <br><input type="submit" class="btn-entrar" value="Entrar">     
                </form>
            </section>
            <section class="container dois">
                <span class="titulo-secundario">Novo por aqui?</span>
                <hr>
                <!--<a href="cadastro.jsp"><input type="submit" class="btn-conta" value="Criar conta"></a>-->
                <a href="cadastro.jsp" id="criarconta">Criar Conta</a>
            </section>

            <span class="contato">
                <a href="contato.jsp" class="entrecontato">Entre em contato</a>
            </span>
        </main> 
    </body>
</html>