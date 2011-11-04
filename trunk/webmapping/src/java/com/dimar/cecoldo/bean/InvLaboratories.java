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
@Table(name = "inv_laboratories")
@NamedQueries({@NamedQuery(name = "InvLaboratories.findByIdLab", query = "SELECT i FROM InvLaboratories i WHERE i.idLab = :idLab"), @NamedQuery(name = "InvLaboratories.findByNameLab", query = "SELECT i FROM InvLaboratories i WHERE i.nameLab = :nameLab"), @NamedQuery(name = "InvLaboratories.findByCreditedSince", query = "SELECT i FROM InvLaboratories i WHERE i.creditedSince = :creditedSince"), @NamedQuery(name = "InvLaboratories.findByCreditedProcedures", query = "SELECT i FROM InvLaboratories i WHERE i.creditedProcedures = :creditedProcedures"), @NamedQuery(name = "InvLaboratories.findByContact", query = "SELECT i FROM InvLaboratories i WHERE i.contact = :contact"), @NamedQuery(name = "InvLaboratories.findByContactJob", query = "SELECT i FROM InvLaboratories i WHERE i.contactJob = :contactJob"), @NamedQuery(name = "InvLaboratories.findByAddress", query = "SELECT i FROM InvLaboratories i WHERE i.address = :address"), @NamedQuery(name = "InvLaboratories.findByPhone", query = "SELECT i FROM InvLaboratories i WHERE i.phone = :phone"), @NamedQuery(name = "InvLaboratories.findByFax", query = "SELECT i FROM InvLaboratories i WHERE i.fax = :fax"), @NamedQuery(name = "InvLaboratories.findByAa", query = "SELECT i FROM InvLaboratories i WHERE i.aa = :aa"), @NamedQuery(name = "InvLaboratories.findByWebpage", query = "SELECT i FROM InvLaboratories i WHERE i.webpage = :webpage"), @NamedQuery(name = "InvLaboratories.findByEmail1", query = "SELECT i FROM InvLaboratories i WHERE i.email1 = :email1"), @NamedQuery(name = "InvLaboratories.findByEmail2", query = "SELECT i FROM InvLaboratories i WHERE i.email2 = :email2")})
public class InvLaboratories implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "id_lab", nullable = false)
    private Integer idLab;
    @Column(name = "name_lab")
    private String nameLab;
    @Column(name = "credited_since")
    private Short creditedSince;
    @Column(name = "credited_procedures")
    private String creditedProcedures;
    @Column(name = "contact")
    private String contact;
    @Column(name = "contact_job")
    private String contactJob;
    @Column(name = "address")
    private String address;
    @Column(name = "phone")
    private String phone;
    @Column(name = "fax")
    private String fax;
    @Column(name = "AA")
    private Short aa;
    @Column(name = "Web_page")
    private String webpage;
    @Column(name = "Email_1")
    private String email1;
    @Column(name = "Email_2")
    private String email2;
    @ManyToMany(mappedBy = "idLaboratoryCollection")
    private Collection<InvCruiseInventory> idCruiseCollection;
    @JoinColumn(name = "country", referencedColumnName = "pai_id")
    @ManyToOne
    private Paises0101 country;
    @JoinColumn(name = "institution_lab", referencedColumnName = "Id_institution")
    @ManyToOne
    private InvInstitutions institutionLab;

    public InvLaboratories() {
    }

    public InvLaboratories(Integer idLab) {
        this.idLab = idLab;
    }

    public Integer getIdLab() {
        return idLab;
    }

    public void setIdLab(Integer idLab) {
        this.idLab = idLab;
    }

    public String getNameLab() {
        return nameLab;
    }

    public void setNameLab(String nameLab) {
        this.nameLab = nameLab;
    }

    public Short getCreditedSince() {
        return creditedSince;
    }

    public void setCreditedSince(Short creditedSince) {
        this.creditedSince = creditedSince;
    }

    public String getCreditedProcedures() {
        return creditedProcedures;
    }

    public void setCreditedProcedures(String creditedProcedures) {
        this.creditedProcedures = creditedProcedures;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getContactJob() {
        return contactJob;
    }

    public void setContactJob(String contactJob) {
        this.contactJob = contactJob;
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

    public Short getAa() {
        return aa;
    }

    public void setAa(Short aa) {
        this.aa = aa;
    }

    public String getWebpage() {
        return webpage;
    }

    public void setWebpage(String webpage) {
        this.webpage = webpage;
    }

    public String getEmail1() {
        return email1;
    }

    public void setEmail1(String email1) {
        this.email1 = email1;
    }

    public String getEmail2() {
        return email2;
    }

    public void setEmail2(String email2) {
        this.email2 = email2;
    }

    public Collection<InvCruiseInventory> getIdCruiseCollection() {
        return idCruiseCollection;
    }

    public void setIdCruiseCollection(Collection<InvCruiseInventory> idCruiseCollection) {
        this.idCruiseCollection = idCruiseCollection;
    }

    public Paises0101 getCountry() {
        return country;
    }

    public void setCountry(Paises0101 country) {
        this.country = country;
    }

    public InvInstitutions getInstitutionLab() {
        return institutionLab;
    }

    public void setInstitutionLab(InvInstitutions institutionLab) {
        this.institutionLab = institutionLab;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idLab != null ? idLab.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof InvLaboratories)) {
            return false;
        }
        InvLaboratories other = (InvLaboratories) object;
        if ((this.idLab == null && other.idLab != null) || (this.idLab != null && !this.idLab.equals(other.idLab))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dimar.cecoldo.bean1.InvLaboratories[idLab=" + idLab + "]";
    }

}
