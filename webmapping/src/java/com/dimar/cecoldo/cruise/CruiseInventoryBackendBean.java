package com.dimar.cecoldo.cruise;

import com.dimar.cecoldo.bean.InvCruiseInstitutions;
import com.dimar.cecoldo.bean.InvCruiseInventory;
import com.dimar.cecoldo.bean.InvInstitutions;
import com.dimar.cecoldo.webmapping.Controller;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.faces.model.SelectItem;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import org.ajax4jsf.component.html.HtmlAjaxCommandButton;
import org.ajax4jsf.component.html.HtmlAjaxSupport;
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
    private Double minLat;
    private Double minLon;
    private Double maxLat;
    private Double maxLon;
    private String name;
    private String password;
    private boolean adminRole;
    private HtmlAjaxCommandButton logoutButton;

    public CruiseInventoryBackendBean() {
        controller = new Controller();
        init();
    }

    public void init() {
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

    public String logout(){
//        this.user = null;
        getRequest().getSession().invalidate();
        if (isAuthenticated()) {
            try {
                getRequest().logout();
            } catch (ServletException ex) {
                ex.printStackTrace();
            }
        }
        System.out.println("ha salido el usuario");
        return "logout";
    }

    public boolean isAuthenticated() {
        return getRequest().getUserPrincipal() != null;
    }

    public static HttpServletRequest getRequest() {
        Object request = FacesContext.getCurrentInstance().getExternalContext().getRequest();
        return request instanceof HttpServletRequest
                ? (HttpServletRequest) request : null;
    }
    public String toAdminCruisesAction(){
        System.out.println("to admin cruise");
        return "success";
    }

    public void validateUser(ActionEvent e) {
        try {
            getRequest().login(name, password);
            adminRole = true;
        } catch (Exception ex) {
            ex.printStackTrace();
            adminRole = false;
        }

        System.out.println("validando usuario");
    }

    public void onload(ActionEvent e) {
        System.out.println("On load");
        init();
    }

    public void search(ActionEvent e) {
        resultList = controller.advancedSearchInventory(this);
        resultsCounter = "Results: " + resultList.size();

        System.out.println("buscando.,..");

    }

    public void changeDisciplineListener(ActionEvent e) {
        dataTypeList = controller.getDataTypeByDiscipline(disciplineSelected);
        dataTypesSelected = new ArrayList();
    }

    public void simpleSearch(ActionEvent e) {
        resultList = controller.simpleSearchInventory(freeSearch);
        resultsCounter = "Results: " + resultList.size();
        System.out.println("buscando...........freesearch" + resultsCounter);
    }

    public void showDetails(ActionEvent e) {
        selectedInventory = (InvCruiseInventory) resultsTable.getRowData();
        minLat = selectedInventory.getMinLat();
        minLon = selectedInventory.getMinLon();
        maxLat = selectedInventory.getMaxLat();
        maxLon = selectedInventory.getMaxLon();
        if (minLat == null || minLon == null || maxLat == null || maxLon == null) {
        } else {
        }
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
        this.scientistSelected = null;
        this.shipNameSelected = null;
        if (e.getSource() instanceof HtmlAjaxSupport) {
            this.resultList.clear();
            this.resultsCounter = "Results: 0";
        }
    }

    public List<InvInstitutions> getInstitutions() {
        List<InvCruiseInstitutions> institutions = controller.getInstitutions(selectedInventory);
        Set<InvInstitutions> institutionSet = new HashSet<InvInstitutions>();
        for (int i = 0; i < institutions.size(); i++) {
            institutionSet.add(institutions.get(i).getInvInstitutions());
        }
        return new ArrayList<InvInstitutions>(institutionSet);
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

    /**
     * @return the minLat
     */
    public Double getMinLat() {
        return minLat;
    }

    /**
     * @param minLat the minLat to set
     */
    public void setMinLat(Double minLat) {
        this.minLat = minLat;
    }

    /**
     * @return the minLon
     */
    public Double getMinLon() {
        return minLon;
    }

    /**
     * @param minLon the minLon to set
     */
    public void setMinLon(Double minLon) {
        this.minLon = minLon;
    }

    /**
     * @return the maxLat
     */
    public Double getMaxLat() {
        return maxLat;
    }

    /**
     * @param maxLat the maxLat to set
     */
    public void setMaxLat(Double maxLat) {
        this.maxLat = maxLat;
    }

    /**
     * @return the maxLon
     */
    public Double getMaxLon() {
        return maxLon;
    }

    /**
     * @param maxLon the maxLon to set
     */
    public void setMaxLon(Double maxLon) {
        this.maxLon = maxLon;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the adminRole
     */
    public boolean isAdminRole() {
        return adminRole;
    }

    /**
     * @param adminRole the adminRole to set
     */
    public void setAdminRole(boolean adminRole) {
        this.adminRole = adminRole;
    }
    /**
     * @return the logoutButton
     */
    public HtmlAjaxCommandButton getLogoutButton() {
        return logoutButton;
    }

    /**
     * @param logoutButton the logoutButton to set
     */
    public void setLogoutButton(HtmlAjaxCommandButton logoutButton) {
        this.logoutButton = logoutButton;
    }
}
