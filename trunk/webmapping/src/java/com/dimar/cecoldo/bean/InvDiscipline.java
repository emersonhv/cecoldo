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
@Table(name = "inv_discipline")
@NamedQueries({@NamedQuery(name = "InvDiscipline.findByIdDiscipline", query = "SELECT i FROM InvDiscipline i WHERE i.idDiscipline = :idDiscipline"), @NamedQuery(name = "InvDiscipline.findByDiscipline", query = "SELECT i FROM InvDiscipline i WHERE i.discipline = :discipline")})
public class InvDiscipline implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "id_discipline", nullable = false)
    private Integer idDiscipline;
    @Column(name = "discipline", nullable = false)
    private String discipline;
    @OneToMany(mappedBy = "discipline")
    private Collection<BodcCategory> bodcCategoryCollection;
    
    public InvDiscipline() {
    }

    public InvDiscipline(Integer idDiscipline) {
        this.idDiscipline = idDiscipline;
    }

    public InvDiscipline(Integer idDiscipline, String discipline) {
        this.idDiscipline = idDiscipline;
        this.discipline = discipline;
    }

    public Integer getIdDiscipline() {
        return idDiscipline;
    }

    public void setIdDiscipline(Integer idDiscipline) {
        this.idDiscipline = idDiscipline;
    }

    public String getDiscipline() {
        return discipline;
    }

    public void setDiscipline(String discipline) {
        this.discipline = discipline;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idDiscipline != null ? idDiscipline.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof InvDiscipline)) {
            return false;
        }
        InvDiscipline other = (InvDiscipline) object;
        if ((this.idDiscipline == null && other.idDiscipline != null) || (this.idDiscipline != null && !this.idDiscipline.equals(other.idDiscipline))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dimar.cecoldo.bean.InvDiscipline[idDiscipline=" + idDiscipline + "]";
    }

    public Collection<BodcCategory> getBodcCategoryCollection() {
        return bodcCategoryCollection;
    }

    public void setBodcCategoryCollection(Collection<BodcCategory> bodcCategoryCollection) {
        this.bodcCategoryCollection = bodcCategoryCollection;
    }

}
