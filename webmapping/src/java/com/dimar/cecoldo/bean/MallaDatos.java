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
@Table(name = "malla_datos")
@NamedQueries({@NamedQuery(name = "MallaDatos.findByIdMallaDatos", query = "SELECT m FROM MallaDatos m WHERE m.idMallaDatos = :idMallaDatos"), @NamedQuery(name = "MallaDatos.findByLongitud", query = "SELECT m FROM MallaDatos m WHERE m.longitud = :longitud"), @NamedQuery(name = "MallaDatos.findByLatitud", query = "SELECT m FROM MallaDatos m WHERE m.latitud = :latitud"), @NamedQuery(name = "MallaDatos.findByNumeroEstacion", query = "SELECT m FROM MallaDatos m WHERE m.numeroEstacion = :numeroEstacion"), @NamedQuery(name = "MallaDatos.findByDescripcion", query = "SELECT m FROM MallaDatos m WHERE m.descripcion = :descripcion")})
public class MallaDatos implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "id_malla_datos", nullable = false)
    private Integer idMallaDatos;
    @Column(name = "longitud", nullable = false)
    private double longitud;
    @Column(name = "latitud", nullable = false)
    private double latitud;
    @Column(name = "numero_estacion")
    private Integer numeroEstacion;
    @Column(name = "descripcion")
    private String descripcion;

    public MallaDatos() {
    }

    public MallaDatos(Integer idMallaDatos) {
        this.idMallaDatos = idMallaDatos;
    }

    public MallaDatos(Integer idMallaDatos, double longitud, double latitud) {
        this.idMallaDatos = idMallaDatos;
        this.longitud = longitud;
        this.latitud = latitud;
    }

    public Integer getIdMallaDatos() {
        return idMallaDatos;
    }

    public void setIdMallaDatos(Integer idMallaDatos) {
        this.idMallaDatos = idMallaDatos;
    }

    public double getLongitud() {
        return longitud;
    }

    public void setLongitud(double longitud) {
        this.longitud = longitud;
    }

    public double getLatitud() {
        return latitud;
    }

    public void setLatitud(double latitud) {
        this.latitud = latitud;
    }

    public Integer getNumeroEstacion() {
        return numeroEstacion;
    }

    public void setNumeroEstacion(Integer numeroEstacion) {
        this.numeroEstacion = numeroEstacion;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idMallaDatos != null ? idMallaDatos.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof MallaDatos)) {
            return false;
        }
        MallaDatos other = (MallaDatos) object;
        if ((this.idMallaDatos == null && other.idMallaDatos != null) || (this.idMallaDatos != null && !this.idMallaDatos.equals(other.idMallaDatos))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "org.webmapping.consultaPuntos.bean.MallaDatos[idMallaDatos=" + idMallaDatos + "]";
    }

}
