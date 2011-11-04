package com.dimar.cecoldo.dictionary;

import java.util.ArrayList;
import java.util.List;
import javax.faces.event.ActionEvent;
import javax.faces.model.SelectItem;
import org.richfaces.component.UIDataTable;
import com.dimar.cecoldo.webmapping.Controller;
import com.dimar.cecoldo.bean.BodcCategory;
import com.dimar.cecoldo.bean.BodcParameter;
/** 
 * BackendBean asociado a la jsp welcomeJSF
 * Realiza todas las acciones invocadas mediante ajax en la pagina
 * y devuelve la información requerida por cada uno de los componentes del sistemaa.
 * @author Administrador
 * @version 
 */
public class DictionaryBackendBean {

    private String checkedList;
    private Controller controller;
    private List<BodcParameter> parameters;
    private String suggest;
    private String queryType;
    private String resultsCounter;
    private Boolean viewResults;
    private List<SelectItem> categories;
    private List<SelectItem> groups;
    private String categoryCode;
    private BodcCategory selectedCategory;
    private BodcParameter selectedParameter;
    private String groupCode;
    private UIDataTable resultsTable;
    private Boolean showDetails;

    

    public DictionaryBackendBean() {
        controller = new Controller();
        queryType = "fullTitle";
        categories = controller.getAllCategories();
        categoryCode = "any";
        groups = new ArrayList();
        groupCode = "any";
    }


    public void search(ActionEvent ev) {
        System.out.println("suggest " + suggest);
        parameters = controller.getParametersByColumn(suggest.toUpperCase(), queryType, true);
        resultsCounter = "Results: " + parameters.size();

    }

    public void showDetails(ActionEvent ev) {
        showDetails = true; 
        selectedParameter = (BodcParameter) resultsTable.getRowData();
        selectedCategory = controller.getCategoryById(categoryCode);
        System.out.println("parameter code: " + selectedParameter.getCode());
    }

    public void categoryChangeListener(ActionEvent event) {

        System.out.println("cambiando categoria " + event.toString());
        groups = controller.getGroupsByCategory(categoryCode);
        System.out.println("" + groups.size());
    }

    public void searchByGroup(ActionEvent event) {
        System.out.println(">>>>>>>category selected " + categoryCode);
        parameters = controller.getparametersByGroup(groupCode);
        resultsCounter = parameters.size() + " Resultados";
    }

    public String getCheckedList() {
        return checkedList;
    }

    public void setCheckedList(String checkedList) {
        this.checkedList = checkedList;
    }

    public List<BodcParameter> getParameters() {
        return parameters;
    }

    public void setParameters(List<BodcParameter> parameters) {
        this.parameters = parameters;
    }

    public String getSuggest() {
        return suggest;
    }

    public void setSuggest(String suggest) {
        this.suggest = suggest;
    }

    public String getQueryType() {
        return queryType;
    }

    public void setQueryType(String queryType) {
        this.queryType = queryType;
    }

    public String getResultsCounter() {
        return resultsCounter;
    }

    public void setResultsCounter(String resultsCounter) {
        this.resultsCounter = resultsCounter;
    }

    public Boolean getViewResults() {
        return viewResults;
    }

    public void setViewResults(Boolean viewResults) {
        this.viewResults = viewResults;
    }

    public List<SelectItem> getCategories() {
//        categories = controller.getAllCategories();
        return categories;
    }

    public void setCategories(List<SelectItem> categories) {
        this.categories = categories;
    }

    public List<SelectItem> getGroups() {
//        groups = controller.getGroupsByCategory(categoryCode);
//        groupCode = groups.get(0).getValue().toString();
        return groups;
    }

    public void setGroups(List<SelectItem> groups) {
        this.groups = groups;
    }

    public String getCategoryCode() {
        return categoryCode;
    }

    public void setCategoryCode(String categoryCode) {
        this.categoryCode = categoryCode;
    }

    public String getGroupCode() {
        return groupCode;
    }

    public void setGroupCode(String groupCode) {
        this.groupCode = groupCode;
    }

    public UIDataTable getResultsTable() {
        return resultsTable;
    }

    public void setResultsTable(UIDataTable resultsTable) {
        this.resultsTable = resultsTable;
    }

    public BodcParameter getSelectedParameter() {
        return selectedParameter;
    }

    public void setSelectedParameter(BodcParameter selectedParameter) {
        this.selectedParameter = selectedParameter;
    }

    public BodcCategory getSelectedCategory() {
        return selectedCategory;
    }

    public void setSelectedCategory(BodcCategory selectedCategory) {
        this.selectedCategory = selectedCategory;
    }

    public Boolean getShowDetails() {
        return showDetails;
    }

    public void setShowDetails(Boolean showDetails) {
        this.showDetails = showDetails;
    }

}
