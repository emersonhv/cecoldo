/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.dimar.cecoldo.bean;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 *
 * @author user
 */
@Embeddable
public class InvCruiseInstitutionsPK implements Serializable {
    @Column(name = "Id_institution", nullable = false)
    private int idinstitution;
    @Column(name = "id_cruise", nullable = false)
    private String idCruise;
    @Column(name = "relation_type", nullable = false)
    private String relationType;

    public InvCruiseInstitutionsPK() {
    }

    public InvCruiseInstitutionsPK(int idinstitution, String idCruise, String relationType) {
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

    public String getIdCruise() {
        return idCruise;
    }

    public void setIdCruise(String idCruise) {
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
        hash += (idCruise != null ? idCruise.hashCode() : 0);
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
        if ((this.idCruise == null && other.idCruise != null) || (this.idCruise != null && !this.idCruise.equals(other.idCruise))) {
            return false;
        }
        if ((this.relationType == null && other.relationType != null) || (this.relationType != null && !this.relationType.equals(other.relationType))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dimar.cecoldo.bean1.InvCruiseInstitutionsPK[idinstitution=" + idinstitution + ", idCruise=" + idCruise + ", relationType=" + relationType + "]";
    }

}
