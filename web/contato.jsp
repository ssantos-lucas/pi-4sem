<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
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
        <link rel="stylesheet" href="./css/contato.css">
        <link rel="stylesheet" href="./css/mensagens.css">
        <title>Contato</title>
    </head>
    <body>
        <%@include file="includes/header.jsp"%>
        <main>
            <section class="contato">
                <h1 class="titulo">Entre em contato</h1>
                <p class="center">Fale conosco através do email: <a href="mailto:gamehubsenac@gmail.com">gamehubsenac@gmail.com</a></p>
                <p>Se você é um aluno ou ex-aluno da instituição e quer publicar seu jogo em nossa plataforma, nos envie um  email com assunto "publicar jogo" e lhe encaminharemos um formulário de preenchimento.</p>
                <ul>
                    <li>Se você ESQUECEU A SENHA, nos mande um email com assunto "esqueci senha".</li>
                    <li>Caso tenha alguma dúvida ou critíca, coloque no assunto do email "dúvida".</li>
                    <li>Caso tenha alguma sugestão, coloque no assunto do email "sugestão" e nos deixe saber o que pensa.</li>
                    <li>E para demais assuntos, coloque como "outros".</li>
                </ul>
                <p class="center">Responderemos a todos o mais breve possível!</p>
            </section>
        </main>
        <%@include file="includes/footer.jsp"%>
    </body>
</html>
