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
public class UnlocodePortPK implements Serializable {
    @Column(name = "Country", nullable = false)
    private String country;
    @Column(name = "Location", nullable = false)
    private String location;

    public UnlocodePortPK() {
    }

    public UnlocodePortPK(String country, String location) {
        this.country = country;
        this.location = location;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (country != null ? country.hashCode() : 0);
        hash += (location != null ? location.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof UnlocodePortPK)) {
            return false;
        }
        UnlocodePortPK other = (UnlocodePortPK) object;
        if ((this.country == null && other.country != null) || (this.country != null && !this.country.equals(other.country))) {
            return false;
        }
        if ((this.location == null && other.location != null) || (this.location != null && !this.location.equals(other.location))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dimar.cecoldo.bean1.UnlocodePortPK[country=" + country + ", location=" + location + "]";
    }

}
