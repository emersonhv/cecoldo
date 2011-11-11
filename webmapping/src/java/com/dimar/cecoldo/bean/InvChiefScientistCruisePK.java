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
public class InvChiefScientistCruisePK implements Serializable {
    @Basic(optional = false)
    @Column(name = "id_chief_scientist")
    private String idChiefScientist;
    @Basic(optional = false)
    @Column(name = "id_cruise")
    private int idCruise;

    public InvChiefScientistCruisePK() {
    }

    public InvChiefScientistCruisePK(String idChiefScientist, int idCruise) {
        this.idChiefScientist = idChiefScientist;
        this.idCruise = idCruise;
    }

    public String getIdChiefScientist() {
        return idChiefScientist;
    }

    public void setIdChiefScientist(String idChiefScientist) {
        this.idChiefScientist = idChiefScientist;
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
        hash += (idChiefScientist != null ? idChiefScientist.hashCode() : 0);
        hash += (int) idCruise;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof InvChiefScientistCruisePK)) {
            return false;
        }
        InvChiefScientistCruisePK other = (InvChiefScientistCruisePK) object;
        if ((this.idChiefScientist == null && other.idChiefScientist != null) || (this.idChiefScientist != null && !this.idChiefScientist.equals(other.idChiefScientist))) {
            return false;
        }
        if (this.idCruise != other.idCruise) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dimar.cecoldo.bean.InvChiefScientistCruisePK[ idChiefScientist=" + idChiefScientist + ", idCruise=" + idCruise + " ]";
    }
    
}
