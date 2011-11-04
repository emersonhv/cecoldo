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
@Table(name = "inv_status_indicators")
@NamedQueries({@NamedQuery(name = "InvStatusIndicators.findBySTStatus", query = "SELECT i FROM InvStatusIndicators i WHERE i.sTStatus = :sTStatus"), @NamedQuery(name = "InvStatusIndicators.findBySTDescription", query = "SELECT i FROM InvStatusIndicators i WHERE i.sTDescription = :sTDescription")})
public class InvStatusIndicators implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "STStatus", nullable = false)
    private String sTStatus;
    @Column(name = "STDescription")
    private String sTDescription;

    public InvStatusIndicators() {
    }

    public InvStatusIndicators(String sTStatus) {
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

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (sTStatus != null ? sTStatus.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof InvStatusIndicators)) {
            return false;
        }
        InvStatusIndicators other = (InvStatusIndicators) object;
        if ((this.sTStatus == null && other.sTStatus != null) || (this.sTStatus != null && !this.sTStatus.equals(other.sTStatus))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dimar.cecoldo.bean1.InvStatusIndicators[sTStatus=" + sTStatus + "]";
    }

}
