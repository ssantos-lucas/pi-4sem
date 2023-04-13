/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
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
        conn = Persistence.createEntityManagerFactory("WebSitePU");
        manager = conn.createEntityManager();

    }

    public List<Jogo> listarJogos() {
        conectar();
        try {
            TypedQuery<Jogo> query = manager.createNamedQuery("Jogo.findAll", Jogo.class);
            List<Jogo> dep = query.getResultList();
            return dep;
        } catch (NoResultException ex) {
            return null;
        }

    }
}
