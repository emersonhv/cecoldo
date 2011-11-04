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
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.Lob;
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
@Table(name = "inv_ship_name")
@NamedQueries({@NamedQuery(name = "InvShipName.findById", query = "SELECT i FROM InvShipName i WHERE i.id = :id"), @NamedQuery(name = "InvShipName.findByShipName", query = "SELECT i FROM InvShipName i WHERE i.shipName = :shipName"), @NamedQuery(name = "InvShipName.findByShipPicture", query = "SELECT i FROM InvShipName i WHERE i.shipPicture = :shipPicture"), @NamedQuery(name = "InvShipName.findByConstructionDate", query = "SELECT i FROM InvShipName i WHERE i.constructionDate = :constructionDate"), @NamedQuery(name = "InvShipName.findByReceptionDate", query = "SELECT i FROM InvShipName i WHERE i.receptionDate = :receptionDate"), @NamedQuery(name = "InvShipName.findByTotalLength", query = "SELECT i FROM InvShipName i WHERE i.totalLength = :totalLength"), @NamedQuery(name = "InvShipName.findByMaxSleeve", query = "SELECT i FROM InvShipName i WHERE i.maxSleeve = :maxSleeve"), @NamedQuery(name = "InvShipName.findByAverageOpenwork", query = "SELECT i FROM InvShipName i WHERE i.averageOpenwork = :averageOpenwork"), @NamedQuery(name = "InvShipName.findByMaxSpeed", query = "SELECT i FROM InvShipName i WHERE i.maxSpeed = :maxSpeed"), @NamedQuery(name = "InvShipName.findByAutonomy", query = "SELECT i FROM InvShipName i WHERE i.autonomy = :autonomy"), @NamedQuery(name = "InvShipName.findByDisplacement", query = "SELECT i FROM InvShipName i WHERE i.displacement = :displacement"), @NamedQuery(name = "InvShipName.findByLodgingCapacity", query = "SELECT i FROM InvShipName i WHERE i.lodgingCapacity = :lodgingCapacity")})
public class InvShipName implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "Id", nullable = false)
    private Short id;
    @Column(name = "ship_name")
    private String shipName;
    @Column(name = "ship_picture")
    private String shipPicture;
    @Column(name = "construction_date")
    private Double constructionDate;
    @Column(name = "reception_date")
    private Double receptionDate;
    @Column(name = "total_length")
    private String totalLength;
    @Column(name = "max_sleeve")
    private String maxSleeve;
    @Column(name = "average_openwork")
    private String averageOpenwork;
    @Column(name = "max_speed")
    private String maxSpeed;
    @Column(name = "autonomy")
    private String autonomy;
    @Column(name = "displacement")
    private String displacement;
    @Column(name = "ship_uri")
    private String shipUri;
    @Column(name = "lodging_capacity")
    private String lodgingCapacity;
    @Lob
    @Column(name = "description")
    private String description;
    @JoinColumns({@JoinColumn(name = "country_port", referencedColumnName = "Country"), @JoinColumn(name = "moored_port", referencedColumnName = "Location")})
    @ManyToOne(fetch=FetchType.LAZY)
    private UnlocodePort unlocodePort;
    @JoinColumn(name = "construction_country", referencedColumnName = "pai_id")
    @ManyToOne(fetch=FetchType.LAZY)
    private Paises0101 constructionCountry;
    @JoinColumn(name = "reception_country", referencedColumnName = "pai_id")
    @ManyToOne(fetch=FetchType.LAZY)
    private Paises0101 receptionCountry;
    @JoinColumn(name = "responsable_institution", referencedColumnName = "Id_institution")
    @ManyToOne(fetch=FetchType.LAZY)
    private InvInstitutions responsableInstitution;
    @JoinColumn(name = "ship_type", referencedColumnName = "Id")
    @ManyToOne(fetch=FetchType.LAZY)
    private InvShipType shipType;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "shipName")
    private Collection<InvCruiseInventory> invCruiseInventoryCollection;
    public InvShipName() {
    }

    public InvShipName(Short id) {
        this.id = id;
    }

    public Short getId() {
        return id;
    }

    public void setId(Short id) {
        this.id = id;
    }

    public String getShipName() {
        return shipName;
    }

    public void setShipName(String shipName) {
        this.shipName = shipName;
    }

    public String getShipPicture() {
        return shipPicture;
    }

    public void setShipPicture(String shipPicture) {
        this.shipPicture = shipPicture;
    }

    public Double getConstructionDate() {
        return constructionDate;
    }

    public void setConstructionDate(Double constructionDate) {
        this.constructionDate = constructionDate;
    }

    public Double getReceptionDate() {
        return receptionDate;
    }

    public void setReceptionDate(Double receptionDate) {
        this.receptionDate = receptionDate;
    }

    public String getTotalLength() {
        return totalLength;
    }

    public void setTotalLength(String totalLength) {
        this.totalLength = totalLength;
    }

    public String getMaxSleeve() {
        return maxSleeve;
    }

    public void setMaxSleeve(String maxSleeve) {
        this.maxSleeve = maxSleeve;
    }

    public String getAverageOpenwork() {
        return averageOpenwork;
    }

    public void setAverageOpenwork(String averageOpenwork) {
        this.averageOpenwork = averageOpenwork;
    }

    public String getMaxSpeed() {
        return maxSpeed;
    }

    public void setMaxSpeed(String maxSpeed) {
        this.maxSpeed = maxSpeed;
    }

    public String getAutonomy() {
        return autonomy;
    }

    public void setAutonomy(String autonomy) {
        this.autonomy = autonomy;
    }

    public String getDisplacement() {
        return displacement;
    }

    public void setDisplacement(String displacement) {
        this.displacement = displacement;
    }

    public String getLodgingCapacity() {
        return lodgingCapacity;
    }

    public void setLodgingCapacity(String lodgingCapacity) {
        this.lodgingCapacity = lodgingCapacity;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public UnlocodePort getUnlocodePort() {
        return unlocodePort;
    }

    public void setUnlocodePort(UnlocodePort unlocodePort) {
        this.unlocodePort = unlocodePort;
    }

    public Paises0101 getConstructionCountry() {
        return constructionCountry;
    }

    public void setConstructionCountry(Paises0101 constructionCountry) {
        this.constructionCountry = constructionCountry;
    }

    public Paises0101 getReceptionCountry() {
        return receptionCountry;
    }

    public void setReceptionCountry(Paises0101 receptionCountry) {
        this.receptionCountry = receptionCountry;
    }

    public InvInstitutions getResponsableInstitution() {
        return responsableInstitution;
    }

    public void setResponsableInstitution(InvInstitutions responsableInstitution) {
        this.responsableInstitution = responsableInstitution;
    }

    public InvShipType getShipType() {
        return shipType;
    }

    public void setShipType(InvShipType shipType) {
        this.shipType = shipType;
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
        if (!(object instanceof InvShipName)) {
            return false;
        }
        InvShipName other = (InvShipName) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dimar.cecoldo.bean1.InvShipName[id=" + id + "]";
    }

    public Collection<InvCruiseInventory> getInvCruiseInventoryCollection() {
        return invCruiseInventoryCollection;
    }

    public void setInvCruiseInventoryCollection(Collection<InvCruiseInventory> invCruiseInventoryCollection) {
        this.invCruiseInventoryCollection = invCruiseInventoryCollection;
    }

    public String getShipUri() {
        return shipUri;
    }

    public void setShipUri(String shipUri) {
        this.shipUri = shipUri;
    }

}
