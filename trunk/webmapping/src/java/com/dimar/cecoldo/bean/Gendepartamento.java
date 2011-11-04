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
@Table(name = "gendepartamento")
@NamedQueries({@NamedQuery(name = "Gendepartamento.findByIdDepartamento", query = "SELECT g FROM Gendepartamento g WHERE g.idDepartamento = :idDepartamento"), @NamedQuery(name = "Gendepartamento.findByNombreDepartamento", query = "SELECT g FROM Gendepartamento g WHERE g.nombreDepartamento = :nombreDepartamento")})
public class Gendepartamento implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "Id_Departamento", nullable = false)
    private Integer idDepartamento;
    @Column(name = "NombreDepartamento", nullable = false)
    private String nombreDepartamento;
    @JoinColumn(name = "id_Pais", referencedColumnName = "pai_id")
    @ManyToOne
    private Paises0101 idPais;
    @OneToMany(mappedBy = "depto")
    private Collection<GenMunicipio> genMunicipioCollection;

    public Gendepartamento() {
    }

    public Gendepartamento(Integer idDepartamento) {
        this.idDepartamento = idDepartamento;
    }

    public Gendepartamento(Integer idDepartamento, String nombreDepartamento) {
        this.idDepartamento = idDepartamento;
        this.nombreDepartamento = nombreDepartamento;
    }

    public Integer getIdDepartamento() {
        return idDepartamento;
    }

    public void setIdDepartamento(Integer idDepartamento) {
        this.idDepartamento = idDepartamento;
    }

    public String getNombreDepartamento() {
        return nombreDepartamento;
    }

    public void setNombreDepartamento(String nombreDepartamento) {
        this.nombreDepartamento = nombreDepartamento;
    }

    public Paises0101 getIdPais() {
        return idPais;
    }

    public void setIdPais(Paises0101 idPais) {
        this.idPais = idPais;
    }

    public Collection<GenMunicipio> getGenMunicipioCollection() {
        return genMunicipioCollection;
    }

    public void setGenMunicipioCollection(Collection<GenMunicipio> genMunicipioCollection) {
        this.genMunicipioCollection = genMunicipioCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idDepartamento != null ? idDepartamento.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Gendepartamento)) {
            return false;
        }
        Gendepartamento other = (Gendepartamento) object;
        if ((this.idDepartamento == null && other.idDepartamento != null) || (this.idDepartamento != null && !this.idDepartamento.equals(other.idDepartamento))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dimar.cecoldo.bean1.Gendepartamento[idDepartamento=" + idDepartamento + "]";
    }

}
