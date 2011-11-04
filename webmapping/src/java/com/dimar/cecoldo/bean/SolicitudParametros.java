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
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
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
@Table(name = "solicitud_parametros")
@NamedQueries({@NamedQuery(name = "SolicitudParametros.findByIdSolicitud", query = "SELECT s FROM SolicitudParametros s WHERE s.idSolicitud = :idSolicitud"), @NamedQuery(name = "SolicitudParametros.findByFechaSolicitud", query = "SELECT s FROM SolicitudParametros s WHERE s.fechaSolicitud = :fechaSolicitud"), @NamedQuery(name = "SolicitudParametros.findByNombreInstitucion", query = "SELECT s FROM SolicitudParametros s WHERE s.nombreInstitucion = :nombreInstitucion"), @NamedQuery(name = "SolicitudParametros.findBySolicitante", query = "SELECT s FROM SolicitudParametros s WHERE s.solicitante = :solicitante"), @NamedQuery(name = "SolicitudParametros.findByCargoSolicitante", query = "SELECT s FROM SolicitudParametros s WHERE s.cargoSolicitante = :cargoSolicitante"), @NamedQuery(name = "SolicitudParametros.findByCorreoElectronico", query = "SELECT s FROM SolicitudParametros s WHERE s.correoElectronico = :correoElectronico"), @NamedQuery(name = "SolicitudParametros.findByTelefono", query = "SELECT s FROM SolicitudParametros s WHERE s.telefono = :telefono")})
public class SolicitudParametros implements Serializable, Cloneable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_solicitud", nullable = false)
    private Integer idSolicitud;
    @Column(name = "fecha_solicitud", nullable = false)
    @Temporal(TemporalType.DATE)
    private Date fechaSolicitud;
    @Column(name = "nombre_institucion", nullable = false)
    private String nombreInstitucion;
    @Column(name = "solicitante", nullable = false)
    private String solicitante;
    @Column(name = "cargo_solicitante", nullable = false)
    private String cargoSolicitante;
    @Column(name = "correo_electronico", nullable = false)
    private String correoElectronico;
    @Column(name = "telefono", nullable = false)
    private String telefono;
    @Lob
    @Column(name = "observaciones")
    private String observaciones;
    @JoinColumn(name = "id_pais", referencedColumnName = "pai_id")
    @ManyToOne
    private Paises0101 idPais;
    @JoinColumn(name = "id_municipio", referencedColumnName = "dane")
    @ManyToOne
    private GenMunicipio idMunicipio;
    @JoinColumn(name = "id_departamento", referencedColumnName = "Id_Departamento")
    @ManyToOne
    private Gendepartamento idDepartamento;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idSolicitud")
    private Collection<BodcRequiredParameter> bodcRequiredParameterCollection;

    public SolicitudParametros() {
    }

    public SolicitudParametros(Integer idSolicitud) {
        this.idSolicitud = idSolicitud;
    }

    public SolicitudParametros(Integer idSolicitud, Date fechaSolicitud, String nombreInstitucion, String solicitante, String cargoSolicitante, String correoElectronico, String telefono) {
        this.idSolicitud = idSolicitud;
        this.fechaSolicitud = fechaSolicitud;
        this.nombreInstitucion = nombreInstitucion;
        this.solicitante = solicitante;
        this.cargoSolicitante = cargoSolicitante;
        this.correoElectronico = correoElectronico;
        this.telefono = telefono;
    }

    public Integer getIdSolicitud() {
        return idSolicitud;
    }

    public void setIdSolicitud(Integer idSolicitud) {
        this.idSolicitud = idSolicitud;
    }

    public Date getFechaSolicitud() {
        return fechaSolicitud;
    }

    public void setFechaSolicitud(Date fechaSolicitud) {
        this.fechaSolicitud = fechaSolicitud;
    }

    public String getNombreInstitucion() {
        return nombreInstitucion;
    }

    public void setNombreInstitucion(String nombreInstitucion) {
        this.nombreInstitucion = nombreInstitucion;
    }

    public String getSolicitante() {
        return solicitante;
    }

    public void setSolicitante(String solicitante) {
        this.solicitante = solicitante;
    }

    public String getCargoSolicitante() {
        return cargoSolicitante;
    }

    public void setCargoSolicitante(String cargoSolicitante) {
        this.cargoSolicitante = cargoSolicitante;
    }

    public String getCorreoElectronico() {
        return correoElectronico;
    }

    public void setCorreoElectronico(String correoElectronico) {
        this.correoElectronico = correoElectronico;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    public Paises0101 getIdPais() {
        return idPais;
    }

    public void setIdPais(Paises0101 idPais) {
        this.idPais = idPais;
    }

    public GenMunicipio getIdMunicipio() {
        return idMunicipio;
    }

    public void setIdMunicipio(GenMunicipio idMunicipio) {
        this.idMunicipio = idMunicipio;
    }

    public Gendepartamento getIdDepartamento() {
        return idDepartamento;
    }

    public void setIdDepartamento(Gendepartamento idDepartamento) {
        this.idDepartamento = idDepartamento;
    }

    public Collection<BodcRequiredParameter> getBodcRequiredParameterCollection() {
        return bodcRequiredParameterCollection;
    }

    public void setBodcRequiredParameterCollection(Collection<BodcRequiredParameter> bodcRequiredParameterCollection) {
        this.bodcRequiredParameterCollection = bodcRequiredParameterCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idSolicitud != null ? idSolicitud.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof SolicitudParametros)) {
            return false;
        }
        SolicitudParametros other = (SolicitudParametros) object;
        if ((this.idSolicitud == null && other.idSolicitud != null) || (this.idSolicitud != null && !this.idSolicitud.equals(other.idSolicitud))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dimar.cecoldo.dictionary.bean.test.SolicitudParametros[idSolicitud=" + idSolicitud + "]";
    }
    public SolicitudParametros getDuplicate() throws CloneNotSupportedException{
        return (SolicitudParametros) this.clone();
    }
}
