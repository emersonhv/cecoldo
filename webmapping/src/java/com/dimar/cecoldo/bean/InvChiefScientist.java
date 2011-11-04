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
@Table(name = "inv_chief_scientist")
@NamedQueries({@NamedQuery(name = "InvChiefScientist.findById", query = "SELECT i FROM InvChiefScientist i WHERE i.id = :id"), @NamedQuery(name = "InvChiefScientist.findByInitials", query = "SELECT i FROM InvChiefScientist i WHERE i.initials = :initials"), @NamedQuery(name = "InvChiefScientist.findByFirstName", query = "SELECT i FROM InvChiefScientist i WHERE i.firstName = :firstName"), @NamedQuery(name = "InvChiefScientist.findByLastName", query = "SELECT i FROM InvChiefScientist i WHERE i.lastName = :lastName"), @NamedQuery(name = "InvChiefScientist.findByCvLac", query = "SELECT i FROM InvChiefScientist i WHERE i.cvLac = :cvLac"), @NamedQuery(name = "InvChiefScientist.findByJob", query = "SELECT i FROM InvChiefScientist i WHERE i.job = :job"), @NamedQuery(name = "InvChiefScientist.findByActive", query = "SELECT i FROM InvChiefScientist i WHERE i.active = :active"), @NamedQuery(name = "InvChiefScientist.findByActiveUntil", query = "SELECT i FROM InvChiefScientist i WHERE i.activeUntil = :activeUntil"), @NamedQuery(name = "InvChiefScientist.findByPhone", query = "SELECT i FROM InvChiefScientist i WHERE i.phone = :phone"), @NamedQuery(name = "InvChiefScientist.findByFax", query = "SELECT i FROM InvChiefScientist i WHERE i.fax = :fax"), @NamedQuery(name = "InvChiefScientist.findByPersonalWebPage", query = "SELECT i FROM InvChiefScientist i WHERE i.personalWebPage = :personalWebPage"), @NamedQuery(name = "InvChiefScientist.findByEMail1", query = "SELECT i FROM InvChiefScientist i WHERE i.eMail1 = :eMail1"), @NamedQuery(name = "InvChiefScientist.findByEMail2", query = "SELECT i FROM InvChiefScientist i WHERE i.eMail2 = :eMail2")})
public class InvChiefScientist implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "Id", nullable = false)
    private String id;
    @Column(name = "initials")
    private String initials;
    @Column(name = "first_name")
    private String firstName;
    @Column(name = "last_name")
    private String lastName;
    @Column(name = "cv_lac")
    private String cvLac;
    @Column(name = "job")
    private String job;
    @Column(name = "active")
    private String active;
    @Column(name = "active_until")
    private String activeUntil;
    @Column(name = "phone")
    private String phone;
    @Column(name = "fax")
    private String fax;
    @Column(name = "personal_web_page")
    private String personalWebPage;
    @Column(name = "e_mail_1")
    private String eMail1;
    @Column(name = "e_mail_2")
    private String eMail2;
    @ManyToMany(mappedBy = "idChiefScientistCollection")
    private Collection<InvCruiseInventory> idCruiseCollection;
    @JoinColumn(name = "institution", referencedColumnName = "Id_institution")
    @ManyToOne
    private InvInstitutions institution;
    @JoinColumn(name = "country", referencedColumnName = "pai_id")
    @ManyToOne
    private Paises0101 country;
    @JoinColumn(name = "profession", referencedColumnName = "id_profesion")
    @ManyToOne
    private GenProfesion profession;

    public InvChiefScientist() {
    }

    public InvChiefScientist(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getInitials() {
        return initials;
    }

    public void setInitials(String initials) {
        this.initials = initials;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getCvLac() {
        return cvLac;
    }

    public void setCvLac(String cvLac) {
        this.cvLac = cvLac;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public String getActive() {
        return active;
    }

    public void setActive(String active) {
        this.active = active;
    }

    public String getActiveUntil() {
        return activeUntil;
    }

    public void setActiveUntil(String activeUntil) {
        this.activeUntil = activeUntil;
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

    public String getPersonalWebPage() {
        return personalWebPage;
    }

    public void setPersonalWebPage(String personalWebPage) {
        this.personalWebPage = personalWebPage;
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

    public Collection<InvCruiseInventory> getIdCruiseCollection() {
        return idCruiseCollection;
    }

    public void setIdCruiseCollection(Collection<InvCruiseInventory> idCruiseCollection) {
        this.idCruiseCollection = idCruiseCollection;
    }

    public InvInstitutions getInstitution() {
        return institution;
    }

    public void setInstitution(InvInstitutions institution) {
        this.institution = institution;
    }

    public Paises0101 getCountry() {
        return country;
    }

    public void setCountry(Paises0101 country) {
        this.country = country;
    }

    public GenProfesion getProfession() {
        return profession;
    }

    public void setProfession(GenProfesion profession) {
        this.profession = profession;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof InvChiefScientist)) {
            return false;
        }
        InvChiefScientist other = (InvChiefScientist) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dimar.cecoldo.bean1.InvChiefScientist[id=" + id + "]";
    }

}
