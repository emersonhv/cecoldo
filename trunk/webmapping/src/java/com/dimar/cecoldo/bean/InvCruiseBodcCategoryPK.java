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
public class InvCruiseBodcCategoryPK implements Serializable {
    @Basic(optional = false)
    @Column(name = "category_code")
    private String categoryCode;
    @Basic(optional = false)
    @Column(name = "id_cruise")
    private int idCruise;

    public InvCruiseBodcCategoryPK() {
    }

    public InvCruiseBodcCategoryPK(String categoryCode, int idCruise) {
        this.categoryCode = categoryCode;
        this.idCruise = idCruise;
    }

    public String getCategoryCode() {
        return categoryCode;
    }

    public void setCategoryCode(String categoryCode) {
        this.categoryCode = categoryCode;
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
        hash += (categoryCode != null ? categoryCode.hashCode() : 0);
        hash += (int) idCruise;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof InvCruiseBodcCategoryPK)) {
            return false;
        }
        InvCruiseBodcCategoryPK other = (InvCruiseBodcCategoryPK) object;
        if ((this.categoryCode == null && other.categoryCode != null) || (this.categoryCode != null && !this.categoryCode.equals(other.categoryCode))) {
            return false;
        }
        if (this.idCruise != other.idCruise) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dimar.cecoldo.bean.InvCruiseBodcCategoryPK[ categoryCode=" + categoryCode + ", idCruise=" + idCruise + " ]";
    }
    
}
