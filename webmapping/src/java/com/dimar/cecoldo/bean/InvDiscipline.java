/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dimar.cecoldo.bean;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author Administrador
 */
@Entity
@Table(name = "inv_discipline")
@NamedQueries({
    @NamedQuery(name = "InvDiscipline.findAll", query = "SELECT i FROM InvDiscipline i"),
    @NamedQuery(name = "InvDiscipline.findByIdDiscipline", query = "SELECT i FROM InvDiscipline i WHERE i.idDiscipline = :idDiscipline"),
    @NamedQuery(name = "InvDiscipline.findByDiscipline", query = "SELECT i FROM InvDiscipline i WHERE i.discipline = :discipline")})
public class InvDiscipline implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_discipline")
    private Integer idDiscipline;
    @Basic(optional = false)
    @Column(name = "discipline")
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

    public Collection<BodcCategory> getBodcCategoryCollection() {
        return bodcCategoryCollection;
    }

    public void setBodcCategoryCollection(Collection<BodcCategory> bodcCategoryCollection) {
        this.bodcCategoryCollection = bodcCategoryCollection;
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
        return "com.dimar.cecoldo.bean.InvDiscipline[ idDiscipline=" + idDiscipline + " ]";
    }
    
}
