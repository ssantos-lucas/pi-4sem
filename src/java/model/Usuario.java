/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author Eddy Mauricio
 */
@Entity
@Table(name = "usuario")
@NamedQueries({
    @NamedQuery(name = "Usuario.findAll", query = "SELECT u FROM Usuario u"),
    @NamedQuery(name = "Usuario.findByEmail", query = "SELECT u FROM Usuario u WHERE u.email = :email"),
    @NamedQuery(name = "Usuario.findByNomeUsu", query = "SELECT u FROM Usuario u WHERE u.nomeUsu = :nomeUsu"),
    @NamedQuery(name = "Usuario.findByIdadeUsu", query = "SELECT u FROM Usuario u WHERE u.idadeUsu = :idadeUsu"),
    @NamedQuery(name = "Usuario.findByEstadoUsu", query = "SELECT u FROM Usuario u WHERE u.estadoUsu = :estadoUsu"),
    @NamedQuery(name = "Usuario.findByDataCriacaoUsu", query = "SELECT u FROM Usuario u WHERE u.dataCriacaoUsu = :dataCriacaoUsu")})
public class Usuario implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "email")
    private String email;
    @Column(name = "nomeUsu")
    private String nomeUsu;
    @Column(name = "idadeUsu")
    private Integer idadeUsu;
    @Column(name = "estadoUsu")
    private String estadoUsu;
    @Column(name = "dataCriacaoUsu")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dataCriacaoUsu;
    @ManyToMany(mappedBy = "usuarioList", fetch = FetchType.EAGER)
    private List<Jogo> jogoList;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "usuario", fetch = FetchType.EAGER)
    private Acesso acesso;

    public Usuario() {
    }

    public Usuario(String email) {
        this.email = email;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNomeUsu() {
        return nomeUsu;
    }

    public void setNomeUsu(String nomeUsu) {
        this.nomeUsu = nomeUsu;
    }

    public Integer getIdadeUsu() {
        return idadeUsu;
    }

    public void setIdadeUsu(Integer idadeUsu) {
        this.idadeUsu = idadeUsu;
    }

    public String getEstadoUsu() {
        return estadoUsu;
    }

    public void setEstadoUsu(String estadoUsu) {
        this.estadoUsu = estadoUsu;
    }

    public Date getDataCriacaoUsu() {
        return dataCriacaoUsu;
    }

    public void setDataCriacaoUsu(Date dataCriacaoUsu) {
        this.dataCriacaoUsu = dataCriacaoUsu;
    }

    public List<Jogo> getJogoList() {
        return jogoList;
    }

    public void setJogoList(List<Jogo> jogoList) {
        this.jogoList = jogoList;
    }

    public Acesso getAcesso() {
        return acesso;
    }

    public void setAcesso(Acesso acesso) {
        this.acesso = acesso;
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
        if (!(object instanceof Usuario)) {
            return false;
        }
        Usuario other = (Usuario) object;
        if ((this.email == null && other.email != null) || (this.email != null && !this.email.equals(other.email))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Usuario[ email=" + email + " ]";
    }
    
}
