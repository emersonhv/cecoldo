package com.dimar.cecoldo.dictionary;

import com.dimar.cecoldo.bean.BodcRequiredParameter;
import com.dimar.cecoldo.bean.SolicitudParametros;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.faces.event.ActionEvent;
import javax.faces.model.SelectItem;
import javax.persistence.NoResultException;
import org.hibernate.validator.Email;
import org.hibernate.validator.Length;
import org.hibernate.validator.NotEmpty;
import org.hibernate.validator.Pattern;
import com.dimar.cecoldo.webmapping.Controller;
import com.dimar.cecoldo.bean.BodcParameter;
import com.dimar.cecoldo.bean.BodcParameterGroup;
import com.dimar.cecoldo.bean.BodcUnits;
import java.util.ResourceBundle;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/** 
 * BackendBean asociado a la jsp welcomeJSF
 * Realiza todas las acciones invocadas mediante ajax en la pagina
 * y devuelve la información requerida por cada uno de los componentes del sistemaa.
 * @author Administrador
 * @version 
 */
public class NewParameterBackendBean {

    private Controller controller;
    private Date date;
    @NotEmpty
    @Pattern(regex = ".*[^\\s].*", message = "La cadena contiene solo espacios")
    @Length(min = 4)
    private String institutionName;
    @NotEmpty
    @Pattern(regex = ".*[^\\s].*", message = "La cadena contiene solo espacios")
    @Length(min = 4)
    private String applicant;
    @NotEmpty
    @Pattern(regex = ".*[^\\s].*", message = "La cadena contiene solo espacios")
    private String applicantPosition;
    @NotEmpty
    @Email
    private String email;
    @NotEmpty
    @Length(min = 4)
    private String phone;
    private List<SelectItem> countryList;
    private List<SelectItem> departamentList;
    private List<SelectItem> cityList;
    private String selectedCountry;
    private Integer selectedDepartament;
    private String selectedCity;
    private List<BodcParameter> parameters;
    private BodcParameter currentParameter;
    private String currentGroup;
    private String currentUnits;
    private List<String> unitList;
    private List<String> groupList;
    private List<SelectItem> categories;
    private String categoryCode;
    private String observations;
    private FacesContext fc;
    private HttpSession session;
//    private List<>
    public NewParameterBackendBean() {
        fc = FacesContext.getCurrentInstance();
        session = (HttpSession) fc.getExternalContext().getSession(false);
        controller = new Controller();
        date = Calendar.getInstance().getTime();
        countryList = controller.getAllCountries();
        departamentList = new ArrayList();
        cityList = new ArrayList();
        parameters = new ArrayList<BodcParameter>();
        unitList = controller.getAllUnits();
        currentParameter = new BodcParameter();
        currentParameter.setGroupCode(new BodcParameterGroup());
        currentParameter.setUnitCode(new BodcUnits());
        categories = controller.getAllCategories();
        groupList = controller.getGroupsByCategoryAsString(categories.get(0).getValue().toString());
    }

    public void categoryChangeListener(ActionEvent event) {

        groupList = controller.getGroupsByCategoryAsString(categoryCode);
        currentGroup = groupList.get(0);
    }

    public void countryChangeListener(ActionEvent e) {
        departamentList = controller.getDepartamentsByCountry(selectedCountry);
    }

    public void departamentChangeListener(ActionEvent e) {
        cityList = controller.getCitiesByDepartament(selectedDepartament);
        if (cityList.size() > 0) {
            selectedCity = cityList.get(0).getValue().toString();
        }
    }

    public void addParameterListener(ActionEvent e) {
        try {
            BodcParameterGroup group = controller.getGroupByTitle(currentGroup);
            currentParameter.setGroupCode(group);
        } catch (NoResultException ex) {
            currentParameter.getGroupCode().setCode("NEW");
            currentParameter.getGroupCode().setFullTitle(currentGroup);
        }
        String[] unitParts = currentUnits.split("\\[");
        if (unitParts.length == 2) {
            try {
                BodcUnits unitCode = controller.getUnitsByFullName(unitParts[0].trim());
                currentParameter.setUnitCode(unitCode);
            } catch (NoResultException ex) {
                currentParameter.getUnitCode().setShortTitle(unitParts[1].replace("]", "").trim());
                currentParameter.getUnitCode().setFullTitle(unitParts[0].trim());
            }
        } else {
            currentParameter.getUnitCode().setShortTitle("NOT-PROVIDED");
            currentParameter.getUnitCode().setFullTitle(currentUnits);
        }
        //se almacena la categoria del grupo en el campo BodcLegal temporalmente
        //para tener referencia antes de la insercion.
        currentParameter.setBodcLegal(categoryCode);
        parameters.add(currentParameter);
        //reinicializa el parámetro
        currentParameter = new BodcParameter();
        currentParameter.setGroupCode(new BodcParameterGroup());
        currentParameter.setUnitCode(new BodcUnits());
        categoryCode = categories.get(0).getValue().toString();
        groupList = controller.getGroupsByCategoryAsString(categoryCode);
        currentGroup = "";
        currentUnits = "";
        System.out.println(">>>>>>>>" + "agregando parámetro");
    }

    public void endAddParameterListener(ActionEvent e) {
        SolicitudParametros sp = new SolicitudParametros();
//        sp.setIdSolicitud(0);
        sp.setCargoSolicitante(applicantPosition);
        sp.setCorreoElectronico(email);
        sp.setFechaSolicitud(date);
        sp.setIdDepartamento(controller.getDepartamentById(selectedDepartament));
        sp.setIdPais(controller.getCountryById(selectedCountry));
        sp.setNombreInstitucion(institutionName);
        sp.setObservaciones(observations);
        sp.setSolicitante(applicant);
        sp.setTelefono(phone);
        sp.setIdMunicipio(controller.getCityById(selectedCity));
        List<BodcRequiredParameter> requiredParameters = new ArrayList<BodcRequiredParameter>();
        for (BodcParameter parameter : parameters) {
            BodcRequiredParameter reqParameter = new BodcRequiredParameter();
//            reqParameter.setIdParameter(0);
            reqParameter.setCategoryCode(parameter.getBodcLegal());
            reqParameter.setDefinition(parameter.getDefinition());
            reqParameter.setGroupCode(parameter.getGroupCode().getCode());
            reqParameter.setGroupDescription(parameter.getGroupCode().getFullTitle());
            reqParameter.setMaxPermissVal(parameter.getMaxPermissVal());
            reqParameter.setMinPermissValue(parameter.getMinPermissVal());
            reqParameter.setUnitCode(parameter.getUnitCode().getCode());
            reqParameter.setUnitDescription(parameter.getUnitCode().getFullTitle());
            reqParameter.setFullTitle(parameter.getFullTitle());
            reqParameter.setIdSolicitud(sp);
            requiredParameters.add(reqParameter);
        }
        sp.setBodcRequiredParameterCollection(requiredParameters);
        controller.saveParametersRequire(sp);
        ResourceBundle bundle = ResourceBundle.getBundle("ApplicationMessages", FacesContext.getCurrentInstance().getViewRoot().getLocale());
        String msg = bundle.getString("email_administrator");

        System.out.println("msg = " + msg);
        controller.sendMailToAdministrator(sp, msg);
        try {
            session.setAttribute("sendedNotification", "true");
            fc = FacesContext.getCurrentInstance();
            ((HttpServletResponse) fc.getExternalContext().getResponse()).sendRedirect("DictionaryQuery.jsp");
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getInstitutionName() {
        return institutionName;
    }

    public void setInstitutionName(String institutionName) {
        this.institutionName = institutionName;
    }

    public String getApplicant() {
        return applicant;
    }

    public void setApplicant(String applicant) {
        this.applicant = applicant;
    }

    public String getApplicantPosition() {
        return applicantPosition;
    }

    public void setApplicantPosition(String applicantPosition) {
        this.applicantPosition = applicantPosition;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public List<SelectItem> getDepartamentList() {
        return departamentList;
    }

    public void setDepartamentList(List<SelectItem> departamentList) {
        this.departamentList = departamentList;
    }

    public List<SelectItem> getCountryList() {
        return countryList;
    }

    public void setCountryList(List<SelectItem> countryList) {
        this.countryList = countryList;
    }

    public String getSelectedCountry() {
        return selectedCountry;
    }

    public void setSelectedCountry(String selectedCountry) {
        this.selectedCountry = selectedCountry;
    }

    public Integer getSelectedDepartament() {
        return selectedDepartament;
    }

    public void setSelectedDepartament(Integer selectedDepartament) {
        this.selectedDepartament = selectedDepartament;
    }

    public List<SelectItem> getCityList() {
        return cityList;
    }

    public void setCityList(List<SelectItem> cityList) {
        this.cityList = cityList;
    }

    public String getSelectedCity() {
        return selectedCity;
    }

    public void setSelectedCity(String selectedCity) {
        this.selectedCity = selectedCity;
    }

    public List<BodcParameter> getParameters() {
        return parameters;
    }

    public void setParameters(List<BodcParameter> parameters) {
        this.parameters = parameters;
    }

    public BodcParameter getCurrentParameter() {
        return currentParameter;
    }

    public void setCurrentParameter(BodcParameter currentParameter) {
        this.currentParameter = currentParameter;
    }

    public String getCurrentUnits() {
        return currentUnits;
    }

    public void setCurrentUnits(String currentUnits) {
        this.currentUnits = currentUnits;
    }

    public List<String> getUnitList() {
        return unitList;
    }

    public void setUnitList(List<String> unitList) {
        this.unitList = unitList;
    }

    public String getCurrentGroup() {
        return currentGroup;
    }

    public void setCurrentGroup(String currentGroup) {
        this.currentGroup = currentGroup;
    }

    public List<SelectItem> getCategories() {
        return categories;
    }

    public void setCategories(List<SelectItem> categories) {
        this.categories = categories;
    }

    public String getCategoryCode() {
        return categoryCode;
    }

    public void setCategoryCode(String categoryCode) {
        this.categoryCode = categoryCode;
    }

    public List<String> getGroupList() {
        return groupList;
    }

    public void setGroupList(List<String> groupList) {
        this.groupList = groupList;
    }

    public String getObservations() {
        return observations;
    }

    public void setObservations(String observations) {
        this.observations = observations;
    }
}
