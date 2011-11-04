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
 * @author user
 */
@Entity
@Table(name = "bodc_category_link")
@NamedQueries({@NamedQuery(name = "BodcCategoryLink.findByCategoryCode", query = "SELECT b FROM BodcCategoryLink b WHERE b.bodcCategoryLinkPK.categoryCode = :categoryCode"), @NamedQuery(name = "BodcCategoryLink.findByGroupCode", query = "SELECT b FROM BodcCategoryLink b WHERE b.bodcCategoryLinkPK.groupCode = :groupCode")})
public class BodcCategoryLink implements Serializable {
    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected BodcCategoryLinkPK bodcCategoryLinkPK;
    @JoinColumn(name = "CATEGORY_CODE", referencedColumnName = "CODE", insertable = false, updatable = false)
    @ManyToOne
    private BodcCategory bodcCategory;
    @JoinColumn(name = "GROUP_CODE", referencedColumnName = "CODE", insertable = false, updatable = false)
    @ManyToOne
    private BodcParameterGroup bodcParameterGroup;

    public BodcCategoryLink() {
    }

    public BodcCategoryLink(BodcCategoryLinkPK bodcCategoryLinkPK) {
        this.bodcCategoryLinkPK = bodcCategoryLinkPK;
    }

    public BodcCategoryLink(String categoryCode, String groupCode) {
        this.bodcCategoryLinkPK = new BodcCategoryLinkPK(categoryCode, groupCode);
    }

    public BodcCategoryLinkPK getBodcCategoryLinkPK() {
        return bodcCategoryLinkPK;
    }

    public void setBodcCategoryLinkPK(BodcCategoryLinkPK bodcCategoryLinkPK) {
        this.bodcCategoryLinkPK = bodcCategoryLinkPK;
    }

    public BodcCategory getBodcCategory() {
        return bodcCategory;
    }

    public void setBodcCategory(BodcCategory bodcCategory) {
        this.bodcCategory = bodcCategory;
    }

    public BodcParameterGroup getBodcParameterGroup() {
        return bodcParameterGroup;
    }

    public void setBodcParameterGroup(BodcParameterGroup bodcParameterGroup) {
        this.bodcParameterGroup = bodcParameterGroup;
    }


    @Override
    public int hashCode() {
        int hash = 0;
        hash += (bodcCategoryLinkPK != null ? bodcCategoryLinkPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof BodcCategoryLink)) {
            return false;
        }
        BodcCategoryLink other = (BodcCategoryLink) object;
        if ((this.bodcCategoryLinkPK == null && other.bodcCategoryLinkPK != null) || (this.bodcCategoryLinkPK != null && !this.bodcCategoryLinkPK.equals(other.bodcCategoryLinkPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "org.webmapping.consultaPuntos.bean.BodcCategoryLink[bodcCategoryLinkPK=" + bodcCategoryLinkPK + "]";
    }

}
