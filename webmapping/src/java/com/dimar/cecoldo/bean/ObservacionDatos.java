/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.dimar.cecoldo.bean;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author user
 */
@Entity
@Table(name = "observacion_datos")
@NamedQueries({@NamedQuery(name = "ObservacionDatos.findByIdObservacion", query = "SELECT o FROM ObservacionDatos o WHERE o.idObservacion = :idObservacion")})
public class ObservacionDatos implements Serializable {
    private static final long serialVersionUID = 1L;
    @Lob
    @Column(name = "observacion")
    private String observacion;
    @Id
    @Column(name = "id_observacion", nullable = false)
    private Integer idObservacion;
    @JoinColumn(name = "id_archivo", referencedColumnName = "id_archivo")
    @ManyToOne
    private ArchivoDatos idArchivo;
    @JoinColumn(name = "id_user", referencedColumnName = "REPORTUSER_ID")
    @ManyToOne
    private ReportUser idUser;

    public ObservacionDatos() {
    }

    public ObservacionDatos(Integer idObservacion) {
        this.idObservacion = idObservacion;
    }

    public String getObservacion() {
        return observacion;
    }

    public void setObservacion(String observacion) {
        this.observacion = observacion;
    }

    public Integer getIdObservacion() {
        return idObservacion;
    }

    public void setIdObservacion(Integer idObservacion) {
        this.idObservacion = idObservacion;
    }

    public ArchivoDatos getIdArchivo() {
        return idArchivo;
    }

    public void setIdArchivo(ArchivoDatos idArchivo) {
        this.idArchivo = idArchivo;
    }

    public ReportUser getIdUser() {
        return idUser;
    }

    public void setIdUser(ReportUser idUser) {
        this.idUser = idUser;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idObservacion != null ? idObservacion.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ObservacionDatos)) {
            return false;
        }
        ObservacionDatos other = (ObservacionDatos) object;
        if ((this.idObservacion == null && other.idObservacion != null) || (this.idObservacion != null && !this.idObservacion.equals(other.idObservacion))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "org.webmapping.consultaPuntos.bean2.ObservacionDatos[idObservacion=" + idObservacion + "]";
    }

}
