/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.dimar.cecoldo.bean;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author user
 */
@Entity
@Table(name = "inv_function_classifiers")
@NamedQueries({@NamedQuery(name = "InvFunctionClassifiers.findByFunctionCode", query = "SELECT i FROM InvFunctionClassifiers i WHERE i.functionCode = :functionCode"), @NamedQuery(name = "InvFunctionClassifiers.findByFunctionDescription", query = "SELECT i FROM InvFunctionClassifiers i WHERE i.functionDescription = :functionDescription")})
public class InvFunctionClassifiers implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "FunctionCode", nullable = false)
    private String functionCode;
    @Column(name = "FunctionDescription")
    private String functionDescription;

    public InvFunctionClassifiers() {
    }

    public InvFunctionClassifiers(String functionCode) {
        this.functionCode = functionCode;
    }

    public String getFunctionCode() {
        return functionCode;
    }

    public void setFunctionCode(String functionCode) {
        this.functionCode = functionCode;
    }

    public String getFunctionDescription() {
        return functionDescription;
    }

    public void setFunctionDescription(String functionDescription) {
        this.functionDescription = functionDescription;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (functionCode != null ? functionCode.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof InvFunctionClassifiers)) {
            return false;
        }
        InvFunctionClassifiers other = (InvFunctionClassifiers) object;
        if ((this.functionCode == null && other.functionCode != null) || (this.functionCode != null && !this.functionCode.equals(other.functionCode))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dimar.cecoldo.bean1.InvFunctionClassifiers[functionCode=" + functionCode + "]";
    }

}
