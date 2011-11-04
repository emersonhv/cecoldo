/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.dimar.cecoldo.bean;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author user
 */
@Entity
@Table(name = "unlocode_port")
@NamedQueries({@NamedQuery(name = "UnlocodePort.findByCountry", query = "SELECT u FROM UnlocodePort u WHERE u.unlocodePortPK.country = :country"), @NamedQuery(name = "UnlocodePort.findByLocation", query = "SELECT u FROM UnlocodePort u WHERE u.unlocodePortPK.location = :location"), @NamedQuery(name = "UnlocodePort.findByName", query = "SELECT u FROM UnlocodePort u WHERE u.name = :name"), @NamedQuery(name = "UnlocodePort.findByNameWoDiacritics", query = "SELECT u FROM UnlocodePort u WHERE u.nameWoDiacritics = :nameWoDiacritics"), @NamedQuery(name = "UnlocodePort.findBySubdivision", query = "SELECT u FROM UnlocodePort u WHERE u.subdivision = :subdivision"), @NamedQuery(name = "UnlocodePort.findByDate", query = "SELECT u FROM UnlocodePort u WHERE u.date = :date"), @NamedQuery(name = "UnlocodePort.findByFunction", query = "SELECT u FROM UnlocodePort u WHERE u.function = :function"), @NamedQuery(name = "UnlocodePort.findByIata", query = "SELECT u FROM UnlocodePort u WHERE u.iata = :iata"), @NamedQuery(name = "UnlocodePort.findByLatitude", query = "SELECT u FROM UnlocodePort u WHERE u.latitude = :latitude"), @NamedQuery(name = "UnlocodePort.findByLongitude", query = "SELECT u FROM UnlocodePort u WHERE u.longitude = :longitude"), @NamedQuery(name = "UnlocodePort.findByRemarks", query = "SELECT u FROM UnlocodePort u WHERE u.remarks = :remarks")})
public class UnlocodePort implements Serializable {
    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected UnlocodePortPK unlocodePortPK;
    @Column(name = "Name")
    private String name;
    @Column(name = "NameWoDiacritics")
    private String nameWoDiacritics;
    @Column(name = "Subdivision")
    private String subdivision;
    @Column(name = "Date")
    private String date;
    @Column(name = "Function1")
    private String function;
    @Column(name = "IATA")
    private String iata;
    @Column(name = "Latitude")
    private Double latitude;
    @Column(name = "Longitude")
    private Double longitude;
    @Column(name = "Remarks")
    private String remarks;
    @OneToMany(mappedBy = "unlocodePort")
    private Collection<InvShipName> invShipNameCollection;
    @OneToMany(mappedBy = "unlocodePort")
    private Collection<InvCruiseInventory> invCruiseInventoryCollection;
    @JoinColumn(name = "Status", referencedColumnName = "STStatus")
    @ManyToOne
    private UnlocodeStatusIndicators status;
    @JoinColumn(name = "Country", referencedColumnName = "pai_id", insertable = false, updatable = false)
    @ManyToOne
    private Paises0101 paises0101;

    public UnlocodePort() {
    }

    public UnlocodePort(UnlocodePortPK unlocodePortPK) {
        this.unlocodePortPK = unlocodePortPK;
    }

    public UnlocodePort(String country, String location) {
        this.unlocodePortPK = new UnlocodePortPK(country, location);
    }

    public UnlocodePortPK getUnlocodePortPK() {
        return unlocodePortPK;
    }

    public void setUnlocodePortPK(UnlocodePortPK unlocodePortPK) {
        this.unlocodePortPK = unlocodePortPK;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNameWoDiacritics() {
        return nameWoDiacritics;
    }

    public void setNameWoDiacritics(String nameWoDiacritics) {
        this.nameWoDiacritics = nameWoDiacritics;
    }

    public String getSubdivision() {
        return subdivision;
    }

    public void setSubdivision(String subdivision) {
        this.subdivision = subdivision;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getFunction() {
        return function;
    }

    public void setFunction(String function) {
        this.function = function;
    }

    public String getIata() {
        return iata;
    }

    public void setIata(String iata) {
        this.iata = iata;
    }

    public Double getLatitude() {
        return latitude;
    }

    public void setLatitude(Double latitude) {
        this.latitude = latitude;
    }

    public Double getLongitude() {
        return longitude;
    }

    public void setLongitude(Double longitude) {
        this.longitude = longitude;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public Collection<InvShipName> getInvShipNameCollection() {
        return invShipNameCollection;
    }

    public void setInvShipNameCollection(Collection<InvShipName> invShipNameCollection) {
        this.invShipNameCollection = invShipNameCollection;
    }

    public Collection<InvCruiseInventory> getInvCruiseInventoryCollection() {
        return invCruiseInventoryCollection;
    }

    public void setInvCruiseInventoryCollection(Collection<InvCruiseInventory> invCruiseInventoryCollection) {
        this.invCruiseInventoryCollection = invCruiseInventoryCollection;
    }

    public UnlocodeStatusIndicators getStatus() {
        return status;
    }

    public void setStatus(UnlocodeStatusIndicators status) {
        this.status = status;
    }

    public Paises0101 getPaises0101() {
        return paises0101;
    }

    public void setPaises0101(Paises0101 paises0101) {
        this.paises0101 = paises0101;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (unlocodePortPK != null ? unlocodePortPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof UnlocodePort)) {
            return false;
        }
        UnlocodePort other = (UnlocodePort) object;
        if ((this.unlocodePortPK == null && other.unlocodePortPK != null) || (this.unlocodePortPK != null && !this.unlocodePortPK.equals(other.unlocodePortPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dimar.cecoldo.bean1.UnlocodePort[unlocodePortPK=" + unlocodePortPK + "]";
    }

}
