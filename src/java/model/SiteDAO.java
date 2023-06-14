package model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.EntityExistsException;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.RollbackException;
import javax.persistence.TypedQuery;

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
    
    public List<Categoria> listarGeneros() {
        conectar();
        try {
            TypedQuery<Categoria> query = manager.createNamedQuery("Categoria.findByTipoCategoria", Categoria.class);
            query.setParameter("tipoCategoria", 1);
            List<Categoria> generos = query.getResultList();
            return generos;
        } catch (NoResultException ex) {
            return null;
        }
    }

    public List<Desenvolvedor> listarDesenvolvedor() {
        conectar();
        try {
            TypedQuery<Desenvolvedor> query = manager.createNamedQuery("Desenvolvedor.findByIdDesenvolvedor", Desenvolvedor.class);
            List<Desenvolvedor> dev = query.getResultList();
            return dev;
        } catch (NoResultException ex) {
            return null;
        }
    }

    public Desenvolvedor buscarDesenvolvedor(int idDesenvolvedor) {
        conectar();
        try {
            Desenvolvedor prod = manager.find(Desenvolvedor.class, idDesenvolvedor);
            return prod;
        } catch (Exception ex) {
            return null;
        }
    }

    public Usuario validarLogin(String email, String senha) {
        conectar();
        try {
            TypedQuery<Usuario> query = manager.createNamedQuery("Usuario.findByEmailSenhaUsuario", Usuario.class);
            //preciso informar qual usuario e senha que vai entrar no select
            query.setParameter("emailUsuario", email);
            query.setParameter("senhaUsuario", senha);  //ele pega recebido do form e joga lá no parametro da query
            Usuario usuario = query.getSingleResult();  //getSingleResult() esse select só retorna um registro
            return usuario;
        } catch (NoResultException ex) {
            return null;
        }
    }

    public int criarConta(Usuario usuario) {
        conectar();
        try {
            manager.getTransaction().begin();   //começa a transação
            manager.persist(usuario);            //executa a operação. Salvo no BD, ele executa o comando insert no BD.
            manager.getTransaction().commit();  //efetiva a transação 
            return 1; // Deu certo o cadastro
        } catch (EntityExistsException | RollbackException ex) {
            return 2;  //usuário já cadastrado
        } catch (Exception ex) {
            return 3; // Para qualquer outro erro
        }
    }

    public int editarPerfil(Usuario usuario, String email, String nome, String estado, Date nascimento) {
        conectar();
        try {
            //set os valores que serão alterados
            usuario.setNomeUsuario(nome);
            usuario.setDataNascUsuario(nascimento);
            usuario.setEstadoUsuario(estado);

            manager.getTransaction().begin();
            manager.merge(usuario);
            manager.getTransaction().commit();
            return 1; //editou certo 
        } catch (Exception ex) {
            return 0;  //deu erro
        }
    }

    public Usuario pegarUsuario(String email) {
        conectar();
        try {
            TypedQuery<Usuario> query = manager.createNamedQuery("Usuario.findByEmailUsuario", Usuario.class);
            query.setParameter("emailUsuario", email);
            Usuario usuario = query.getSingleResult();  //getSingleResult() esse select só retorna um registro
            return usuario;
        } catch (NoResultException ex) {
            return null;
        }
    }

    public Jogo consultarJogo(int idJogo) {
        conectar();
        try {
            TypedQuery queryId = manager.createNamedQuery("Jogo.findByIdJogo", Jogo.class);
            queryId.setParameter("idJogo", idJogo);
            Jogo jog = (Jogo) queryId.getSingleResult();
            return jog;
        } catch (NoResultException ex) {
            return null;
        }
    }

    public List<Jogo> consultarJogo(String nomeJogo) {
        conectar();
        try {
            TypedQuery queryNome = manager.createNamedQuery("Jogo.findByNomeJogo", Jogo.class);
            queryNome.setParameter("nomeJogo", "%" + nomeJogo + "%");
            return queryNome.getResultList();
        } catch (NoResultException ex) {
            return null;
        }
    }
    
    public List<Jogo> consultarJogosPorCategoria(int idCategoria) {
        conectar();
        try {
            Query query = manager.createNativeQuery("SELECT j.* FROM Jogo j INNER JOIN jogo_categoria jc ON j.idJogo = jc.idJogo WHERE jc.idCategoria = ?", Jogo.class);
            query.setParameter(1, idCategoria);
            return query.getResultList();
        } catch (NoResultException ex) {
            return null;
        }
    }
    
//    public int isFavorito() {
//        int resultado = ;
//        conectar();
//        manager.getTransaction().begin();
////        try {
////            TypedQuery isFavorito = manager.createNamedQuery();
////            if () {
////                resultado = 1; // não é favorito
////            } else {
////                resultado = 2; // é favorito
////            }
////        } catch (Exception e) {
////            resultado = 0; //erro
////        }
//        return resultado;
//    }
//    


    public boolean possuiJogoFavorito(int idUsuario, int idJogo) {
        conectar();
        try {
            Query query = manager.createNativeQuery("SELECT * FROM Favorito WHERE idUsuario = ? AND idJogo = ?");
            query.setParameter(1, idUsuario);
            query.setParameter(2, idJogo);

            Object result = query.getSingleResult();
            boolean possuiFavorito = (result != null);
            
            manager.close();

            return possuiFavorito;
        } catch (Exception ex) {
            return false;
        }
    }

    public List<Jogo> listarJogosFavoritos(int idUsuario) {
        conectar();
        try {

            Query query = manager.createQuery("SELECT j FROM Jogo j INNER JOIN j.favoritos f WHERE f.idUsuario = :idUsuario");
            query.setParameter("idUsuario", idUsuario);

            List<Jogo> jogosFavoritos = query.getResultList();

            manager.close();

            return jogosFavoritos;
        } catch (Exception e) {
            // Trate a exceção ou faça o log do erro aqui
            e.printStackTrace();
            return null; // Ou retorne uma lista vazia, dependendo do caso
        }
    }

   public void adicionarJogoFavorito(int idUsuario, int idJogo) {
        conectar();
        try {
            manager.getTransaction().begin();
            Query query = manager.createNativeQuery("INSERT INTO favorito (idUsuario, idJogo) VALUES (?, ?)");
            query.setParameter(1, idUsuario);
            query.setParameter(2, idJogo);
            query.executeUpdate();
            manager.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            manager.getTransaction().rollback();
        } finally {
            manager.close();
            conn.close();
        }
    }

    public void removerJogoFavorito(int idUsuario, int idJogo) {
        conectar();
        try {
            manager.getTransaction().begin();
            Query query = manager.createNativeQuery("DELETE FROM favorito WHERE idUsuario = ? AND idJogo = ?");
            query.setParameter(1, idUsuario);
            query.setParameter(2, idJogo);
            query.executeUpdate();
            manager.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            manager.getTransaction().rollback();
        } finally {
            manager.close();
            conn.close();
        }
    }
}
