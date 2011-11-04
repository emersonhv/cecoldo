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
@Table(name = "inv_project")
@NamedQueries({@NamedQuery(name = "InvProject.findByIdProject", query = "SELECT i FROM InvProject i WHERE i.idProject = :idProject"), @NamedQuery(name = "InvProject.findByProjectName", query = "SELECT i FROM InvProject i WHERE i.projectName = :projectName"), @NamedQuery(name = "InvProject.findByProjectBoss", query = "SELECT i FROM InvProject i WHERE i.projectBoss = :projectBoss"), @NamedQuery(name = "InvProject.findByUriProject", query = "SELECT i FROM InvProject i WHERE i.uriProject = :uriProject")})
public class InvProject implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "id_project", nullable = false)
    private Integer idProject;
    @Column(name = "project_name", nullable = false)
    private String projectName;
    @Column(name = "project_boss")
    private String projectBoss;
    @Column(name = "uri_project")
    private String uriProject;
    @JoinColumn(name = "id_status", referencedColumnName = "id_status")
    @ManyToOne
    private InvStatus idStatus;
    @JoinColumn(name = "id_institution", referencedColumnName = "Id_institution")
    @ManyToOne
    private InvInstitutions idInstitution;
    @OneToMany(mappedBy = "idProject")
    private Collection<InvCruiseInventory> invCruiseInventoryCollection;    

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
        return "com.dimar.cecoldo.bean.InvProject[idProject=" + idProject + "]";
    }

    public Collection<InvCruiseInventory> getInvCruiseInventoryCollection() {
        return invCruiseInventoryCollection;
    }

    public void setInvCruiseInventoryCollection(Collection<InvCruiseInventory> invCruiseInventoryCollection) {
        this.invCruiseInventoryCollection = invCruiseInventoryCollection;
    }

}
