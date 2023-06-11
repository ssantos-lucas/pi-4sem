<%-- 
    Document   : resultadoBusca
    Created on : Jun 11, 2023, 1:52:23 AM
    Author     : carolinestelitano
--%>

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
        <link rel="stylesheet" href="./css/reset.css">
        <link rel="stylesheet" href="./css/style.css">
        <title>Resultado de busca</title>
    </head>
    <body>
        <%@include file="includes/header.jsp"%>
        
        <%
        String termoDeBusca = (String) request.getAttribute("termoDeBusca");
        List<Jogo> jogos = (List<Jogo>) request.getAttribute("listaJogos");
        
        %>
        
        <form>
            <input name="nomeJogo" value="<%=termoDeBusca%>">
        </form>
        
        <h1>Resultados com "<%=termoDeBusca%>"</h1>
        <%=jogos.size()%> resultados encontrados:
        
        <%
        for (Jogo jogo : jogos) {
        %>
        
            <p class="name"><%=jogo.getNomeJogo()%>
        
        <%}%>

        <%@include file="includes/footer.jsp"%>
    </body>
</html>
