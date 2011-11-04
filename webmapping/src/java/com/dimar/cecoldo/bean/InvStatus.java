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
@Table(name = "inv_status")
@NamedQueries({@NamedQuery(name = "InvStatus.findByIdStatus", query = "SELECT i FROM InvStatus i WHERE i.idStatus = :idStatus"), @NamedQuery(name = "InvStatus.findByStatus", query = "SELECT i FROM InvStatus i WHERE i.status = :status")})
public class InvStatus implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "id_status", nullable = false)
    private Short idStatus;
    @Column(name = "status")
    private String status;
    @OneToMany(mappedBy = "idStatus")
    private Collection<InvProject> invProjectCollection;
    @OneToMany(mappedBy = "status")
    private Collection<InvCruiseInventory> invCruiseInventoryCollection;
    

    public InvStatus() {
    }

    public InvStatus(Short idStatus) {
        this.idStatus = idStatus;
    }

    public Short getIdStatus() {
        return idStatus;
    }

    public void setIdStatus(Short idStatus) {
        this.idStatus = idStatus;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idStatus != null ? idStatus.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof InvStatus)) {
            return false;
        }
        InvStatus other = (InvStatus) object;
        if ((this.idStatus == null && other.idStatus != null) || (this.idStatus != null && !this.idStatus.equals(other.idStatus))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dimar.cecoldo.bean1.InvStatus[idStatus=" + idStatus + "]";
    }

    public Collection<InvProject> getInvProjectCollection() {
        return invProjectCollection;
    }

    public void setInvProjectCollection(Collection<InvProject> invProjectCollection) {
        this.invProjectCollection = invProjectCollection;
    }

    public Collection<InvCruiseInventory> getInvCruiseInventoryCollection() {
        return invCruiseInventoryCollection;
    }

    public void setInvCruiseInventoryCollection(Collection<InvCruiseInventory> invCruiseInventoryCollection) {
        this.invCruiseInventoryCollection = invCruiseInventoryCollection;
    }

}
