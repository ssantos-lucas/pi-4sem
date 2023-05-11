<%-- 
    Document   : cadastro
    Created on : May 11, 2023, 8:41:40 AM
    Author     : carolinestelitano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="./image/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/cadastro.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@200;400;600&display=swap" rel="stylesheet">
    <title>Cadastro</title>
</head>

<body>
    <header class="cabecalho">
        <img src="./image/Logo.png" alt="logo do site" class="logo">
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
                        <label for="email">E-mail:</label>
                        <input type="email" id="email" name="email" required> 
                    </p>
                    <p>
                        <label for="senha">Senha:</label>
                        <input type="text" id="senha" name="senha" required>
                    </p>
                    <p>
                        <label for="nome">Nome:</label>
                        <input type="text" id="nome" name="nome" required>
                    </p>
                    <p>
                        <label for="estado">Estado:</label>
                        <input type="text" id="estado" name="estado"> 
                    </p>
                    <!--ALTERAR BD E TIRAR OS NOT NULL DE DATA DE NASCIMENTO E CREATED_AT E ESTADO-->
                    <!--SENAO VAI TER QUE ENTRAR NO FORM--> 
                </div>
                <br><input type="submit" class="btn-entrar" value="Cadastrar">
                <!--INSERIR DADO PRA SALVAR AUTOMATICO O CREATED_AT NO BANCO NA HORA DO CADASTRO-->
            </form>
        </section>
    </main>
    <footer class="rodape">
        <a href="#" class="entrecontato">Entre em contato</a>
    </footer>

</body>

</html>
