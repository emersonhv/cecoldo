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
import javax.persistence.Table;

/**
 *
 * @author user
 */
@Entity
@Table(name = "report_user")
@NamedQueries({@NamedQuery(name = "ReportUser.findByReportuserId", query = "SELECT r FROM ReportUser r WHERE r.reportuserId = :reportuserId"), @NamedQuery(name = "ReportUser.findByName", query = "SELECT r FROM ReportUser r WHERE r.name = :name"), @NamedQuery(name = "ReportUser.findByPassword", query = "SELECT r FROM ReportUser r WHERE r.password = :password"), @NamedQuery(name = "ReportUser.findByExternalId", query = "SELECT r FROM ReportUser r WHERE r.externalId = :externalId"), @NamedQuery(name = "ReportUser.findByEmailAddress", query = "SELECT r FROM ReportUser r WHERE r.emailAddress = :emailAddress"), @NamedQuery(name = "ReportUser.findByPdfExportType", query = "SELECT r FROM ReportUser r WHERE r.pdfExportType = :pdfExportType"), @NamedQuery(name = "ReportUser.findByState", query = "SELECT r FROM ReportUser r WHERE r.state = :state"), @NamedQuery(name = "ReportUser.findByInstitution", query = "SELECT r FROM ReportUser r WHERE r.institution = :institution"), @NamedQuery(name = "ReportUser.findByAcronim", query = "SELECT r FROM ReportUser r WHERE r.acronim = :acronim"), @NamedQuery(name = "ReportUser.findByLider", query = "SELECT r FROM ReportUser r WHERE r.lider = :lider"), @NamedQuery(name = "ReportUser.findByCargoLider", query = "SELECT r FROM ReportUser r WHERE r.cargoLider = :cargoLider"), @NamedQuery(name = "ReportUser.findByCountry", query = "SELECT r FROM ReportUser r WHERE r.country = :country"), @NamedQuery(name = "ReportUser.findByDepto", query = "SELECT r FROM ReportUser r WHERE r.depto = :depto"), @NamedQuery(name = "ReportUser.findByCity", query = "SELECT r FROM ReportUser r WHERE r.city = :city"), @NamedQuery(name = "ReportUser.findByAddress", query = "SELECT r FROM ReportUser r WHERE r.address = :address"), @NamedQuery(name = "ReportUser.findByPhone", query = "SELECT r FROM ReportUser r WHERE r.phone = :phone"), @NamedQuery(name = "ReportUser.findByFax", query = "SELECT r FROM ReportUser r WHERE r.fax = :fax"), @NamedQuery(name = "ReportUser.findByWeb", query = "SELECT r FROM ReportUser r WHERE r.web = :web"), @NamedQuery(name = "ReportUser.findByPrivatePolitics", query = "SELECT r FROM ReportUser r WHERE r.privatePolitics = :privatePolitics"), @NamedQuery(name = "ReportUser.findByExchangePolitics", query = "SELECT r FROM ReportUser r WHERE r.exchangePolitics = :exchangePolitics")})
public class ReportUser implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "REPORTUSER_ID", nullable = false)
    private Integer reportuserId;
    @Column(name = "NAME", nullable = false)
    private String name;
    @Column(name = "PASSWORD", nullable = false)
    private String password;
    @Column(name = "EXTERNAL_ID")
    private String externalId;
    @Column(name = "EMAIL_ADDRESS")
    private String emailAddress;
    @Column(name = "PDF_EXPORT_TYPE", nullable = false)
    private int pdfExportType;
    @Column(name = "STATE")
    private String state;
    @Column(name = "institution")
    private String institution;
    @Column(name = "acronim")
    private String acronim;
    @Column(name = "lider")
    private String lider;
    @Column(name = "cargo_lider")
    private String cargoLider;
    @Column(name = "country")
    private Integer country;
    @Column(name = "depto")
    private Integer depto;
    @Column(name = "city")
    private Integer city;
    @Column(name = "address")
    private String address;
    @Column(name = "phone")
    private String phone;
    @Column(name = "fax")
    private String fax;
    @Column(name = "web")
    private String web;
    @Column(name = "privatePolitics")
    private Boolean privatePolitics;
    @Column(name = "exchangePolitics")
    private Boolean exchangePolitics;
    @JoinColumn(name = "DEFAULT_REPORT_ID", referencedColumnName = "REPORT_ID")
    @ManyToOne
    private Report defaultReportId;

    public ReportUser() {
    }

    public ReportUser(Integer reportuserId) {
        this.reportuserId = reportuserId;
    }

    public ReportUser(Integer reportuserId, String name, String password, int pdfExportType) {
        this.reportuserId = reportuserId;
        this.name = name;
        this.password = password;
        this.pdfExportType = pdfExportType;
    }

    public Integer getReportuserId() {
        return reportuserId;
    }

    public void setReportuserId(Integer reportuserId) {
        this.reportuserId = reportuserId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getExternalId() {
        return externalId;
    }

    public void setExternalId(String externalId) {
        this.externalId = externalId;
    }

    public String getEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

    public int getPdfExportType() {
        return pdfExportType;
    }

    public void setPdfExportType(int pdfExportType) {
        this.pdfExportType = pdfExportType;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getInstitution() {
        return institution;
    }

    public void setInstitution(String institution) {
        this.institution = institution;
    }

    public String getAcronim() {
        return acronim;
    }

    public void setAcronim(String acronim) {
        this.acronim = acronim;
    }

    public String getLider() {
        return lider;
    }

    public void setLider(String lider) {
        this.lider = lider;
    }

    public String getCargoLider() {
        return cargoLider;
    }

    public void setCargoLider(String cargoLider) {
        this.cargoLider = cargoLider;
    }

    public Integer getCountry() {
        return country;
    }

    public void setCountry(Integer country) {
        this.country = country;
    }

    public Integer getDepto() {
        return depto;
    }

    public void setDepto(Integer depto) {
        this.depto = depto;
    }

    public Integer getCity() {
        return city;
    }

    public void setCity(Integer city) {
        this.city = city;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getFax() {
        return fax;
    }

    public void setFax(String fax) {
        this.fax = fax;
    }

    public String getWeb() {
        return web;
    }

    public void setWeb(String web) {
        this.web = web;
    }

    public Boolean getPrivatePolitics() {
        return privatePolitics;
    }

    public void setPrivatePolitics(Boolean privatePolitics) {
        this.privatePolitics = privatePolitics;
    }

    public Boolean getExchangePolitics() {
        return exchangePolitics;
    }

    public void setExchangePolitics(Boolean exchangePolitics) {
        this.exchangePolitics = exchangePolitics;
    }

    public Report getDefaultReportId() {
        return defaultReportId;
    }

    public void setDefaultReportId(Report defaultReportId) {
        this.defaultReportId = defaultReportId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (reportuserId != null ? reportuserId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ReportUser)) {
            return false;
        }
        ReportUser other = (ReportUser) object;
        if ((this.reportuserId == null && other.reportuserId != null) || (this.reportuserId != null && !this.reportuserId.equals(other.reportuserId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "org.webmapping.consultaPuntos.bean.ReportUser[reportuserId=" + reportuserId + "]";
    }

}
