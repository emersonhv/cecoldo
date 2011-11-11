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
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author Administrador
 */
@Entity
@Table(name = "inv_project")
@NamedQueries({
    @NamedQuery(name = "InvProject.findAll", query = "SELECT i FROM InvProject i"),
    @NamedQuery(name = "InvProject.findByIdProject", query = "SELECT i FROM InvProject i WHERE i.idProject = :idProject"),
    @NamedQuery(name = "InvProject.findByProjectName", query = "SELECT i FROM InvProject i WHERE i.projectName = :projectName"),
    @NamedQuery(name = "InvProject.findByProjectBoss", query = "SELECT i FROM InvProject i WHERE i.projectBoss = :projectBoss"),
    @NamedQuery(name = "InvProject.findByUriProject", query = "SELECT i FROM InvProject i WHERE i.uriProject = :uriProject"),
    @NamedQuery(name = "InvProject.findByDescription", query = "SELECT i FROM InvProject i WHERE i.description = :description")})
public class InvProject implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_project")
    private Integer idProject;
    @Basic(optional = false)
    @Column(name = "project_name")
    private String projectName;
    @Column(name = "project_boss")
    private String projectBoss;
    @Column(name = "uri_project")
    private String uriProject;
    @Column(name = "description")
    private String description;
    @JoinTable(name = "inv_cruise_to_project", joinColumns = {
        @JoinColumn(name = "inv_project_id_project", referencedColumnName = "id_project")}, inverseJoinColumns = {
        @JoinColumn(name = "inv_cruise_inventory_id_cruise", referencedColumnName = "id_cruise")})
    @ManyToMany
    private Collection<InvCruiseInventory> invCruiseInventoryCollection;
    @JoinColumn(name = "id_status", referencedColumnName = "id_status")
    @ManyToOne
    private InvStatus idStatus;
    @JoinColumn(name = "id_institution", referencedColumnName = "Id_institution")
    @ManyToOne
    private InvInstitutions idInstitution;

    public InvProject() {
    }

    public InvProject(Integer idProject) {
        this.idProject = idProject;
    }

    public InvProject(Integer idProject, String projectName) {
        this.idProject = idProject;
        this.projectName = projectName;
    }

    public Integer getIdProject() {
        return idProject;
    }

    public void setIdProject(Integer idProject) {
        this.idProject = idProject;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getProjectBoss() {
        return projectBoss;
    }

    public void setProjectBoss(String projectBoss) {
        this.projectBoss = projectBoss;
    }

    public String getUriProject() {
        return uriProject;
    }

    public void setUriProject(String uriProject) {
        this.uriProject = uriProject;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Collection<InvCruiseInventory> getInvCruiseInventoryCollection() {
        return invCruiseInventoryCollection;
    }

    public void setInvCruiseInventoryCollection(Collection<InvCruiseInventory> invCruiseInventoryCollection) {
        this.invCruiseInventoryCollection = invCruiseInventoryCollection;
    }

    public InvStatus getIdStatus() {
        return idStatus;
    }

    public void setIdStatus(InvStatus idStatus) {
        this.idStatus = idStatus;
    }

    public InvInstitutions getIdInstitution() {
        return idInstitution;
    }

    public void setIdInstitution(InvInstitutions idInstitution) {
        this.idInstitution = idInstitution;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idProject != null ? idProject.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof InvProject)) {
            return false;
        }
        InvProject other = (InvProject) object;
        if ((this.idProject == null && other.idProject != null) || (this.idProject != null && !this.idProject.equals(other.idProject))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dimar.cecoldo.bean.InvProject[ idProject=" + idProject + " ]";
    }
    
}
