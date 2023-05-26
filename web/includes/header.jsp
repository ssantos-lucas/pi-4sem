<%@page import="model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header class="header">
    <div class="header-container">
        <a href="index.jsp"><img class="img-logo" src="./images/CapiLogo.png" alt="Logo do site"></a>
        <nav class="itens">
            <ul>
                <li><a href="sobre.jsp">Sobre</a></li>
                <li><a href="contato.jsp">Contato</a></li>
                <li><a href="#">Busca</a></li>
                <li>
                    <%
                        Usuario uLogado = (Usuario)session.getAttribute("usuarioLogado");
                        if(uLogado != null){
                    %>
                    <a href="contato.jsp"><span><%=uLogado.getNomeUsuario()%></span></a>
                    <li>
                        <a href="Controle?flag=logout"> Sair </a>
                        <%//session.removeAttribute("usuarioLogado");%>
                    </li>
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
