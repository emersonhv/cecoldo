/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dimar.cecoldo.bean;

import java.io.Serializable;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author Administrador
 */
@Entity
@Table(name = "inv_chief_scientist_cruise")
@NamedQueries({
    @NamedQuery(name = "InvChiefScientistCruise.findAll", query = "SELECT i FROM InvChiefScientistCruise i"),
    @NamedQuery(name = "InvChiefScientistCruise.findByIdChiefScientist", query = "SELECT i FROM InvChiefScientistCruise i WHERE i.invChiefScientistCruisePK.idChiefScientist = :idChiefScientist"),
    @NamedQuery(name = "InvChiefScientistCruise.findByIdCruise", query = "SELECT i FROM InvChiefScientistCruise i WHERE i.invChiefScientistCruisePK.idCruise = :idCruise")})
public class InvChiefScientistCruise implements Serializable {
    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected InvChiefScientistCruisePK invChiefScientistCruisePK;
    @JoinColumn(name = "id_cruise", referencedColumnName = "id_cruise", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private InvCruiseInventory invCruiseInventory;
    @JoinColumn(name = "id_chief_scientist", referencedColumnName = "Id", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private InvChiefScientist invChiefScientist;

    public InvChiefScientistCruise() {
    }

    public InvChiefScientistCruise(InvChiefScientistCruisePK invChiefScientistCruisePK) {
        this.invChiefScientistCruisePK = invChiefScientistCruisePK;
    }

    public InvChiefScientistCruise(String idChiefScientist, int idCruise) {
        this.invChiefScientistCruisePK = new InvChiefScientistCruisePK(idChiefScientist, idCruise);
    }

    public InvChiefScientistCruisePK getInvChiefScientistCruisePK() {
        return invChiefScientistCruisePK;
    }

    public void setInvChiefScientistCruisePK(InvChiefScientistCruisePK invChiefScientistCruisePK) {
        this.invChiefScientistCruisePK = invChiefScientistCruisePK;
    }

    public InvCruiseInventory getInvCruiseInventory() {
        return invCruiseInventory;
    }

    public void setInvCruiseInventory(InvCruiseInventory invCruiseInventory) {
        this.invCruiseInventory = invCruiseInventory;
    }

    public InvChiefScientist getInvChiefScientist() {
        return invChiefScientist;
    }

    public void setInvChiefScientist(InvChiefScientist invChiefScientist) {
        this.invChiefScientist = invChiefScientist;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (invChiefScientistCruisePK != null ? invChiefScientistCruisePK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof InvChiefScientistCruise)) {
            return false;
        }
        InvChiefScientistCruise other = (InvChiefScientistCruise) object;
        if ((this.invChiefScientistCruisePK == null && other.invChiefScientistCruisePK != null) || (this.invChiefScientistCruisePK != null && !this.invChiefScientistCruisePK.equals(other.invChiefScientistCruisePK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dimar.cecoldo.bean.InvChiefScientistCruise[ invChiefScientistCruisePK=" + invChiefScientistCruisePK + " ]";
    }
    
}
