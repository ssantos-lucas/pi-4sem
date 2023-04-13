/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 *
 * @author Eddy Mauricio
 */
@Embeddable
public class DesenvolvedorHasEquipePK implements Serializable {

    @Basic(optional = false)
    @Column(name = "Desenvolvedor_email")
    private String desenvolvedoremail;
    @Basic(optional = false)
    @Column(name = "Equipe_idEquipe")
    private int equipeidEquipe;

    public DesenvolvedorHasEquipePK() {
    }

    public DesenvolvedorHasEquipePK(String desenvolvedoremail, int equipeidEquipe) {
        this.desenvolvedoremail = desenvolvedoremail;
        this.equipeidEquipe = equipeidEquipe;
    }

    public String getDesenvolvedoremail() {
        return desenvolvedoremail;
    }

    public void setDesenvolvedoremail(String desenvolvedoremail) {
        this.desenvolvedoremail = desenvolvedoremail;
    }

    public int getEquipeidEquipe() {
        return equipeidEquipe;
    }

    public void setEquipeidEquipe(int equipeidEquipe) {
        this.equipeidEquipe = equipeidEquipe;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (desenvolvedoremail != null ? desenvolvedoremail.hashCode() : 0);
        hash += (int) equipeidEquipe;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof DesenvolvedorHasEquipePK)) {
            return false;
        }
        DesenvolvedorHasEquipePK other = (DesenvolvedorHasEquipePK) object;
        if ((this.desenvolvedoremail == null && other.desenvolvedoremail != null) || (this.desenvolvedoremail != null && !this.desenvolvedoremail.equals(other.desenvolvedoremail))) {
            return false;
        }
        if (this.equipeidEquipe != other.equipeidEquipe) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.DesenvolvedorHasEquipePK[ desenvolvedoremail=" + desenvolvedoremail + ", equipeidEquipe=" + equipeidEquipe + " ]";
    }
    
}
