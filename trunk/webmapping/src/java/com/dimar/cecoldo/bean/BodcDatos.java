/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.dimar.cecoldo.bean;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author user
 */
@Entity
@Table(name = "bodc_datos")
@NamedQueries({@NamedQuery(name = "BodcDatos.findById", query = "SELECT b FROM BodcDatos b WHERE b.id = :id"), @NamedQuery(name = "BodcDatos.findByFecha", query = "SELECT b FROM BodcDatos b WHERE b.fecha = :fecha"), @NamedQuery(name = "BodcDatos.findByHora", query = "SELECT b FROM BodcDatos b WHERE b.hora = :hora"), @NamedQuery(name = "BodcDatos.findByLatitud", query = "SELECT b FROM BodcDatos b WHERE b.latitud = :latitud"), @NamedQuery(name = "BodcDatos.findByLongitud", query = "SELECT b FROM BodcDatos b WHERE b.longitud = :longitud"), @NamedQuery(name = "BodcDatos.findByProfundidad", query = "SELECT b FROM BodcDatos b WHERE b.profundidad = :profundidad")})
public class BodcDatos implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "id", nullable = false)
    private Integer id;
    @Column(name = "fecha")
    @Temporal(TemporalType.DATE)
    private Date fecha;
    @Column(name = "hora")
    @Temporal(TemporalType.TIME)
    private Date hora;
    @Column(name = "latitud")
    private Double latitud;
    @Column(name = "longitud")
    private Double longitud;
    @Column(name = "profundidad")
    private Double profundidad;
    @JoinColumn(name = "id_archivo", referencedColumnName = "id_archivo")
    @ManyToOne
    private ArchivoDatos idArchivo;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idDatos")
    private Collection<BodcDetalleDatos> bodcDetalleDatosCollection;

    public BodcDatos() {
    }

    public BodcDatos(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Date getHora() {
        return hora;
    }

    public void setHora(Date hora) {
        this.hora = hora;
    }

    public Double getLatitud() {
        return latitud;
    }

    public void setLatitud(Double latitud) {
        this.latitud = latitud;
    }

    public Double getLongitud() {
        return longitud;
    }

    public void setLongitud(Double longitud) {
        this.longitud = longitud;
    }

    public Double getProfundidad() {
        return profundidad;
    }

    public void setProfundidad(Double profundidad) {
        this.profundidad = profundidad;
    }

    public ArchivoDatos getIdArchivo() {
        return idArchivo;
    }

    public void setIdArchivo(ArchivoDatos idArchivo) {
        this.idArchivo = idArchivo;
    }

    public Collection<BodcDetalleDatos> getBodcDetalleDatosCollection() {
        return bodcDetalleDatosCollection;
    }

    public void setBodcDetalleDatosCollection(Collection<BodcDetalleDatos> bodcDetalleDatosCollection) {
        this.bodcDetalleDatosCollection = bodcDetalleDatosCollection;
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
        if (!(object instanceof BodcDatos)) {
            return false;
        }
        BodcDatos other = (BodcDatos) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "org.webmapping.consultaPuntos.bean.BodcDatos[id=" + id + "]";
    }

}
