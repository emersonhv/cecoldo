/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dimar.cecoldo.bean;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 *
 * @author Administrador
 */
@Embeddable
public class InvCruiseInstitutionsPK implements Serializable {
    @Basic(optional = false)
    @Column(name = "Id_institution")
    private int idinstitution;
    @Basic(optional = false)
    @Column(name = "id_cruise")
    private int idCruise;
    @Basic(optional = false)
    @Column(name = "relation_type")
    private String relationType;

    public InvCruiseInstitutionsPK() {
    }

    public InvCruiseInstitutionsPK(int idinstitution, int idCruise, String relationType) {
        this.idinstitution = idinstitution;
        this.idCruise = idCruise;
        this.relationType = relationType;
    }

    public int getIdinstitution() {
        return idinstitution;
    }

    public void setIdinstitution(int idinstitution) {
        this.idinstitution = idinstitution;
    }

    public int getIdCruise() {
        return idCruise;
    }

    public void setIdCruise(int idCruise) {
        this.idCruise = idCruise;
    }

    public String getRelationType() {
        return relationType;
    }

    public void setRelationType(String relationType) {
        this.relationType = relationType;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) idinstitution;
        hash += (int) idCruise;
        hash += (relationType != null ? relationType.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof InvCruiseInstitutionsPK)) {
            return false;
        }
        InvCruiseInstitutionsPK other = (InvCruiseInstitutionsPK) object;
        if (this.idinstitution != other.idinstitution) {
            return false;
        }
        if (this.idCruise != other.idCruise) {
            return false;
        }
        if ((this.relationType == null && other.relationType != null) || (this.relationType != null && !this.relationType.equals(other.relationType))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dimar.cecoldo.bean.InvCruiseInstitutionsPK[ idinstitution=" + idinstitution + ", idCruise=" + idCruise + ", relationType=" + relationType + " ]";
    }
    
}
