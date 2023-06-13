<%@page import="model.Jogo"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;400;500;700;900&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@200;400;600&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="./css/reset.css">
        <link rel="stylesheet" href="./css/resultadoBusca.css"> <!--sim, ta chamando essa-->
        <title>Resultado de busca</title>
    </head>
    <body>
        <%@include file="includes/header.jsp"%>
        <main>
            <section class="resultado">
                <%
                    String termoDeBusca = request.getParameter("nomeJogo");
                    List<Jogo> jogos = (List<Jogo>) request.getAttribute("listaJogos");
                %>
                <h1>Resultados com "<%=termoDeBusca%>"</h1>
                <p><%=jogos.size()%> resultados encontrados.</p>
                <ul> 
                    <%
                    for (Jogo jogo : jogos) {
                    %>
                    <li>
                        <a href="Controle?flag=consultar&idJogo=<%=jogo.getIdJogo()%>" title="<%=jogo.getNomeJogo()%>">
                            <img src="images/games/<%=jogo.getImagemLogo()%>" alt="<%=jogo.getNomeJogo()%>">
                            <span><%=jogo.getNomeJogo()%></span>
                        </a>
                    </li>
                    <%}%>
                </ul>
            </section> 
        </main> 
        <%@include file="includes/footer.jsp"%>
    </body>
</html>
