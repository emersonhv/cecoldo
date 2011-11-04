/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.dimar.cecoldo.bean;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author user
 */
@Entity
@Table(name = "or_properties")
@NamedQueries({@NamedQuery(name = "CecoldoProperties.findByPropertyId", query = "SELECT c FROM CecoldoProperties c WHERE c.propertyId = :propertyId"), @NamedQuery(name = "CecoldoProperties.findByPropertyKey", query = "SELECT c FROM CecoldoProperties c WHERE c.propertyKey = :propertyKey"), @NamedQuery(name = "CecoldoProperties.findByPropertyValue", query = "SELECT c FROM CecoldoProperties c WHERE c.propertyValue = :propertyValue")})
public class CecoldoProperties implements Serializable {
    public static final String MAIL_ADMINISTRATOR = "mail.admin";
    
    
    private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "PROPERTY_ID", nullable = false)
    private Integer propertyId;
    @Column(name = "PROPERTY_KEY", nullable = false)
    private String propertyKey;
    @Column(name = "PROPERTY_VALUE")
    private String propertyValue;

    public CecoldoProperties() {
    }

    public CecoldoProperties(Integer propertyId) {
        this.propertyId = propertyId;
    }

    public CecoldoProperties(Integer propertyId, String propertyKey) {
        this.propertyId = propertyId;
        this.propertyKey = propertyKey;
    }

    public Integer getPropertyId() {
        return propertyId;
    }

    public void setPropertyId(Integer propertyId) {
        this.propertyId = propertyId;
    }

    public String getPropertyKey() {
        return propertyKey;
    }

    public void setPropertyKey(String propertyKey) {
        this.propertyKey = propertyKey;
    }

    public String getPropertyValue() {
        return propertyValue;
    }

    public void setPropertyValue(String propertyValue) {
        this.propertyValue = propertyValue;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (propertyId != null ? propertyId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CecoldoProperties)) {
            return false;
        }
        CecoldoProperties other = (CecoldoProperties) object;
        if ((this.propertyId == null && other.propertyId != null) || (this.propertyId != null && !this.propertyId.equals(other.propertyId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dimar.cecoldo.dictionary.bean.CecoldoProperties[propertyId=" + propertyId + "]";
    }

}
