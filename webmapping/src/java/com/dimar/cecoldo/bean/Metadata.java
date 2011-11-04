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
import javax.persistence.JoinColumn;
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
@Table(name = "metadata")
@NamedQueries({@NamedQuery(name = "Metadata.findById", query = "SELECT m FROM Metadata m WHERE m.id = :id"), @NamedQuery(name = "Metadata.findByUuid", query = "SELECT m FROM Metadata m WHERE m.uuid = :uuid"), @NamedQuery(name = "Metadata.findBySchemaId", query = "SELECT m FROM Metadata m WHERE m.schemaId = :schemaId"), @NamedQuery(name = "Metadata.findByIsTemplate", query = "SELECT m FROM Metadata m WHERE m.isTemplate = :isTemplate"), @NamedQuery(name = "Metadata.findByIsHarvested", query = "SELECT m FROM Metadata m WHERE m.isHarvested = :isHarvested"), @NamedQuery(name = "Metadata.findByCreateDate", query = "SELECT m FROM Metadata m WHERE m.createDate = :createDate"), @NamedQuery(name = "Metadata.findByChangeDate", query = "SELECT m FROM Metadata m WHERE m.changeDate = :changeDate"), @NamedQuery(name = "Metadata.findBySource", query = "SELECT m FROM Metadata m WHERE m.source = :source"), @NamedQuery(name = "Metadata.findByTitle", query = "SELECT m FROM Metadata m WHERE m.title = :title"), @NamedQuery(name = "Metadata.findByRoot", query = "SELECT m FROM Metadata m WHERE m.root = :root"), @NamedQuery(name = "Metadata.findByHarvestUuid", query = "SELECT m FROM Metadata m WHERE m.harvestUuid = :harvestUuid"), @NamedQuery(name = "Metadata.findByHarvestUri", query = "SELECT m FROM Metadata m WHERE m.harvestUri = :harvestUri"), @NamedQuery(name = "Metadata.findByRating", query = "SELECT m FROM Metadata m WHERE m.rating = :rating"), @NamedQuery(name = "Metadata.findByPopularity", query = "SELECT m FROM Metadata m WHERE m.popularity = :popularity")})
public class Metadata implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "id", nullable = false)
    private Integer id;
    @Column(name = "uuid", nullable = false)
    private String uuid;
    @Column(name = "schemaId", nullable = false)
    private String schemaId;
    @Column(name = "isTemplate", nullable = false)
    private char isTemplate;
    @Column(name = "isHarvested", nullable = false)
    private char isHarvested;
    @Column(name = "createDate", nullable = false)
    private String createDate;
    @Column(name = "changeDate", nullable = false)
    private String changeDate;
    @Lob
    @Column(name = "data", nullable = false)
    private String data;
    @Column(name = "source", nullable = false)
    private String source;
    @Column(name = "title")
    private String title;
    @Column(name = "root")
    private String root;
    @Column(name = "harvestUuid")
    private String harvestUuid;
    @Column(name = "harvestUri")
    private String harvestUri;
    @Column(name = "rating", nullable = false)
    private int rating;
    @Column(name = "popularity", nullable = false)
    private int popularity;
    @OneToMany(mappedBy = "idMetadata")
    private Collection<ArchivoDatos> archivoDatosCollection;
    @JoinColumn(name = "owner", referencedColumnName = "id")
    @ManyToOne
    private Users owner;
    @JoinColumn(name = "groupOwner", referencedColumnName = "id")
    @ManyToOne
    private Groups groupOwner;

    public Metadata() {
    }

    public Metadata(Integer id) {
        this.id = id;
    }

    public Metadata(Integer id, String uuid, String schemaId, char isTemplate, char isHarvested, String createDate, String changeDate, String data, String source, int rating, int popularity) {
        this.id = id;
        this.uuid = uuid;
        this.schemaId = schemaId;
        this.isTemplate = isTemplate;
        this.isHarvested = isHarvested;
        this.createDate = createDate;
        this.changeDate = changeDate;
        this.data = data;
        this.source = source;
        this.rating = rating;
        this.popularity = popularity;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public String getSchemaId() {
        return schemaId;
    }

    public void setSchemaId(String schemaId) {
        this.schemaId = schemaId;
    }

    public char getIsTemplate() {
        return isTemplate;
    }

    public void setIsTemplate(char isTemplate) {
        this.isTemplate = isTemplate;
    }

    public char getIsHarvested() {
        return isHarvested;
    }

    public void setIsHarvested(char isHarvested) {
        this.isHarvested = isHarvested;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public String getChangeDate() {
        return changeDate;
    }

    public void setChangeDate(String changeDate) {
        this.changeDate = changeDate;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getRoot() {
        return root;
    }

    public void setRoot(String root) {
        this.root = root;
    }

    public String getHarvestUuid() {
        return harvestUuid;
    }

    public void setHarvestUuid(String harvestUuid) {
        this.harvestUuid = harvestUuid;
    }

    public String getHarvestUri() {
        return harvestUri;
    }

    public void setHarvestUri(String harvestUri) {
        this.harvestUri = harvestUri;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public int getPopularity() {
        return popularity;
    }

    public void setPopularity(int popularity) {
        this.popularity = popularity;
    }

    public Collection<ArchivoDatos> getArchivoDatosCollection() {
        return archivoDatosCollection;
    }

    public void setArchivoDatosCollection(Collection<ArchivoDatos> archivoDatosCollection) {
        this.archivoDatosCollection = archivoDatosCollection;
    }

    public Users getOwner() {
        return owner;
    }

    public void setOwner(Users owner) {
        this.owner = owner;
    }

    public Groups getGroupOwner() {
        return groupOwner;
    }

    public void setGroupOwner(Groups groupOwner) {
        this.groupOwner = groupOwner;
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
        if (!(object instanceof Metadata)) {
            return false;
        }
        Metadata other = (Metadata) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "org.webmapping.consultaPuntos.bean.Metadata[id=" + id + "]";
    }

}
