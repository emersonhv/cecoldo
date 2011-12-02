/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dimar.cecoldo.bean;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author Administrador
 */
@Entity
@Table(name = "gen_cities")
@NamedQueries({
    @NamedQuery(name = "GenCities.findAll", query = "SELECT g FROM GenCities g")})
public class GenCities implements Serializable {
    @OneToMany(mappedBy = "codCity")
    private List<InvInstitutions> invInstitutionsList;
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "locId")
    private Integer locId;
    @Column(name = "region")
    private String region;
    @Column(name = "city")
    private String city;
    @Column(name = "postalcode")
    private String postalcode;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "latitude")
    private Double latitude;
    @Column(name = "longitude")
    private Double longitude;
    @Column(name = "metro_code")
    private Integer metroCode;
    @Column(name = "area_code")
    private Integer areaCode;
    @JoinColumn(name = "country", referencedColumnName = "pai_id")
    @ManyToOne
    private Paises0101 country;
    @OneToMany(mappedBy = "codCity")
    private Collection<InvInstitutions> invInstitutionsCollection;

    public GenCities() {
    }

    public GenCities(Integer locId) {
        this.locId = locId;
    }

    public Integer getLocId() {
        return locId;
    }

    public void setLocId(Integer locId) {
        this.locId = locId;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getPostalcode() {
        return postalcode;
    }

    public void setPostalcode(String postalcode) {
        this.postalcode = postalcode;
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

    public Integer getMetroCode() {
        return metroCode;
    }

    public void setMetroCode(Integer metroCode) {
        this.metroCode = metroCode;
    }

    public Integer getAreaCode() {
        return areaCode;
    }

    public void setAreaCode(Integer areaCode) {
        this.areaCode = areaCode;
    }

    public Paises0101 getCountry() {
        return country;
    }

    public void setCountry(Paises0101 country) {
        this.country = country;
    }

    public Collection<InvInstitutions> getInvInstitutionsCollection() {
        return invInstitutionsCollection;
    }

    public void setInvInstitutionsCollection(Collection<InvInstitutions> invInstitutionsCollection) {
        this.invInstitutionsCollection = invInstitutionsCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (locId != null ? locId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof GenCities)) {
            return false;
        }
        GenCities other = (GenCities) object;
        if ((this.locId == null && other.locId != null) || (this.locId != null && !this.locId.equals(other.locId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dimar.cecoldo.bean.GenCities[ locId=" + locId + " ]";
    }

    public List<InvInstitutions> getInvInstitutionsList() {
        return invInstitutionsList;
    }

    public void setInvInstitutionsList(List<InvInstitutions> invInstitutionsList) {
        this.invInstitutionsList = invInstitutionsList;
    }
    
}
