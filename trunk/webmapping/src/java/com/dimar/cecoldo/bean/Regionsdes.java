/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.dimar.cecoldo.bean;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
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
@Table(name = "regionsdes")
@NamedQueries({@NamedQuery(name = "Regionsdes.findByIdDes", query = "SELECT r FROM Regionsdes r WHERE r.regionsdesPK.idDes = :idDes"), @NamedQuery(name = "Regionsdes.findByLangId", query = "SELECT r FROM Regionsdes r WHERE r.regionsdesPK.langId = :langId"), @NamedQuery(name = "Regionsdes.findByLabel", query = "SELECT r FROM Regionsdes r WHERE r.label = :label")})
public class Regionsdes implements Serializable {
    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected RegionsdesPK regionsdesPK;
    @Column(name = "label")
    private String label;
    @JoinColumn(name = "idDes", referencedColumnName = "id", insertable = false, updatable = false)
    @ManyToOne
    private Regions regions;

    public Regionsdes() {
    }

    public Regionsdes(RegionsdesPK regionsdesPK) {
        this.regionsdesPK = regionsdesPK;
    }

    public Regionsdes(short idDes, String langId) {
        this.regionsdesPK = new RegionsdesPK(idDes, langId);
    }

    public RegionsdesPK getRegionsdesPK() {
        return regionsdesPK;
    }

    public void setRegionsdesPK(RegionsdesPK regionsdesPK) {
        this.regionsdesPK = regionsdesPK;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }


    @Override
    public int hashCode() {
        int hash = 0;
        hash += (regionsdesPK != null ? regionsdesPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Regionsdes)) {
            return false;
        }
        Regionsdes other = (Regionsdes) object;
        if ((this.regionsdesPK == null && other.regionsdesPK != null) || (this.regionsdesPK != null && !this.regionsdesPK.equals(other.regionsdesPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dimar.cecoldo.bean.Regionsdes[regionsdesPK=" + regionsdesPK + "]";
    }

    public Regions getRegions() {
        return regions;
    }

    public void setRegions(Regions regions) {
        this.regions = regions;
    }

}
