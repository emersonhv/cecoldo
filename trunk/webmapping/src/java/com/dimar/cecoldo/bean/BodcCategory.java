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
import javax.persistence.ManyToMany;
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
@Table(name = "bodc_category")
@NamedQueries({@NamedQuery(name = "BodcCategory.findByCode", query = "SELECT b FROM BodcCategory b WHERE b.code = :code"), @NamedQuery(name = "BodcCategory.findByTitle", query = "SELECT b FROM BodcCategory b WHERE b.title = :title"), @NamedQuery(name = "BodcCategory.findByDocref", query = "SELECT b FROM BodcCategory b WHERE b.docref = :docref"), @NamedQuery(name = "BodcCategory.findByRecordLock", query = "SELECT b FROM BodcCategory b WHERE b.recordLock = :recordLock"), @NamedQuery(name = "BodcCategory.findByCreated", query = "SELECT b FROM BodcCategory b WHERE b.created = :created"), @NamedQuery(name = "BodcCategory.findByModified", query = "SELECT b FROM BodcCategory b WHERE b.modified = :modified")})
public class BodcCategory implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "CODE", nullable = false)
    private String code;
    @Column(name = "TITLE")
    private String title;
    @Column(name = "DOCREF")
    private Integer docref;
    @Column(name = "RECORD_LOCK")
    private String recordLock;
    @Column(name = "CREATED")
    private String created;
    @Column(name = "MODIFIED")
    private String modified;
    @ManyToMany(mappedBy = "categoryCodeCollection")
    private Collection<ReportGroup> groupIdCollection;   
    @JoinColumn(name = "DISCIPLINE", referencedColumnName = "id_discipline")
    @ManyToOne
    private InvDiscipline discipline;    
    @ManyToMany(mappedBy = "categoryCodeCollection")
    private Collection<InvCruiseInventory> idCruiseCollection;    

    public BodcCategory() {
    }

    public BodcCategory(String code) {
        this.code = code;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getDocref() {
        return docref;
    }

    public void setDocref(Integer docref) {
        this.docref = docref;
    }

    public String getRecordLock() {
        return recordLock;
    }

    public void setRecordLock(String recordLock) {
        this.recordLock = recordLock;
    }

    public String getCreated() {
        return created;
    }

    public void setCreated(String created) {
        this.created = created;
    }

    public String getModified() {
        return modified;
    }

    public void setModified(String modified) {
        this.modified = modified;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (code != null ? code.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof BodcCategory)) {
            return false;
        }
        BodcCategory other = (BodcCategory) object;
        if ((this.code == null && other.code != null) || (this.code != null && !this.code.equals(other.code))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dimar.cecoldo.bean1.BodcCategory[code=" + code + "]";
    }

    public Collection<ReportGroup> getGroupIdCollection() {
        return groupIdCollection;
    }

    public void setGroupIdCollection(Collection<ReportGroup> groupIdCollection) {
        this.groupIdCollection = groupIdCollection;
    }

    public InvDiscipline getDiscipline() {
        return discipline;
    }

    public void setDiscipline(InvDiscipline discipline) {
        this.discipline = discipline;
    }

    public Collection<InvCruiseInventory> getIdCruiseCollection() {
        return idCruiseCollection;
    }

    public void setIdCruiseCollection(Collection<InvCruiseInventory> idCruiseCollection) {
        this.idCruiseCollection = idCruiseCollection;
    }

}
