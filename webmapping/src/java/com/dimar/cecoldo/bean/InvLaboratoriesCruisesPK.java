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
public class InvLaboratoriesCruisesPK implements Serializable {
    @Basic(optional = false)
    @Column(name = "id_laboratory")
    private int idLaboratory;
    @Basic(optional = false)
    @Column(name = "id_cruise")
    private int idCruise;

    public InvLaboratoriesCruisesPK() {
    }

    public InvLaboratoriesCruisesPK(int idLaboratory, int idCruise) {
        this.idLaboratory = idLaboratory;
        this.idCruise = idCruise;
    }

    public int getIdLaboratory() {
        return idLaboratory;
    }

    public void setIdLaboratory(int idLaboratory) {
        this.idLaboratory = idLaboratory;
    }

    public int getIdCruise() {
        return idCruise;
    }

    public void setIdCruise(int idCruise) {
        this.idCruise = idCruise;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) idLaboratory;
        hash += (int) idCruise;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof InvLaboratoriesCruisesPK)) {
            return false;
        }
        InvLaboratoriesCruisesPK other = (InvLaboratoriesCruisesPK) object;
        if (this.idLaboratory != other.idLaboratory) {
            return false;
        }
        if (this.idCruise != other.idCruise) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dimar.cecoldo.bean.InvLaboratoriesCruisesPK[ idLaboratory=" + idLaboratory + ", idCruise=" + idCruise + " ]";
    }
    
}
