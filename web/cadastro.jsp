<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="pt-br">

    <head>
        <meta charset="ISO-8859-1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="./image/favicon.ico" type="image/x-icon">
        <link rel="stylesheet" href="./css/reset.css">
        <link rel="stylesheet" href="./css/cadastro.css">
        <link rel="stylesheet" href="./css/mensagens.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@200;400;600&display=swap" rel="stylesheet">
        <title>Cadastro</title>
    </head>

    <body>
        <header>
            <a href="index.jsp"><img src="./images/CapiLogo.png" alt="logo do site" class="img-logo"></a>
        </header>
        <main class="main">
            <section class="container">
                <span class="titulo">
                    Criar conta
                </span>
                <form method="POST" action="Controle"> 
                    <input type="hidden" name="flag" value="criarConta">
                    <div class="dados">
                        <p>
                            <label class="digite" for="email">E-mail:</label>
                            <br>
                            <input class="campo" type="email" id="email" name="email" required> 
                        </p>
                        <p><br>
                            <label class="digite" for="senha">Senha:</label>
                            <br>
                            <input class="campo" type="password" id="senha" name="senha" required>
                        </p>
                        <p><br>
                            <label class="digite" for="nome">Nome:</label>
                            <br>
                            <input class="campo" type="text" id="nome" name="nome" required>
                        </p>
                    </div>
                    <div class="chamar">
                        <input class="botao" type="submit" value="Cadastrar">
                        <!--INSERIR DADO PRA SALVAR AUTOMATICO O CREATED_AT NO BANCO NA HORA DO CADASTRO-->
                    </div>

                </form>
            </section>

            <span class="contato chamar">
                <a href="contato.jsp">Entre em contato</a>
            </span>
        </main>


    </body>

</html>
