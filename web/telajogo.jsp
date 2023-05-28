<%@page import="model.Jogo"%>
<%@page import="model.Usuario"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/stylejogo.css">
    <link rel="stylesheet" href="./css/includes.css">
    <title>Jogo</title>
</head>

<body>
    <%@include file="includes/header.jsp"%>
    <main>
        <%
            Jogo 
        %>
        <h1 class="titulo">John Cena</h1>
        <section class="conteudo">
            <img src="./image/0x0.jpg" alt="iamgem do john cena do site">
        </section>
        <section class="text">
            <p class="desc"> 
                Lorem ipsum dolor sit amet consectetur, adipisicing elit. Aut laborum saepe ipsa soluta! Aliquid ab consequuntur 
                eveniet mollitia a animi. Earum ad distinctio dignissimos animi? Lorem ipsum dolor, sit amet consectetur adipisicing 
                elit. Libero maiores unde animi nam eius. Nemo necessitatibus vero adipisci suscipit accusamus sunt vitae ullam, 
                voluptatum minima accusantium at modi voluptates? Cupiditate! Lorem ipsum, dolor sit amet consectetur adipisicing 
                elit. Repellat non nisi suscipit sequi vel porro officiis doloremque, adipisci dolore voluptates. Sequi blanditiis 
                eos tempore unde repellendus. Similique libero quod eveniet. Lorem ipsum dolor sit amet consectetur adipisicing elit. 
                Omnis quibusdam commodi voluptatem earum ut? Distinctio, officiis quibusdam tempora, voluptas nisi quidem vel 
                accusantium mollitia molestias nesciunt unde ex blanditiis officia? Lorem ipsum dolor sit amet consectetur adipisicing
                elit. Ratione inventore harum doloremque animi, labore totam dolorem dolore id saepe mollitia doloribus amet natus officia autem fugit! 
                Excepturi tempore omnis alias. 
            </p>
        </section>
    </main>

    <%@include file="includes/footer.jsp"%>
</body>
</html>