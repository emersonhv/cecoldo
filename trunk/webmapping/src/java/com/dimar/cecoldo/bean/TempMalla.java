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
 * @author Administrador
 */
@Entity
@Table(name = "malla_datos")
@NamedQueries({@NamedQuery(name = "TempMalla.findById", query = "SELECT t FROM TempMalla t WHERE t.id = :id"), @NamedQuery(name = "TempMalla.findByLat", query = "SELECT t FROM TempMalla t WHERE t.lat = :lat"), @NamedQuery(name = "TempMalla.findByLon", query = "SELECT t FROM TempMalla t WHERE t.lon = :lon")})
public class TempMalla implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "id_malla_datos", nullable = false)
    private Integer id;
    @Column(name = "latitud")
    private Double lat;
    @Column(name = "longitud")
    private Double lon;
    public TempMalla() {
    }

    public TempMalla(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Double getLat() {
        return lat;
    }

    public void setLat(Double lat) {
        this.lat = lat;
    }

    public Double getLon() {
        return lon;
    }

    public void setLon(Double lon) {
        this.lon = lon;
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
        if (!(object instanceof TempMalla)) {
            return false;
        }
        TempMalla other = (TempMalla) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "org.webmaping.persitencia.TempMalla[id=" + id + "]";
    }


}
