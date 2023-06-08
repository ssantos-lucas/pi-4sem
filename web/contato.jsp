<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./css/reset.css">
        <link rel="stylesheet" href="./css/contato.css">
        <link rel="stylesheet" href="./css/mensagens.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@200;400;600&display=swap" rel="stylesheet">
        <title>Contato</title>
    </head>
    <body>

        <%@include file="includes/header.jsp"%>

        <main>
            <section class="perfil">
                <h1 class="contato">Entre em contato: </h1>

                <span class="email">Fale conosco atrav�s do email: gamehubsenac@gmail.com.</span>

                <p>Se voc� � um aluno ou ex-aluno da institui��o e quer publicar seu jogo em nossa plataforma, nos envie um  email com assunto "publicar jogo" e lhe encaminharemos um formul�rio de preenchimento.</p>

                <ul>
                    <li><span class="dados">Se voc� ESQUECEU A SENHA, nos mande um email com assunto "esqueci senha".
                        </span></li>

                    <li><span class="dados">Caso tenha alguma d�vida ou crit�ca, coloque no assunto do email "d�vida".
                        </span></li>
                    <li><span class="dados">Caso tenha alguma sugest�o, coloque no assunto do email "sugest�o" e nos deixe saber o que pensa. </span></li>
                    <li><span class="dados">E para demais assuntos, coloque como "outros".</span></li>
                </ul>

                <span class="dados resposta">Responderemos a todos o mais breve poss�vel!</span>

            </section>
        </main>
    </body>
</html>
