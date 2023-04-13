/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author Eddy Mauricio
 */
@Entity
@Table(name = "jogo")
@NamedQueries({
    @NamedQuery(name = "Jogo.findAll", query = "SELECT j FROM Jogo j"),
    @NamedQuery(name = "Jogo.findByIdJogo", query = "SELECT j FROM Jogo j WHERE j.idJogo = :idJogo"),
    @NamedQuery(name = "Jogo.findByNomeJogo", query = "SELECT j FROM Jogo j WHERE j.nomeJogo = :nomeJogo"),
    @NamedQuery(name = "Jogo.findByDescricaoJogo", query = "SELECT j FROM Jogo j WHERE j.descricaoJogo = :descricaoJogo"),
    @NamedQuery(name = "Jogo.findByClassEtariaJogo", query = "SELECT j FROM Jogo j WHERE j.classEtariaJogo = :classEtariaJogo"),
    @NamedQuery(name = "Jogo.findByPlataformaJogo", query = "SELECT j FROM Jogo j WHERE j.plataformaJogo = :plataformaJogo"),
    @NamedQuery(name = "Jogo.findByImagemJogo", query = "SELECT j FROM Jogo j WHERE j.imagemJogo = :imagemJogo")})
public class Jogo implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "idJogo")
    private Integer idJogo;
    @Column(name = "nomeJogo")
    private String nomeJogo;
    @Column(name = "descricaoJogo")
    private String descricaoJogo;
    @Column(name = "classEtariaJogo")
    private Integer classEtariaJogo;
    @Column(name = "plataformaJogo")
    private String plataformaJogo;
    @Lob
    @Column(name = "conteudoJogo")
    private String conteudoJogo;
    @Column(name = "imagemJogo")
    private String imagemJogo;
    @ManyToMany(mappedBy = "jogoList", fetch = FetchType.EAGER)
    private List<Categoria> categoriaList;
    @JoinTable(name = "favorito", joinColumns = {
        @JoinColumn(name = "idJogo", referencedColumnName = "idJogo")}, inverseJoinColumns = {
        @JoinColumn(name = "email", referencedColumnName = "email")})
    @ManyToMany(fetch = FetchType.EAGER)
    private List<Usuario> usuarioList;
    @JoinColumn(name = "idEquipe", referencedColumnName = "idEquipe")
    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private Equipe idEquipe;

    public Jogo() {
    }

    public Jogo(Integer idJogo) {
        this.idJogo = idJogo;
    }

    public Integer getIdJogo() {
        return idJogo;
    }

    public void setIdJogo(Integer idJogo) {
        this.idJogo = idJogo;
    }

    public String getNomeJogo() {
        return nomeJogo;
    }

    public void setNomeJogo(String nomeJogo) {
        this.nomeJogo = nomeJogo;
    }

    public String getDescricaoJogo() {
        return descricaoJogo;
    }

    public void setDescricaoJogo(String descricaoJogo) {
        this.descricaoJogo = descricaoJogo;
    }

    public Integer getClassEtariaJogo() {
        return classEtariaJogo;
    }

    public void setClassEtariaJogo(Integer classEtariaJogo) {
        this.classEtariaJogo = classEtariaJogo;
    }

    public String getPlataformaJogo() {
        return plataformaJogo;
    }

    public void setPlataformaJogo(String plataformaJogo) {
        this.plataformaJogo = plataformaJogo;
    }

    public String getConteudoJogo() {
        return conteudoJogo;
    }

    public void setConteudoJogo(String conteudoJogo) {
        this.conteudoJogo = conteudoJogo;
    }

    public String getImagemJogo() {
        return imagemJogo;
    }

    public void setImagemJogo(String imagemJogo) {
        this.imagemJogo = imagemJogo;
    }

    public List<Categoria> getCategoriaList() {
        return categoriaList;
    }

    public void setCategoriaList(List<Categoria> categoriaList) {
        this.categoriaList = categoriaList;
    }

    public List<Usuario> getUsuarioList() {
        return usuarioList;
    }

    public void setUsuarioList(List<Usuario> usuarioList) {
        this.usuarioList = usuarioList;
    }

    public Equipe getIdEquipe() {
        return idEquipe;
    }

    public void setIdEquipe(Equipe idEquipe) {
        this.idEquipe = idEquipe;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idJogo != null ? idJogo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Jogo)) {
            return false;
        }
        Jogo other = (Jogo) object;
        if ((this.idJogo == null && other.idJogo != null) || (this.idJogo != null && !this.idJogo.equals(other.idJogo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Jogo[ idJogo=" + idJogo + " ]";
    }
    
}
