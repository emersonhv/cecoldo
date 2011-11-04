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
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author user
 */
@Entity
@Table(name = "bodc_units")
@NamedQueries({@NamedQuery(name = "BodcUnits.findByCode", query = "SELECT b FROM BodcUnits b WHERE b.code = :code"), @NamedQuery(name = "BodcUnits.findByShortTitle", query = "SELECT b FROM BodcUnits b WHERE b.shortTitle = :shortTitle"), @NamedQuery(name = "BodcUnits.findByFullTitle", query = "SELECT b FROM BodcUnits b WHERE b.fullTitle = :fullTitle"), @NamedQuery(name = "BodcUnits.findByRecordLock", query = "SELECT b FROM BodcUnits b WHERE b.recordLock = :recordLock"), @NamedQuery(name = "BodcUnits.findByCreated", query = "SELECT b FROM BodcUnits b WHERE b.created = :created"), @NamedQuery(name = "BodcUnits.findByModified", query = "SELECT b FROM BodcUnits b WHERE b.modified = :modified")})
public class BodcUnits implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "CODE", nullable = false)
    private String code;
    @Column(name = "SHORT_TITLE")
    private String shortTitle;
    @Column(name = "FULL_TITLE")
    private String fullTitle;
    @Lob
    @Column(name = "COMMENTS")
    private String comments;
    @Column(name = "RECORD_LOCK")
    private String recordLock;
    @Column(name = "CREATED")
    private String created;
    @Column(name = "MODIFIED")
    private String modified;
    @OneToMany(mappedBy = "unitCode")
    private Collection<BodcParameter> bodcParameterCollection;

    public BodcUnits() {
    }

    public BodcUnits(String code) {
        this.code = code;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getShortTitle() {
        return shortTitle;
    }

    public void setShortTitle(String shortTitle) {
        this.shortTitle = shortTitle;
    }

    public String getFullTitle() {
        return fullTitle;
    }

    public void setFullTitle(String fullTitle) {
        this.fullTitle = fullTitle;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
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

    public Collection<BodcParameter> getBodcParameterCollection() {
        return bodcParameterCollection;
    }

    public void setBodcParameterCollection(Collection<BodcParameter> bodcParameterCollection) {
        this.bodcParameterCollection = bodcParameterCollection;
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
        if (!(object instanceof BodcUnits)) {
            return false;
        }
        BodcUnits other = (BodcUnits) object;
        if ((this.code == null && other.code != null) || (this.code != null && !this.code.equals(other.code))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "org.webmapping.consultaPuntos.bean.BodcUnits[code=" + code + "]";
    }

}
