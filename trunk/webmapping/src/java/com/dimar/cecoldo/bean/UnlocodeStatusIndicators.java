/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.dimar.cecoldo.bean;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author user
 */
@Entity
@Table(name = "unlocode_status_indicators")
@NamedQueries({@NamedQuery(name = "UnlocodeStatusIndicators.findBySTStatus", query = "SELECT u FROM UnlocodeStatusIndicators u WHERE u.sTStatus = :sTStatus"), @NamedQuery(name = "UnlocodeStatusIndicators.findBySTDescription", query = "SELECT u FROM UnlocodeStatusIndicators u WHERE u.sTDescription = :sTDescription")})
public class UnlocodeStatusIndicators implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "STStatus", nullable = false)
    private String sTStatus;
    @Column(name = "STDescription")
    private String sTDescription;
    @OneToMany(mappedBy = "status")
    private Collection<UnlocodePort> unlocodePortCollection;

    public UnlocodeStatusIndicators() {
    }

    public UnlocodeStatusIndicators(String sTStatus) {
        this.sTStatus = sTStatus;
    }

    public String getSTStatus() {
        return sTStatus;
    }

    public void setSTStatus(String sTStatus) {
        this.sTStatus = sTStatus;
    }

    public String getSTDescription() {
        return sTDescription;
    }

    public void setSTDescription(String sTDescription) {
        this.sTDescription = sTDescription;
    }

    public Collection<UnlocodePort> getUnlocodePortCollection() {
        return unlocodePortCollection;
    }

    public void setUnlocodePortCollection(Collection<UnlocodePort> unlocodePortCollection) {
        this.unlocodePortCollection = unlocodePortCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (sTStatus != null ? sTStatus.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof UnlocodeStatusIndicators)) {
            return false;
        }
        UnlocodeStatusIndicators other = (UnlocodeStatusIndicators) object;
        if ((this.sTStatus == null && other.sTStatus != null) || (this.sTStatus != null && !this.sTStatus.equals(other.sTStatus))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dimar.cecoldo.bean1.UnlocodeStatusIndicators[sTStatus=" + sTStatus + "]";
    }

}
