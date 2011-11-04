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
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author user
 */
@Entity
@Table(name = "report_group")
@NamedQueries({@NamedQuery(name = "ReportGroup.findByGroupId", query = "SELECT r FROM ReportGroup r WHERE r.groupId = :groupId"), @NamedQuery(name = "ReportGroup.findByName", query = "SELECT r FROM ReportGroup r WHERE r.name = :name"), @NamedQuery(name = "ReportGroup.findByDescription", query = "SELECT r FROM ReportGroup r WHERE r.description = :description")})
public class ReportGroup implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "GROUP_ID", nullable = false)
    private Integer groupId;
    @Column(name = "NAME", nullable = false)
    private String name;
    @Column(name = "DESCRIPTION", nullable = false)
    private String description;
    @JoinTable(name = "bodc_category_group", joinColumns = {@JoinColumn(name = "group_id", referencedColumnName = "GROUP_ID")}, inverseJoinColumns = {@JoinColumn(name = "category_code", referencedColumnName = "CODE")})
    @ManyToMany
    private Collection<BodcCategory> categoryCodeCollection;

    public ReportGroup() {
    }

    public ReportGroup(Integer groupId) {
        this.groupId = groupId;
    }

    public ReportGroup(Integer groupId, String name, String description) {
        this.groupId = groupId;
        this.name = name;
        this.description = description;
    }

    public Integer getGroupId() {
        return groupId;
    }

    public void setGroupId(Integer groupId) {
        this.groupId = groupId;
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

    public Collection<BodcCategory> getCategoryCodeCollection() {
        return categoryCodeCollection;
    }

    public void setCategoryCodeCollection(Collection<BodcCategory> categoryCodeCollection) {
        this.categoryCodeCollection = categoryCodeCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (groupId != null ? groupId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ReportGroup)) {
            return false;
        }
        ReportGroup other = (ReportGroup) object;
        if ((this.groupId == null && other.groupId != null) || (this.groupId != null && !this.groupId.equals(other.groupId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dimar.cecoldo.bean.ReportGroup[groupId=" + groupId + "]";
    }

}
