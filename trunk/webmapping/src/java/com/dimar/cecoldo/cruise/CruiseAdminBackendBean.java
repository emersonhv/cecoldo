package com.dimar.cecoldo.cruise;

import com.dimar.cecoldo.bean.InvChiefScientistCruise;
import com.dimar.cecoldo.bean.InvCruiseBodcCategory;
import com.dimar.cecoldo.bean.InvCruiseInstitutions;
import com.dimar.cecoldo.bean.InvCruiseInventory;
import com.dimar.cecoldo.bean.InvInstitutions;
import com.dimar.cecoldo.bean.InvLaboratoriesCruises;
import com.dimar.cecoldo.bean.InvMetadata;
import com.dimar.cecoldo.bean.InvProject;
import com.dimar.cecoldo.bean.InvReport;
import com.dimar.cecoldo.bean.Regions;
import com.dimar.cecoldo.bean.UnlocodePortPK;
import com.dimar.cecoldo.webmapping.Controller;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.faces.event.ValueChangeEvent;
import javax.faces.model.SelectItem;
import javax.faces.validator.ValidatorException;
import org.ajax4jsf.component.UIRepeat;
import org.ajax4jsf.component.html.HtmlAjaxCommandButton;
import org.hibernate.validator.Pattern;
import org.richfaces.component.UICalendar;
import org.richfaces.component.UIDataTable;

/** 
 * BackendBean asociado a la jsp welcomeJSF
 * Realiza todas las acciones invocadas mediante ajax en la pagina
 * y devuelve la información requerida por cada uno de los componentes del sistemaa.
 * @author Helbert Dario Rico Lugo
 * @version 
 */
public class CruiseAdminBackendBean {

    private UIDataTable cruiseInventorysTable;
    private UIRepeat metadataRepeater;
    private UIRepeat projectRepeater;
    private UICalendar beginDateCalendar;
    private UICalendar endDateCalendar;
    private HtmlAjaxCommandButton updateLink;
    private List<SelectItem> shipNameList;
    private Short shipNameSelected;
    private List<SelectItem> cruiseNameList;
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
    private List<String> dataTypesSelected = new ArrayList<String>();
    private List<SelectItem> laboratoryList;
    private List<String> laboratoriesSelected = new ArrayList<String>();
    private List<SelectItem> areaList;
    private List<String> areasSelected = new ArrayList<String>();
    private List<SelectItem> unlocodePortList;
    private String unlocodePortSelected;
    private List<SelectItem> countryList;
    private String unlocodePort1Selected;
    private String lang = "es";
    private List<InvCruiseInventory> allCruiseInventorys;
    private Controller controller;
    private InvCruiseInventory selectedInventory;
    private List<SelectItem> institutionList;
    private List<String> institutionsSelected = new ArrayList<String>();
    private List<SelectItem> scientistList;
    private List<String> scientistSelected = new ArrayList<String>();
    private List<InvMetadata> metadataList;
    //Campos del formulario
    private String countrySelected;
    private String cruiseName;
    private String cruiseObjetives;
    private Regions oceanArea;
    private String status;
    private String uriReport;
    private List<InvProject> projectList;
    private String reportTitle;
    @Pattern(regex = "(^$)|(^(http|ftp|https):\\/\\/.*)", message = "La URI no es válida")
    private String reportUri;
    private String metadataTitle;
    @Pattern(regex = "(^$)|(^(http|ftp|https):\\/\\/.*)", message = "La URI no es válida")
    private String metadataUri;
    private boolean editable;
    private boolean toValidate;

    public CruiseAdminBackendBean() {
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
        shipNameList.add(0, new SelectItem("", ""));
        allCruiseInventorys = controller.getAllCruiseInventorys();
        unlocodePortList = controller.getAllUnlocodePorts();
        unlocodePortList.add(0, new SelectItem("", ""));
        countryList = controller.getAllCountries();
        countrySelected = "22";
        toValidate = true;
    }

    public void editCruiseInventory(ActionEvent e) {
        selectedInventory = (InvCruiseInventory) cruiseInventorysTable.getRowData();
        beginDate = selectedInventory.getBeginDate();
        endDate = selectedInventory.getEndDate();
        countrySelected = selectedInventory.getCountry().getPaiNombrePais();
        cruiseName = selectedInventory.getCruiseName();
        cruiseObjetives = selectedInventory.getCruiseObjetives();
        oceanArea = selectedInventory.getOceanArea();
        status = selectedInventory.getStatus();
        uriReport = selectedInventory.getUriReport();
        shipNameSelected = selectedInventory.getShipName().getId();
        institutionsSelected = new ArrayList<String>();
        List<InvCruiseInstitutions> cruiseInstitutions = (List<InvCruiseInstitutions>) selectedInventory.getInvCruiseInstitutionsCollection();
        for (InvCruiseInstitutions cruiseInstitution : cruiseInstitutions) {
            institutionsSelected.add(cruiseInstitution.getInvCruiseInstitutionsPK().getIdinstitution() + "");
        }
        unlocodePortSelected = selectedInventory.getUnlocodePort().getUnlocodePortPK().getCountry() + ";" + selectedInventory.getUnlocodePort().getUnlocodePortPK().getLocation();
        unlocodePort1Selected = selectedInventory.getUnlocodePort1().getUnlocodePortPK().getCountry() + ";" + selectedInventory.getUnlocodePort1().getUnlocodePortPK().getLocation();
        scientistSelected = new ArrayList<String>();
        List<InvChiefScientistCruise> scientists = (List<InvChiefScientistCruise>) selectedInventory.getInvChiefScientistCruiseCollection();
        for (InvChiefScientistCruise scientist : scientists) {
            scientistSelected.add(scientist.getInvChiefScientistCruisePK().getIdChiefScientist());
        }
        laboratoriesSelected = new ArrayList<String>();
        List<InvLaboratoriesCruises> laboratories = (List<InvLaboratoriesCruises>) selectedInventory.getInvLaboratoriesCruisesCollection();
        for (InvLaboratoriesCruises laboratory : laboratories) {
            laboratoriesSelected.add(laboratory.getInvLaboratoriesCruisesPK().getIdLaboratory() + "");
        }
        dataTypesSelected = new ArrayList<String>();
        List<InvCruiseBodcCategory> bodcCategories = (List<InvCruiseBodcCategory>) selectedInventory.getInvCruiseBodcCategoryCollection();
        for (InvCruiseBodcCategory bodcCatgegory : bodcCategories) {
            dataTypesSelected.add(bodcCatgegory.getInvCruiseBodcCategoryPK().getCategoryCode() + "");
        }
        metadataList = (List<InvMetadata>) selectedInventory.getInvMetadataCollection();
        reportTitle = selectedInventory.getIdReport() != null ? selectedInventory.getIdReport().getTitle() : "";
        reportUri = selectedInventory.getIdReport() != null ? selectedInventory.getIdReport().getUri() : "";
        metadataTitle = selectedInventory.getMetadataTitle();
        metadataUri = selectedInventory.getMetadataUrl();
        countrySelected = selectedInventory.getCountry().getPaiId();
        this.setEditable(true);
        this.setToValidate(true);
        this.updateLink.setRendered(true);
    }

    public void deleteCruiseInventory(ActionEvent e) {
        selectedInventory = (InvCruiseInventory) cruiseInventorysTable.getRowData();
        controller.deleteCruiseInventory(selectedInventory);
        this.clearFields();
        updateLink.setRendered(false);
        allCruiseInventorys = controller.getAllCruiseInventorys();
    }

    public void insertAction(ActionEvent e) {
        InvCruiseInventory newInventory = new InvCruiseInventory();
        newInventory.setBeginDate(beginDate);
        newInventory.setCountry(controller.getCountryById(countrySelected));
        newInventory.setCruiseName(cruiseName);
        newInventory.setCruiseObjetives(cruiseObjetives);
        newInventory.setEndDate(endDate);
        InvReport report = new InvReport();
        report.setTitle(reportTitle);
        report.setUri(reportUri);
        newInventory.setIdReport(report);
        newInventory.setMetadataTitle(metadataTitle);
        newInventory.setMetadataUrl(metadataUri);
        newInventory.setShipName(controller.getInvShipName(shipNameSelected));
        newInventory.setStatus("0");
        String[] unlocodePKData = unlocodePortSelected.split(";");
        newInventory.setUnlocodePort(controller.getUnlocodePort(new UnlocodePortPK(unlocodePKData[0], unlocodePKData[1])));
        String[] unlocode1PKData = unlocodePort1Selected.split(";");
        newInventory.setUnlocodePort1(controller.getUnlocodePort(new UnlocodePortPK(unlocode1PKData[0], unlocode1PKData[1])));
        scientistSelected = new ArrayList<String>(new HashSet<String>(scientistSelected));
        institutionsSelected = new ArrayList<String>(new HashSet<String>(institutionsSelected));
        laboratoriesSelected = new ArrayList<String>(new HashSet<String>(laboratoriesSelected));
        dataTypesSelected = new ArrayList<String>(new HashSet<String>(dataTypesSelected));
        controller.insertInvCruiseInventory(newInventory, scientistSelected, institutionsSelected, laboratoriesSelected, dataTypesSelected);
        this.setToValidate(true);
        this.clearFields();
        allCruiseInventorys = controller.getAllCruiseInventorys();
    }

    public void updateAction(ActionEvent e) {
        if(!isDatesValid()){
            return;
        }
        InvCruiseInventory newInventory = this.getSelectedInventory();
        newInventory.setBeginDate(beginDate);
        newInventory.setCountry(controller.getCountryById(countrySelected));
        newInventory.setCruiseName(cruiseName);
        newInventory.setCruiseObjetives(cruiseObjetives);
        newInventory.setEndDate(endDate);
        InvReport report = new InvReport();
        report.setTitle(reportTitle);
        report.setUri(reportUri);
        newInventory.setIdReport(report);
        newInventory.setMetadataTitle(metadataTitle);
        newInventory.setMetadataUrl(metadataUri);
        newInventory.setShipName(controller.getInvShipName(shipNameSelected));
        newInventory.setStatus("0");
        String[] unlocodePKData = unlocodePortSelected.split(";");
        newInventory.setUnlocodePort(controller.getUnlocodePort(new UnlocodePortPK(unlocodePKData[0], unlocodePKData[1])));
        String[] unlocode1PKData = unlocodePort1Selected.split(";");
        newInventory.setUnlocodePort1(controller.getUnlocodePort(new UnlocodePortPK(unlocode1PKData[0], unlocode1PKData[1])));
        scientistSelected = new ArrayList<String>(new HashSet<String>(scientistSelected));
        institutionsSelected = new ArrayList<String>(new HashSet<String>(institutionsSelected));
        laboratoriesSelected = new ArrayList<String>(new HashSet<String>(laboratoriesSelected));
        dataTypesSelected = new ArrayList<String>(new HashSet<String>(dataTypesSelected));
        controller.updateInvCruiseInventory(newInventory, scientistSelected, institutionsSelected, laboratoriesSelected, dataTypesSelected);
//        this.clearFields();
//        this.setEditable(false);
        this.setToValidate(false);
//        this.updateLink.setRendered(false);
    }

    public void cancelAction(ActionEvent e) {
        this.clearFields();
        this.setEditable(false);
        this.setToValidate(true);
        this.updateLink.setRendered(false);
    }

    public void datesValidate(ValueChangeEvent event) {
        isDatesValid();
    }

    public void datesValidate2(ActionEvent event) {
        //NO BORRAR PORQUE ES NECESARIO PARA QUE LOS EVENTOS DE LOS CALENDAR FUNCIONEN APROPIADAMENTE.
    }

    public List<InvInstitutions> getInstitutions() {
        List<InvCruiseInstitutions> institutions = controller.getInstitutions(selectedInventory);
        Set<InvInstitutions> institutionSet = new HashSet<InvInstitutions>();
        for (int i = 0; i < institutions.size(); i++) {
            institutionSet.add(institutions.get(i).getInvInstitutions());
        }
        return new ArrayList<InvInstitutions>(institutionSet);
    }

    public UIDataTable getCruiseInventorysTable() {
        return cruiseInventorysTable;
    }

    public void setCruiseInventorysTable(UIDataTable resultsTable) {
        this.cruiseInventorysTable = resultsTable;
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

    public List<InvCruiseInventory> getAllCruiseInventorys() {
        return allCruiseInventorys;
    }

    public List<SelectItem> getCruiseNameList() {
        return cruiseNameList;
    }

    public void setCruiseNameList(List<SelectItem> cruiseNameList) {
        this.cruiseNameList = cruiseNameList;
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

    public Short getShipNameSelected() {
        return shipNameSelected;
    }

    public void setShipNameSelected(Short shipNameSelected) {
        this.shipNameSelected = shipNameSelected;
    }

    /**
     * @return the country
     */
    public String getCountrySelected() {
        return countrySelected;
    }

    /**
     * @param country the country to set
     */
    public void setCountrySelected(String country) {
        this.countrySelected = country;
    }

    /**
     * @return the cruiseName
     */
    public String getCruiseName() {
        return cruiseName;
    }

    /**
     * @param cruiseName the cruiseName to set
     */
    public void setCruiseName(String cruiseName) {
        this.cruiseName = cruiseName;
    }

    /**
     * @return the cruiseObjetives
     */
    public String getCruiseObjetives() {
        return cruiseObjetives;
    }

    /**
     * @param cruiseObjetives the cruiseObjetives to set
     */
    public void setCruiseObjetives(String cruiseObjetives) {
        this.cruiseObjetives = cruiseObjetives;
    }

    /**
     * @return the oceanArea
     */
    public Regions getOceanArea() {
        return oceanArea;
    }

    /**
     * @param oceanArea the oceanArea to set
     */
    public void setOceanArea(Regions oceanArea) {
        this.oceanArea = oceanArea;
    }

    /**
     * @return the status
     */
    public String getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * @return the uriReport
     */
    public String getUriReport() {
        return uriReport;
    }

    /**
     * @param uriReport the uriReport to set
     */
    public void setUriReport(String uriReport) {
        this.uriReport = uriReport;
    }

    /**
     * @return the unlocodePortList
     */
    public List<SelectItem> getUnlocodePortList() {
        return unlocodePortList;
    }

    /**
     * @param unlocodePortList the unlocodePortList to set
     */
    public void setUnlocodePortList(List<SelectItem> unlocodePortList) {
        this.unlocodePortList = unlocodePortList;
    }

    /**
     * @return the unlocodePortSelected
     */
    public String getUnlocodePortSelected() {
        return unlocodePortSelected;
    }

    /**
     * @param unlocodePortSelected the unlocodePortSelected to set
     */
    public void setUnlocodePortSelected(String unlocodePortSelected) {
        this.unlocodePortSelected = unlocodePortSelected;
    }

    /**
     * @return the unlocodePort1Selected
     */
    public String getUnlocodePort1Selected() {
        return unlocodePort1Selected;
    }

    /**
     * @param unlocodePort1Selected the unlocodePort1Selected to set
     */
    public void setUnlocodePort1Selected(String unlocodePort1Selected) {
        this.unlocodePort1Selected = unlocodePort1Selected;
    }

    public void setMetadataRepeater(UIRepeat repeater) {
        this.metadataRepeater = repeater;
    }

    public UIRepeat getMetadataRepeater() {
        return metadataRepeater;
    }

    /**
     * @return the metadataList
     */
    public List<InvMetadata> getMetadataList() {
        return metadataList;
    }

    /**
     * @param metadataList the metadataList to set
     */
    public void setMetadataList(List<InvMetadata> metadataList) {
        this.metadataList = metadataList;
    }

    /**
     * @return the projectList
     */
    public List<InvProject> getProjectList() {
        return projectList;
    }

    /**
     * @param projectList the projectList to set
     */
    public void setProjectList(List<InvProject> projectList) {
        this.projectList = projectList;
    }

    /**
     * @return the projectRepeater
     */
    public UIRepeat getProjectRepeater() {
        return projectRepeater;
    }

    /**
     * @param projectRepeater the projectRepeater to set
     */
    public void setProjectRepeater(UIRepeat projectRepeater) {
        this.projectRepeater = projectRepeater;
    }

    /**
     * @return the reportTitle
     */
    public String getReportTitle() {
        return reportTitle;
    }

    /**
     * @param reportTitle the reportTitle to set
     */
    public void setReportTitle(String reportTitle) {
        this.reportTitle = reportTitle;
    }

    /**
     * @return the reportUri
     */
    public String getReportUri() {
        return reportUri;
    }

    /**
     * @param reportUri the reportUri to set
     */
    public void setReportUri(String reportUri) {
        this.reportUri = reportUri;
    }

    /**
     * @return the metadataTitle
     */
    public String getMetadataTitle() {
        return metadataTitle;
    }

    /**
     * @param metadataTitle the metadataTitle to set
     */
    public void setMetadataTitle(String metadataTitle) {
        this.metadataTitle = metadataTitle;
    }

    /**
     * @return the metadataUri
     */
    public String getMetadataUri() {
        return metadataUri;
    }

    /**
     * @param metadataUri the metadataUri to set
     */
    public void setMetadataUri(String metadataUri) {
        this.metadataUri = metadataUri;
    }

    /**
     * @return the editable
     */
    public boolean isEditable() {
        return editable;
    }

    /**
     * @param editable the editable to set
     */
    public void setEditable(boolean editable) {
        this.editable = editable;
    }

    /**
     * @return the updateLink
     */
    public HtmlAjaxCommandButton getUpdateLink() {
        return updateLink;
    }

    /**
     * @param updateLink the updateLink to set
     */
    public void setUpdateLink(HtmlAjaxCommandButton updateLink) {
        this.updateLink = updateLink;
    }

    private void clearFields() {
        beginDate = null;
        this.cruiseName = "";
        this.cruiseObjetives = "";
        this.dataTypesSelected = new ArrayList<String>();
        this.endDate = null;
        this.institutionsSelected = new ArrayList<String>();
        this.laboratoriesSelected = new ArrayList<String>();
        this.metadataTitle = "";
        this.metadataUri = "";
        this.reportTitle = "";
        this.reportUri = "";
        this.scientistSelected = new ArrayList<String>();
        this.shipNameSelected = 0;
        this.unlocodePortSelected = "";
        this.unlocodePort1Selected = "";
    }

    /**
     * @return the countryList
     */
    public List<SelectItem> getCountryList() {
        return countryList;
    }

    /**
     * @param countryList the countryList to set
     */
    public void setCountryList(List<SelectItem> countryList) {
        this.countryList = countryList;
    }

    /**
     * @return the endDateCalendar
     */
    public UICalendar getEndDateCalendar() {
        return endDateCalendar;
    }

    /**
     * @param endDateCalendar the endDateCalendar to set
     */
    public void setEndDateCalendar(UICalendar endDateCalendar) {
        this.endDateCalendar = endDateCalendar;
    }

    /**
     * @return the beginDateCalendar
     */
    public UICalendar getBeginDateCalendar() {
        return beginDateCalendar;
    }

    /**
     * @param beginDateCalendar the beginDateCalendar to set
     */
    public void setBeginDateCalendar(UICalendar beginDateCalendar) {
        this.beginDateCalendar = beginDateCalendar;
    }

    /**
     * @return the validate
     */
    public boolean isToValidate() {
        return toValidate;
    }

    /**
     * @param validate the validate to set
     */
    public void setToValidate(boolean validate) {
        this.toValidate = validate;
    }

    private boolean isDatesValid() {
        long diff = ((Date) endDateCalendar.getValue()).getTime() - ((Date) beginDateCalendar.getValue()).getTime();
        long diffDays = diff / (24 * 60 * 60 * 1000);
        System.out.println("diferencia en dias " + diffDays);
        if (diff < 0) {
            //la fecha de inicio es mayor que la fecha fin
            FacesMessage message = new FacesMessage("La fecha de inicio no puede ser mayor que la fecha final");
            FacesContext.getCurrentInstance().addMessage(endDateCalendar.getClientId(FacesContext.getCurrentInstance()), message);
            return false;
        } else if (diffDays > 90) {
            FacesMessage message = new FacesMessage("La diferencia entre la fecha de inicio y la fecha final debe ser menor a 90 días");
            FacesContext.getCurrentInstance().addMessage(endDateCalendar.getClientId(FacesContext.getCurrentInstance()), message);
            return false;
        }        
        return true;
    }
}
