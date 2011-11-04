/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.dimar.cecoldo.bean;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.Collection;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author user
 */
@Entity
@Table(name = "report_datasource")
@NamedQueries({@NamedQuery(name = "ReportDatasource.findByDatasourceId", query = "SELECT r FROM ReportDatasource r WHERE r.datasourceId = :datasourceId"), @NamedQuery(name = "ReportDatasource.findByName", query = "SELECT r FROM ReportDatasource r WHERE r.name = :name"), @NamedQuery(name = "ReportDatasource.findByDriver", query = "SELECT r FROM ReportDatasource r WHERE r.driver = :driver"), @NamedQuery(name = "ReportDatasource.findByUrl", query = "SELECT r FROM ReportDatasource r WHERE r.url = :url"), @NamedQuery(name = "ReportDatasource.findByUsername", query = "SELECT r FROM ReportDatasource r WHERE r.username = :username"), @NamedQuery(name = "ReportDatasource.findByPassword", query = "SELECT r FROM ReportDatasource r WHERE r.password = :password"), @NamedQuery(name = "ReportDatasource.findByMaxIdle", query = "SELECT r FROM ReportDatasource r WHERE r.maxIdle = :maxIdle"), @NamedQuery(name = "ReportDatasource.findByMaxActive", query = "SELECT r FROM ReportDatasource r WHERE r.maxActive = :maxActive"), @NamedQuery(name = "ReportDatasource.findByMaxWait", query = "SELECT r FROM ReportDatasource r WHERE r.maxWait = :maxWait"), @NamedQuery(name = "ReportDatasource.findByValidationQuery", query = "SELECT r FROM ReportDatasource r WHERE r.validationQuery = :validationQuery"), @NamedQuery(name = "ReportDatasource.findByJndi", query = "SELECT r FROM ReportDatasource r WHERE r.jndi = :jndi")})
public class ReportDatasource implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "DATASOURCE_ID", nullable = false)
    private Integer datasourceId;
    @Column(name = "NAME", nullable = false)
    private String name;
    @Column(name = "DRIVER")
    private String driver;
    @Column(name = "URL", nullable = false)
    private String url;
    @Column(name = "USERNAME")
    private String username;
    @Column(name = "PASSWORD")
    private String password;
    @Column(name = "MAX_IDLE")
    private Integer maxIdle;
    @Column(name = "MAX_ACTIVE")
    private Integer maxActive;
    @Column(name = "MAX_WAIT")
    private BigInteger maxWait;
    @Column(name = "VALIDATION_QUERY")
    private String validationQuery;
    @Column(name = "JNDI")
    private Boolean jndi;
    @OneToMany(mappedBy = "datasourceId")
    private Collection<ReportChart> reportChartCollection;
    @OneToMany(mappedBy = "datasourceId")
    private Collection<Report> reportCollection;

    public ReportDatasource() {
    }

    public ReportDatasource(Integer datasourceId) {
        this.datasourceId = datasourceId;
    }

    public ReportDatasource(Integer datasourceId, String name, String url) {
        this.datasourceId = datasourceId;
        this.name = name;
        this.url = url;
    }

    public Integer getDatasourceId() {
        return datasourceId;
    }

    public void setDatasourceId(Integer datasourceId) {
        this.datasourceId = datasourceId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDriver() {
        return driver;
    }

    public void setDriver(String driver) {
        this.driver = driver;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getMaxIdle() {
        return maxIdle;
    }

    public void setMaxIdle(Integer maxIdle) {
        this.maxIdle = maxIdle;
    }

    public Integer getMaxActive() {
        return maxActive;
    }

    public void setMaxActive(Integer maxActive) {
        this.maxActive = maxActive;
    }

    public BigInteger getMaxWait() {
        return maxWait;
    }

    public void setMaxWait(BigInteger maxWait) {
        this.maxWait = maxWait;
    }

    public String getValidationQuery() {
        return validationQuery;
    }

    public void setValidationQuery(String validationQuery) {
        this.validationQuery = validationQuery;
    }

    public Boolean getJndi() {
        return jndi;
    }

    public void setJndi(Boolean jndi) {
        this.jndi = jndi;
    }

    public Collection<ReportChart> getReportChartCollection() {
        return reportChartCollection;
    }

    public void setReportChartCollection(Collection<ReportChart> reportChartCollection) {
        this.reportChartCollection = reportChartCollection;
    }

    public Collection<Report> getReportCollection() {
        return reportCollection;
    }

    public void setReportCollection(Collection<Report> reportCollection) {
        this.reportCollection = reportCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (datasourceId != null ? datasourceId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ReportDatasource)) {
            return false;
        }
        ReportDatasource other = (ReportDatasource) object;
        if ((this.datasourceId == null && other.datasourceId != null) || (this.datasourceId != null && !this.datasourceId.equals(other.datasourceId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "org.webmapping.consultaPuntos.bean.ReportDatasource[datasourceId=" + datasourceId + "]";
    }

}
