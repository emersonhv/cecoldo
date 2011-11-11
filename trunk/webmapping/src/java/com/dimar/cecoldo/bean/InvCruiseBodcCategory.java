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
@Table(name = "inv_cruise_bodc_category")
@NamedQueries({
    @NamedQuery(name = "InvCruiseBodcCategory.findAll", query = "SELECT i FROM InvCruiseBodcCategory i"),
    @NamedQuery(name = "InvCruiseBodcCategory.findByCategoryCode", query = "SELECT i FROM InvCruiseBodcCategory i WHERE i.invCruiseBodcCategoryPK.categoryCode = :categoryCode"),
    @NamedQuery(name = "InvCruiseBodcCategory.findByIdCruise", query = "SELECT i FROM InvCruiseBodcCategory i WHERE i.invCruiseBodcCategoryPK.idCruise = :idCruise")})
public class InvCruiseBodcCategory implements Serializable {
    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected InvCruiseBodcCategoryPK invCruiseBodcCategoryPK;
    @JoinColumn(name = "id_cruise", referencedColumnName = "id_cruise", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private InvCruiseInventory invCruiseInventory;
    @JoinColumn(name = "category_code", referencedColumnName = "CODE", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private BodcCategory bodcCategory;

    public InvCruiseBodcCategory() {
    }

    public InvCruiseBodcCategory(InvCruiseBodcCategoryPK invCruiseBodcCategoryPK) {
        this.invCruiseBodcCategoryPK = invCruiseBodcCategoryPK;
    }

    public InvCruiseBodcCategory(String categoryCode, int idCruise) {
        this.invCruiseBodcCategoryPK = new InvCruiseBodcCategoryPK(categoryCode, idCruise);
    }

    public InvCruiseBodcCategoryPK getInvCruiseBodcCategoryPK() {
        return invCruiseBodcCategoryPK;
    }

    public void setInvCruiseBodcCategoryPK(InvCruiseBodcCategoryPK invCruiseBodcCategoryPK) {
        this.invCruiseBodcCategoryPK = invCruiseBodcCategoryPK;
    }

    public InvCruiseInventory getInvCruiseInventory() {
        return invCruiseInventory;
    }

    public void setInvCruiseInventory(InvCruiseInventory invCruiseInventory) {
        this.invCruiseInventory = invCruiseInventory;
    }

    public BodcCategory getBodcCategory() {
        return bodcCategory;
    }

    public void setBodcCategory(BodcCategory bodcCategory) {
        this.bodcCategory = bodcCategory;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (invCruiseBodcCategoryPK != null ? invCruiseBodcCategoryPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof InvCruiseBodcCategory)) {
            return false;
        }
        InvCruiseBodcCategory other = (InvCruiseBodcCategory) object;
        if ((this.invCruiseBodcCategoryPK == null && other.invCruiseBodcCategoryPK != null) || (this.invCruiseBodcCategoryPK != null && !this.invCruiseBodcCategoryPK.equals(other.invCruiseBodcCategoryPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dimar.cecoldo.bean.InvCruiseBodcCategory[ invCruiseBodcCategoryPK=" + invCruiseBodcCategoryPK + " ]";
    }
    
}
