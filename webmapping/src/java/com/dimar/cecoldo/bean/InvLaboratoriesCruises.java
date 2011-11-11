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
@Table(name = "inv_laboratories_cruises")
@NamedQueries({
    @NamedQuery(name = "InvLaboratoriesCruises.findAll", query = "SELECT i FROM InvLaboratoriesCruises i"),
    @NamedQuery(name = "InvLaboratoriesCruises.findByIdLaboratory", query = "SELECT i FROM InvLaboratoriesCruises i WHERE i.invLaboratoriesCruisesPK.idLaboratory = :idLaboratory"),
    @NamedQuery(name = "InvLaboratoriesCruises.findByIdCruise", query = "SELECT i FROM InvLaboratoriesCruises i WHERE i.invLaboratoriesCruisesPK.idCruise = :idCruise")})
public class InvLaboratoriesCruises implements Serializable {
    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected InvLaboratoriesCruisesPK invLaboratoriesCruisesPK;
    @JoinColumn(name = "id_cruise", referencedColumnName = "id_cruise", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private InvCruiseInventory invCruiseInventory;
    @JoinColumn(name = "id_laboratory", referencedColumnName = "id_lab", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private InvLaboratories invLaboratories;

    public InvLaboratoriesCruises() {
    }

    public InvLaboratoriesCruises(InvLaboratoriesCruisesPK invLaboratoriesCruisesPK) {
        this.invLaboratoriesCruisesPK = invLaboratoriesCruisesPK;
    }

    public InvLaboratoriesCruises(int idLaboratory, int idCruise) {
        this.invLaboratoriesCruisesPK = new InvLaboratoriesCruisesPK(idLaboratory, idCruise);
    }

    public InvLaboratoriesCruisesPK getInvLaboratoriesCruisesPK() {
        return invLaboratoriesCruisesPK;
    }

    public void setInvLaboratoriesCruisesPK(InvLaboratoriesCruisesPK invLaboratoriesCruisesPK) {
        this.invLaboratoriesCruisesPK = invLaboratoriesCruisesPK;
    }

    public InvCruiseInventory getInvCruiseInventory() {
        return invCruiseInventory;
    }

    public void setInvCruiseInventory(InvCruiseInventory invCruiseInventory) {
        this.invCruiseInventory = invCruiseInventory;
    }

    public InvLaboratories getInvLaboratories() {
        return invLaboratories;
    }

    public void setInvLaboratories(InvLaboratories invLaboratories) {
        this.invLaboratories = invLaboratories;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (invLaboratoriesCruisesPK != null ? invLaboratoriesCruisesPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof InvLaboratoriesCruises)) {
            return false;
        }
        InvLaboratoriesCruises other = (InvLaboratoriesCruises) object;
        if ((this.invLaboratoriesCruisesPK == null && other.invLaboratoriesCruisesPK != null) || (this.invLaboratoriesCruisesPK != null && !this.invLaboratoriesCruisesPK.equals(other.invLaboratoriesCruisesPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dimar.cecoldo.bean.InvLaboratoriesCruises[ invLaboratoriesCruisesPK=" + invLaboratoriesCruisesPK + " ]";
    }
    
}
