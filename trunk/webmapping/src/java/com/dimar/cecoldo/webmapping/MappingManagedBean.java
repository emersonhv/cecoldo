/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dimar.cecoldo.webmapping;

import java.util.List;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.servlet.http.HttpServletRequest;
import com.dimar.cecoldo.bean.CategoryColor;
import com.dimar.cecoldo.bean.MapPoint;
import com.dimar.cecoldo.bean.ObservacionDatos;
import com.dimar.cecoldo.bean.TempMalla;

/**
 *
 * @author Alexander Mogollon Diaz, Helbert Dario Rico Lugo
 *
 */
public class MappingManagedBean {

    private FacesContext fc;
    private List<MapPoint> lista;
    private List<MapPoint> bodcDataList;
    private TempMalla puntoMedio;
    private Controller controller;
    private String puntos;
    private String acepto;
    private List<CategoryColor> categoryColors;
    private Integer idArchivo;
    private String observations;
    private Integer currentFile;

    /** Creates a new instance of MappinWEbJSFManagedBean */
    public MappingManagedBean() {
        System.out.println(">>>>>>id Archivo " + idArchivo);
        fc = FacesContext.getCurrentInstance();
        controller = new Controller();
        HttpServletRequest req = (HttpServletRequest) fc.getExternalContext().getRequest();
        if (req.getParameter("idArchivo") != null) {
            idArchivo = Integer.parseInt(req.getParameter("idArchivo"));
            
            bodcDataList = controller.getPuntosCargados(idArchivo);
            lista = controller.getPuntos();
            puntoMedio = controller.getPuntoMedio();
            categoryColors = controller.getCategoryColorList();
        }
    }

    public void sendObservations(ActionEvent ev) {
        ObservacionDatos obs = new ObservacionDatos();
        System.out.println(">>>>>>>>currentFile " + currentFile);
        
//        obs.setIdArchivo(idArchivo);
        controller.saveObservations(observations);
    }

    public List<MapPoint> getLista() {
        return this.lista;
    }

    public void setLista(List<MapPoint> lista) {
        this.lista = lista;
    }

    public String getPuntos() {
        return puntos;
    }

    public void setPuntos(String Puntos) {
        this.puntos = Puntos;
    }

    public TempMalla getPuntoMedio() {
        return puntoMedio;
    }

    public void setPuntoMedio(TempMalla puntoMedio) {
        this.puntoMedio = puntoMedio;
    }

    public String getAcepto() {
        return acepto;
    }

    public void setAcepto(String acepto) {
        this.acepto = acepto;
    }

    public List<MapPoint> getBodcDataList() {
        return bodcDataList;
    }

    public void setBodcDataList(List<MapPoint> bodcDataList) {
        this.bodcDataList = bodcDataList;
    }

    public List<CategoryColor> getCategoryColors() {
        return categoryColors;
    }

    public void setCategoryColors(List<CategoryColor> categoryColors) {
        this.categoryColors = categoryColors;
    }

    public Integer getIdArchivo() {
        return idArchivo;
    }

    public void setIdArchivo(Integer idArchivo) {
        this.idArchivo = idArchivo;
    }

    public String getObservations() {
        return observations;
    }

    public void setObservations(String observations) {
        this.observations = observations;
    }

    public Integer getCurrentFile() {
        return currentFile;
    }

    public void setCurrentFile(Integer currentFile) {
        this.currentFile = currentFile;
    }
}
