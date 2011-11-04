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
@Table(name = "bodc_parameter_group")
@NamedQueries({@NamedQuery(name = "BodcParameterGroup.findByCode", query = "SELECT b FROM BodcParameterGroup b WHERE b.code = :code"), @NamedQuery(name = "BodcParameterGroup.findByShortTitle", query = "SELECT b FROM BodcParameterGroup b WHERE b.shortTitle = :shortTitle"), @NamedQuery(name = "BodcParameterGroup.findByFullTitle", query = "SELECT b FROM BodcParameterGroup b WHERE b.fullTitle = :fullTitle"), @NamedQuery(name = "BodcParameterGroup.findByRecordLock", query = "SELECT b FROM BodcParameterGroup b WHERE b.recordLock = :recordLock"), @NamedQuery(name = "BodcParameterGroup.findByBodcLegal", query = "SELECT b FROM BodcParameterGroup b WHERE b.bodcLegal = :bodcLegal"), @NamedQuery(name = "BodcParameterGroup.findByCreated", query = "SELECT b FROM BodcParameterGroup b WHERE b.created = :created"), @NamedQuery(name = "BodcParameterGroup.findByModified", query = "SELECT b FROM BodcParameterGroup b WHERE b.modified = :modified")})
public class BodcParameterGroup implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "CODE", nullable = false)
    private String code;
    @Column(name = "SHORT_TITLE")
    private String shortTitle;
    @Column(name = "FULL_TITLE")
    private String fullTitle;
    @Lob
    @Column(name = "DEFINITION")
    private String definition;
    @Column(name = "RECORD_LOCK")
    private String recordLock;
    @Column(name = "BODC_LEGAL")
    private String bodcLegal;
    @Column(name = "CREATED")
    private String created;
    @Column(name = "MODIFIED")
    private String modified;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "bodcParameterGroup")
    private Collection<BodcCategoryLink> bodcCategoryLinkCollection;
    @OneToMany(mappedBy = "groupCode")
    private Collection<BodcParameter> bodcParameterCollection;

    public BodcParameterGroup() {
    }

    public BodcParameterGroup(String code) {
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

    public String getDefinition() {
        return definition;
    }

    public void setDefinition(String definition) {
        this.definition = definition;
    }

    public String getRecordLock() {
        return recordLock;
    }

    public void setRecordLock(String recordLock) {
        this.recordLock = recordLock;
    }

    public String getBodcLegal() {
        return bodcLegal;
    }

    public void setBodcLegal(String bodcLegal) {
        this.bodcLegal = bodcLegal;
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

    public Collection<BodcCategoryLink> getBodcCategoryLinkCollection() {
        return bodcCategoryLinkCollection;
    }

    public void setBodcCategoryLinkCollection(Collection<BodcCategoryLink> bodcCategoryLinkCollection) {
        this.bodcCategoryLinkCollection = bodcCategoryLinkCollection;
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
        if (!(object instanceof BodcParameterGroup)) {
            return false;
        }
        BodcParameterGroup other = (BodcParameterGroup) object;
        if ((this.code == null && other.code != null) || (this.code != null && !this.code.equals(other.code))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "org.webmapping.consultaPuntos.bean.BodcParameterGroup[code=" + code + "]";
    }

}
