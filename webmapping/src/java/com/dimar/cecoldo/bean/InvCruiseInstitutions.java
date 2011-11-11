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
@Table(name = "inv_cruise_institutions")
@NamedQueries({
    @NamedQuery(name = "InvCruiseInstitutions.findAll", query = "SELECT i FROM InvCruiseInstitutions i"),
    @NamedQuery(name = "InvCruiseInstitutions.findByIdinstitution", query = "SELECT i FROM InvCruiseInstitutions i WHERE i.invCruiseInstitutionsPK.idinstitution = :idinstitution"),
    @NamedQuery(name = "InvCruiseInstitutions.findByIdCruise", query = "SELECT i FROM InvCruiseInstitutions i WHERE i.invCruiseInstitutionsPK.idCruise = :idCruise"),
    @NamedQuery(name = "InvCruiseInstitutions.findByRelationType", query = "SELECT i FROM InvCruiseInstitutions i WHERE i.invCruiseInstitutionsPK.relationType = :relationType")})
public class InvCruiseInstitutions implements Serializable {
    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected InvCruiseInstitutionsPK invCruiseInstitutionsPK;
    @JoinColumn(name = "id_cruise", referencedColumnName = "id_cruise", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private InvCruiseInventory invCruiseInventory;
    @JoinColumn(name = "Id_institution", referencedColumnName = "Id_institution", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private InvInstitutions invInstitutions;

    public InvCruiseInstitutions() {
    }

    public InvCruiseInstitutions(InvCruiseInstitutionsPK invCruiseInstitutionsPK) {
        this.invCruiseInstitutionsPK = invCruiseInstitutionsPK;
    }

    public InvCruiseInstitutions(int idinstitution, int idCruise, String relationType) {
        this.invCruiseInstitutionsPK = new InvCruiseInstitutionsPK(idinstitution, idCruise, relationType);
    }

    public InvCruiseInstitutionsPK getInvCruiseInstitutionsPK() {
        return invCruiseInstitutionsPK;
    }

    public void setInvCruiseInstitutionsPK(InvCruiseInstitutionsPK invCruiseInstitutionsPK) {
        this.invCruiseInstitutionsPK = invCruiseInstitutionsPK;
    }

    public InvCruiseInventory getInvCruiseInventory() {
        return invCruiseInventory;
    }

    public void setInvCruiseInventory(InvCruiseInventory invCruiseInventory) {
        this.invCruiseInventory = invCruiseInventory;
    }

    public InvInstitutions getInvInstitutions() {
        return invInstitutions;
    }

    public void setInvInstitutions(InvInstitutions invInstitutions) {
        this.invInstitutions = invInstitutions;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (invCruiseInstitutionsPK != null ? invCruiseInstitutionsPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof InvCruiseInstitutions)) {
            return false;
        }
        InvCruiseInstitutions other = (InvCruiseInstitutions) object;
        if ((this.invCruiseInstitutionsPK == null && other.invCruiseInstitutionsPK != null) || (this.invCruiseInstitutionsPK != null && !this.invCruiseInstitutionsPK.equals(other.invCruiseInstitutionsPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dimar.cecoldo.bean.InvCruiseInstitutions[ invCruiseInstitutionsPK=" + invCruiseInstitutionsPK + " ]";
    }
    
}
