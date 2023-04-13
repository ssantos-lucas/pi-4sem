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
@Table(name = "desenvolvedor")
@NamedQueries({
    @NamedQuery(name = "Desenvolvedor.findAll", query = "SELECT d FROM Desenvolvedor d"),
    @NamedQuery(name = "Desenvolvedor.findByEmail", query = "SELECT d FROM Desenvolvedor d WHERE d.email = :email"),
    @NamedQuery(name = "Desenvolvedor.findByNomeDev", query = "SELECT d FROM Desenvolvedor d WHERE d.nomeDev = :nomeDev"),
    @NamedQuery(name = "Desenvolvedor.findByIdadeDev", query = "SELECT d FROM Desenvolvedor d WHERE d.idadeDev = :idadeDev"),
    @NamedQuery(name = "Desenvolvedor.findByEstadoDev", query = "SELECT d FROM Desenvolvedor d WHERE d.estadoDev = :estadoDev")})
public class Desenvolvedor implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "email")
    private String email;
    @Column(name = "nomeDev")
    private String nomeDev;
    @Column(name = "idadeDev")
    private Integer idadeDev;
    @Column(name = "estadoDev")
    private String estadoDev;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "desenvolvedor", fetch = FetchType.EAGER)
    private List<DesenvolvedorHasEquipe> desenvolvedorHasEquipeList;

    public Desenvolvedor() {
    }

    public Desenvolvedor(String email) {
        this.email = email;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNomeDev() {
        return nomeDev;
    }

    public void setNomeDev(String nomeDev) {
        this.nomeDev = nomeDev;
    }

    public Integer getIdadeDev() {
        return idadeDev;
    }

    public void setIdadeDev(Integer idadeDev) {
        this.idadeDev = idadeDev;
    }

    public String getEstadoDev() {
        return estadoDev;
    }

    public void setEstadoDev(String estadoDev) {
        this.estadoDev = estadoDev;
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
        hash += (email != null ? email.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Desenvolvedor)) {
            return false;
        }
        Desenvolvedor other = (Desenvolvedor) object;
        if ((this.email == null && other.email != null) || (this.email != null && !this.email.equals(other.email))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Desenvolvedor[ email=" + email + " ]";
    }
    
}
