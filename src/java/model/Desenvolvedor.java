/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author carolinestelitano
 */
@Entity
@Table(name = "desenvolvedor")
@NamedQueries({
    @NamedQuery(name = "Desenvolvedor.findAll", query = "SELECT d FROM Desenvolvedor d"),
    @NamedQuery(name = "Desenvolvedor.findByIdDesenvolvedor", query = "SELECT d FROM Desenvolvedor d WHERE d.idDesenvolvedor = :idDesenvolvedor"),
    @NamedQuery(name = "Desenvolvedor.findByNomeDesenvolvedor", query = "SELECT d FROM Desenvolvedor d WHERE d.nomeDesenvolvedor = :nomeDesenvolvedor"),
    @NamedQuery(name = "Desenvolvedor.findByEmailDesenvolvedor", query = "SELECT d FROM Desenvolvedor d WHERE d.emailDesenvolvedor = :emailDesenvolvedor"),
    @NamedQuery(name = "Desenvolvedor.findByDataNascDesenvolvedor", query = "SELECT d FROM Desenvolvedor d WHERE d.dataNascDesenvolvedor = :dataNascDesenvolvedor"),
    @NamedQuery(name = "Desenvolvedor.findByEstadoDesenvolvedor", query = "SELECT d FROM Desenvolvedor d WHERE d.estadoDesenvolvedor = :estadoDesenvolvedor"),
    @NamedQuery(name = "Desenvolvedor.findByContatoDesenvolvedor", query = "SELECT d FROM Desenvolvedor d WHERE d.contatoDesenvolvedor = :contatoDesenvolvedor")})
public class Desenvolvedor implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idDesenvolvedor")
    private Integer idDesenvolvedor;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 60)
    @Column(name = "nomeDesenvolvedor")
    private String nomeDesenvolvedor;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 40)
    @Column(name = "emailDesenvolvedor")
    private String emailDesenvolvedor;
    @Basic(optional = false)
    @NotNull
    @Column(name = "dataNascDesenvolvedor")
    @Temporal(TemporalType.DATE)
    private Date dataNascDesenvolvedor;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 15)
    @Column(name = "estadoDesenvolvedor")
    private String estadoDesenvolvedor;
    @Size(max = 45)
    @Column(name = "ContatoDesenvolvedor")
    private String contatoDesenvolvedor;
    @JoinTable(name = "jogo_desenvolvedor", joinColumns = {
        @JoinColumn(name = "idDesenvolvedor", referencedColumnName = "idDesenvolvedor")}, inverseJoinColumns = {
        @JoinColumn(name = "idJogo", referencedColumnName = "idJogo")})
    @ManyToMany(fetch = FetchType.EAGER)
    private List<Jogo> jogoList;

    public Desenvolvedor() {
    }

    public Desenvolvedor(Integer idDesenvolvedor) {
        this.idDesenvolvedor = idDesenvolvedor;
    }

    public Desenvolvedor(Integer idDesenvolvedor, String nomeDesenvolvedor, String emailDesenvolvedor, Date dataNascDesenvolvedor, String estadoDesenvolvedor) {
        this.idDesenvolvedor = idDesenvolvedor;
        this.nomeDesenvolvedor = nomeDesenvolvedor;
        this.emailDesenvolvedor = emailDesenvolvedor;
        this.dataNascDesenvolvedor = dataNascDesenvolvedor;
        this.estadoDesenvolvedor = estadoDesenvolvedor;
    }

    public Integer getIdDesenvolvedor() {
        return idDesenvolvedor;
    }

    public void setIdDesenvolvedor(Integer idDesenvolvedor) {
        this.idDesenvolvedor = idDesenvolvedor;
    }

    public String getNomeDesenvolvedor() {
        return nomeDesenvolvedor;
    }

    public void setNomeDesenvolvedor(String nomeDesenvolvedor) {
        this.nomeDesenvolvedor = nomeDesenvolvedor;
    }

    public String getEmailDesenvolvedor() {
        return emailDesenvolvedor;
    }

    public void setEmailDesenvolvedor(String emailDesenvolvedor) {
        this.emailDesenvolvedor = emailDesenvolvedor;
    }

    public Date getDataNascDesenvolvedor() {
        return dataNascDesenvolvedor;
    }

    public void setDataNascDesenvolvedor(Date dataNascDesenvolvedor) {
        this.dataNascDesenvolvedor = dataNascDesenvolvedor;
    }

    public String getEstadoDesenvolvedor() {
        return estadoDesenvolvedor;
    }

    public void setEstadoDesenvolvedor(String estadoDesenvolvedor) {
        this.estadoDesenvolvedor = estadoDesenvolvedor;
    }

    public String getContatoDesenvolvedor() {
        return contatoDesenvolvedor;
    }

    public void setContatoDesenvolvedor(String contatoDesenvolvedor) {
        this.contatoDesenvolvedor = contatoDesenvolvedor;
    }

    public List<Jogo> getJogoList() {
        return jogoList;
    }

    public void setJogoList(List<Jogo> jogoList) {
        this.jogoList = jogoList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idDesenvolvedor != null ? idDesenvolvedor.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Desenvolvedor)) {
            return false;
        }
        Desenvolvedor other = (Desenvolvedor) object;
        if ((this.idDesenvolvedor == null && other.idDesenvolvedor != null) || (this.idDesenvolvedor != null && !this.idDesenvolvedor.equals(other.idDesenvolvedor))) {
            return false;
        }
        return true;
    }
    
    public String[] getDev() {
        String[] dev = new String[2];
        dev[0] = idDesenvolvedor.toString();
        dev[1] = nomeDesenvolvedor;
        return dev;
        //return  nomeDesenvolvedor ;
    }

    @Override
    public String toString() {
        return "" + idDesenvolvedor + "";
        //return  nomeDesenvolvedor ;
    }
    
}
