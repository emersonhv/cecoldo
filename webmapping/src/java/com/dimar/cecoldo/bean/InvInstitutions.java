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
import javax.persistence.JoinColumn;
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
@Table(name = "inv_institutions")
@NamedQueries({@NamedQuery(name = "InvInstitutions.findByIdinstitution", query = "SELECT i FROM InvInstitutions i WHERE i.idinstitution = :idinstitution"), @NamedQuery(name = "InvInstitutions.findByInstitution", query = "SELECT i FROM InvInstitutions i WHERE i.institution = :institution"), @NamedQuery(name = "InvInstitutions.findByAbbreviation", query = "SELECT i FROM InvInstitutions i WHERE i.abbreviation = :abbreviation"), @NamedQuery(name = "InvInstitutions.findByContact", query = "SELECT i FROM InvInstitutions i WHERE i.contact = :contact"), @NamedQuery(name = "InvInstitutions.findByContactJob", query = "SELECT i FROM InvInstitutions i WHERE i.contactJob = :contactJob"), @NamedQuery(name = "InvInstitutions.findByAddress", query = "SELECT i FROM InvInstitutions i WHERE i.address = :address"), @NamedQuery(name = "InvInstitutions.findByPhone", query = "SELECT i FROM InvInstitutions i WHERE i.phone = :phone"), @NamedQuery(name = "InvInstitutions.findByFax", query = "SELECT i FROM InvInstitutions i WHERE i.fax = :fax"), @NamedQuery(name = "InvInstitutions.findByAa", query = "SELECT i FROM InvInstitutions i WHERE i.aa = :aa"), @NamedQuery(name = "InvInstitutions.findByWebPage", query = "SELECT i FROM InvInstitutions i WHERE i.webPage = :webPage"), @NamedQuery(name = "InvInstitutions.findByEMail1", query = "SELECT i FROM InvInstitutions i WHERE i.eMail1 = :eMail1"), @NamedQuery(name = "InvInstitutions.findByEMail2", query = "SELECT i FROM InvInstitutions i WHERE i.eMail2 = :eMail2")})
public class InvInstitutions implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "Id_institution", nullable = false)
    private Integer idinstitution;
    @Column(name = "institution")
    private String institution;
    @Column(name = "abbreviation")
    private String abbreviation;
    @Column(name = "contact")
    private String contact;
    @Column(name = "contact_job")
    private String contactJob;
    @Column(name = "address")
    private String address;
    @Column(name = "phone")
    private Double phone;
    @Column(name = "fax")
    private Double fax;
    @Column(name = "AA")
    private Double aa;
    @Column(name = "web_page")
    private String webPage;
    @Column(name = "email_1")
    private String eMail1;
    @Column(name = "email_2")
    private String eMail2;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "invInstitutions")
    private Collection<InvCruiseInstitutions> invCruiseInstitutionsCollection;
    @OneToMany(mappedBy = "institution")
    private Collection<InvChiefScientist> invChiefScientistCollection;
    @OneToMany(mappedBy = "institutionLab")
    private Collection<InvLaboratories> invLaboratoriesCollection;
    @OneToMany(mappedBy = "responsableInstitution")
    private Collection<InvShipName> invShipNameCollection;
    @JoinColumn(name = "cod_city", referencedColumnName = "DANE")
    @ManyToOne
    private GenMunicipio codCity;
    @JoinColumn(name = "country", referencedColumnName = "pai_id")
    @ManyToOne
    private Paises0101 country;
    @OneToMany(mappedBy = "idInstitution")
    private Collection<InvProject> invProjectCollection;    

    public InvInstitutions() {
    }

    public InvInstitutions(Integer idinstitution) {
        this.idinstitution = idinstitution;
    }

    public Integer getIdinstitution() {
        return idinstitution;
    }

    public void setIdinstitution(Integer idinstitution) {
        this.idinstitution = idinstitution;
    }

    public String getInstitution() {
        return institution;
    }

    public void setInstitution(String institution) {
        this.institution = institution;
    }

    public String getAbbreviation() {
        return abbreviation;
    }

    public void setAbbreviation(String abbreviation) {
        this.abbreviation = abbreviation;
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

    public Double getPhone() {
        return phone;
    }

    public void setPhone(Double phone) {
        this.phone = phone;
    }

    public Double getFax() {
        return fax;
    }

    public void setFax(Double fax) {
        this.fax = fax;
    }

    public Double getAa() {
        return aa;
    }

    public void setAa(Double aa) {
        this.aa = aa;
    }

    public String getWebPage() {
        return webPage;
    }

    public void setWebPage(String webPage) {
        this.webPage = webPage;
    }

    public String getEMail1() {
        return eMail1;
    }

    public void setEMail1(String eMail1) {
        this.eMail1 = eMail1;
    }

    public String getEMail2() {
        return eMail2;
    }

    public void setEMail2(String eMail2) {
        this.eMail2 = eMail2;
    }

    public Collection<InvCruiseInstitutions> getInvCruiseInstitutionsCollection() {
        return invCruiseInstitutionsCollection;
    }

    public void setInvCruiseInstitutionsCollection(Collection<InvCruiseInstitutions> invCruiseInstitutionsCollection) {
        this.invCruiseInstitutionsCollection = invCruiseInstitutionsCollection;
    }

    public Collection<InvChiefScientist> getInvChiefScientistCollection() {
        return invChiefScientistCollection;
    }

    public void setInvChiefScientistCollection(Collection<InvChiefScientist> invChiefScientistCollection) {
        this.invChiefScientistCollection = invChiefScientistCollection;
    }

    public Collection<InvLaboratories> getInvLaboratoriesCollection() {
        return invLaboratoriesCollection;
    }

    public void setInvLaboratoriesCollection(Collection<InvLaboratories> invLaboratoriesCollection) {
        this.invLaboratoriesCollection = invLaboratoriesCollection;
    }

    public Collection<InvShipName> getInvShipNameCollection() {
        return invShipNameCollection;
    }

    public void setInvShipNameCollection(Collection<InvShipName> invShipNameCollection) {
        this.invShipNameCollection = invShipNameCollection;
    }

    public GenMunicipio getCodCity() {
        return codCity;
    }

    public void setCodCity(GenMunicipio codCity) {
        this.codCity = codCity;
    }

    public Paises0101 getCountry() {
        return country;
    }

    public void setCountry(Paises0101 country) {
        this.country = country;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idinstitution != null ? idinstitution.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof InvInstitutions)) {
            return false;
        }
        InvInstitutions other = (InvInstitutions) object;
        if ((this.idinstitution == null && other.idinstitution != null) || (this.idinstitution != null && !this.idinstitution.equals(other.idinstitution))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dimar.cecoldo.bean1.InvInstitutions[idinstitution=" + idinstitution + "]";
    }

    public Collection<InvProject> getInvProjectCollection() {
        return invProjectCollection;
    }

    public void setInvProjectCollection(Collection<InvProject> invProjectCollection) {
        this.invProjectCollection = invProjectCollection;
    }

}
