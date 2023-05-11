package controler;

import java.io.IOException;
import java.io.PrintWriter;
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

/**
 *
 * @author Eddy Mauricio
 */
@WebServlet(name = "Controle", urlPatterns = {"/Controle"})
public class Controle extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        
        PrintWriter out = response.getWriter();
        
        String flag, mensagem = null;
        flag = request.getParameter("flag");
        
        SiteDAO dao = new SiteDAO();
        
        if(flag.equals("paginainicial")){
            List<Jogo> jog = new SiteDAO().listarJogos();
            request.setAttribute("listaJogo", jog);
            RequestDispatcher disp = request.getRequestDispatcher("index.jsp");
            disp.forward(request, response);
            
        } else if(flag.equalsIgnoreCase("login")) {
            String email, senha;
            email = request.getParameter("email");
            senha = request.getParameter("senha");
            
            Usuario usuario = dao.validarLogin(email, senha);
            
            if(usuario == null){
                mensagem = "Usuário não cadastrado ou senha incorreta.";
                
                request.setAttribute("erro", mensagem);
                RequestDispatcher disp = request.getRequestDispatcher("login.jsp"); 
                disp.forward(request, response);              
            } else {
                session.setAttribute("usuarioLogado", usuario);
                RequestDispatcher disp = request.getRequestDispatcher("index.jsp"); 
                disp.forward(request, response);
            }
            
        } else if(flag.equalsIgnoreCase("criarConta")) {
            String email, senha, nome;
            
            Usuario usuario = new Usuario();
            
            usuario.setEmailUsuario(request.getParameter("email"));
            usuario.setSenhaUsuario(request.getParameter("senha"));
            usuario.setNomeUsuario(request.getParameter("nome"));
            
            int resultado = dao.criarConta(usuario);
            
            switch (resultado) {
                case 1:
                    mensagem = "usuário cadastrado com sucesso.";
                    break;
                default:
                    mensagem = "Erro: Contacte o administrador.";
                    break;
            }
            
            request.setAttribute("m", mensagem);
            RequestDispatcher disp = request.getRequestDispatcher("mensagens.jsp"); //SUBSTITUIR PELA TELA DE PERFIL???
            disp.forward(request, response); 
            
            //response.sendRedirect("index.jsp");  //em substituição das 3 linhas acima, esse é pra caso eu tenha certeza absoluta que nao vai dar nenhum problema no cadastro
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
