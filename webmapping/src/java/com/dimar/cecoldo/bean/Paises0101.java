    /*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.dimar.cecoldo.bean;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author user
 */
@Entity
@Table(name = "paises_0101")
@NamedQueries({@NamedQuery(name = "Paises0101.findByPaiId", query = "SELECT p FROM Paises0101 p WHERE p.paiId = :paiId"), @NamedQuery(name = "Paises0101.findByPaiNombrePais", query = "SELECT p FROM Paises0101 p WHERE p.paiNombrePais = :paiNombrePais")})
public class Paises0101 implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "pai_id", nullable = false)
    private String paiId;
    @Column(name = "pai_nombre_pais")
    private String paiNombrePais;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idPais")
    private Collection<Gendepartamento> gendepartamentoCollection;
    @OneToMany(mappedBy = "country")
    private Collection<InvChiefScientist> invChiefScientistCollection;
    @OneToMany(mappedBy = "country")
    private Collection<InvLaboratories> invLaboratoriesCollection;
    @OneToMany(mappedBy = "constructionCountry")
    private Collection<InvShipName> invShipNameCollection;
    @OneToMany(mappedBy = "country")
    private Collection<InvCruiseInventory> invCruiseInventoryCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "paises0101")
    private Collection<UnlocodePort> unlocodePortCollection;
    @OneToMany(mappedBy = "country")
    private Collection<InvInstitutions> invInstitutionsCollection;

    public Paises0101() {
    }

    public Paises0101(String paiId) {
        this.paiId = paiId;
    }

    public String getPaiId() {
        return paiId;
    }

    public void setPaiId(String paiId) {
        this.paiId = paiId;
    }

    public String getPaiNombrePais() {
        return paiNombrePais;
    }

    public void setPaiNombrePais(String paiNombrePais) {
        this.paiNombrePais = paiNombrePais;
    }

    public Collection<Gendepartamento> getGendepartamentoCollection() {
        return gendepartamentoCollection;
    }

    public void setGendepartamentoCollection(Collection<Gendepartamento> gendepartamentoCollection) {
        this.gendepartamentoCollection = gendepartamentoCollection;
    }


    public Collection<InvChiefScientist> getInvChiefScientistCollection() {
        return invChiefScientistCollection;
    }

    public void setInvChiefScientistCollection(Collection<InvChiefScientist> invChiefScientistCollection) {
        this.invChiefScientistCollection = invChiefScientistCollection;
    }

    public Collection<InvLaboratories> getInvLaboratoriesCollection() {
        return invLaboratoriesCollection;
    }

    public void setInvLaboratoriesCollection(Collection<InvLaboratories> invLaboratoriesCollection) {
        this.invLaboratoriesCollection = invLaboratoriesCollection;
    }

    public Collection<InvShipName> getInvShipNameCollection() {
        return invShipNameCollection;
    }

    public void setInvShipNameCollection(Collection<InvShipName> invShipNameCollection) {
        this.invShipNameCollection = invShipNameCollection;
    }

    public Collection<InvCruiseInventory> getInvCruiseInventoryCollection() {
        return invCruiseInventoryCollection;
    }

    public void setInvCruiseInventoryCollection(Collection<InvCruiseInventory> invCruiseInventoryCollection) {
        this.invCruiseInventoryCollection = invCruiseInventoryCollection;
    }

    public Collection<UnlocodePort> getUnlocodePortCollection() {
        return unlocodePortCollection;
    }

    public void setUnlocodePortCollection(Collection<UnlocodePort> unlocodePortCollection) {
        this.unlocodePortCollection = unlocodePortCollection;
    }

    public Collection<InvInstitutions> getInvInstitutionsCollection() {
        return invInstitutionsCollection;
    }

    public void setInvInstitutionsCollection(Collection<InvInstitutions> invInstitutionsCollection) {
        this.invInstitutionsCollection = invInstitutionsCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (paiId != null ? paiId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Paises0101)) {
            return false;
        }
        Paises0101 other = (Paises0101) object;
        if ((this.paiId == null && other.paiId != null) || (this.paiId != null && !this.paiId.equals(other.paiId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dimar.cecoldo.bean1.Paises0101[paiId=" + paiId + "]";
    }

}
