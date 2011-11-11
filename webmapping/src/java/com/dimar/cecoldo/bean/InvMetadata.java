/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dimar.cecoldo.bean;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author Administrador
 */
@Entity
@Table(name = "inv_metadata")
@NamedQueries({
    @NamedQuery(name = "InvMetadata.findAll", query = "SELECT i FROM InvMetadata i"),
    @NamedQuery(name = "InvMetadata.findByIdMetadata", query = "SELECT i FROM InvMetadata i WHERE i.idMetadata = :idMetadata"),
    @NamedQuery(name = "InvMetadata.findByTitle", query = "SELECT i FROM InvMetadata i WHERE i.title = :title"),
    @NamedQuery(name = "InvMetadata.findByDescription", query = "SELECT i FROM InvMetadata i WHERE i.description = :description"),
    @NamedQuery(name = "InvMetadata.findByUri", query = "SELECT i FROM InvMetadata i WHERE i.uri = :uri")})
public class InvMetadata implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_metadata")
    private Integer idMetadata;
    @Column(name = "title")
    private String title;
    @Column(name = "description")
    private String description;
    @Column(name = "uri")
    private String uri;
    @ManyToMany(mappedBy = "invMetadataCollection")
    private Collection<InvCruiseInventory> invCruiseInventoryCollection;

    public InvMetadata() {
    }

    public InvMetadata(Integer idMetadata) {
        this.idMetadata = idMetadata;
    }

    public Integer getIdMetadata() {
        return idMetadata;
    }

    public void setIdMetadata(Integer idMetadata) {
        this.idMetadata = idMetadata;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getUri() {
        return uri;
    }

    public void setUri(String uri) {
        this.uri = uri;
    }

    public Collection<InvCruiseInventory> getInvCruiseInventoryCollection() {
        return invCruiseInventoryCollection;
    }

    public void setInvCruiseInventoryCollection(Collection<InvCruiseInventory> invCruiseInventoryCollection) {
        this.invCruiseInventoryCollection = invCruiseInventoryCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idMetadata != null ? idMetadata.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof InvMetadata)) {
            return false;
        }
        InvMetadata other = (InvMetadata) object;
        if ((this.idMetadata == null && other.idMetadata != null) || (this.idMetadata != null && !this.idMetadata.equals(other.idMetadata))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dimar.cecoldo.bean.InvMetadata[ idMetadata=" + idMetadata + " ]";
    }
    
}
