/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.dimar.cecoldo.bean;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 *
 * @author user
 */
@Embeddable
public class RegionsdesPK implements Serializable {
    @Column(name = "idDes", nullable = false)
    private short idDes;
    @Column(name = "langId", nullable = false)
    private String langId;

    public RegionsdesPK() {
    }

    public RegionsdesPK(short idDes, String langId) {
        this.idDes = idDes;
        this.langId = langId;
    }

    public short getIdDes() {
        return idDes;
    }

    public void setIdDes(short idDes) {
        this.idDes = idDes;
    }

    public String getLangId() {
        return langId;
    }

    public void setLangId(String langId) {
        this.langId = langId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) idDes;
        hash += (langId != null ? langId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof RegionsdesPK)) {
            return false;
        }
        RegionsdesPK other = (RegionsdesPK) object;
        if (this.idDes != other.idDes) {
            return false;
        }
        if ((this.langId == null && other.langId != null) || (this.langId != null && !this.langId.equals(other.langId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dimar.cecoldo.bean.RegionsdesPK[idDes=" + idDes + ", langId=" + langId + "]";
    }

}
