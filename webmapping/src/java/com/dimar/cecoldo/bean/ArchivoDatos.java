/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.dimar.cecoldo.bean;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
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
@Table(name = "archivo_datos")
@NamedQueries({@NamedQuery(name = "ArchivoDatos.findByIdArchivo", query = "SELECT a FROM ArchivoDatos a WHERE a.idArchivo = :idArchivo"), @NamedQuery(name = "ArchivoDatos.findByNombreArchivo", query = "SELECT a FROM ArchivoDatos a WHERE a.nombreArchivo = :nombreArchivo"), @NamedQuery(name = "ArchivoDatos.findByIdUsuario", query = "SELECT a FROM ArchivoDatos a WHERE a.idUsuario = :idUsuario"), @NamedQuery(name = "ArchivoDatos.findByFecha", query = "SELECT a FROM ArchivoDatos a WHERE a.fecha = :fecha"), @NamedQuery(name = "ArchivoDatos.findByHora", query = "SELECT a FROM ArchivoDatos a WHERE a.hora = :hora"), @NamedQuery(name = "ArchivoDatos.findByRegion", query = "SELECT a FROM ArchivoDatos a WHERE a.region = :region"), @NamedQuery(name = "ArchivoDatos.findByEstado", query = "SELECT a FROM ArchivoDatos a WHERE a.estado = :estado")})
public class ArchivoDatos implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "id_archivo", nullable = false)
    private Integer idArchivo;
    @Column(name = "nombre_archivo")
    private String nombreArchivo;
    @Column(name = "id_usuario", nullable = false)
    private int idUsuario;
    @Column(name = "fecha")
    @Temporal(TemporalType.DATE)
    private Date fecha;
    @Column(name = "hora")
    @Temporal(TemporalType.TIME)
    private Date hora;
    @Column(name = "region")
    private String region;
    @Column(name = "estado")
    private String estado;
    @OneToMany(mappedBy = "idArchivo")
    private Collection<BodcDatos> bodcDatosCollection;
    @JoinColumn(name = "id_metadata", referencedColumnName = "id")
    @ManyToOne
    private Metadata idMetadata;

    public ArchivoDatos() {
    }

    public ArchivoDatos(Integer idArchivo) {
        this.idArchivo = idArchivo;
    }

    public ArchivoDatos(Integer idArchivo, int idUsuario) {
        this.idArchivo = idArchivo;
        this.idUsuario = idUsuario;
    }

    public Integer getIdArchivo() {
        return idArchivo;
    }

    public void setIdArchivo(Integer idArchivo) {
        this.idArchivo = idArchivo;
    }

    public String getNombreArchivo() {
        return nombreArchivo;
    }

    public void setNombreArchivo(String nombreArchivo) {
        this.nombreArchivo = nombreArchivo;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
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

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Collection<BodcDatos> getBodcDatosCollection() {
        return bodcDatosCollection;
    }

    public void setBodcDatosCollection(Collection<BodcDatos> bodcDatosCollection) {
        this.bodcDatosCollection = bodcDatosCollection;
    }

    public Metadata getIdMetadata() {
        return idMetadata;
    }

    public void setIdMetadata(Metadata idMetadata) {
        this.idMetadata = idMetadata;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idArchivo != null ? idArchivo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ArchivoDatos)) {
            return false;
        }
        ArchivoDatos other = (ArchivoDatos) object;
        if ((this.idArchivo == null && other.idArchivo != null) || (this.idArchivo != null && !this.idArchivo.equals(other.idArchivo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "org.webmapping.consultaPuntos.bean.ArchivoDatos[idArchivo=" + idArchivo + "]";
    }

}
