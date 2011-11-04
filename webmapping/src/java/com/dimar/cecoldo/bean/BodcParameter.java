/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.dimar.cecoldo.bean;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import org.hibernate.validator.Length;
import org.hibernate.validator.NotEmpty;
import org.hibernate.validator.NotNull;
import org.hibernate.validator.Pattern;
import org.hibernate.validator.Range;

/**
 *
 * @author user
 */
@Entity
@Table(name = "bodc_parameter")
@NamedQueries({@NamedQuery(name = "BodcParameter.findByCode", query = "SELECT b FROM BodcParameter b WHERE b.code = :code"), @NamedQuery(name = "BodcParameter.findByDummyVal", query = "SELECT b FROM BodcParameter b WHERE b.dummyVal = :dummyVal"), @NamedQuery(name = "BodcParameter.findByMinPermissVal", query = "SELECT b FROM BodcParameter b WHERE b.minPermissVal = :minPermissVal"), @NamedQuery(name = "BodcParameter.findByMaxPermissVal", query = "SELECT b FROM BodcParameter b WHERE b.maxPermissVal = :maxPermissVal"), @NamedQuery(name = "BodcParameter.findByBeforeDp", query = "SELECT b FROM BodcParameter b WHERE b.beforeDp = :beforeDp"), @NamedQuery(name = "BodcParameter.findByAfterDp", query = "SELECT b FROM BodcParameter b WHERE b.afterDp = :afterDp"), @NamedQuery(name = "BodcParameter.findBySigFig", query = "SELECT b FROM BodcParameter b WHERE b.sigFig = :sigFig"), @NamedQuery(name = "BodcParameter.findByShortTitle", query = "SELECT b FROM BodcParameter b WHERE b.shortTitle = :shortTitle"), @NamedQuery(name = "BodcParameter.findByRecordLock", query = "SELECT b FROM BodcParameter b WHERE b.recordLock = :recordLock"), @NamedQuery(name = "BodcParameter.findByBodcLegal", query = "SELECT b FROM BodcParameter b WHERE b.bodcLegal = :bodcLegal"), @NamedQuery(name = "BodcParameter.findByCreated", query = "SELECT b FROM BodcParameter b WHERE b.created = :created"), @NamedQuery(name = "BodcParameter.findByModified", query = "SELECT b FROM BodcParameter b WHERE b.modified = :modified")})
public class BodcParameter implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "CODE", nullable = false)
    private String code;
    @Column(name = "DUMMY_VAL")
    private Double dummyVal;
    @Column(name = "MIN_PERMISS_VAL")
    @NotNull
    @Range(min=-999999999, max=999999999, message="El valor no es válido")
    private Double minPermissVal;
    @Column(name = "MAX_PERMISS_VAL")
    @NotNull
    @Range(min=-999999999, max=999999999, message="El valor no es válido")
    private Double maxPermissVal;
    @Column(name = "BEFORE_DP")
    private Short beforeDp;
    @Column(name = "AFTER_DP")
    private Short afterDp;
    @Column(name = "SIG_FIG")
    private Short sigFig;
    @Column(name = "SHORT_TITLE")
    private String shortTitle;
    @Lob
    @Column(name = "FULL_TITLE")
    @NotEmpty
    @Pattern(regex = ".*[^\\s].*", message = "La cadena contiene solo espacios")
    @Length(min = 4, message = "El texto de descripción del título es muy corto")
    private String fullTitle;
    @Lob
    @Column(name = "DEFINITION")
    @NotEmpty
    @Pattern(regex = ".*[^\\s].*", message = "La cadena contiene solo espacios")
    @Length(min = 4, message = "El texto de descripción de la metodología es muy corto")
    private String definition;
    @Column(name = "RECORD_LOCK")
    private String recordLock;
    @Column(name = "BODC_LEGAL")
    private String bodcLegal;
    @Column(name = "CREATED")
    private String created;
    @Column(name = "MODIFIED")
    private String modified;
    @JoinColumn(name = "UNIT_CODE", referencedColumnName = "CODE")
    @ManyToOne(fetch=FetchType.LAZY)
    private BodcUnits unitCode;
    @JoinColumn(name = "GROUP_CODE", referencedColumnName = "CODE")
    @ManyToOne(fetch=FetchType.LAZY)
    private BodcParameterGroup groupCode;

    public BodcParameter() {
    }

    public BodcParameter(String code) {
        this.code = code;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Double getDummyVal() {
        return dummyVal;
    }

    public void setDummyVal(Double dummyVal) {
        this.dummyVal = dummyVal;
    }

    public Double getMinPermissVal() {
        return minPermissVal;
    }

    public void setMinPermissVal(Double minPermissVal) {
        this.minPermissVal = minPermissVal;
    }

    public Double getMaxPermissVal() {
        return maxPermissVal;
    }

    public void setMaxPermissVal(Double maxPermissVal) {
        this.maxPermissVal = maxPermissVal;
    }

    public Short getBeforeDp() {
        return beforeDp;
    }

    public void setBeforeDp(Short beforeDp) {
        this.beforeDp = beforeDp;
    }

    public Short getAfterDp() {
        return afterDp;
    }

    public void setAfterDp(Short afterDp) {
        this.afterDp = afterDp;
    }

    public Short getSigFig() {
        return sigFig;
    }

    public void setSigFig(Short sigFig) {
        this.sigFig = sigFig;
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

    public BodcUnits getUnitCode() {
        return unitCode;
    }

    public void setUnitCode(BodcUnits unitCode) {
        this.unitCode = unitCode;
    }

    public BodcParameterGroup getGroupCode() {
        return groupCode;
    }

    public void setGroupCode(BodcParameterGroup groupCode) {
        this.groupCode = groupCode;
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
        if (!(object instanceof BodcParameter)) {
            return false;
        }
        BodcParameter other = (BodcParameter) object;
        if ((this.code == null && other.code != null) || (this.code != null && !this.code.equals(other.code))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "org.webmapping.consultaPuntos.bean.BodcParameter[code=" + code + "]";
    }

}
