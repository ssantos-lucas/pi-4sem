/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author Eddy Mauricio
 */
@Entity
@Table(name = "desenvolvedor_has_equipe")
@NamedQueries({
    @NamedQuery(name = "DesenvolvedorHasEquipe.findAll", query = "SELECT d FROM DesenvolvedorHasEquipe d"),
    @NamedQuery(name = "DesenvolvedorHasEquipe.findByDesenvolvedoremail", query = "SELECT d FROM DesenvolvedorHasEquipe d WHERE d.desenvolvedorHasEquipePK.desenvolvedoremail = :desenvolvedoremail"),
    @NamedQuery(name = "DesenvolvedorHasEquipe.findByEquipeidEquipe", query = "SELECT d FROM DesenvolvedorHasEquipe d WHERE d.desenvolvedorHasEquipePK.equipeidEquipe = :equipeidEquipe"),
    @NamedQuery(name = "DesenvolvedorHasEquipe.findByPapel", query = "SELECT d FROM DesenvolvedorHasEquipe d WHERE d.papel = :papel"),
    @NamedQuery(name = "DesenvolvedorHasEquipe.findByNomeEquipe", query = "SELECT d FROM DesenvolvedorHasEquipe d WHERE d.nomeEquipe = :nomeEquipe")})
public class DesenvolvedorHasEquipe implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected DesenvolvedorHasEquipePK desenvolvedorHasEquipePK;
    @Column(name = "Papel")
    private String papel;
    @Column(name = "nomeEquipe")
    private String nomeEquipe;
    @JoinColumn(name = "Desenvolvedor_email", referencedColumnName = "email", insertable = false, updatable = false)
    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private Desenvolvedor desenvolvedor;
    @JoinColumn(name = "Equipe_idEquipe", referencedColumnName = "idEquipe", insertable = false, updatable = false)
    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private Equipe equipe;

    public DesenvolvedorHasEquipe() {
    }

    public DesenvolvedorHasEquipe(DesenvolvedorHasEquipePK desenvolvedorHasEquipePK) {
        this.desenvolvedorHasEquipePK = desenvolvedorHasEquipePK;
    }

    public DesenvolvedorHasEquipe(String desenvolvedoremail, int equipeidEquipe) {
        this.desenvolvedorHasEquipePK = new DesenvolvedorHasEquipePK(desenvolvedoremail, equipeidEquipe);
    }

    public DesenvolvedorHasEquipePK getDesenvolvedorHasEquipePK() {
        return desenvolvedorHasEquipePK;
    }

    public void setDesenvolvedorHasEquipePK(DesenvolvedorHasEquipePK desenvolvedorHasEquipePK) {
        this.desenvolvedorHasEquipePK = desenvolvedorHasEquipePK;
    }

    public String getPapel() {
        return papel;
    }

    public void setPapel(String papel) {
        this.papel = papel;
    }

    public String getNomeEquipe() {
        return nomeEquipe;
    }

    public void setNomeEquipe(String nomeEquipe) {
        this.nomeEquipe = nomeEquipe;
    }

    public Desenvolvedor getDesenvolvedor() {
        return desenvolvedor;
    }

    public void setDesenvolvedor(Desenvolvedor desenvolvedor) {
        this.desenvolvedor = desenvolvedor;
    }

    public Equipe getEquipe() {
        return equipe;
    }

    public void setEquipe(Equipe equipe) {
        this.equipe = equipe;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (desenvolvedorHasEquipePK != null ? desenvolvedorHasEquipePK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof DesenvolvedorHasEquipe)) {
            return false;
        }
        DesenvolvedorHasEquipe other = (DesenvolvedorHasEquipe) object;
        if ((this.desenvolvedorHasEquipePK == null && other.desenvolvedorHasEquipePK != null) || (this.desenvolvedorHasEquipePK != null && !this.desenvolvedorHasEquipePK.equals(other.desenvolvedorHasEquipePK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.DesenvolvedorHasEquipe[ desenvolvedorHasEquipePK=" + desenvolvedorHasEquipePK + " ]";
    }
    
}
