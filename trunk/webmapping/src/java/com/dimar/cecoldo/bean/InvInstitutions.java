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
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author Administrador
 */
@Entity
@Table(name = "inv_institutions")
@NamedQueries({
    @NamedQuery(name = "InvInstitutions.findAll", query = "SELECT i FROM InvInstitutions i")})
public class InvInstitutions implements Serializable {
    @OneToMany(mappedBy = "responsableInstitution")
    private Collection<InvShipName> invShipNameCollection;
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "Id_institution")
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
    private String phone;
    @Column(name = "fax")
    private String fax;
    @Column(name = "AA")
    private String aa;
    @Column(name = "web_page")
    private String webPage;
    @Column(name = "email_1")
    private String email1;
    @Column(name = "email_2")
    private String email2;
    @Column(name = "observations")
    private String observations;
    @JoinColumn(name = "cod_city", referencedColumnName = "locId")
    @ManyToOne
    private GenCities codCity;
    @JoinColumn(name = "country", referencedColumnName = "pai_id")
    @ManyToOne
    private Paises0101 country;

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

    public String getAa() {
        return aa;
    }

    public void setAa(String aa) {
        this.aa = aa;
    }

    public String getWebPage() {
        return webPage;
    }

    public void setWebPage(String webPage) {
        this.webPage = webPage;
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

    public String getObservations() {
        return observations;
    }

    public void setObservations(String observations) {
        this.observations = observations;
    }

    public GenCities getCodCity() {
        return codCity;
    }

    public void setCodCity(GenCities codCity) {
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
        return "com.dimar.cecoldo.bean.InvInstitutions[ idinstitution=" + idinstitution + " ]";
    }

    public Collection<InvShipName> getInvShipNameCollection() {
        return invShipNameCollection;
    }

    public void setInvShipNameCollection(Collection<InvShipName> invShipNameCollection) {
        this.invShipNameCollection = invShipNameCollection;
    }
    
}
