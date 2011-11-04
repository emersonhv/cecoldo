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
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author user
 */
@Entity
@Table(name = "bodc_detalle_datos")
@NamedQueries({@NamedQuery(name = "BodcDetalleDatos.findByIdDetalle", query = "SELECT b FROM BodcDetalleDatos b WHERE b.idDetalle = :idDetalle"), @NamedQuery(name = "BodcDetalleDatos.findByBodc", query = "SELECT b FROM BodcDetalleDatos b WHERE b.bodc = :bodc"), @NamedQuery(name = "BodcDetalleDatos.findByValor", query = "SELECT b FROM BodcDetalleDatos b WHERE b.valor = :valor"), @NamedQuery(name = "BodcDetalleDatos.findByQf", query = "SELECT b FROM BodcDetalleDatos b WHERE b.qf = :qf")})
public class BodcDetalleDatos implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "id_detalle", nullable = false)
    private Integer idDetalle;
    @Column(name = "bodc")
    private String bodc;
    @Column(name = "valor")
    private Double valor;
    @Column(name = "qf")
    private Integer qf;
    @JoinColumn(name = "id_datos", referencedColumnName = "id")
    @ManyToOne
    private BodcDatos idDatos;

    public BodcDetalleDatos() {
    }

    public BodcDetalleDatos(Integer idDetalle) {
        this.idDetalle = idDetalle;
    }

    public Integer getIdDetalle() {
        return idDetalle;
    }

    public void setIdDetalle(Integer idDetalle) {
        this.idDetalle = idDetalle;
    }

    public String getBodc() {
        return bodc;
    }

    public void setBodc(String bodc) {
        this.bodc = bodc;
    }

    public Double getValor() {
        return valor;
    }

    public void setValor(Double valor) {
        this.valor = valor;
    }

    public Integer getQf() {
        return qf;
    }

    public void setQf(Integer qf) {
        this.qf = qf;
    }

    public BodcDatos getIdDatos() {
        return idDatos;
    }

    public void setIdDatos(BodcDatos idDatos) {
        this.idDatos = idDatos;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idDetalle != null ? idDetalle.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof BodcDetalleDatos)) {
            return false;
        }
        BodcDetalleDatos other = (BodcDetalleDatos) object;
        if ((this.idDetalle == null && other.idDetalle != null) || (this.idDetalle != null && !this.idDetalle.equals(other.idDetalle))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "org.webmapping.consultaPuntos.bean.BodcDetalleDatos[idDetalle=" + idDetalle + "]";
    }

}
