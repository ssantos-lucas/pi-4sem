package model;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

/**
 *
 * @author Eddy Mauricio
 */
public class SiteDAO {

    private EntityManagerFactory conn;
    private EntityManager manager;

    public void conectar() {
        conn = Persistence.createEntityManagerFactory("GameHubPU");
        manager = conn.createEntityManager();

    }

    public List<Jogo> listarJogos() {
        conectar();
        try {
            TypedQuery<Jogo> query = manager.createNamedQuery("Jogo.findAll", Jogo.class);
            List<Jogo> jogos = query.getResultList();
            return jogos;
        } catch (NoResultException ex) {
            return null;
        }
    }
    
    public Usuario validarLogin(String email, String senha){
        conectar();
        try{
            TypedQuery<Usuario> query = manager.createNamedQuery("Usuario.findByEmailSenhaUsuario", Usuario.class);  
            //preciso informar qual usuario e senha que vai entrar no select
            query.setParameter("emailUsuario", email);
            query.setParameter("senhaUsuario", senha);  //ele pega recebido do form e joga lá no parametro da query
            Usuario usuario = query.getSingleResult();  //getSingleResult() esse select só retorna um registro
            return usuario; 
        } catch(NoResultException ex){
            return null;
        }
    }
    
    public int criarConta(Usuario usuario){
        conectar();
        try{    
            manager.getTransaction().begin();   //começa a transação
            manager.persist(usuario);            //executa a operação. Salvo no BD, ele executa o comando insert no BD.
            manager.getTransaction().commit();  //efetiva a transação 
            return 1; // Deu certo o cadastro
        } catch (Exception ex){   //tratando qualquer outra exceção possível
            return 2; // Para qualquer outro erro
        }  
    }
}
