/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dimar.cecoldo.bean;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author Administrador
 */
@Entity
@Table(name = "inv_cruise_inventory")
@NamedQueries({
    @NamedQuery(name = "InvCruiseInventory.findAll", query = "SELECT i FROM InvCruiseInventory i"),
    @NamedQuery(name = "InvCruiseInventory.findByIdCruise", query = "SELECT i FROM InvCruiseInventory i WHERE i.idCruise = :idCruise"),
    @NamedQuery(name = "InvCruiseInventory.findByYear", query = "SELECT i FROM InvCruiseInventory i WHERE i.year = :year"),
    @NamedQuery(name = "InvCruiseInventory.findByBeginDate", query = "SELECT i FROM InvCruiseInventory i WHERE i.beginDate = :beginDate"),
    @NamedQuery(name = "InvCruiseInventory.findByEndDate", query = "SELECT i FROM InvCruiseInventory i WHERE i.endDate = :endDate"),
    @NamedQuery(name = "InvCruiseInventory.findByCruiseName", query = "SELECT i FROM InvCruiseInventory i WHERE i.cruiseName = :cruiseName"),
    @NamedQuery(name = "InvCruiseInventory.findByCruiseObjetives", query = "SELECT i FROM InvCruiseInventory i WHERE i.cruiseObjetives = :cruiseObjetives"),
    @NamedQuery(name = "InvCruiseInventory.findByStatus", query = "SELECT i FROM InvCruiseInventory i WHERE i.status = :status"),
    @NamedQuery(name = "InvCruiseInventory.findByUriReport", query = "SELECT i FROM InvCruiseInventory i WHERE i.uriReport = :uriReport")})
public class InvCruiseInventory implements Serializable {

    @Column(name = "begin_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date beginDate;
    @Column(name = "end_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date endDate;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "min_lat")
    private Double minLat;
    @Column(name = "max_lat")
    private Double maxLat;
    @Column(name = "min_lon")
    private Double minLon;
    @Column(name = "max_lon")
    private Double maxLon;
    @Column(name = "metadata_title")
    private String metadataTitle;
    @Column(name = "metadata_url")
    private String metadataUrl;
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_cruise")
    private Integer idCruise;
    @Column(name = "year")
    private Short year;
    @Column(name = "cruise_name")
    private String cruiseName;
    @Column(name = "cruise_objetives")
    private String cruiseObjetives;
    @Column(name = "status")
    private String status;
    @Column(name = "uri_report")
    private String uriReport;
    @ManyToMany(mappedBy = "invCruiseInventoryCollection")
    private Collection<InvProject> invProjectCollection;
    @JoinTable(name = "inv_cruise_metadata", joinColumns = {
        @JoinColumn(name = "id_cruise", referencedColumnName = "id_cruise")}, inverseJoinColumns = {
        @JoinColumn(name = "id_metadata", referencedColumnName = "id_metadata")})
    @ManyToMany
    private Collection<InvMetadata> invMetadataCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "invCruiseInventory")
    private Collection<InvCruiseBodcCategory> invCruiseBodcCategoryCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "invCruiseInventory")
    private Collection<InvCruiseInstitutions> invCruiseInstitutionsCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "invCruiseInventory")
    private Collection<InvLaboratoriesCruises> invLaboratoriesCruisesCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "invCruiseInventory")
    private Collection<InvChiefScientistCruise> invChiefScientistCruiseCollection;
    @JoinColumn(name = "id_report", referencedColumnName = "id_report")
    @ManyToOne
    private InvReport idReport;
    @JoinColumn(name = "country", referencedColumnName = "pai_id")
    @ManyToOne
    private Paises0101 country;
    @JoinColumn(name = "ocean_area", referencedColumnName = "id")
    @ManyToOne
    private Regions oceanArea;
    @JoinColumns({
        @JoinColumn(name = "countryPort", referencedColumnName = "Country"),
        @JoinColumn(name = "port_of_departure", referencedColumnName = "Location")})
    @ManyToOne
    private UnlocodePort unlocodePort;
    @JoinColumns({
        @JoinColumn(name = "return_country_port", referencedColumnName = "Country"),
        @JoinColumn(name = "port_of_return", referencedColumnName = "Location")})
    @ManyToOne
    private UnlocodePort unlocodePort1;
    @JoinColumn(name = "ship_name", referencedColumnName = "Id")
    @ManyToOne
    private InvShipName shipName;

    public InvCruiseInventory() {
    }

    public InvCruiseInventory(Integer idCruise) {
        this.idCruise = idCruise;
    }

    public Integer getIdCruise() {
        return idCruise;
    }

    public void setIdCruise(Integer idCruise) {
        this.idCruise = idCruise;
    }

    public Short getYear() {
        return year;
    }

    public void setYear(Short year) {
        this.year = year;
    }

    public Date getBeginDate() {
        return beginDate;
    }

    public void setBeginDate(Date beginDate) {
        this.beginDate = beginDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getCruiseName() {
        return cruiseName;
    }

    public void setCruiseName(String cruiseName) {
        this.cruiseName = cruiseName;
    }

    public String getCruiseObjetives() {
        return cruiseObjetives;
    }

    public void setCruiseObjetives(String cruiseObjetives) {
        this.cruiseObjetives = cruiseObjetives;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getUriReport() {
        return uriReport;
    }

    public void setUriReport(String uriReport) {
        this.uriReport = uriReport;
    }

    public Collection<InvProject> getInvProjectCollection() {
        return invProjectCollection;
    }

    public void setInvProjectCollection(Collection<InvProject> invProjectCollection) {
        this.invProjectCollection = invProjectCollection;
    }

    public Collection<InvMetadata> getInvMetadataCollection() {
        return invMetadataCollection;
    }

    public void setInvMetadataCollection(Collection<InvMetadata> invMetadataCollection) {
        this.invMetadataCollection = invMetadataCollection;
    }

    public Collection<InvCruiseBodcCategory> getInvCruiseBodcCategoryCollection() {
        return invCruiseBodcCategoryCollection;
    }

    public void setInvCruiseBodcCategoryCollection(Collection<InvCruiseBodcCategory> invCruiseBodcCategoryCollection) {
        this.invCruiseBodcCategoryCollection = invCruiseBodcCategoryCollection;
    }

    public Collection<InvCruiseInstitutions> getInvCruiseInstitutionsCollection() {
        return invCruiseInstitutionsCollection;
    }

    public void setInvCruiseInstitutionsCollection(Collection<InvCruiseInstitutions> invCruiseInstitutionsCollection) {
        this.invCruiseInstitutionsCollection = invCruiseInstitutionsCollection;
    }

    public Collection<InvLaboratoriesCruises> getInvLaboratoriesCruisesCollection() {
        return invLaboratoriesCruisesCollection;
    }

    public void setInvLaboratoriesCruisesCollection(Collection<InvLaboratoriesCruises> invLaboratoriesCruisesCollection) {
        this.invLaboratoriesCruisesCollection = invLaboratoriesCruisesCollection;
    }

    public Collection<InvChiefScientistCruise> getInvChiefScientistCruiseCollection() {
        return invChiefScientistCruiseCollection;
    }

    public void setInvChiefScientistCruiseCollection(Collection<InvChiefScientistCruise> invChiefScientistCruiseCollection) {
        this.invChiefScientistCruiseCollection = invChiefScientistCruiseCollection;
    }

    public InvReport getIdReport() {
        return idReport;
    }

    public void setIdReport(InvReport idReport) {
        this.idReport = idReport;
    }

    public Paises0101 getCountry() {
        return country;
    }

    public void setCountry(Paises0101 country) {
        this.country = country;
    }

    public Regions getOceanArea() {
        return oceanArea;
    }

    public void setOceanArea(Regions oceanArea) {
        this.oceanArea = oceanArea;
    }

    public UnlocodePort getUnlocodePort() {
        return unlocodePort;
    }

    public void setUnlocodePort(UnlocodePort unlocodePort) {
        this.unlocodePort = unlocodePort;
    }

    public UnlocodePort getUnlocodePort1() {
        return unlocodePort1;
    }

    public void setUnlocodePort1(UnlocodePort unlocodePort1) {
        this.unlocodePort1 = unlocodePort1;
    }

    public InvShipName getShipName() {
        return shipName;
    }

    public void setShipName(InvShipName shipName) {
        this.shipName = shipName;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idCruise != null ? idCruise.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof InvCruiseInventory)) {
            return false;
        }
        InvCruiseInventory other = (InvCruiseInventory) object;
        if ((this.idCruise == null && other.idCruise != null) || (this.idCruise != null && !this.idCruise.equals(other.idCruise))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dimar.cecoldo.bean.InvCruiseInventory[ idCruise=" + idCruise + " ]";
    }

    public String getMetadataTitle() {
        return metadataTitle;
    }

    public void setMetadataTitle(String metadataTitle) {
        this.metadataTitle = metadataTitle;
    }

    public String getMetadataUrl() {
        return metadataUrl;
    }

    public void setMetadataUrl(String metadataUrl) {
        this.metadataUrl = metadataUrl;
    }

    public Double getMinLat() {
        return minLat;
    }

    public void setMinLat(Double minLat) {
        this.minLat = minLat;
    }

    public Double getMaxLat() {
        return maxLat;
    }

    public void setMaxLat(Double maxLat) {
        this.maxLat = maxLat;
    }

    public Double getMinLon() {
        return minLon;
    }

    public void setMinLon(Double minLon) {
        this.minLon = minLon;
    }

    public Double getMaxLon() {
        return maxLon;
    }

    public void setMaxLon(Double maxLon) {
        this.maxLon = maxLon;
    }
}
