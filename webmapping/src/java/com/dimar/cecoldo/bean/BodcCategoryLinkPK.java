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
public class BodcCategoryLinkPK implements Serializable {
    @Column(name = "CATEGORY_CODE", nullable = false)
    private String categoryCode;
    @Column(name = "GROUP_CODE", nullable = false)
    private String groupCode;

    public BodcCategoryLinkPK() {
    }

    public BodcCategoryLinkPK(String categoryCode, String groupCode) {
        this.categoryCode = categoryCode;
        this.groupCode = groupCode;
    }

    public String getCategoryCode() {
        return categoryCode;
    }

    public void setCategoryCode(String categoryCode) {
        this.categoryCode = categoryCode;
    }

    public String getGroupCode() {
        return groupCode;
    }

    public void setGroupCode(String groupCode) {
        this.groupCode = groupCode;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (categoryCode != null ? categoryCode.hashCode() : 0);
        hash += (groupCode != null ? groupCode.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof BodcCategoryLinkPK)) {
            return false;
        }
        BodcCategoryLinkPK other = (BodcCategoryLinkPK) object;
        if ((this.categoryCode == null && other.categoryCode != null) || (this.categoryCode != null && !this.categoryCode.equals(other.categoryCode))) {
            return false;
        }
        if ((this.groupCode == null && other.groupCode != null) || (this.groupCode != null && !this.groupCode.equals(other.groupCode))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "org.webmapping.consultaPuntos.bean.BodcCategoryLinkPK[categoryCode=" + categoryCode + ", groupCode=" + groupCode + "]";
    }

}
