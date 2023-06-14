package controler;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Jogo;
import model.SiteDAO;
import model.Usuario;

@WebServlet(name = "Controle", urlPatterns = {"/Controle"})
public class Controle extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=ISO-8859-1");
        HttpSession session = request.getSession();

        PrintWriter out = response.getWriter();

        String flag, mensagem = null;
        flag = request.getParameter("flag");

        SiteDAO dao = new SiteDAO();

        if (flag.equals("paginainicial")) {
            List<Jogo> jog = dao.listarJogos();
            request.setAttribute("listaJogo", jog);
            RequestDispatcher disp = request.getRequestDispatcher("index.jsp");
            disp.forward(request, response);

        } else if (flag.equalsIgnoreCase("login")) {
            String email, senha;
            email = request.getParameter("email");
            senha = request.getParameter("senha");

            Usuario usuario = dao.validarLogin(email, senha);

            if (usuario == null) {
                mensagem = "Usuário não cadastrado ou senha incorreta.";

                request.setAttribute("erro", mensagem);
                RequestDispatcher disp = request.getRequestDispatcher("login.jsp");
                disp.forward(request, response);
            } else {
                session.setAttribute("usuarioLogado", usuario);
                RequestDispatcher disp = request.getRequestDispatcher("index.jsp");
                disp.forward(request, response);
            }

        } else if (flag.equalsIgnoreCase("logout")) {
            session.removeAttribute("usuarioLogado");
            RequestDispatcher disp = request.getRequestDispatcher("index.jsp");
            disp.forward(request, response);

        } else if (flag.equalsIgnoreCase("criarConta")) {
            Usuario usuario = new Usuario();

            usuario.setEmailUsuario(request.getParameter("email"));
            usuario.setSenhaUsuario(request.getParameter("senha"));
            usuario.setNomeUsuario(request.getParameter("nome"));

            int resultado = dao.criarConta(usuario);

            switch (resultado) {
                case 1:
                    mensagem = "Usuário cadastrado com sucesso.";
                    break;
                case 2:
                    mensagem = "Usuário já cadastrado.";
                    break;
                default:
                    mensagem = "Erro: Contacte o administrador.";
                    break;
            }

            request.setAttribute("m", mensagem);
            RequestDispatcher disp = request.getRequestDispatcher("mensagens.jsp");
            disp.forward(request, response);

            //response.sendRedirect("index.jsp");  //em substituição das 3 linhas acima, esse é pra caso eu tenha certeza absoluta que nao vai dar nenhum problema no cadastro
        } else if (flag.equalsIgnoreCase("editarPerfil")) {
            String email = request.getParameter("email");
            String nome = request.getParameter("nome");
            String estado = request.getParameter("estado");

            try {
                Date nascimento = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("nascimento"));
                Usuario usuario = dao.pegarUsuario(email);
                int resultado = dao.editarPerfil(usuario, email, nome, estado, nascimento);

                if (resultado == 1) {
                    mensagem = "Dados alterados com sucesso.";
                    Usuario usuarioAtualizado = dao.pegarUsuario(email);
                    session.setAttribute("usuarioLogado", usuarioAtualizado);
                } else {
                    mensagem = "Erro ao tentar alterar dados.";
                }
                request.setAttribute("m", mensagem);
                RequestDispatcher disp = request.getRequestDispatcher("mensagens.jsp");
                disp.forward(request, response);
            } catch (ParseException e) {
                mensagem = "A data deve ser aaaa-mm-dd";
                request.setAttribute("erroData", mensagem);
                RequestDispatcher disp = request.getRequestDispatcher("perfil.jsp");
                disp.forward(request, response);
            }

        } else if (flag.equalsIgnoreCase("consultar")) {
            int idJogo = Integer.parseInt(request.getParameter("idJogo"));

            Jogo jog = dao.consultarJogo(idJogo);

            if (jog == null) {
                mensagem = "Jogo não encontrado";
                request.setAttribute("m", mensagem);
                RequestDispatcher disp = request.getRequestDispatcher("mensagens.jsp");
                disp.forward(request, response);
            } else {
                request.setAttribute("Jogo", jog);
                RequestDispatcher disp = request.getRequestDispatcher("telajogo.jsp");
                disp.forward(request, response);
            }

        } else if (flag.equalsIgnoreCase("barraDeBusca")) {
            String nomeJogo = request.getParameter("nomeJogo");
            List<Jogo> jogos = dao.consultarJogo(nomeJogo);

            request.setAttribute("listaJogos", jogos);
            RequestDispatcher disp = request.getRequestDispatcher("resultadoBusca.jsp");
            disp.forward(request, response);

        } else if (flag.equalsIgnoreCase("favoritar")) {

            int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
            int idJogo = Integer.parseInt(request.getParameter("idJogo"));

            dao.adicionarJogoFavorito(idUsuario, idJogo);

        } else if (flag.equalsIgnoreCase("desfavoritar")) {

            int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
            int idJogo = Integer.parseInt(request.getParameter("idJogo"));

            dao.removerJogoFavorito(idUsuario, idJogo);

        } else if (flag.equalsIgnoreCase("verificaFavorito")) {

            int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
            int idJogo = Integer.parseInt(request.getParameter("idJogo"));

            dao.possuiJogoFavorito(idUsuario, idJogo);
        
        } else if (flag.equalsIgnoreCase("filtroGenero")) {
            int idCategoria =  Integer.parseInt(request.getParameter("genero"));
            List<Jogo> jogos = dao.consultarJogosPorCategoria(idCategoria);
            
            request.setAttribute("listaJogos", jogos);
            RequestDispatcher disp = request.getRequestDispatcher("index.jsp");
            disp.forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
