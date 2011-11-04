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
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author user
 */
@Entity
@Table(name = "groups")
@NamedQueries({@NamedQuery(name = "Groups.findById", query = "SELECT g FROM Groups g WHERE g.id = :id"), @NamedQuery(name = "Groups.findByName", query = "SELECT g FROM Groups g WHERE g.name = :name"), @NamedQuery(name = "Groups.findByDescription", query = "SELECT g FROM Groups g WHERE g.description = :description"), @NamedQuery(name = "Groups.findByEmail", query = "SELECT g FROM Groups g WHERE g.email = :email")})
public class Groups implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "id", nullable = false)
    private Integer id;
    @Column(name = "name", nullable = false)
    private String name;
    @Column(name = "description")
    private String description;
    @Column(name = "email")
    private String email;
    @ManyToMany(mappedBy = "groupIdCollection")
    private Collection<Users> userIdCollection;
    @JoinColumn(name = "referrer", referencedColumnName = "id")
    @ManyToOne
    private Users referrer;
    @OneToMany(mappedBy = "groupOwner")
    private Collection<Metadata> metadataCollection;

    public Groups() {
    }

    public Groups(Integer id) {
        this.id = id;
    }

    public Groups(Integer id, String name) {
        this.id = id;
        this.name = name;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Collection<Users> getUserIdCollection() {
        return userIdCollection;
    }

    public void setUserIdCollection(Collection<Users> userIdCollection) {
        this.userIdCollection = userIdCollection;
    }

    public Users getReferrer() {
        return referrer;
    }

    public void setReferrer(Users referrer) {
        this.referrer = referrer;
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
        if (!(object instanceof Groups)) {
            return false;
        }
        Groups other = (Groups) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "org.webmapping.consultaPuntos.bean.Groups[id=" + id + "]";
    }

}
