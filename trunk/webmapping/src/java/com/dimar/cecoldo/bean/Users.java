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
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author user
 */
@Entity
@Table(name = "users")
@NamedQueries({@NamedQuery(name = "Users.findById", query = "SELECT u FROM Users u WHERE u.id = :id"), @NamedQuery(name = "Users.findByUsername", query = "SELECT u FROM Users u WHERE u.username = :username"), @NamedQuery(name = "Users.findByPassword", query = "SELECT u FROM Users u WHERE u.password = :password"), @NamedQuery(name = "Users.findBySurname", query = "SELECT u FROM Users u WHERE u.surname = :surname"), @NamedQuery(name = "Users.findByName", query = "SELECT u FROM Users u WHERE u.name = :name"), @NamedQuery(name = "Users.findByProfile", query = "SELECT u FROM Users u WHERE u.profile = :profile"), @NamedQuery(name = "Users.findByAddress", query = "SELECT u FROM Users u WHERE u.address = :address"), @NamedQuery(name = "Users.findByState", query = "SELECT u FROM Users u WHERE u.state = :state"), @NamedQuery(name = "Users.findByZip", query = "SELECT u FROM Users u WHERE u.zip = :zip"), @NamedQuery(name = "Users.findByCountry", query = "SELECT u FROM Users u WHERE u.country = :country"), @NamedQuery(name = "Users.findByEmail", query = "SELECT u FROM Users u WHERE u.email = :email"), @NamedQuery(name = "Users.findByOrganisation", query = "SELECT u FROM Users u WHERE u.organisation = :organisation"), @NamedQuery(name = "Users.findByKind", query = "SELECT u FROM Users u WHERE u.kind = :kind")})
public class Users implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "id", nullable = false)
    private Integer id;
    @Column(name = "username", nullable = false)
    private String username;
    @Column(name = "password", nullable = false)
    private String password;
    @Column(name = "surname")
    private String surname;
    @Column(name = "name")
    private String name;
    @Column(name = "profile", nullable = false)
    private String profile;
    @Column(name = "address")
    private String address;
    @Column(name = "state")
    private String state;
    @Column(name = "zip")
    private String zip;
    @Column(name = "country")
    private String country;
    @Column(name = "email")
    private String email;
    @Column(name = "organisation")
    private String organisation;
    @Column(name = "kind")
    private String kind;
    @JoinTable(name = "usergroups", joinColumns = {@JoinColumn(name = "userId", referencedColumnName = "id")}, inverseJoinColumns = {@JoinColumn(name = "groupId", referencedColumnName = "id")})
    @ManyToMany
    private Collection<Groups> groupIdCollection;
    @OneToMany(mappedBy = "referrer")
    private Collection<Groups> groupsCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "owner")
    private Collection<Metadata> metadataCollection;

    public Users() {
    }

    public Users(Integer id) {
        this.id = id;
    }

    public Users(Integer id, String username, String password, String profile) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.profile = profile;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getZip() {
        return zip;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getOrganisation() {
        return organisation;
    }

    public void setOrganisation(String organisation) {
        this.organisation = organisation;
    }

    public String getKind() {
        return kind;
    }

    public void setKind(String kind) {
        this.kind = kind;
    }

    public Collection<Groups> getGroupIdCollection() {
        return groupIdCollection;
    }

    public void setGroupIdCollection(Collection<Groups> groupIdCollection) {
        this.groupIdCollection = groupIdCollection;
    }

    public Collection<Groups> getGroupsCollection() {
        return groupsCollection;
    }

    public void setGroupsCollection(Collection<Groups> groupsCollection) {
        this.groupsCollection = groupsCollection;
    }

    public Collection<Metadata> getMetadataCollection() {
        return metadataCollection;
    }

    public void setMetadataCollection(Collection<Metadata> metadataCollection) {
        this.metadataCollection = metadataCollection;
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
        if (!(object instanceof Users)) {
            return false;
        }
        Users other = (Users) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "org.webmapping.consultaPuntos.bean.Users[id=" + id + "]";
    }

}
