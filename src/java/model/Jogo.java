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
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

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
    @NamedQuery(name = "Jogo.findByFaixaEtariaJogo", query = "SELECT j FROM Jogo j WHERE j.faixaEtariaJogo = :faixaEtariaJogo"),
    @NamedQuery(name = "Jogo.findByDataLancamento", query = "SELECT j FROM Jogo j WHERE j.dataLancamento = :dataLancamento"),
    @NamedQuery(name = "Jogo.findByImagemLogo", query = "SELECT j FROM Jogo j WHERE j.imagemLogo = :imagemLogo"),
    @NamedQuery(name = "Jogo.findByImagemCorpo", query = "SELECT j FROM Jogo j WHERE j.imagemCorpo = :imagemCorpo"),
    @NamedQuery(name = "Jogo.findByUrlJogo", query = "SELECT j FROM Jogo j WHERE j.urlJogo = :urlJogo")})
public class Jogo implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idJogo")
    private Integer idJogo;
    @Basic(optional = false)
    @Column(name = "nomeJogo")
    private String nomeJogo;
    @Basic(optional = false)
    @Lob
    @Column(name = "descricaoJogo")
    private String descricaoJogo;
    @Basic(optional = false)
    @Column(name = "faixaEtariaJogo")
    private int faixaEtariaJogo;
    @Basic(optional = false)
    @Lob
    @Column(name = "resumoJogo")
    private String resumoJogo;
    @Basic(optional = false)
    @Column(name = "dataLancamento")
    @Temporal(TemporalType.DATE)
    private Date dataLancamento;
    @Basic(optional = false)
    @Column(name = "imagemLogo")
    private String imagemLogo;
    @Basic(optional = false)
    @Column(name = "imagemCorpo")
    private String imagemCorpo;
    @Basic(optional = false)
    @Column(name = "urlJogo")
    private String urlJogo;
    @ManyToMany(mappedBy = "jogoList", fetch = FetchType.EAGER)
    private List<Desenvolvedor> desenvolvedorList;
    @JoinTable(name = "favorito", joinColumns = {
        @JoinColumn(name = "idJogo", referencedColumnName = "idJogo")}, inverseJoinColumns = {
        @JoinColumn(name = "idUsuario", referencedColumnName = "idUsuario")})
    @ManyToMany(fetch = FetchType.EAGER)
    private List<Usuario> usuarioList;
    @ManyToMany(mappedBy = "jogoList", fetch = FetchType.EAGER)
    private List<Categoria> categoriaList;

    public Jogo() {
    }

    public Jogo(Integer idJogo) {
        this.idJogo = idJogo;
    }

    public Jogo(Integer idJogo, String nomeJogo, String descricaoJogo, int faixaEtariaJogo, String resumoJogo, Date dataLancamento, String imagemLogo, String imagemCorpo, String urlJogo) {
        this.idJogo = idJogo;
        this.nomeJogo = nomeJogo;
        this.descricaoJogo = descricaoJogo;
        this.faixaEtariaJogo = faixaEtariaJogo;
        this.resumoJogo = resumoJogo;
        this.dataLancamento = dataLancamento;
        this.imagemLogo = imagemLogo;
        this.imagemCorpo = imagemCorpo;
        this.urlJogo = urlJogo;
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

    public int getFaixaEtariaJogo() {
        return faixaEtariaJogo;
    }

    public void setFaixaEtariaJogo(int faixaEtariaJogo) {
        this.faixaEtariaJogo = faixaEtariaJogo;
    }

    public String getResumoJogo() {
        return resumoJogo;
    }

    public void setResumoJogo(String resumoJogo) {
        this.resumoJogo = resumoJogo;
    }

    public Date getDataLancamento() {
        return dataLancamento;
    }

    public void setDataLancamento(Date dataLancamento) {
        this.dataLancamento = dataLancamento;
    }

    public String getImagemLogo() {
        return imagemLogo;
    }

    public void setImagemLogo(String imagemLogo) {
        this.imagemLogo = imagemLogo;
    }

    public String getImagemCorpo() {
        return imagemCorpo;
    }

    public void setImagemCorpo(String imagemCorpo) {
        this.imagemCorpo = imagemCorpo;
    }

    public String getUrlJogo() {
        return urlJogo;
    }

    public void setUrlJogo(String urlJogo) {
        this.urlJogo = urlJogo;
    }

    public List<Desenvolvedor> getDesenvolvedorList() {
        return desenvolvedorList;
    }

    public void setDesenvolvedorList(List<Desenvolvedor> desenvolvedorList) {
        this.desenvolvedorList = desenvolvedorList;
    }

    public List<Usuario> getUsuarioList() {
        return usuarioList;
    }

    public void setUsuarioList(List<Usuario> usuarioList) {
        this.usuarioList = usuarioList;
    }

    public List<Categoria> getCategoriaList() {
        return categoriaList;
    }

    public void setCategoriaList(List<Categoria> categoriaList) {
        this.categoriaList = categoriaList;
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
