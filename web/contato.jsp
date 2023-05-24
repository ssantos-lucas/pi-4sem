<%@page import="model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/reset.css">
        <link rel="stylesheet" href="./css/style.css">
        <link rel="stylesheet" href="./css/mensagens.css">
        <title>Contato</title>
    </head>
    <body>
        <header class="header">
            <div class="header-container">
                <a href="index.jsp" class="logo"><img src="./images/FFF.svg" alt="logo da página"></a>
                <nav class="itens">
                    <ul>
                        <li><a href="sobre.jsp">Sobre</a></li>
                        <li>
                            <%
                                Usuario uLogado = (Usuario)session.getAttribute("usuarioLogado");
                                if(uLogado != null){
                            %>
                            <span><%=uLogado.getNomeUsuario()%></span>
                            <%
                                } else {
                            %>
                            <a href="login.jsp">Login</a>
                            <%
                            }
                            %>
                        </li>
                    </ul>
                </nav>
            </div>
        </header>
        <h2>Entre em contato</h2>
        <p>Fale conosco através do email gamehubsenac@gmail.com</p>
        <p>Se você é um aluno ou ex-aluno da instituição e quer publicar seu jogo em nossa plataforma, nos envie um email com assunto "publicar jogo" e lhe encaminharemos um formulário de preenchimento.</p>
        <ul>
            <li>Se você ESQUECEU A SENHA, nos mande um email com assunto "esqueci senha".</li>
            <li>Caso tenha alguma dúvida ou crítica, coloque no assunto do email "dúvida".</li>
            <li>Caso tenha alguma sugestão, coloque no assunto do email "sugestão" e nos deixe saber o que pensa.</li>
            <li>E para demais assuntos, coloque como "outros".</li>
        </ul>
        <p>Responderemos a todos o mais breve possível!</p>
        <p></p>
    </body>
</html>
