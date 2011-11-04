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
@Table(name = "gen_municipio")
@NamedQueries({@NamedQuery(name = "GenMunicipio.findByMunicipio", query = "SELECT g FROM GenMunicipio g WHERE g.municipio = :municipio"), @NamedQuery(name = "GenMunicipio.findByDane", query = "SELECT g FROM GenMunicipio g WHERE g.dane = :dane")})
public class GenMunicipio implements Serializable {
    private static final long serialVersionUID = 1L;
    @Column(name = "MUNICIPIO")
    private String municipio;
    @Id
    @Column(name = "DANE", nullable = false)
    private String dane;
    @JoinColumn(name = "DEPTO", referencedColumnName = "Id_Departamento")
    @ManyToOne
    private Gendepartamento depto;
    @OneToMany(mappedBy = "codCity")
    private Collection<InvInstitutions> invInstitutionsCollection;

    public GenMunicipio() {
    }

    public GenMunicipio(String dane) {
        this.dane = dane;
    }

    public String getMunicipio() {
        return municipio;
    }

    public void setMunicipio(String municipio) {
        this.municipio = municipio;
    }

    public String getDane() {
        return dane;
    }

    public void setDane(String dane) {
        this.dane = dane;
    }

    public Gendepartamento getDepto() {
        return depto;
    }

    public void setDepto(Gendepartamento depto) {
        this.depto = depto;
    }

    public Collection<InvInstitutions> getInvInstitutionsCollection() {
        return invInstitutionsCollection;
    }

    public void setInvInstitutionsCollection(Collection<InvInstitutions> invInstitutionsCollection) {
        this.invInstitutionsCollection = invInstitutionsCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (dane != null ? dane.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof GenMunicipio)) {
            return false;
        }
        GenMunicipio other = (GenMunicipio) object;
        if ((this.dane == null && other.dane != null) || (this.dane != null && !this.dane.equals(other.dane))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dimar.cecoldo.bean1.GenMunicipio[dane=" + dane + "]";
    }

}
