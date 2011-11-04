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
@Table(name = "inv_ship_type")
@NamedQueries({@NamedQuery(name = "InvShipType.findById", query = "SELECT i FROM InvShipType i WHERE i.id = :id"), @NamedQuery(name = "InvShipType.findByShipType", query = "SELECT i FROM InvShipType i WHERE i.shipType = :shipType")})
public class InvShipType implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "Id", nullable = false)
    private String id;
    @Column(name = "ship_type")
    private String shipType;
    @OneToMany(mappedBy = "shipType")
    private Collection<InvShipName> invShipNameCollection;

    public InvShipType() {
    }

    public InvShipType(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getShipType() {
        return shipType;
    }

    public void setShipType(String shipType) {
        this.shipType = shipType;
    }

    public Collection<InvShipName> getInvShipNameCollection() {
        return invShipNameCollection;
    }

    public void setInvShipNameCollection(Collection<InvShipName> invShipNameCollection) {
        this.invShipNameCollection = invShipNameCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof InvShipType)) {
            return false;
        }
        InvShipType other = (InvShipType) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dimar.cecoldo.bean1.InvShipType[id=" + id + "]";
    }

}
