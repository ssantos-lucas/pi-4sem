<%@page import="model.Usuario"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<link rel="stylesheet" href="./css/includes.css">
<header class="header">
    <div class="header-container">
        <a href="index.jsp"><img class="img-logo" src="./images/Capilogo.png" alt="Logo do site"></a>
        <nav class="itens">
            <ul>
                <li><a href="sobre.jsp">Sobre</a></li>
                <li><a href="contato.jsp">Contato</a></li>
                <form method="GET" action="Controle"> 
                    <input type="hidden" name="flag" value="barraDeBusca">
                    <div id="barraDeBusca">
                        <label class="btn-barraDeBusca" for="inputBarraDeBusca"><img src="./images/magnifying-glass.jpeg"></label>
                        <input id="inputBarraDeBusca" type="text" name="nomeJogo" placeholder="Buscar jogos">
                    </div>
                </form>
                <li>
                    <%
                        Usuario uLogado = (Usuario)session.getAttribute("usuarioLogado");
                        if(uLogado != null){
                        
                        String primeiroNome = uLogado.getNomeUsuario().split(" ")[0];
                    %>
                    <a href="perfil.jsp"><span><%=primeiroNome%></span></a>
                    </li>
                    <li>
                        <a href="Controle?flag=logout"> Sair </a>
                    </li>
                    <li>
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
