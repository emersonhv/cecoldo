package com.dimar.cecoldo.cruise;

import com.dimar.cecoldo.bean.InvCruiseInventory;
import com.dimar.cecoldo.webmapping.Controller;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.faces.event.ActionEvent;
import javax.faces.model.SelectItem;
import org.richfaces.component.UIDataTable;

/** 
 * BackendBean asociado a la jsp welcomeJSF
 * Realiza todas las acciones invocadas mediante ajax en la pagina
 * y devuelve la información requerida por cada uno de los componentes del sistemaa.
 * @author Helbert Dario Rico Lugo
 * @version 
 */
public class CruiseInventoryBackendBean {

    private UIDataTable resultsTable;
    private List<SelectItem> shipNameList;
    private Integer shipNameSelected;
    private List<SelectItem> cruiseNameList;
    private Integer cruiseNameSelected;
    private String freeSearch;
    private String resultsCounter;
    private List<InvCruiseInventory> cruiseInventories;
    private Date beginDate;
    private Date endDate;
    private List<SelectItem> statusList;
    private Integer statusSelected;
    private List<SelectItem> disciplineList;
    private Integer disciplineSelected;
    private List<SelectItem> orderByList;
    private String orderBySelected;
    private List<SelectItem> retrieveList;
    private String retrieveSelected;
    private List<SelectItem> dataTypeList;
    private List<String> dataTypesSelected;
    private List<SelectItem> laboratoryList;
    private List<String> laboratoriesSelected;
    private List<SelectItem> areaList;
    private List<String> areasSelected;
    private String lang = "es";
    private List<InvCruiseInventory> resultList;
    private Controller controller;
    private InvCruiseInventory selectedInventory;
    private List<SelectItem> institutionList;
    private List<String> institutionsSelected;
    private List<SelectItem> scientistList;
    private List<String> scientistSelected;
    
    
    public CruiseInventoryBackendBean() {
        controller = new Controller();
//        cruiseNameList = controller.getAllShipNames(); 
        cruiseNameList = controller.getAllCruiseNames();
        statusList = controller.getAllStatus();
        areaList = controller.getAllAreas(lang);
        disciplineList = controller.getAllDisciplines();
        dataTypeList = controller.getAllCategories();
        laboratoryList = controller.getAllLaboratories();
        orderByList = controller.getInventoryOrderByList();
        retrieveList = controller.getRetrieveList();
        institutionList = controller.getAllInstitutions();
        scientistList = controller.getAllScientist();
        shipNameList = controller.getAllShipNames();
    }

    public void search(ActionEvent e) {
        resultList = controller.advancedSearchInventory(this);
        resultsCounter = "Results: " + resultList.size();

        System.out.println("buscando.,..");

    }
    
    public void changeDisciplineListener(ActionEvent e){
        dataTypeList = controller.getDataTypeByDiscipline(disciplineSelected);
        dataTypesSelected = new ArrayList();
    }

    public void simpleSearch(ActionEvent e) {
        resultList = controller.simpleSearchInventory(freeSearch);
        resultsCounter = "Results: " + resultList.size();
        System.out.println("buscando...........freesearch" + resultsCounter);
    }
    
    public void showDetails(ActionEvent e){
        selectedInventory = (InvCruiseInventory) resultsTable.getRowData();
    }

    public void clean(ActionEvent e) {
        this.areasSelected = null;
        this.beginDate = null;
        this.cruiseNameSelected = -1;
        this.dataTypesSelected = null;
        this.dataTypesSelected = null;
        this.disciplineSelected = null;
        this.endDate = null;
        this.freeSearch = null;
        this.laboratoriesSelected = null;
        this.orderBySelected = null;
        this.retrieveSelected = null;
        this.statusSelected = null;
        this.institutionsSelected = null;
    }

    public UIDataTable getResultsTable() {
        return resultsTable;
    }

    public void setResultsTable(UIDataTable resultsTable) {
        this.resultsTable = resultsTable;
    }

    public String getFreeSearch() {
        return freeSearch;
    }

    public void setFreeSearch(String freeSearch) {
        this.freeSearch = freeSearch;
    }

    public List<InvCruiseInventory> getCruiseInventories() {
        return cruiseInventories;
    }

    public void setCruiseInventories(List<InvCruiseInventory> cruiseInventories) {
        this.cruiseInventories = cruiseInventories;
    }

    public Date getBeginDate() {
        return beginDate;
    }

    public void setBeginDate(Date beginDate) {
        this.beginDate = beginDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public List<SelectItem> getStatusList() {
        return statusList;
    }

    public void setStatusList(List<SelectItem> statusList) {
        this.statusList = statusList;
    }

    public Integer getStatusSelected() {
        return statusSelected;
    }

    public void setStatusSelected(Integer statusSelected) {
        this.statusSelected = statusSelected;
    }

    public List<SelectItem> getAreaList() {
        return areaList;
    }

    public void setAreaList(List<SelectItem> areaList) {
        this.areaList = areaList;
    }

    public List<String> getAreasSelected() {
        return areasSelected;
    }

    public void setAreasSelected(List<String> areasSelected) {
        this.areasSelected = areasSelected;
    }

    public List<SelectItem> getDisciplineList() {
        return disciplineList;
    }

    public void setDisciplineList(List<SelectItem> disciplineList) {
        this.disciplineList = disciplineList;
    }

    public Integer getDisciplineSelected() {
        return disciplineSelected;
    }

    public void setDisciplineSelected(Integer disciplineSelected) {
        this.disciplineSelected = disciplineSelected;
    }

    public List<SelectItem> getDataTypeList() {
        return dataTypeList;
    }

    public void setDataTypeList(List<SelectItem> dataTypeList) {
        this.dataTypeList = dataTypeList;
    }

    public List<SelectItem> getLaboratoryList() {
        return laboratoryList;
    }

    public void setLaboratoryList(List<SelectItem> laboratoryList) {
        this.laboratoryList = laboratoryList;
    }

    public List<String> getLaboratoriesSelected() {
        return laboratoriesSelected;
    }

    public void setLaboratoriesSelected(List<String> laboratoriesSelected) {
        this.laboratoriesSelected = laboratoriesSelected;
    }

    public List<String> getDataTypesSelected() {
        return dataTypesSelected;
    }

    public void setDataTypesSelected(List<String> dataTypesSelected) {
        this.dataTypesSelected = dataTypesSelected;
    }

    public List<SelectItem> getOrderByList() {
        return orderByList;
    }

    public void setOrderByList(List<SelectItem> orderByList) {
        this.orderByList = orderByList;
    }

    public String getOrderBySelected() {
        return orderBySelected;
    }

    public void setOrderBySelected(String orderBySelected) {
        this.orderBySelected = orderBySelected;
    }

    public List<SelectItem> getRetrieveList() {
        return retrieveList;
    }

    public void setRetrieveList(List<SelectItem> retrieveList) {
        this.retrieveList = retrieveList;
    }

    public String getRetrieveSelected() {
        return retrieveSelected;
    }

    public void setRetrieveSelected(String retrieveSelected) {
        this.retrieveSelected = retrieveSelected;
    }

    public List<InvCruiseInventory> getResultList() {
        return resultList;
    }

    public void setResultList(List<InvCruiseInventory> resultList) {
        this.resultList = resultList;
    }

    public List<SelectItem> getCruiseNameList() {
        return cruiseNameList;
    }

    public void setCruiseNameList(List<SelectItem> cruiseNameList) {
        this.cruiseNameList = cruiseNameList;
    }

    public Integer getCruiseNameSelected() {
        return cruiseNameSelected;
    }

    public void setCruiseNameSelected(Integer cruiseNameSelected) {
        this.cruiseNameSelected = cruiseNameSelected;
    }

    public String getResultsCounter() {
        return resultsCounter;
    }

    public void setResultsCounter(String resultsCounter) {
        this.resultsCounter = resultsCounter;
    }

    public InvCruiseInventory getSelectedInventory() {
        return selectedInventory;
    }

    public void setSelectedInventory(InvCruiseInventory selectedInventory) {
        this.selectedInventory = selectedInventory;
    }

    public List<SelectItem> getInstitutionList() {
        return institutionList;
    }

    public void setInstitutionList(List<SelectItem> institutionList) {
        this.institutionList = institutionList;
    }

    public List<String> getInstitutionsSelected() {
        return institutionsSelected;
    }

    public void setInstitutionsSelected(List<String> institutionsSelected) {
        this.institutionsSelected = institutionsSelected;
    }

    public List<SelectItem> getScientistList() {
        return scientistList;
    }

    public void setScientistList(List<SelectItem> scientistList) {
        this.scientistList = scientistList;
    }

    public List<String> getScientistSelected() {
        return scientistSelected;
    }

    public void setScientistSelected(List<String> scientistSelected) {
        this.scientistSelected = scientistSelected;
    }

    public List<SelectItem> getShipNameList() {
        return shipNameList;
    }

    public void setShipNameList(List<SelectItem> shipNameList) {
        this.shipNameList = shipNameList;
    }

    public Integer getShipNameSelected() {
        return shipNameSelected;
    }

    public void setShipNameSelected(Integer shipNameSelected) {
        this.shipNameSelected = shipNameSelected;
    }
}
