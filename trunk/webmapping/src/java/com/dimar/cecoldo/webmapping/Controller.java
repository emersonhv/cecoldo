/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dimar.cecoldo.webmapping;

import com.dimar.cecoldo.bean.Gendepartamento;
import com.dimar.cecoldo.bean.GenMunicipio;
import com.dimar.cecoldo.bean.InvCruiseInventory;
import com.dimar.cecoldo.bean.Paises0101;
import com.dimar.cecoldo.bean.SolicitudParametros;
import com.dimar.cecoldo.cruise.CruiseInventoryBackendBean;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.faces.model.SelectItem;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.FlushModeType;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;
import com.dimar.cecoldo.bean.BodcCategory;
import com.dimar.cecoldo.bean.BodcParameter;
import com.dimar.cecoldo.bean.BodcParameterGroup;
import com.dimar.cecoldo.bean.BodcUnits;
import com.dimar.cecoldo.bean.CategoryColor;
import com.dimar.cecoldo.bean.MallaDatos;
import com.dimar.cecoldo.bean.MapPoint;
import com.dimar.cecoldo.bean.TempMalla;
import com.dimar.cecoldo.bean.BodcRequiredParameter;
import com.dimar.cecoldo.bean.CecoldoProperties;
import com.dimar.cecoldo.bean.InvChiefScientist;
import com.dimar.cecoldo.bean.InvCruiseInstitutions;
import com.dimar.cecoldo.bean.InvDiscipline;
import com.dimar.cecoldo.bean.InvInstitutions;
import com.dimar.cecoldo.bean.InvLaboratories;
import com.dimar.cecoldo.bean.InvShipName;
import com.dimar.cecoldo.bean.InvStatus;
import com.dimar.cecoldo.bean.Regionsdes;
import com.dimar.cecoldo.util.CecoldoPropertiesProvider;
import com.dimar.cecoldo.util.MailService;
import java.util.Comparator;
import java.util.Set;
import java.util.TreeSet;
import javax.persistence.TemporalType;

/**
 *
 * @author Administrador
 */
public class Controller {

    private List<CategoryColor> categoryColorList;
    private EntityManagerFactory emf;
    public static Map<Integer, String> COLORS;
    public final int MAX_RESULTS = 200;

    static {
        COLORS = new HashMap<Integer, String>();
        COLORS.put(1, "#FC6456");
        COLORS.put(2, "#964601");
        COLORS.put(3, "#C4C4C4");
        COLORS.put(4, "#4C4CFB");
        COLORS.put(5, "#3DFAF8");
        COLORS.put(6, "#4AFB74");
        COLORS.put(7, "#FBF94E");
        COLORS.put(8, "#A14BFA");
        COLORS.put(9, "#E6E6E6");
        COLORS.put(10, "#F940FB");
        COLORS.put(11, "#016600");
    }

    public List<InvCruiseInventory> advancedSearchInventory(CruiseInventoryBackendBean bean) {
        List<InvCruiseInventory> results = new ArrayList<InvCruiseInventory>();
        String labSql = "";
        String categorySql = "";
        String institutionsSql = "";
        String scientistSql = "";
        String shipNameSql = "";
        if (bean.getLaboratoriesSelected().size() > 0) {
            labSql = ", IN (i.invLaboratoriesCruisesCollection) l";
        }
        if (bean.getDataTypesSelected().size() > 0 || bean.getDisciplineSelected() != -1) {
            categorySql = ", IN (i.invCruiseBodcCategoryCollection) c";
        }
        if (bean.getInstitutionsSelected().size() > 0) {
            institutionsSql = ", IN (i.invCruiseInstitutionsCollection) inst";
        }
        if (bean.getScientistSelected().size() > 0) {
            scientistSql = ", IN (i.invChiefScientistCruiseCollection) scientist";
        }
        String sql = "select distinct i from InvCruiseInventory i" + labSql + institutionsSql + categorySql + scientistSql + " where 1=1 ";
        if (bean.getShipNameSelected() != -1) {
            sql += " and i.shipName.id = " + bean.getShipNameSelected();
        }
        if (bean.getCruiseNameSelected() != -1) {
            sql += " and i.idCruise = " + bean.getCruiseNameSelected();
        }
        if (bean.getBeginDate() != null) {
            sql += " and i.beginDate > :beginDate";
        }
        if (bean.getEndDate() != null) {
            sql += " and i.endDate < :endDate";
        }
//        if (bean.getStatusSelected() != -1) {
//            System.out.println("status --->" + bean.getStatusSelected());
//            sql += " and i.status.idStatus = " + bean.getStatusSelected();
//        }
        if (bean.getAreasSelected().size() > 0) {
            sql += " and i.oceanArea.id in (" + bean.getAreasSelected().get(0);
            for (int i = 1; i < bean.getAreasSelected().size(); i++) {
                sql += ", " + bean.getAreasSelected().get(i);
            }
            sql += ")";
        }
        if (bean.getDisciplineSelected() != -1 && bean.getDataTypesSelected().size() == 0) {
            sql += " and c.bodcCategory.discipline.idDiscipline = " + bean.getDisciplineSelected();
        }
        if (bean.getLaboratoriesSelected().size() > 0) {
            sql += " and l.invLaboratories.idLab in (" + bean.getLaboratoriesSelected().get(0);
            for (int i = 1; i < bean.getLaboratoriesSelected().size(); i++) {
                sql += ", " + bean.getLaboratoriesSelected().get(i);
            }
            sql += ")";
        }
        if (bean.getInstitutionsSelected().size() > 0) {
            sql += " and inst.invInstitutions.idinstitution in (" + bean.getInstitutionsSelected().get(0);
            for (int i = 1; i < bean.getInstitutionsSelected().size(); i++) {
                sql += ", " + bean.getInstitutionsSelected().get(i);
            }
            sql += ")";
        }
        if (bean.getScientistSelected().size() > 0) {
            sql += " and scientist.invChiefScientist.id in (" + bean.getScientistSelected().get(0);
            for (int i = 1; i < bean.getScientistSelected().size(); i++) {
                sql += ", " + bean.getScientistSelected().get(i);
            }
            sql += ")";
        }
        if (bean.getDataTypesSelected().size() > 0) {
            sql += " and c.bodcCategory.code in ('" + bean.getDataTypesSelected().get(0);
            for (int i = 1; i < bean.getDataTypesSelected().size(); i++) {
                sql += "', '" + bean.getDataTypesSelected().get(i);
            }
            sql += "')";
        }
        sql += " order by i." + bean.getOrderBySelected();
        Query query = getEntityManager().createQuery(sql);
        if (bean.getBeginDate() != null) {
            query.setParameter("beginDate", bean.getBeginDate(), TemporalType.DATE);
        }
        if (bean.getEndDate() != null) {
            query.setParameter("endDate", bean.getEndDate(), TemporalType.DATE);
        }
        results = query.getResultList();
        //cruiseNameSelected, beginDate, endDate, statusSelected, areasSelected, disciplineSelected, dataTypesSelected, laboratoriesSelected, orderBySelected
        return results;
    }

    public List<SelectItem> getAllAreas(String lang) {
        List<SelectItem> items = new ArrayList<SelectItem>();
        String sql = "from Regionsdes r where r.regionsdesPK.langId = :lang";
        Query query = getEntityManager().createQuery(sql);
        query.setParameter("lang", lang);
        List<Regionsdes> regions = query.getResultList();
        for (Regionsdes region : regions) {
            SelectItem item = new SelectItem();
            item.setValue(region.getRegions().getId());
            item.setLabel(region.getLabel());
            items.add(item);
        }
        return items;
    }

    public List<SelectItem> getAllCategories() {
        List<SelectItem> items = new ArrayList<SelectItem>();
        String sql = "from BodcCategory order by title";
        Query query = getEntityManager().createQuery(sql);
        List<BodcCategory> categories = query.getResultList();
        for (BodcCategory category : categories) {
            SelectItem item = new SelectItem();
            item.setValue(category.getCode());
            item.setLabel(category.getTitle());
            items.add(item);
        }
        return items;
    }

    public List<SelectItem> getAllCountries() {
        List<SelectItem> items = new ArrayList<SelectItem>();
        String sql = "from Paises0101 p order by p.paiNombrePais";
        Query query = getEntityManager().createQuery(sql);
        List<Paises0101> countries = query.getResultList();
        for (Paises0101 country : countries) {
            SelectItem item = new SelectItem();
            item.setValue(country.getPaiId());
            item.setLabel(country.getPaiNombrePais());
            items.add(item);
        }
        return items;
    }

    public List<SelectItem> getAllCruiseNames() {
        List<SelectItem> items = new ArrayList<SelectItem>();
        String sql = "from InvCruiseInventory n order by n.cruiseName";
        Query query = getEntityManager().createQuery(sql);
        List<InvCruiseInventory> cruiseInventoryList = query.getResultList();
        for (InvCruiseInventory cruiseInventory : cruiseInventoryList) {
            SelectItem item = new SelectItem();
            item.setValue(cruiseInventory.getIdCruise());
            item.setLabel(cruiseInventory.getCruiseName());
            items.add(item);
        }
        return items;
    }

    public List<SelectItem> getAllDisciplines() {
        List<SelectItem> items = new ArrayList<SelectItem>();
        String sql = "from InvDiscipline d";
        Query query = getEntityManager().createQuery(sql);
        List<InvDiscipline> disciplines = query.getResultList();
        for (InvDiscipline discipline : disciplines) {
            SelectItem item = new SelectItem();
            item.setValue(discipline.getIdDiscipline());
            item.setLabel(discipline.getDiscipline());
            items.add(item);
        }
        return items;
    }

    public List<SelectItem> getAllInstitutions() {
        List<SelectItem> items = new ArrayList<SelectItem>();
        String sql = "from InvInstitutions d order by d.institution";
        Query query = getEntityManager().createQuery(sql);
        List<InvInstitutions> institutions = query.getResultList();
        for (InvInstitutions institution : institutions) {
            SelectItem item = new SelectItem();
            item.setValue(institution.getIdinstitution());
            item.setLabel(institution.getInstitution());
            items.add(item);
        }
        return items;
    }

    public List<SelectItem> getAllLaboratories() {
        List<SelectItem> items = new ArrayList<SelectItem>();
        String sql = "from InvLaboratories d order by d.nameLab";
        Query query = getEntityManager().createQuery(sql);
        List<InvLaboratories> laboratories = query.getResultList();
        for (InvLaboratories laboratory : laboratories) {
            SelectItem item = new SelectItem();
            item.setValue(laboratory.getIdLab());
            item.setLabel(laboratory.getNameLab());
            items.add(item);
        }
        return items;
    }

    public List<SelectItem> getAllScientist() {
        List<SelectItem> items = new ArrayList<SelectItem>();
        String sql = "from InvChiefScientist d order by d.firstName";
        Query query = getEntityManager().createQuery(sql);
        List<InvChiefScientist> scientistList = query.getResultList();
        for (InvChiefScientist scientist : scientistList) {
            SelectItem item = new SelectItem();
            item.setValue(scientist.getId());
            item.setLabel(scientist.getFirstName() + " " + scientist.getLastName());
            items.add(item);
        }
        return items;
    }

    public List<SelectItem> getAllShipNames() {
        List<SelectItem> items = new ArrayList<SelectItem>();
        String sql = "from InvShipName n order by n.shipName";
        Query query = getEntityManager().createQuery(sql);
        List<InvShipName> shipNames = query.getResultList();
        for (InvShipName shipName : shipNames) {
            SelectItem item = new SelectItem();
            item.setValue(shipName.getId());
            item.setLabel(shipName.getShipName());
            items.add(item);
        }
        return items;

    }

    public List<SelectItem> getAllStatus() {
        List<SelectItem> items = new ArrayList<SelectItem>();
        String sql = "from InvStatus s order by s.status";
        Query query = getEntityManager().createQuery(sql);
        List<InvStatus> statusList = query.getResultList();
        for (InvStatus status : statusList) {
            SelectItem item = new SelectItem();
            item.setValue(status.getIdStatus());
            item.setLabel(status.getStatus());
            items.add(item);
        }
        return items;
    }

    public List<String> getAllUnits() {
        String sql = "select u.fullTitle || ' [' || u.shortTitle || ']' from BodcUnits u order by u.fullTitle";
        Query query = getEntityManager().createQuery(sql);
        return query.getResultList();
    }

    public BodcCategory getCategoryById(String categoryCode) {
        return (BodcCategory) getEntityManager().createNamedQuery("BodcCategory.findByCode").setParameter("code", categoryCode).getSingleResult();
    }

    public List<SelectItem> getCitiesByDepartament(Integer departament) {
        List<SelectItem> items = new ArrayList<SelectItem>();
        String sql = "from GenMunicipio m where m.depto.idDepartamento = :departament order by m.municipio";
        Query query = getEntityManager().createQuery(sql);
        System.out.println(">>>>" + departament);
        query.setParameter("departament", departament);
        List<GenMunicipio> cities = query.getResultList();
        for (GenMunicipio city : cities) {
            SelectItem item = new SelectItem();
            item.setValue(city.getDane());
            item.setLabel(city.getMunicipio());
            items.add(item);
        }
        return items;
    }

    public GenMunicipio getCityById(String selectedCity) {
        EntityManager em = getEntityManager();

        System.out.println("selectedCity = " + selectedCity);
        try {
            return (GenMunicipio) em.createNamedQuery("GenMunicipio.findByDane").setParameter("dane", selectedCity).getSingleResult();
        } catch (NoResultException e) {
            return null;
        } finally {
            em.close();
        }
    }

    public Paises0101 getCountryById(String selectedCountry) {
        EntityManager em = getEntityManager();
        try {
            return (Paises0101) em.createNamedQuery("Paises0101.findByPaiId").setParameter("paiId", selectedCountry).getSingleResult();
        } catch (NoResultException e) {
            return null;
        } finally {
            em.close();
        }

    }

    public List<SelectItem> getDataTypeByDiscipline(Integer disciplineSelected) {
        List<SelectItem> items = new ArrayList<SelectItem>();
        String sql = "from BodcCategory c where c.discipline.idDiscipline =:discipline order by c.title";
        Query query = getEntityManager().createQuery(sql);
        query.setParameter("discipline", disciplineSelected);
        List<BodcCategory> categories = query.getResultList();
        for (BodcCategory category : categories) {
            SelectItem item = new SelectItem();
            item.setValue(category.getCode());
            item.setLabel(category.getTitle());
            items.add(item);
        }
        return items;

    }

    public Gendepartamento getDepartamentById(Integer selectedDepartament) {
        EntityManager em = getEntityManager();

        try {
            return (Gendepartamento) em.createNamedQuery("Gendepartamento.findByIdDepartamento").setParameter("idDepartamento", selectedDepartament).getSingleResult();
        } catch (NoResultException e) {
            return null;
        } finally {
            em.close();
        }

    }

    public List<SelectItem> getDepartamentsByCountry(String country) {
        List<SelectItem> items = new ArrayList<SelectItem>();
        String sql = "from Gendepartamento a where a.idPais.paiId = :country order by a.nombreDepartamento";
        Query query = getEntityManager().createQuery(sql);
        System.out.println(">>>>" + country);
        query.setParameter("country", country);
        List<Gendepartamento> departaments = query.getResultList();
        for (Gendepartamento departament : departaments) {
            SelectItem item = new SelectItem();
            item.setValue(departament.getIdDepartamento());
            item.setLabel(departament.getNombreDepartamento());
            items.add(item);
        }
        return items;

    }

    public BodcParameterGroup getGroupByTitle(String currentGroup) throws NoResultException {
        Query query = getEntityManager().createNamedQuery("BodcParameterGroup.findByFullTitle");
        query.setParameter("fullTitle", currentGroup);
        return (BodcParameterGroup) query.getSingleResult();
    }

    public List<SelectItem> getGroupsByCategory(String categoryTitle) {
        List<SelectItem> items = new ArrayList<SelectItem>();
        System.out.println(">>>>>>");
        String sql = "select l.bodcParameterGroup from BodcCategoryLink l where l.bodcCategory.code = :categoryTitle order by l.bodcParameterGroup.fullTitle";
        Query query = getEntityManager().createQuery(sql);
        System.out.println(">>>>" + categoryTitle);
        query.setParameter("categoryTitle", categoryTitle);
        List<BodcParameterGroup> groups = query.getResultList();
        for (BodcParameterGroup group : groups) {
            SelectItem item = new SelectItem();
            item.setValue(group.getCode());
            item.setLabel(group.getFullTitle());
            items.add(item);
        }
        return items;
    }

    public List<String> getGroupsByCategoryAsString(String categoryCode) {
        String sql = "select l.bodcParameterGroup.fullTitle from BodcCategoryLink l where l.bodcCategory.code = :categoryCode order by l.bodcParameterGroup.fullTitle";
        Query query = getEntityManager().createQuery(sql);
        query.setParameter("categoryCode", categoryCode);
        List<String> result = query.getResultList();
        return result;
    }

    public List<SelectItem> getInventoryOrderByList() {
        List<SelectItem> items = new ArrayList<SelectItem>();
        SelectItem item = new SelectItem();
        item.setValue("beginDate");
        item.setLabel("Fecha del Crucero");
        items.add(item);
        item = new SelectItem();
        item.setValue("shipName");
        item.setLabel("Nombre del Navío");
        items.add(item);
        item = new SelectItem();
        item.setValue("cruiseName");
        item.setLabel("Nombre del Crucero");
        items.add(item);
        item = new SelectItem();
        item.setValue("idProject.projectName");
        item.setLabel("Nombre del Proyecto");
        items.add(item);

        return items;
    }

    public BodcParameter getParameterById(String selectedParameterCode) {
        System.out.println("selectedParameter " + selectedParameterCode);
        EntityManager em = getEntityManager();
        Query query = em.createNamedQuery("BodcParameter.findByCode");

        query.setParameter("code", selectedParameterCode);
        BodcParameter parameter = (BodcParameter) query.getSingleResult();
        em.close();
        return parameter;

    }

    public List<BodcParameter> getParametersByColumn(String text, String column, Boolean all) {
        String consulta = "SELECT p FROM BodcParameter p where p." + column + " like :text";
        Query query = getEntityManager().createQuery(consulta);
        if (!all) {
            query.setMaxResults(10);
        } else {
            query.setMaxResults(MAX_RESULTS);
        }
        query.setParameter("text", "%" + text + "%");
        ArrayList<BodcParameter> parameters = (ArrayList<BodcParameter>) query.getResultList();
        return parameters;
    }

    public CecoldoProperties getPropertyValue(String key) {
        EntityManager em = getEntityManager();
        Query query = em.createNamedQuery("CecoldoProperties.findByPropertyKey");
        query.setParameter("propertyKey", key);
        return (CecoldoProperties) query.getSingleResult();
    }

    public List<SelectItem> getRetrieveList() {
        List<SelectItem> items = new ArrayList<SelectItem>();
        SelectItem item = new SelectItem();
        item.setValue("10 records at time");
        item.setLabel("Cruise Date");
        items.add(item);
        return items;
    }

    public BodcUnits getUnitsByFullName(String fullTitle) throws NoResultException {
        Query query = getEntityManager().createNamedQuery("BodcUnits.findByFullTitle");
        query.setParameter("fullTitle", fullTitle);
        return (BodcUnits) query.getSingleResult();
    }

    public List<BodcParameter> getparametersByGroup(String groupCode) {
        System.out.println("group " + groupCode);
        String sql = "FROM BodcParameter p where p.groupCode.code = :groupCode";
        Query query = getEntityManager().createQuery(sql);
        query.setMaxResults(MAX_RESULTS);
        query.setParameter("groupCode", groupCode);
        query.setFlushMode(FlushModeType.COMMIT);
        ArrayList<BodcParameter> parameters = (ArrayList<BodcParameter>) query.getResultList();
        return parameters;
    }

    public void saveParametersRequire(SolicitudParametros sp) {
        EntityManager em = getEntityManager();
        em.setFlushMode(FlushModeType.COMMIT);
        EntityTransaction t = em.getTransaction();
        t.begin();
        em.persist(sp);
        t.commit();
        em.close();
    }

    public void sendMailToAdministrator(SolicitudParametros sp, String template) {
        template = template.replace("{0}", sp.getFechaSolicitud().toString());
        template = template.replace("{1}", sp.getNombreInstitucion());
        template = template.replace("{2}", sp.getSolicitante());
        template = template.replace("{3}", sp.getCargoSolicitante());
        template = template.replace("{4}", sp.getCorreoElectronico());
        template = template.replace("{5}", sp.getTelefono());
        template = template.replace("{6}", sp.getIdPais() != null ? sp.getIdPais().getPaiNombrePais() : "");
        template = template.replace("{7}", sp.getIdDepartamento() != null ? sp.getIdDepartamento().getNombreDepartamento() : "");
        template = template.replace("{8}", sp.getIdMunicipio() != null ? sp.getIdMunicipio().getMunicipio() : "");
        template = template.replace("{9}", sp.getObservaciones());
        //parámetros solicitados
        String table = "<table width = '100%' cellspacing='0' cellspadding='0' border='1' style='font-size:10px'>";
        table += "<tr><th>Category</th><th>Group</th><th>Units</th><th>FullTitle</th><th>Definition</th><th>Min. Value</th><th>Max. Value</th></tr>";
        for (BodcRequiredParameter parameter : sp.getBodcRequiredParameterCollection()) {
            table += "<tr>";
            table += "<td>" + parameter.getCategoryCode() + "</td>";
            table += "<td>" + parameter.getGroupCode() + " - " + parameter.getGroupDescription() + "</td>";
            table += "<td>" + parameter.getUnitDescription() + " [" + parameter.getUnitCode() + "]" + "</td>";
            table += "<td>" + parameter.getFullTitle() + "</td>";
            table += "<td>" + parameter.getDefinition() + "</td>";
            table += "<td>" + parameter.getMinPermissValue().intValue() + "</td>";
            table += "<td>" + parameter.getMaxPermissVal().intValue() + "</td>";
            table += "</tr>";
        }
        table += "</table>";
        template = template.replace("{table}", table);
        //envia el correo electrónico
        MailService.getInstance().sendMessageToUser(CecoldoPropertiesProvider.getInstance().getValue(CecoldoProperties.MAIL_ADMINISTRATOR), null, "CECOLDO Admin", template);
    }

    public List<InvCruiseInventory> simpleSearchInventory(String freeSearch) {

        Set<InvCruiseInventory> results = new TreeSet<InvCruiseInventory>(new InventoryComparator());
        String yearSql = "";
        if (isNumber(freeSearch)) {
            yearSql += "or i.year = :year";
        }
        String sql = "SELECT i from InvCruiseInventory i where i.cruiseName like :freeSearch " + yearSql;
        Query query = getEntityManager().createQuery(sql);
        query.setParameter("freeSearch", "%" + freeSearch + "%");
        if (isNumber(freeSearch)) {
            query.setParameter("year", Short.valueOf(freeSearch));
        }
        results.addAll(query.getResultList());
        //pais
        sql = "SELECT i from InvCruiseInventory i "
                + "where i.country.paiNombrePais like :freeSearch";
        query = getEntityManager().createQuery(sql);
        query.setParameter("freeSearch", "%" + freeSearch + "%");
        results.addAll(query.getResultList());
        //puertos
        sql = "SELECT i from InvCruiseInventory i "
                + "where i.unlocodePort.name like :freeSearch "
                + "or i.unlocodePort1.name like :freeSearch ";
        query = getEntityManager().createQuery(sql);
        query.setParameter("freeSearch", "%" + freeSearch + "%");
        results.addAll(query.getResultList());
//                "or i.unlocodePort.name like :freeSearch " +
//                "or i.unlocodePort is null " +
//                "or i.portOfReturn.name like :freeSearch " +
//                "or i.portOfReturn is null " +
        //proyecto
//                        "or i.idProject.projectName like :freeSearch " +
//                "or i.idProject is null " +
        //busca los cruceros donde trabajaó un cientifico con el nombre similar
        sql = "SELECT i from InvCruiseInventory i, IN (i.invChiefScientistCruiseCollection) scientist "
                + "where scientist.invChiefScientist.firstName like :freeSearch "
                + "or scientist.invChiefScientist.lastName like :freeSearch";
        query = getEntityManager().createQuery(sql);
        query.setParameter("freeSearch", "%" + freeSearch + "%");
        results.addAll(query.getResultList());
//        results = orderByDate(results);        
        return new ArrayList<InvCruiseInventory>(results);
    }

    private EntityManager getEntityManager() {
        if (emf == null) {
            emf = Persistence.createEntityManagerFactory("WebMappingPU");
        }
        return emf.createEntityManager();
    }

    public List<MapPoint> getPuntos() {
        List<MapPoint> points = new ArrayList<MapPoint>();
        String consulta = "SELECT c FROM MallaDatos c";
        Query query = getEntityManager().createQuery(consulta);
        ArrayList<MallaDatos> puntos = (ArrayList<MallaDatos>) query.getResultList();
        for (MallaDatos punto : puntos) {
            MapPoint point = new MapPoint();
            point.setId(punto.getNumeroEstacion());
            point.setLat(punto.getLatitud());
            point.setLon(punto.getLongitud());
            point.setCategoryTitle(punto.getDescripcion());
            points.add(point);
        }
        return points;
    }

    public ArrayList<MapPoint> getPuntosCargados(Integer idArchivo) {
        categoryColorList = new ArrayList<CategoryColor>();
        int i = 0;
        ArrayList<MapPoint> points = new ArrayList<MapPoint>();
        String consulta = "SELECT b.latitud, b.longitud FROM BodcDatos b "
                + "WHERE b.idArchivo.idArchivo = :idArchivo "
                + "GROUP BY b.latitud, b.longitud";
        Query query = getEntityManager().createQuery(consulta);
        query.setParameter("idArchivo", idArchivo);
        List<Object[]> result = query.getResultList();
        Map<String, Integer> categoryColors = new HashMap<String, Integer>();
        Integer nextColor = 2;
        Integer color;
        for (Object[] objects : result) {

            System.out.println("objects[0] " + objects[0] + "," + objects[1]);
            //obtengo las diferentes categorias que van en esos puntos lat, lon
            consulta = "select l.category_code, c.title from bodc_detalle_datos d, bodc_datos b, bodc_parameter p, bodc_category_link l, bodc_category c, archivo_datos a "
                    + "where b.id = d.id_datos "
                    + "and l.category_code = c.code "
                    + "and p.code = d.bodc "
                    + "and p.group_code = l.group_code "
                    + "and b.latitud = :latitud and b.longitud = :longitud "
                    + "and a.id_archivo = :idArchivo "
                    + "and a.id_archivo = b.id_archivo";
            query = getEntityManager().createNativeQuery(consulta);
            query.setParameter("latitud", objects[0]);
            query.setParameter("longitud", objects[1]);
            query.setParameter("idArchivo", idArchivo);
            List<Object[]> categories = query.getResultList();

            for (Object[] category : categories) {
                MapPoint point = new MapPoint();
                point.setId(i);
                point.setLat((Double) objects[0]);
                point.setLon((Double) objects[1]);
                point.setCategory((String) category[0]);
                point.setCategoryTitle((String) category[1]);
                if (categoryColors.containsKey(point.getCategory())) {
                    color = categoryColors.get(point.getCategory());
                } else {
                    color = nextColor;
                    categoryColors.put(point.getCategory(), nextColor);
                    CategoryColor categoryColor = new CategoryColor();
                    categoryColor.setCategory(point.getCategoryTitle());
                    categoryColor.setColor(COLORS.get(nextColor));
                    categoryColor.setColorNumber(nextColor);
                    categoryColorList.add(categoryColor);
                    nextColor++;
                }
                point.setColor(color);
                points.add(point);
                i++;
            }
            //select l.category_code from bodc_detalle_datos d, bodc_datos b, bodc_parameter p, bodc_category_link l
            //where b.id = d.id_datos
            //and p.code = d.bodc
            //and p.group_code = l.group_code
            //and b.latitud = 3.3 and b.longitud = -77.45  group by d.bodc;
            //recorro las categorias y creo un punto con cada una.
            //meter en un hash la categoria y el numero que le corresponde 
            //si no tiene numero creamos uno nuevo.
        }
        removeDuplicates(points);
        return points;
    }

    public TempMalla getPuntoMedio() {
        String sql = "select max(c.lon), max(c.lat), min(lon), min(lat) from TempMalla c";
        Query query = getEntityManager().createQuery(sql);
        Object[] objs = (Object[]) query.getSingleResult();
        Double maxLon = (Double) objs[0];
        Double maxLat = (Double) objs[1];
        Double minLon = (Double) objs[2];
        Double minLat = (Double) objs[3];
        Double lonPuntoMedio = minLon + (maxLon - minLon) / 2;
        Double latPuntoMedio = minLat + (maxLat - minLat) / 2;
        TempMalla puntoMedio = new TempMalla();
        puntoMedio.setId(0);
        puntoMedio.setLon(lonPuntoMedio);
        puntoMedio.setLat(latPuntoMedio);
        return puntoMedio;
    }

    private static boolean isNumber(String freeSearch) {
        try {
            Double.parseDouble(freeSearch);
        } catch (NumberFormatException nfe) {
            return false;
        }
        return true;
    }

//    private List<InvCruiseInventory> orderByDate(Set<InvCruiseInventory> results) {
//        
//        InvCruiseInventory temp;
//        for (int i = 0; i < results.size(); i++) {
//            for (int j = i + 1; j < results.size(); j++) {
//                if (results.).getBeginDate().after(results.get(j).getEndDate())) {
//                    temp = results.get(i);
//                    results.set(i, results.get(j));
//                    results.set(j, temp);
//                }
//            }
//        }
//        return results;
//    }
    private void removeDuplicates(List<MapPoint> points) {
        List<MapPoint> toRemove = new ArrayList<MapPoint>();
        for (int i = 0; i
                < points.size() - 1; i++) {
            MapPoint a = points.get(i);
            for (int j = i + 1; j
                    < points.size(); j++) {
                MapPoint b = points.get(j);
                if (a.getColor().intValue() == b.getColor().intValue() && a.getLat() == b.getLat() && a.getLon() == b.getLon()) {
                    toRemove.add(b);
                }

            }
        }
        for (MapPoint mapPoint : toRemove) {
            points.remove(mapPoint);
        }

    }

    public List<CategoryColor> getCategoryColorList() {
        return categoryColorList;
    }

    void saveObservations(String observations) {
        getEntityManager().persist(this);

    }

    public List<InvCruiseInstitutions> getInstitutions(InvCruiseInventory inventory) {
        if (inventory != null) {
            String sql = "select distinct i from InvCruiseInstitutions i where i.invCruiseInventory.idCruise = :idCruise";
            Query query = getEntityManager().createQuery(sql);
            query.setParameter("idCruise", inventory.getIdCruise());
            return query.getResultList();
        }else{
            return new ArrayList<InvCruiseInstitutions>();
        }
    }
}

class InventoryComparator implements Comparator<InvCruiseInventory> {

    @Override
    public int compare(InvCruiseInventory o1, InvCruiseInventory o2) {
        if (o1.getBeginDate().getTime() < o2.getBeginDate().getTime()) {
            return -1;
        } else if (o1.getBeginDate().getTime() == o2.getBeginDate().getTime()) {
            return 0;
        } else {
            return 1;
        }
    }
}
