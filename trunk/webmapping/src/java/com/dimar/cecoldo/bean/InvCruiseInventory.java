/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.dimar.cecoldo.bean;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
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
 * @author user
 */
@Entity
@Table(name = "inv_cruise_inventory")
@NamedQueries({@NamedQuery(name = "InvCruiseInventory.findByIdCruise", query = "SELECT i FROM InvCruiseInventory i WHERE i.idCruise = :idCruise"), @NamedQuery(name = "InvCruiseInventory.findByYear", query = "SELECT i FROM InvCruiseInventory i WHERE i.year = :year"), @NamedQuery(name = "InvCruiseInventory.findByBeginDate", query = "SELECT i FROM InvCruiseInventory i WHERE i.beginDate = :beginDate"), @NamedQuery(name = "InvCruiseInventory.findByEndDate", query = "SELECT i FROM InvCruiseInventory i WHERE i.endDate = :endDate"), @NamedQuery(name = "InvCruiseInventory.findByShipName", query = "SELECT i FROM InvCruiseInventory i WHERE i.shipName = :shipName"), @NamedQuery(name = "InvCruiseInventory.findByCruiseName", query = "SELECT i FROM InvCruiseInventory i WHERE i.cruiseName = :cruiseName"), @NamedQuery(name = "InvCruiseInventory.findByCruiseObjetives", query = "SELECT i FROM InvCruiseInventory i WHERE i.cruiseObjetives = :cruiseObjetives"), @NamedQuery(name = "InvCruiseInventory.findByPortOfReturn", query = "SELECT i FROM InvCruiseInventory i WHERE i.portOfReturn = :portOfReturn"), @NamedQuery(name = "InvCruiseInventory.findByUriMetadata", query = "SELECT i FROM InvCruiseInventory i WHERE i.uriMetadata = :uriMetadata"), @NamedQuery(name = "InvCruiseInventory.findByUriProject", query = "SELECT i FROM InvCruiseInventory i WHERE i.uriProject = :uriProject"), @NamedQuery(name = "InvCruiseInventory.findByUriReport", query = "SELECT i FROM InvCruiseInventory i WHERE i.uriReport = :uriReport")})
public class InvCruiseInventory implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "id_cruise", nullable = false)
    private String idCruise;
    @Column(name = "year")
    private Short year;
    @Column(name = "begin_date")
    @Temporal(TemporalType.DATE)    
    private Date beginDate;
    @Column(name = "end_date")
    @Temporal(TemporalType.DATE)    
    private Date endDate;
    @JoinColumn(name = "ship_name", referencedColumnName = "id")
    @ManyToOne
    private InvShipName shipName;
    @Column(name = "cruise_name")
    private String cruiseName;
    @Column(name = "cruise_objetives")
    private String cruiseObjetives;
    @JoinColumns({@JoinColumn(name = "return_country_port", referencedColumnName = "Country"), @JoinColumn(name = "port_of_return", referencedColumnName = "Location")})
    @ManyToOne
    private UnlocodePort portOfReturn;
    @Column(name = "uri_metadata")
    private String uriMetadata;
    @Column(name = "uri_project")
    private String uriProject;
    @Column(name = "uri_report")
    private String uriReport;
    @JoinTable(name = "inv_laboratories_cruises", joinColumns = {@JoinColumn(name = "id_cruise", referencedColumnName = "id_cruise")}, inverseJoinColumns = {@JoinColumn(name = "id_laboratory", referencedColumnName = "id_lab")})
    @ManyToMany
    private Collection<InvLaboratories> idLaboratoryCollection;
    @JoinTable(name = "inv_chief_scientist_cruise", joinColumns = {@JoinColumn(name = "id_cruise", referencedColumnName = "id_cruise")}, inverseJoinColumns = {@JoinColumn(name = "id_chief_scientist", referencedColumnName = "Id")})
    @ManyToMany
    private Collection<InvChiefScientist> idChiefScientistCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "invCruiseInventory")
    private Collection<InvCruiseInstitutions> invCruiseInstitutionsCollection;
    @JoinColumn(name = "country", referencedColumnName = "pai_id")
    @ManyToOne
    private Paises0101 country;
    @JoinColumn(name = "status", referencedColumnName = "id_status")
    @ManyToOne
    private InvStatus status;
    @JoinColumn(name = "ocean_area", referencedColumnName = "id")
    @ManyToOne
    private Regions oceanArea;
    @JoinColumns({@JoinColumn(name = "countryPort", referencedColumnName = "Country"), @JoinColumn(name = "port_of_departure", referencedColumnName = "Location")})
    @ManyToOne
    private UnlocodePort unlocodePort;
    @JoinColumn(name = "id_project", referencedColumnName = "id_project")
    @ManyToOne
    private InvProject idProject;
    @JoinTable(name = "inv_cruise_bodc_category", joinColumns = {@JoinColumn(name = "id_cruise", referencedColumnName = "id_cruise")}, inverseJoinColumns = {@JoinColumn(name = "category_code", referencedColumnName = "CODE")})
    @ManyToMany
    private Collection<BodcCategory> categoryCodeCollection;   
    public InvCruiseInventory() {
    }

    public InvCruiseInventory(String idCruise) {
        this.idCruise = idCruise;
    }

    public String getIdCruise() {
        return idCruise;
    }

    public void setIdCruise(String idCruise) {
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


    public String getUriMetadata() {
        return uriMetadata;
    }

    public void setUriMetadata(String uriMetadata) {
        this.uriMetadata = uriMetadata;
    }

    public String getUriProject() {
        return uriProject;
    }

    public void setUriProject(String uriProject) {
        this.uriProject = uriProject;
    }

    public String getUriReport() {
        return uriReport;
    }

    public void setUriReport(String uriReport) {
        this.uriReport = uriReport;
    }

    public Collection<InvLaboratories> getIdLaboratoryCollection() {
        return idLaboratoryCollection;
    }

    public void setIdLaboratoryCollection(Collection<InvLaboratories> idLaboratoryCollection) {
        this.idLaboratoryCollection = idLaboratoryCollection;
    }

    public Collection<InvChiefScientist> getIdChiefScientistCollection() {
        return idChiefScientistCollection;
    }

    public void setIdChiefScientistCollection(Collection<InvChiefScientist> idChiefScientistCollection) {
        this.idChiefScientistCollection = idChiefScientistCollection;
    }

    public Collection<InvCruiseInstitutions> getInvCruiseInstitutionsCollection() {
        return invCruiseInstitutionsCollection;
    }

    public void setInvCruiseInstitutionsCollection(Collection<InvCruiseInstitutions> invCruiseInstitutionsCollection) {
        this.invCruiseInstitutionsCollection = invCruiseInstitutionsCollection;
    }

    public Paises0101 getCountry() {
        return country;
    }

    public void setCountry(Paises0101 country) {
        this.country = country;
    }

    public InvStatus getStatus() {
        return status;
    }

    public void setStatus(InvStatus status) {
        this.status = status;
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
        return "com.dimar.cecoldo.bean1.InvCruiseInventory[idCruise=" + idCruise + "]";
    }

    public InvShipName getShipName() {
        return shipName;
    }

    public void setShipName(InvShipName shipName) {
        this.shipName = shipName;
    }

    public InvProject getIdProject() {
        return idProject;
    }

    public void setIdProject(InvProject idProject) {
        this.idProject = idProject;
    }

    public UnlocodePort getPortOfReturn() {
        return portOfReturn;
    }

    public void setPortOfReturn(UnlocodePort portOfReturn) {
        this.portOfReturn = portOfReturn;
    }

    public Collection<BodcCategory> getCategoryCodeCollection() {
        return categoryCodeCollection;
    }

    public void setCategoryCodeCollection(Collection<BodcCategory> categoryCodeCollection) {
        this.categoryCodeCollection = categoryCodeCollection;
    }

}
