/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dimar.cecoldo.bean;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.CascadeType;
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
@Table(name = "regions")
@NamedQueries({@NamedQuery(name = "Regions.findById", query = "SELECT r FROM Regions r WHERE r.id = :id"), @NamedQuery(name = "Regions.findByWest", query = "SELECT r FROM Regions r WHERE r.west = :west"), @NamedQuery(name = "Regions.findBySouth", query = "SELECT r FROM Regions r WHERE r.south = :south"), @NamedQuery(name = "Regions.findByEast", query = "SELECT r FROM Regions r WHERE r.east = :east"), @NamedQuery(name = "Regions.findByNorth", query = "SELECT r FROM Regions r WHERE r.north = :north")})
public class Regions implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "id", nullable = false)
    private Short id;
    @Column(name = "west")
    private Double west;
    @Column(name = "south")
    private Double south;
    @Column(name = "east")
    private Double east;
    @Column(name = "north")
    private Double north;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "regions")
    private Collection<Regionsdes> regionsdesCollection;
    @OneToMany(mappedBy = "oceanArea")
    private Collection<InvCruiseInventory> invCruiseInventoryCollection;

    public Regions() {
    }

    public Regions(Short id) {
        this.id = id;
    }

    public Short getId() {
        return id;
    }

    public void setId(Short id) {
        this.id = id;
    }

    public Double getWest() {
        return west;
    }

    public void setWest(Double west) {
        this.west = west;
    }

    public Double getSouth() {
        return south;
    }

    public void setSouth(Double south) {
        this.south = south;
    }

    public Double getEast() {
        return east;
    }

    public void setEast(Double east) {
        this.east = east;
    }

    public Double getNorth() {
        return north;
    }

    public void setNorth(Double north) {
        this.north = north;
    }

    public Collection<Regionsdes> getRegionsdesCollection() {
        return regionsdesCollection;
    }

    public void setRegionsdesCollection(Collection<Regionsdes> regionsdesCollection) {
        this.regionsdesCollection = regionsdesCollection;
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
        if (!(object instanceof Regions)) {
            return false;
        }
        Regions other = (Regions) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dimar.cecoldo.bean.Regions[id=" + id + "]";
    }

    public Collection<InvCruiseInventory> getInvCruiseInventoryCollection() {
        return invCruiseInventoryCollection;
    }

    public void setInvCruiseInventoryCollection(Collection<InvCruiseInventory> invCruiseInventoryCollection) {
        this.invCruiseInventoryCollection = invCruiseInventoryCollection;
    }
}
