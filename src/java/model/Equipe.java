/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author Eddy Mauricio
 */
@Entity
@Table(name = "equipe")
@NamedQueries({
    @NamedQuery(name = "Equipe.findAll", query = "SELECT e FROM Equipe e"),
    @NamedQuery(name = "Equipe.findByIdEquipe", query = "SELECT e FROM Equipe e WHERE e.idEquipe = :idEquipe"),
    @NamedQuery(name = "Equipe.findByNomeEquipe", query = "SELECT e FROM Equipe e WHERE e.nomeEquipe = :nomeEquipe")})
public class Equipe implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "idEquipe")
    private Integer idEquipe;
    @Column(name = "nomeEquipe")
    private String nomeEquipe;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idEquipe", fetch = FetchType.EAGER)
    private List<Jogo> jogoList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "equipe", fetch = FetchType.EAGER)
    private List<DesenvolvedorHasEquipe> desenvolvedorHasEquipeList;

    public Equipe() {
    }

    public Equipe(Integer idEquipe) {
        this.idEquipe = idEquipe;
    }

    public Integer getIdEquipe() {
        return idEquipe;
    }

    public void setIdEquipe(Integer idEquipe) {
        this.idEquipe = idEquipe;
    }

    public String getNomeEquipe() {
        return nomeEquipe;
    }

    public void setNomeEquipe(String nomeEquipe) {
        this.nomeEquipe = nomeEquipe;
    }

    public List<Jogo> getJogoList() {
        return jogoList;
    }

    public void setJogoList(List<Jogo> jogoList) {
        this.jogoList = jogoList;
    }

    public List<DesenvolvedorHasEquipe> getDesenvolvedorHasEquipeList() {
        return desenvolvedorHasEquipeList;
    }

    public void setDesenvolvedorHasEquipeList(List<DesenvolvedorHasEquipe> desenvolvedorHasEquipeList) {
        this.desenvolvedorHasEquipeList = desenvolvedorHasEquipeList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idEquipe != null ? idEquipe.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Equipe)) {
            return false;
        }
        Equipe other = (Equipe) object;
        if ((this.idEquipe == null && other.idEquipe != null) || (this.idEquipe != null && !this.idEquipe.equals(other.idEquipe))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Equipe[ idEquipe=" + idEquipe + " ]";
    }
    
}
