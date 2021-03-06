<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@taglib uri="http://richfaces.org/a4j" prefix="a4j"%>
<%@taglib uri="http://richfaces.org/rich" prefix="rich"%>

<%@taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%--
    This file is an entry point for JavaServer Faces application.
--%>

<html>
    <f:view>
        <f:loadBundle basename="ApplicationMessages" var="msg"/>
        <head>
            <link rel="icon" href="favicon.ico" type="image/x-icon">            
            <script src="javascript/dictionary.js"></script>
            <script src="javascript/OpenLayers.js"></script>
            <link rel="stylesheet" type="text/css" href="styles/styles.css" />
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title><h:outputText value="#{msg.admin_cruise_title}"/></title>
            <script type="text/javascript">
                var map, layer;
                function polygon(minLat, minLon, maxLat, maxLon){
                    clearMap();
                    var polygon = new GPolygon([
                        new GLatLng(minLat, minLon),
                        new GLatLng(minLat, maxLon),
                        new GLatLng(maxLat, maxLon),
                        new GLatLng(maxLat, minLon),
                        new GLatLng(minLat, minLon)
                    ], "#f33f00", 5, 1, "#ff0000", 0.2);
                    map.addOverlay(polygon);     
                        var sw = new GLatLng(minLat, minLon);
                        var ne = new GLatLng(maxLat, maxLon);
                        var bounds = new GLatLngBounds(sw, ne);
                        var fitLevel = map.getBoundsZoomLevel(bounds);
                        if (fitLevel > 1) {
                                fitLevel = fitLevel -1;
                        }
                        var center = new GLatLng(minLat + (maxLat-minLat)/2, minLon + (maxLon-minLon)/2);
                        map.setCenter(center, fitLevel);                    
                    //map.panTo(new GLatLng(centerLat, centerLon));
                }
                
                
                function clearMap(){
                    map.clearOverlays();
                }
            </script>            
        </head>
        <body onload="initVars()">
            <div class="panel_banner">
                <h:form id="myform">
                    <table border="0" width="100%" class="header1" cellspacing="0" cellpadding="0">
                        <tr>
                            <td colspan="3" width="100%">
                                <table width="100%" cellspacing="0">
                                    <tr class="banner">
                                        <td align="left" class="banner">
                                            <img src="images/header-left.jpg" alt="DIMAR" align="top" />
                                        </td>
                                        <td align="right" class="banner">
                                            <img src="images/header-right.jpg" alt="Servicio de Inventario de Cruceros" align="top" />
                                        </td>
                                    </tr>
                                    <tr class="banner">
                                        <td class="banner-menu" align="left">
                                            <a class="banner" href="index.html">Inicio</a>
                                            |
                                            <a class="banner" href="contact.html">Contáctenos</a>
                                            |
                                            <a class="banner" href="help.html">Ayuda</a>
                                            |
                                        </td>
                                        <td class="banner-menu" align="right">
                                            <rich:panel id="loginPanel" styleClass="loginbanner" bodyClass="loginbanner"> 
                                                <h:inputText value="#{cruiseManagedBean.name}" rendered="#{not cruiseManagedBean.adminRole}"/>
                                                <h:inputSecret value="#{cruiseManagedBean.password}" rendered="#{not cruiseManagedBean.adminRole}"/>
                                                <a4j:commandButton actionListener="#{cruiseManagedBean.validateUser}" 
                                                                   value="#{msg.b_login}" 
                                                                   id="loginAction" 
                                                                   reRender="loginPanel"
                                                                   onclick="this.disabled=true; globalNS.runButton=this;" oncomplete="globalNS.runButton.disabled=false;"
                                                                   rendered="#{not cruiseManagedBean.adminRole}"/>
                                                <a href="CruiseQuery.jsp"><h:outputText value="#{msg.b_query_cruises}"/></a>
                                                <a4j:commandButton action="#{cruiseManagedBean.logout}" 
                                                                   value="#{msg.b_logout}" id="logoutAction" 
                                                                   rendered="#{cruiseManagedBean.adminRole}"
                                                                   onclick="this.disabled=true; globalNS.runButton=this;" oncomplete="globalNS.runButton.disabled=false;"
                                                                   reRender="loginPanel"/>
                                                <a class="header_selected" href="#">Español</a>
                                                |
                                                <span class="banner">Inglés</span>
                                            </rich:panel>
                                        </td>
                                        <!--td align="right" class="banner-menu" width="610px"><select class="banner-content content" onchange="location.replace('../' + this.options[this.selectedIndex].value + '/main.home');">
                                                <option value="en">English</option>
                                                <option value="es" selected="">Español</option></select></td-->
                                    </tr>                            
                                    <tr class="banner">
                                        <td class="banner-login" align="right" colspan="2"></td>
                                    </tr>                            
                                </table>
                            </td>
                        </tr>
                    </table>
                    <a4j:jsFunction name="initVars" 
                                    actionListener="#{cruiseAdminManagedBean.onload}"
                                    reRender="details,details3,rootPane">
                    </a4j:jsFunction>
                    <div align="center">
                        <table width="100%" align="center" class="main">
                            <tr>
                                <td align="left">

                                    <table width="100%">
                                        <tr>
                                            <td valign="top" width="100%" colspan="2">
                                                <rich:panel id="rootPane">
                                                    <div>
                                                        <rich:dataTable var="cruise" value="#{cruiseAdminManagedBean.allCruiseInventorys}" 
                                                                        width="100%" cellpadding="1"
                                                                        binding="#{cruiseAdminManagedBean.cruiseInventorysTable}" 
                                                                        rows="10"
                                                                        id="inventoryTable">
                                                            <rich:column style="background-color: #EFF4FA; text-align: center">
                                                                <f:facet name="header">
                                                                    <h:outputText value="#{msg.t_begin_date}" />
                                                                </f:facet>   
                                                                <h:outputText value="#{cruise.beginDate}">
                                                                    <f:convertDateTime pattern="yyyy-MM-dd"/>
                                                                </h:outputText> 
                                                            </rich:column>
                                                            <rich:column style="background-color: #EFF4FA; text-align: center">
                                                                <f:facet name="header">
                                                                    <h:outputText value="#{msg.t_end_date}" />
                                                                </f:facet>   
                                                                <span class="gris">  
                                                                    <h:outputText value="#{cruise.endDate}" styleClass="gris">
                                                                        <f:convertDateTime pattern="yyyy-MM-dd"/>
                                                                    </h:outputText> 
                                                                </span>
                                                            </rich:column>
                                                            <rich:column style="background-color: #EFF4FA;">
                                                                <f:facet name="header">
                                                                    <h:outputText value="#{msg.t_cruiseName}" />
                                                                </f:facet>   
                                                                <span style="color: #CC3300;"> <h:outputText value="#{cruise.cruiseName}" /></span>
                                                            </rich:column>
                                                            <rich:column style="background-color: #EFF4FA; text-align: center" width="50px">
                                                                <f:facet name="header">
                                                                    <h:outputText value="#{msg.t_edit}" />
                                                                </f:facet>   
                                                                <span class="gris">
                                                                    <a4j:commandLink actionListener="#{cruiseAdminManagedBean.editCruiseInventory}" reRender="details,details3,divMapaResult,minLat,minLon,maxLat,maxLon">
                                                                        <h:graphicImage alt="show" url="images/edit.gif" style="border: 0"/>
                                                                    </a4j:commandLink>
                                                                </span>                                                                
                                                            </rich:column>
                                                            <rich:column style="background-color: #EFF4FA; text-align: center" width="50px">
                                                                <f:facet name="header">
                                                                    <h:outputText value="#{msg.t_delete}" />
                                                                </f:facet>   
                                                                <span class="gris">
                                                                    <a4j:commandLink actionListener="#{cruiseAdminManagedBean.deleteCruiseInventory}" reRender="rootPane" onclick="if(confirm('#{msg.confirm_delete} #{cruise.cruiseName}?') == false )  return false;" >
                                                                        <h:graphicImage alt="show" url="images/delete.gif" style="border: 0"/>
                                                                    </a4j:commandLink>
                                                                </span>
                                                            </rich:column>
                                                            <f:facet name="footer">
                                                                <rich:datascroller />
                                                            </f:facet>                                                                
                                                        </rich:dataTable>
                                                    </div>
                                                </rich:panel>
                                                <rich:panel id="divMapaResult" style="visibility: hidden;">
                                                    <script type="text/javascript">
                                                        polygon(<h:outputText value="#{cruiseAdminManagedBean.minLat}"/>, 
                                                        <h:outputText value="#{cruiseAdminManagedBean.minLon}"/>, 
                                                        <h:outputText value="#{cruiseAdminManagedBean.maxLat}"/>, 
                                                        <h:outputText value="#{cruiseAdminManagedBean.maxLon}"/>);
                                                    </script>
                                                </rich:panel>
                                                <a4j:form>
                                                    <rich:panel id="editPanel">
                                                        <f:facet name="header">
                                                            <h:panelGroup>
                                                                <h:outputText value="#{msg.detail_title}"></h:outputText>
                                                            </h:panelGroup>
                                                        </f:facet>                                                    
                                                        <rich:panel id="details">
                                                            <div>
                                                                <table width="100%" style="text-align: left;">
                                                                    <tr>
                                                                        <th>
                                                                            <h:outputText value="#{msg.cruise_name}"/>
                                                                            <span class="mandatory">*</span>
                                                                        </th>
                                                                        <td>
                                                                            <span id="h.cruise_name">
                                                                                <img src="images/help_icon.gif" alt="help"/> 
                                                                                <rich:toolTip for="h.cruise_name">
                                                                                    <div style="width: 350px">
                                                                                        <h:outputText value="#{msg.h_cruise_name}"/>
                                                                                    </div>
                                                                                </rich:toolTip>
                                                                            </span>                                                                                    
                                                                        </td>                                                                
                                                                        <td>
                                                                            <h:inputText value="#{cruiseAdminManagedBean.cruiseName}" id="cruiseName">
                                                                                <rich:ajaxValidator event="onblur"/>
                                                                            </h:inputText>
                                                                            <rich:message for="cruiseName" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th width="20%">
                                                                            <h:outputText value="#{msg.ship_name}"/>
                                                                            <span class="mandatory">*</span>
                                                                        </th>
                                                                        <td>
                                                                            <span id="h.ship_name">
                                                                                <img src="images/help_icon.gif" alt="help"/> 
                                                                                <rich:toolTip for="h.ship_name">
                                                                                    <div style="width: 350px">
                                                                                        <h:outputText value="#{msg.h_ship_name}"/>
                                                                                    </div>
                                                                                </rich:toolTip>
                                                                            </span>                                                                                    
                                                                        </td>                                                                
                                                                        <td>
                                                                            <h:selectOneMenu id="shipNames" value="#{cruiseAdminManagedBean.shipNameSelected}">
                                                                                <f:selectItems value="#{cruiseAdminManagedBean.shipNameList}" />
                                                                            </h:selectOneMenu>                                                            
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th width="20%">
                                                                            <h:outputText value="#{msg.country}"/>
                                                                            <span class="mandatory">*</span>
                                                                        </th>
                                                                        <td>
                                                                            <span id="h.country">
                                                                                <img src="images/help_icon.gif" alt="help"/> 
                                                                                <rich:toolTip for="h.country">
                                                                                    <div style="width: 350px">
                                                                                        <h:outputText value="#{msg.h_country}"/>
                                                                                    </div>
                                                                                </rich:toolTip>
                                                                            </span>                                                                                    
                                                                        </td>                                                                
                                                                        <td>
                                                                            <h:selectOneMenu id="countrys" value="#{cruiseAdminManagedBean.countrySelected}">
                                                                                <f:selectItems value="#{cruiseAdminManagedBean.countryList}" />
                                                                            </h:selectOneMenu>                                                            
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th>
                                                                            <h:outputText value="#{msg.cruise_beginDate}"/>
                                                                            <span class="mandatory">*</span>
                                                                        </th>                                                                
                                                                        <td>
                                                                            <span id="h.cruise_beginDate">
                                                                                <img src="images/help_icon.gif" alt="help"/> 
                                                                                <rich:toolTip for="h.cruise_beginDate">
                                                                                    <div style="width: 350px">
                                                                                        <h:outputText value="#{msg.h_cruise_beginDate}"/>
                                                                                    </div>
                                                                                </rich:toolTip>
                                                                            </span>                                                                                    
                                                                        </td>                                                                
                                                                        <td>
                                                                            <a4j:outputPanel id="beginDatePanel" layout="block">
                                                                                <rich:calendar value="#{cruiseAdminManagedBean.beginDate}"
                                                                                               valueChangeListener="#{cruiseAdminManagedBean.datesValidate}"
                                                                                               binding="#{cruiseAdminManagedBean.beginDateCalendar}"
                                                                                               popup="true"
                                                                                               id="beginDateCalendar"
                                                                                               datePattern="dd/MM/yyyy"
                                                                                               showApplyButton="false" cellWidth="24px" cellHeight="22px" style="width:200px">
                                                                                    <a4j:support event="onchanged" actionListener="#{cruiseAdminManagedBean.datesValidate2}"/>
                                                                                </rich:calendar>
                                                                            </a4j:outputPanel>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th>
                                                                            <h:outputText value="#{msg.cruise_endDate}"/>
                                                                            <span class="mandatory">*</span>
                                                                        </th>                                                                
                                                                        <td>
                                                                            <span id="h.cruise_endDate">
                                                                                <img src="images/help_icon.gif" alt="help"/> 
                                                                                <rich:toolTip for="h.cruise_endDate">
                                                                                    <div style="width: 350px">
                                                                                        <h:outputText value="#{msg.h_cruise_endDate}"/>
                                                                                    </div>
                                                                                </rich:toolTip>
                                                                            </span>                                                                                    
                                                                        </td>                                                                
                                                                        <td>
                                                                            <a4j:outputPanel id="endDatePanel" layout="block">
                                                                                <rich:calendar value="#{cruiseAdminManagedBean.endDate}" 
                                                                                               valueChangeListener="#{cruiseAdminManagedBean.datesValidate}"
                                                                                               binding="#{cruiseAdminManagedBean.endDateCalendar}"
                                                                                               popup="true"
                                                                                               datePattern="dd/MM/yyyy"
                                                                                               showApplyButton="false" cellWidth="24px" cellHeight="22px" style="width:200px" 
                                                                                               id="endDateCalendar">
                                                                                    <a4j:support event="onchanged" actionListener="#{cruiseAdminManagedBean.datesValidate2}"/>
                                                                                </rich:calendar>
                                                                                <rich:message for="endDateCalendar" />
                                                                            </a4j:outputPanel>                                                                            
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th>
                                                                            <h:outputText value="#{msg.cruise_port_of_departure}"/>
                                                                            <span class="mandatory">*</span>
                                                                        </th>
                                                                        <td>
                                                                            <span id="h.cruise_port_of_departure">
                                                                                <img src="images/help_icon.gif" alt="help"/> 
                                                                                <rich:toolTip for="h.cruise_port_of_departure">
                                                                                    <div style="width: 350px">
                                                                                        <h:outputText value="#{msg.h_cruise_port_of_departure}"/>
                                                                                    </div>
                                                                                </rich:toolTip>
                                                                            </span>                                                                                    
                                                                        </td>                                                                         
                                                                        <td>
                                                                            <h:selectOneMenu id="unlocodePort" value="#{cruiseAdminManagedBean.unlocodePortSelected}">
                                                                                <f:selectItems value="#{cruiseAdminManagedBean.unlocodePortList}" />
                                                                            </h:selectOneMenu>                                                                              
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th>
                                                                            <h:outputText value="#{msg.cruise_port_of_return}"/>
                                                                            <span class="mandatory">*</span>
                                                                        </th>
                                                                        <td>
                                                                            <span id="h.cruise_port_of_return">
                                                                                <img src="images/help_icon.gif" alt="help"/> 
                                                                                <rich:toolTip for="h.cruise_port_of_return">
                                                                                    <div style="width: 350px">
                                                                                        <h:outputText value="#{msg.h_cruise_port_of_return}"/>
                                                                                    </div>
                                                                                </rich:toolTip>
                                                                            </span>                                                                                    
                                                                        </td>                                                                        
                                                                        <td>
                                                                            <h:selectOneMenu id="unlocodePort1" value="#{cruiseAdminManagedBean.unlocodePort1Selected}">
                                                                                <f:selectItems value="#{cruiseAdminManagedBean.unlocodePortList}" />
                                                                            </h:selectOneMenu>                                                                              
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th>
                                                                            <h:outputText value="#{msg.cruise_institutions}"/>
                                                                            <span class="mandatory">*</span>
                                                                        </th>                                                                
                                                                        <td>
                                                                            <span id="h.cruise_institutions">
                                                                                <img src="images/help_icon.gif" alt="help"/> 
                                                                                <rich:toolTip for="h.cruise_institutions">
                                                                                    <div style="width: 350px">
                                                                                        <h:outputText value="#{msg.h_cruise_institutions}"/>
                                                                                    </div>
                                                                                </rich:toolTip>
                                                                            </span>                                                                                    
                                                                        </td>                                                                
                                                                        <td>
                                                                            <rich:pickList id="institutionList" value="#{cruiseAdminManagedBean.institutionsSelected}" copyControlLabel="#{msg.add}" copyAllControlLabel="#{msg.add_all}" removeAllControlLabel="#{msg.remove_all}" removeControlLabel="#{msg.remove}" sourceListWidth="180" targetListWidth="180">
                                                                                <f:selectItems value="#{cruiseAdminManagedBean.institutionList}" />
                                                                            </rich:pickList>
                                                                        </td>
                                                                    </tr>                                                            
                                                                    <tr>
                                                                        <th>
                                                                            <h:outputText value="#{msg.cruise_chief_scientist}"/>
                                                                        </th>
                                                                        <td>
                                                                            <span id="h.cruise_chief_scientist">
                                                                                <img src="images/help_icon.gif" alt="help"/> 
                                                                                <rich:toolTip for="h.cruise_chief_scientist">
                                                                                    <div style="width: 350px">
                                                                                        <h:outputText value="#{msg.h_cruise_chief_scientist}"/>
                                                                                    </div>
                                                                                </rich:toolTip>
                                                                            </span>                                                                                    
                                                                        </td>                                                                
                                                                        <td>
                                                                            <rich:pickList id="scientistList" value="#{cruiseAdminManagedBean.scientistSelected}" copyControlLabel="#{msg.add}" copyAllControlLabel="#{msg.add_all}" removeAllControlLabel="#{msg.remove_all}" removeControlLabel="#{msg.remove}" sourceListWidth="180" targetListWidth="180">
                                                                                <f:selectItems value="#{cruiseAdminManagedBean.scientistList}" />
                                                                            </rich:pickList>
                                                                        </td>
                                                                    </tr>
                                                                </table>      
                                                            </div>
                                                        </rich:panel>
                                                        <rich:panel id="details2">           
                                                            <div>
                                                                <table width="100%" style="text-align: left;">
                                                                    <tr>
                                                                        <th width="20%">
                                                                            <h:outputText value="#{msg.cruise_ocean_sea_areas}"/>
                                                                            <span class="mandatory">*</span>
                                                                        </th>
                                                                        <td>
                                                                            <span id="h.cruise_ocean_sea_areas">
                                                                                <img src="images/help_icon.gif" alt="help"/> 
                                                                                <rich:toolTip for="h.cruise_ocean_sea_areas">
                                                                                    <div style="width: 350px">
                                                                                        <h:outputText value="#{msg.h_cruise_ocean_sea_areas}"/>
                                                                                    </div>
                                                                                </rich:toolTip>
                                                                            </span>                                                                                    
                                                                        </td>                                                           
                                                                        <td>
                                                                            <table>
                                                                                <tr>
                                                                                    <td colspan="3" align="center">
                                                                                        <span class="subtitle">
                                                                                            <h:outputText value="#{msg.maxLat}"/>
                                                                                        </span><br/>
                                                                                        <h:inputText value="#{cruiseAdminManagedBean.maxLat}" size="4" id="maxLat"/>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        <span class="subtitle">
                                                                                            <h:outputText value="#{msg.minLon}"/>
                                                                                        </span><br/>
                                                                                        <h:inputText value="#{cruiseAdminManagedBean.minLon}" size="4" id="minLon"/>
                                                                                    </td>
                                                                                    <td width="350px">
                                                                                        <rich:gmap  gmapVar="map" zoom="6" 
                                                                                                    style="width:400px;height:400px" 
                                                                                                    gmapKey="#{msg.key_google_maps}" 
                                                                                                    id="gmap" 
                                                                                                    lat="#{cruiseAdminManagedBean.centralLat}" 
                                                                                                    lng="#{cruiseAdminManagedBean.centralLon}">
                                                                                        </rich:gmap>

                                                                                    </td>
                                                                                    <td>
                                                                                        <span class="subtitle">
                                                                                            <h:outputText value="#{msg.maxLon}"/>
                                                                                        </span><br/>
                                                                                        <h:inputText value="#{cruiseAdminManagedBean.maxLon}" size="4" id="maxLon"/>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td colspan="3" align="center">
                                                                                        <span class="subtitle">
                                                                                            <h:outputText value="#{msg.minLat}"/>
                                                                                        </span><br/>
                                                                                        <h:inputText value="#{cruiseAdminManagedBean.minLat}" size="4" id="minLat"/>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td colspan="3" align="center">
                                                                                        <a4j:commandButton actionListener="#{cruiseAdminManagedBean.updateMap}" 
                                                                                                           value="#{msg.update_map}"
                                                                                                           reRender="divMapaResult">
                                                                                        </a4j:commandButton>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                </table>      
                                                            </div>
                                                        </rich:panel>
                                                        <rich:panel id="details3">           
                                                            <div>
                                                                <table width="100%" style="text-align: left;">
                                                                    <tr>
                                                                        <th width="20%">
                                                                            <h:outputText value="#{msg.details_laboratories}"/>
                                                                        </th>
                                                                        <td>
                                                                            <span id="h.details_laboratories">
                                                                                <img src="images/help_icon.gif" alt="help"/> 
                                                                                <rich:toolTip for="h.details_laboratories">
                                                                                    <div style="width: 350px">
                                                                                        <h:outputText value="#{msg.h_details_laboratories}"/>
                                                                                    </div>
                                                                                </rich:toolTip>
                                                                            </span>                                                                                    
                                                                        </td>                                                                
                                                                        <td>
                                                                            <rich:pickList id="laboratoryList" value="#{cruiseAdminManagedBean.laboratoriesSelected}" copyControlLabel="#{msg.add}" copyAllControlLabel="#{msg.add_all}" removeAllControlLabel="#{msg.remove_all}" removeControlLabel="#{msg.remove}" sourceListWidth="180" targetListWidth="180">
                                                                                <f:selectItems value="#{cruiseAdminManagedBean.laboratoryList}" />
                                                                            </rich:pickList>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th>
                                                                            <h:outputText value="#{msg.cruise_measurements}"/>
                                                                            <span class="mandatory">*</span>
                                                                        </th>
                                                                        <td>
                                                                            <span id="h.cruise_measurements">
                                                                                <img src="images/help_icon.gif" alt="help"/> 
                                                                                <rich:toolTip for="h.cruise_measurements">
                                                                                    <div style="width: 350px">
                                                                                        <h:outputText value="#{msg.h_cruise_measurements}"/>
                                                                                        <a href="DictionaryQuery.jsp" target="_blank">
                                                                                            <h:outputText value="#{msg.h_dataTypeLink}"/>
                                                                                        </a>
                                                                                    </div>
                                                                                </rich:toolTip>
                                                                            </span>                                                                                    
                                                                        </td>                                                                
                                                                        <td>
                                                                            <rich:pickList id="dataTypeList" value="#{cruiseAdminManagedBean.dataTypesSelected}" copyControlLabel="#{msg.add}" copyAllControlLabel="#{msg.add_all}" removeAllControlLabel="#{msg.remove_all}" removeControlLabel="#{msg.remove}" sourceListWidth="180" targetListWidth="180">
                                                                                <f:selectItems value="#{cruiseAdminManagedBean.dataTypeList}" />
                                                                            </rich:pickList>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th>
                                                                            <h:outputText value="#{msg.uri_metadata}"/>
                                                                        </th>
                                                                        <td>
                                                                            <span id="h.uri_metadata">
                                                                                <img src="images/help_icon.gif" alt="help"/> 
                                                                                <rich:toolTip for="h.uri_metadata">
                                                                                    <div style="width: 350px">
                                                                                        <h:outputText value="#{msg.h_uri_metadata}"/>
                                                                                    </div>
                                                                                </rich:toolTip>
                                                                            </span>                                                                                    
                                                                        </td> 
                                                                        <td>
                                                                            <table>
                                                                                <tr>
                                                                                    <th>
                                                                                        <h:outputText value="#{msg.metadata_title}"/>
                                                                                    </th>
                                                                                    <td>
                                                                                        <h:inputText value="#{cruiseAdminManagedBean.metadataTitle}"/>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <th>
                                                                                        <h:outputText value="#{msg.metadata_uri}"/>
                                                                                    </th>
                                                                                    <td>
                                                                                        <h:inputText value="#{cruiseAdminManagedBean.metadataUri}" id="metadataUrl">
                                                                                            <rich:ajaxValidator event="onblur"/>
                                                                                        </h:inputText>
                                                                                        <h:outputText value="#{msg.metadata_uri_example}"/>
                                                                                        <br/><rich:message for="metadataUrl" /> 
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th>
                                                                            <h:outputText value="#{msg.uri_report}"/>
                                                                        </th>
                                                                        <td>
                                                                            <span id="h.uri_report">
                                                                                <img src="images/help_icon.gif" alt="help"/> 
                                                                                <rich:toolTip for="h.uri_report">
                                                                                    <div style="width: 350px">
                                                                                        <h:outputText value="#{msg.h_uri_report}"/>
                                                                                    </div>
                                                                                </rich:toolTip>
                                                                            </span>                                                                                    
                                                                        </td> 
                                                                        <td>
                                                                            <table>
                                                                                <tr>
                                                                                    <th>
                                                                                        <h:outputText value="#{msg.metadata_title}"/>
                                                                                    </th>
                                                                                    <td>
                                                                                        <h:inputText value="#{cruiseAdminManagedBean.reportTitle}"/>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <th>
                                                                                        <h:outputText value="#{msg.metadata_uri}"/>
                                                                                    </th>
                                                                                    <td>
                                                                                        <h:inputText value="#{cruiseAdminManagedBean.reportUri}" id="reportUri">
                                                                                            <rich:ajaxValidator event="onblur"/>
                                                                                        </h:inputText>
                                                                                        <h:outputText value="#{msg.report_uri_example}"/>
                                                                                        <br/><rich:message for="reportUri" /> 
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="3" align="center">
                                                                            <a4j:commandButton value="#{msg.action_insert}" reRender="inventoryTable,details,details3,minLat,minLon,maxLat,maxLon"
                                                                                               actionListener="#{cruiseAdminManagedBean.insertAction}"
                                                                                               rendered="#{not cruiseAdminManagedBean.editable}"
                                                                                               onclick="this.disabled=true; globalNS.runButton=this;" oncomplete="globalNS.runButton.disabled=false;clearMap();"/>
                                                                            <a4j:commandButton  value="#{msg.action_update}"  reRender="inventoryTable,details,details3,minLat,minLon,maxLat,maxLon" 
                                                                                                actionListener="#{cruiseAdminManagedBean.updateAction}"
                                                                                                rendered="false" binding="#{cruiseAdminManagedBean.updateLink}"   
                                                                                                onclick="this.disabled=true; globalNS.runButton=this;" oncomplete="globalNS.runButton.disabled=false;clearMap();"/>
                                                                            <a4j:commandButton value="#{msg.action_cancel}" reRender="inventoryTable,details,details3,minLat,minLon,maxLat,maxLon" 
                                                                                               actionListener="#{cruiseAdminManagedBean.cancelAction}" 
                                                                                               onclick="this.disabled=true; globalNS.runButton=this;" oncomplete="globalNS.runButton.disabled=false;clearMap();"/>
                                                                        </td>
                                                                    </tr>
                                                                </table>      
                                                            </div>
                                                        </rich:panel>
                                                    </rich:panel>
                                                </a4j:form>

                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                </h:form>            

                <table width="975px" align="center">
                    <tr>
                        <td>
                            <table width="100%" class="footer">
                                <tr>
                                    <td class="borde_derecho" align="center">
                                        <table cellpadding="5">
                                            <tr valign="middle" style="vertical-align: middle;">
                                                <td>
                                                    <a target="_blank" href="http://ioc-unesco.org/">
                                                        <img src="images/enlace_coi.png" width="60px"/>
                                                    </a>
                                                </td>
                                                <td>
                                                    <a target="_blank" href="http://www.wmo.int/pages/index_es.html">
                                                        <img src="images/enlace_omm.png" width="60px"/>
                                                    </a>
                                                </td>
                                                <td>
                                                    <a target="_blank" href="http://www.iode.org/">
                                                        <img src="images/enlace_iode.png" width="60px"/>
                                                    </a>
                                                </td>
                                                <td>
                                                    <a target="_blank" href="http://www.odincarsa.org/">
                                                        <img src="images/enlace_odincarsa.png" width="60px"/>
                                                    </a>
                                                </td>
                                                <td>
                                                    <a target="_blank" href="http://www.cpps-int.org/">
                                                        <img src="images/enlace_cpps.png" width="60px"/>
                                                    </a>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="borde_derecho" align="center">
                                        CECOLDO  |  <a href="http://www.cccp.org.co/index.php/component/content/article/945" style="color:#999999;">Política de privacidad</a>  |  Resolución Óptima 1024 x 768 
                                    </td>
                                    <td align="center" valign="middle">
                                        <a target="_blank" href="http://www.gobiernoenlinea.gov.co"><img src="images/gobiernoEnLinea.png" alt="Gobierno en Línea"></a>
                                    </td>
                                    <td align="center" valign="middle">
                                        <a target="_blank" href="http://wsp.presidencia.gov.co/Paginas/Presidencia.aspx"><img src="images/repDeColombia.png" alt="República de Colombia"></a>
                                    </td>
                                </tr>
                            </table>
                        </td>            
                    </tr>
                </table>         
            </div>
        </body>
    </f:view>
</html>

