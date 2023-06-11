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
                <p class="center">Fale conosco atrav�s do email: <a href="mailto:gamehubsenac@gmail.com">gamehubsenac@gmail.com</a></p>
                <p>Se voc� � um aluno ou ex-aluno da institui��o e quer publicar seu jogo em nossa plataforma, nos envie um  email com assunto "publicar jogo" e lhe encaminharemos um formul�rio de preenchimento.</p>
                <ul>
                    <li>Se voc� ESQUECEU A SENHA, nos mande um email com assunto "esqueci senha".</li>
                    <li>Caso tenha alguma d�vida ou crit�ca, coloque no assunto do email "d�vida".</li>
                    <li>Caso tenha alguma sugest�o, coloque no assunto do email "sugest�o" e nos deixe saber o que pensa.</li>
                    <li>E para demais assuntos, coloque como "outros".</li>
                </ul>
                <p class="center">Responderemos a todos o mais breve poss�vel!</p>
            </section>
        </main>
        <%@include file="includes/footer.jsp"%>
    </body>
</html>
