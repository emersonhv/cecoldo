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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author Administrador
 */
@Entity
@Table(name = "inv_report")
@NamedQueries({
    @NamedQuery(name = "InvReport.findAll", query = "SELECT i FROM InvReport i"),
    @NamedQuery(name = "InvReport.findByIdReport", query = "SELECT i FROM InvReport i WHERE i.idReport = :idReport"),
    @NamedQuery(name = "InvReport.findByTitle", query = "SELECT i FROM InvReport i WHERE i.title = :title"),
    @NamedQuery(name = "InvReport.findByUri", query = "SELECT i FROM InvReport i WHERE i.uri = :uri"),
    @NamedQuery(name = "InvReport.findByDescription", query = "SELECT i FROM InvReport i WHERE i.description = :description")})
public class InvReport implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_report")
    private Integer idReport;
    @Column(name = "title")
    private String title;
    @Column(name = "uri")
    private String uri;
    @Column(name = "description")
    private String description;
    @OneToMany(mappedBy = "idReport")
    private Collection<InvCruiseInventory> invCruiseInventoryCollection;

    public InvReport() {
    }

    public InvReport(Integer idReport) {
        this.idReport = idReport;
    }

    public Integer getIdReport() {
        return idReport;
    }

    public void setIdReport(Integer idReport) {
        this.idReport = idReport;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getUri() {
        return uri;
    }

    public void setUri(String uri) {
        this.uri = uri;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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
        hash += (idReport != null ? idReport.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof InvReport)) {
            return false;
        }
        InvReport other = (InvReport) object;
        if ((this.idReport == null && other.idReport != null) || (this.idReport != null && !this.idReport.equals(other.idReport))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dimar.cecoldo.bean.InvReport[ idReport=" + idReport + " ]";
    }
    
}
