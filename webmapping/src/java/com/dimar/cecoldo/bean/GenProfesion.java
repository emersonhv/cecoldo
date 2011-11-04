/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.dimar.cecoldo.bean;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author user
 */
@Entity
@Table(name = "gen_profesion")
@NamedQueries({@NamedQuery(name = "GenProfesion.findByIdProfesion", query = "SELECT g FROM GenProfesion g WHERE g.idProfesion = :idProfesion"), @NamedQuery(name = "GenProfesion.findByProfesion", query = "SELECT g FROM GenProfesion g WHERE g.profesion = :profesion")})
public class GenProfesion implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "id_profesion", nullable = false)
    private Integer idProfesion;
    @Column(name = "profesion")
    private String profesion;
    @OneToMany(mappedBy = "profession")
    private Collection<InvChiefScientist> invChiefScientistCollection;

    public GenProfesion() {
    }

    public GenProfesion(Integer idProfesion) {
        this.idProfesion = idProfesion;
    }

    public Integer getIdProfesion() {
        return idProfesion;
    }

    public void setIdProfesion(Integer idProfesion) {
        this.idProfesion = idProfesion;
    }

    public String getProfesion() {
        return profesion;
    }

    public void setProfesion(String profesion) {
        this.profesion = profesion;
    }

    public Collection<InvChiefScientist> getInvChiefScientistCollection() {
        return invChiefScientistCollection;
    }

    public void setInvChiefScientistCollection(Collection<InvChiefScientist> invChiefScientistCollection) {
        this.invChiefScientistCollection = invChiefScientistCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idProfesion != null ? idProfesion.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof GenProfesion)) {
            return false;
        }
        GenProfesion other = (GenProfesion) object;
        if ((this.idProfesion == null && other.idProfesion != null) || (this.idProfesion != null && !this.idProfesion.equals(other.idProfesion))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dimar.cecoldo.bean1.GenProfesion[idProfesion=" + idProfesion + "]";
    }

}
