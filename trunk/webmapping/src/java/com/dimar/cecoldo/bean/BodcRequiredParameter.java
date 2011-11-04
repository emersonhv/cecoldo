/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dimar.cecoldo.bean;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author user
 */
@Entity
@Table(name = "bodc_required_parameter")
@NamedQueries({@NamedQuery(name = "BodcRequiredParameter.findByIdParameter", query = "SELECT b FROM BodcRequiredParameter b WHERE b.idParameter = :idParameter"), @NamedQuery(name = "BodcRequiredParameter.findByGroupCode", query = "SELECT b FROM BodcRequiredParameter b WHERE b.groupCode = :groupCode"), @NamedQuery(name = "BodcRequiredParameter.findByUnitCode", query = "SELECT b FROM BodcRequiredParameter b WHERE b.unitCode = :unitCode"), @NamedQuery(name = "BodcRequiredParameter.findByCategoryCode", query = "SELECT b FROM BodcRequiredParameter b WHERE b.categoryCode = :categoryCode"), @NamedQuery(name = "BodcRequiredParameter.findByMinPermissValue", query = "SELECT b FROM BodcRequiredParameter b WHERE b.minPermissValue = :minPermissValue"), @NamedQuery(name = "BodcRequiredParameter.findByMaxPermissVal", query = "SELECT b FROM BodcRequiredParameter b WHERE b.maxPermissVal = :maxPermissVal")})
public class BodcRequiredParameter implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_parameter", nullable = false)
    private Integer idParameter;
    @Column(name = "group_code")
    private String groupCode;
    @Lob
    @Column(name = "group_description")
    private String groupDescription;
    @Column(name = "unit_code")
    private String unitCode;
    @Lob
    @Column(name = "unit_description")
    private String unitDescription;
    @Lob
    @Column(name = "definition", nullable = false)
    private String definition;
    @Column(name = "category_code")
    private String categoryCode;
    @Column(name = "min_permiss_value")
    private Double minPermissValue;
    @Column(name = "max_permiss_val")
    private Double maxPermissVal;
    @JoinColumn(name = "id_solicitud", referencedColumnName = "id_solicitud")
    @ManyToOne
    private SolicitudParametros idSolicitud;
    @Column(name = "full_title")
    private String fullTitle;
    public BodcRequiredParameter() {
    }

    public BodcRequiredParameter(Integer idParameter) {
        this.idParameter = idParameter;
    }

    public BodcRequiredParameter(Integer idParameter, String definition) {
        this.idParameter = idParameter;
        this.definition = definition;
    }

    public Integer getIdParameter() {
        return idParameter;
    }

    public void setIdParameter(Integer idParameter) {
        this.idParameter = idParameter;
    }

    public String getGroupCode() {
        return groupCode;
    }

    public void setGroupCode(String groupCode) {
        this.groupCode = groupCode;
    }

    public String getGroupDescription() {
        return groupDescription;
    }

    public void setGroupDescription(String groupDescription) {
        this.groupDescription = groupDescription;
    }

    public String getUnitCode() {
        return unitCode;
    }

    public void setUnitCode(String unitCode) {
        this.unitCode = unitCode;
    }

    public String getUnitDescription() {
        return unitDescription;
    }

    public void setUnitDescription(String unitDescription) {
        this.unitDescription = unitDescription;
    }

    public String getDefinition() {
        return definition;
    }

    public void setDefinition(String definition) {
        this.definition = definition;
    }

    public String getCategoryCode() {
        return categoryCode;
    }

    public void setCategoryCode(String categoryCode) {
        this.categoryCode = categoryCode;
    }

    public Double getMinPermissValue() {
        return minPermissValue;
    }

    public void setMinPermissValue(Double minPermissValue) {
        this.minPermissValue = minPermissValue;
    }

    public Double getMaxPermissVal() {
        return maxPermissVal;
    }

    public void setMaxPermissVal(Double maxPermissVal) {
        this.maxPermissVal = maxPermissVal;
    }

    public SolicitudParametros getIdSolicitud() {
        return idSolicitud;
    }

    public void setIdSolicitud(SolicitudParametros idSolicitud) {
        this.idSolicitud = idSolicitud;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idParameter != null ? idParameter.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof BodcRequiredParameter)) {
            return false;
        }
        BodcRequiredParameter other = (BodcRequiredParameter) object;
        if ((this.idParameter == null && other.idParameter != null) || (this.idParameter != null && !this.idParameter.equals(other.idParameter))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dimar.cecoldo.dictionary.bean.test.BodcRequiredParameter[idParameter=" + idParameter + "]";
    }

    public String getFullTitle() {
        return fullTitle;
    }

    public void setFullTitle(String fullTitle) {
        this.fullTitle = fullTitle;
    }
}
