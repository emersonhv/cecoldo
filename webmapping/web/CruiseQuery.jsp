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
            <script src="javascript/dictionary.js"></script>
            <script type="text/javascript">
                var map, layer;
                function polygon(minLat, minLon, maxLat, maxLon){
                    var polygon = new GPolygon([
                        new GLatLng(minLat, minLon),
                        new GLatLng(minLat, maxLon),
                        new GLatLng(maxLat, maxLon),
                        new GLatLng(maxLat, minLon),
                        new GLatLng(minLat, minLon)
                    ], "#f33f00", 5, 1, "#ff0000", 0.2);
                    map.addOverlay(polygon);     
                    var mapdisplay = 250;
                    var dist = (6371 * Math.acos(Math.sin(minLat / 57.2958) * Math.sin(maxLat / 57.2958) + (Math.cos(minLat / 57.2958) * Math.cos(maxLat / 57.2958) * Math.cos((maxLon / 57.2958) - (minLon / 57.2958)))));
                    var fitLevel = Math.floor(8 - Math.log(1.6446 * dist / Math.sqrt(2 * (mapdisplay * mapdisplay))) / Math.log (2));
                    //                    alert('fitLevel:' + fitLevel);
                    //                        if (fitLevel > 1) {
                    //                                fitLevel = fitLevel -1;
                    //                        }
                    var center = new GLatLng(minLat + (maxLat - minLat)/2, minLon + (maxLon - minLon)/2);
                    //                    alert("bounds:" + map.getBounds());
                    //                    alert("lat:" + center.lat() + ", lon:" + center.lng());
                    map.setCenter(center, fitLevel);
                    //                    alert(map.getCenter());
                    //                    //map.panTo(new GLatLng(centerLat, centerLon));
                }
                
                
                function clearMap(){
                    map.clearOverlays();
                }
                function defaultCenterMap(){
                    var center = new GLatLng(4, -79);
                    map.setCenter(center);
                }
            </script>            

            <link rel="stylesheet" type="text/css" href="styles/styles.css" />
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title><h:outputText value="#{msg.cruise_title}"/></title>
        </head>
        <body onload="initVars()">
            <div class="panel_banner">
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
                                        <a class="header_selected" href="#">Español</a>
                                        |
                                        <span class="banner">Inglés</span>
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
                <h:form id="myform">
                    <a4j:jsFunction name="initVars" 
                                    actionListener="#{cruiseManagedBean.onload}"
                                    reRender="advancedPanel">                        
                    </a4j:jsFunction>
                    <div align="center">
                        <table width="100%" align="center" class="main">
                            <tr>
                                <td align="left">

                                    <table width="100%">
                                        <tr>
                                            <td valign="top" width="100%" colspan="2">
                                                <rich:tabPanel switchType="client" id="tab">
                                                    <rich:tab label="Consulta Sencilla" id="simpleTab">
                                                        <a4j:support event="onlabelclick" actionListener="#{cruiseManagedBean.clean}" reRender="resultsCounter, resultList, advancedPanel"/>
                                                        <a4j:region id="freeSearch">                                                
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <h:outputText value="#{msg.cruise_freeSearch}"/>
                                                                    </td>                                                                
                                                                    <td>
                                                                        <span id="h.freeSearch">
                                                                            <img src="images/help_icon.gif" alt="help"/> 
                                                                            <rich:toolTip for="h.freeSearch">
                                                                                <div style="width: 350px">
                                                                                    <h:outputText value="#{msg.h_freeSearch}"/>
                                                                                </div>
                                                                            </rich:toolTip>
                                                                        </span>                                                                                    
                                                                    </td>                                                                
                                                                    <td>
                                                                        <h:inputText value="#{cruiseManagedBean.freeSearch}" id="free_search_id">
                                                                        </h:inputText>
                                                                        <rich:hotKey key="return"
                                                                                     handler="#{rich:element('searchButton')}.click()"
                                                                                     selector="#free_search_id"/>                                                                        
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center">
                                                                        <a4j:status for="freeSearch">
                                                                            <f:facet name="start">
                                                                                <h:graphicImage  value="images/ajax-loader.gif"/>
                                                                            </f:facet>
                                                                        </a4j:status>
                                                                    </td>
                                                                    <td colspan="2" align="center">
                                                                        <a4j:commandButton actionListener="#{cruiseManagedBean.clean}" value="#{msg.clean}" reRender="resultsCounter, resultList, advancedPanel" onclick="this.disabled=true; globalNS.runButton=this;" oncomplete="globalNS.runButton.disabled=false;"/>                                                                        
                                                                        <a4j:commandButton id="searchButton" actionListener="#{cruiseManagedBean.simpleSearch}" value="#{msg.searchCruise}" reRender="resultsCounter, resultList" onclick="this.disabled=true; globalNS.runButton=this;" oncomplete="globalNS.runButton.disabled=false;"/>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </a4j:region>
                                                    </rich:tab>
                                                    <rich:tab label="Consulta Avanzada" id="advancedTab">
                                                        <a4j:support event="onlabelclick" actionListener="#{cruiseManagedBean.clean}" reRender="resultsCounter, resultList, advancedPanel"/>
                                                        <a4j:outputPanel id="advancedPanel">
                                                            <a4j:region id="advancedRegion">
                                                                <table>
                                                                    <tr>
                                                                        <td>
                                                                            <h:outputText value="#{msg.cruise_shipName}"/>
                                                                        </td>                                                                
                                                                        <td>
                                                                            <span id="h.shipName">
                                                                                <img src="images/help_icon.gif" alt="help"/> 
                                                                                <rich:toolTip for="h.shipName">
                                                                                    <div style="width: 350px">
                                                                                        <h:outputText value="#{msg.h_shipName}"/>
                                                                                    </div>
                                                                                </rich:toolTip>
                                                                            </span>                                                                                    
                                                                        </td>                                                                
                                                                        <td>
                                                                            <h:selectOneMenu id="shipNames" value="#{cruiseManagedBean.shipNameSelected}">
                                                                                <f:selectItem itemValue="-1" itemLabel=""/>
                                                                                <f:selectItems value="#{cruiseManagedBean.shipNameList}" />
                                                                            </h:selectOneMenu>                                                            
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <h:outputText value="#{msg.cruise_name}"/>
                                                                        </td>                                                                
                                                                        <td>
                                                                            <span id="h.cruiseName">
                                                                                <img src="images/help_icon.gif" alt="help"/> 
                                                                                <rich:toolTip for="h.cruiseName">
                                                                                    <div style="width: 350px">
                                                                                        <h:outputText value="#{msg.h_cruiseName}"/>
                                                                                    </div>
                                                                                </rich:toolTip>
                                                                            </span>                                                                                    
                                                                        </td>                                                                
                                                                        <td>
                                                                            <h:selectOneMenu id="cruiseNames" value="#{cruiseManagedBean.cruiseNameSelected}">
                                                                                <f:selectItem itemValue="-1" itemLabel=""/>
                                                                                <f:selectItems value="#{cruiseManagedBean.cruiseNameList}" />
                                                                            </h:selectOneMenu>                                                            
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <h:outputText value="#{msg.cruise_beginDate}"/>
                                                                        </td>                                                                
                                                                        <td>
                                                                            <span id="h.beginDate">
                                                                                <img src="images/help_icon.gif" alt="help"/> 
                                                                                <rich:toolTip for="h.beginDate">
                                                                                    <div style="width: 350px">
                                                                                        <h:outputText value="#{msg.h_beginDate}"/>
                                                                                    </div>
                                                                                </rich:toolTip>
                                                                            </span>                                                                                    
                                                                        </td>                                                                
                                                                        <td>
                                                                            <a4j:outputPanel id="beginDatePanel" layout="block">
                                                                                <rich:calendar value="#{cruiseManagedBean.beginDate}"
                                                                                               popup="true"
                                                                                               datePattern="dd/MM/yyyy"
                                                                                               showApplyButton="false" cellWidth="24px" cellHeight="22px" style="width:200px"/>
                                                                            </a4j:outputPanel>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <h:outputText value="#{msg.cruise_endDate}"/>
                                                                        </td>                                                                
                                                                        <td>
                                                                            <span id="h.endDate">
                                                                                <img src="images/help_icon.gif" alt="help"/> 
                                                                                <rich:toolTip for="h.endDate">
                                                                                    <div style="width: 350px">
                                                                                        <h:outputText value="#{msg.h_endDate}"/>
                                                                                    </div>
                                                                                </rich:toolTip>
                                                                            </span>                                                                                    
                                                                        </td>                                                                
                                                                        <td>
                                                                            <a4j:outputPanel id="endDatePanel" layout="block">
                                                                                <rich:calendar value="#{cruiseManagedBean.endDate}"
                                                                                               popup="true"
                                                                                               datePattern="dd/MM/yyyy"
                                                                                               showApplyButton="false" cellWidth="24px" cellHeight="22px" style="width:200px"/>
                                                                            </a4j:outputPanel>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <h:outputText value="#{msg.cruise_institutions}"/>
                                                                        </td>                                                                
                                                                        <td>
                                                                            <span id="h.cruiseInstitutions">
                                                                                <img src="images/help_icon.gif" alt="help"/> 
                                                                                <rich:toolTip for="h.cruiseInstitutions">
                                                                                    <div style="width: 350px">
                                                                                        <h:outputText value="#{msg.h_cruiseInstitutions}"/>
                                                                                    </div>
                                                                                </rich:toolTip>
                                                                            </span>                                                                                    
                                                                        </td>                                                                
                                                                        <td>
                                                                            <h:selectManyListbox id="institutionList" value="#{cruiseManagedBean.institutionsSelected}" size="6">
                                                                                <f:selectItems value="#{cruiseManagedBean.institutionList}" />
                                                                            </h:selectManyListbox>                                                            
                                                                        </td>
                                                                    </tr>                                                            
                                                                    <tr>
                                                                        <td>
                                                                            <h:outputText value="#{msg.cruise_scientist}"/>
                                                                        </td>                                                                
                                                                        <td>
                                                                            <span id="h.cruiseScientist">
                                                                                <img src="images/help_icon.gif" alt="help"/> 
                                                                                <rich:toolTip for="h.cruiseScientist">
                                                                                    <div style="width: 350px">
                                                                                        <h:outputText value="#{msg.h_cruiseScientist}"/>
                                                                                    </div>
                                                                                </rich:toolTip>
                                                                            </span>                                                                                    
                                                                        </td>                                                                
                                                                        <td>
                                                                            <h:selectManyListbox id="scientistList" value="#{cruiseManagedBean.scientistSelected}" size="6">
                                                                                <f:selectItems value="#{cruiseManagedBean.scientistList}" />
                                                                            </h:selectManyListbox>                                                            
                                                                        </td>
                                                                    </tr>                                                            
                                                                    <tr>
                                                                        <td>
                                                                            <h:outputText value="#{msg.cruise_area}"/>
                                                                        </td>                                                                
                                                                        <td>
                                                                            <span id="h.area">
                                                                                <img src="images/help_icon.gif" alt="help"/> 
                                                                                <rich:toolTip for="h.area">
                                                                                    <div style="width: 350px">
                                                                                        <h:outputText value="#{msg.h_area}"/>
                                                                                    </div>
                                                                                </rich:toolTip>
                                                                            </span>                                                                                    
                                                                        </td>                                                                
                                                                        <td>
                                                                            <h:selectManyListbox id="areaList" value="#{cruiseManagedBean.areasSelected}" size="5">
                                                                                <f:selectItems value="#{cruiseManagedBean.areaList}" />
                                                                            </h:selectManyListbox>                                                            
                                                                        </td>
                                                                    </tr>                                                            
                                                                    <tr>
                                                                        <td>
                                                                            <h:outputText value="#{msg.cruise_discipline}"/>
                                                                        </td>                                                                
                                                                        <td>
                                                                            <span id="h.discipline">
                                                                                <img src="images/help_icon.gif" alt="help"/> 
                                                                                <rich:toolTip for="h.discipline">
                                                                                    <div style="width: 350px">
                                                                                        <h:outputText value="#{msg.h_discipline}"/>
                                                                                    </div>
                                                                                </rich:toolTip>
                                                                            </span>                                                                                    
                                                                        </td>                                                                
                                                                        <td>
                                                                            <h:selectOneMenu id="disciplineList" value="#{cruiseManagedBean.disciplineSelected}">
                                                                                <f:selectItem itemValue="-1" itemLabel=""/>
                                                                                <f:selectItems value="#{cruiseManagedBean.disciplineList}" />
                                                                                <a4j:support event="onchange" actionListener="#{cruiseManagedBean.changeDisciplineListener}" reRender="dataTypeList"/>
                                                                            </h:selectOneMenu>                                                            
                                                                        </td>
                                                                    </tr>                                                            
                                                                    <tr>
                                                                        <td>
                                                                            <h:outputText value="#{msg.cruise_dataType}"/>
                                                                        </td>                                                                
                                                                        <td>
                                                                            <span id="h.dataType">
                                                                                <img src="images/help_icon.gif" alt="help"/> 
                                                                                <rich:toolTip for="h.dataType">
                                                                                    <div style="width: 350px">
                                                                                        <h:outputText value="#{msg.h_dataType}"/>
                                                                                        <a href="DictionaryQuery.jsp" target="_blank"><h:outputText value="#{msg.h_dataTypeLink}"/></a>
                                                                                    </div>
                                                                                </rich:toolTip>
                                                                            </span>                                                                                    
                                                                        </td>                                                                
                                                                        <td>
                                                                            <h:selectManyListbox id="dataTypeList" value="#{cruiseManagedBean.dataTypesSelected}" size="5">
                                                                                <f:selectItems value="#{cruiseManagedBean.dataTypeList}" />
                                                                            </h:selectManyListbox>                                                            
                                                                        </td>
                                                                    </tr>   
                                                                    <tr>
                                                                        <td>
                                                                            <h:outputText value="#{msg.cruise_laboratory}"/>
                                                                        </td>                                                                
                                                                        <td>
                                                                            <span id="h.laboratory">
                                                                                <img src="images/help_icon.gif" alt="help"/> 
                                                                                <rich:toolTip for="h.laboratory">
                                                                                    <div style="width: 350px">
                                                                                        <h:outputText value="#{msg.h_laboratory}"/>
                                                                                    </div>
                                                                                </rich:toolTip>
                                                                            </span>                                                                                    
                                                                        </td>                                                                
                                                                        <td>
                                                                            <h:selectManyListbox id="laboratoryList" value="#{cruiseManagedBean.laboratoriesSelected}" size="5">
                                                                                <f:selectItems value="#{cruiseManagedBean.laboratoryList}" />
                                                                            </h:selectManyListbox>                                                            
                                                                        </td>
                                                                    </tr>   
                                                                    <tr>
                                                                        <td>
                                                                            <h:outputText value="#{msg.cruise_orderBy}"/>
                                                                        </td>                                                                
                                                                        <td>
                                                                            <span id="h.orderBy">
                                                                                <img src="images/help_icon.gif" alt="help"/> 
                                                                                <rich:toolTip for="h.orderBy">
                                                                                    <div style="width: 350px">
                                                                                        <h:outputText value="#{msg.h_orderBy}"/>
                                                                                    </div>
                                                                                </rich:toolTip>
                                                                            </span>                                                                                    
                                                                        </td>                                                                
                                                                        <td>
                                                                            <h:selectOneMenu id="orderByList" value="#{cruiseManagedBean.orderBySelected}">
                                                                                <f:selectItems value="#{cruiseManagedBean.orderByList}" />
                                                                            </h:selectOneMenu>                                                            
                                                                        </td>
                                                                    </tr>    
                                                                    <tr>
                                                                        <td align="center">
                                                                            <a4j:status for="advancedRegion">
                                                                                <f:facet name="start">
                                                                                    <h:graphicImage  value="images/ajax-loader.gif"/>
                                                                                </f:facet>
                                                                            </a4j:status>
                                                                        </td>                                                                
                                                                        <td colspan="2" align="center">
                                                                            <a4j:commandButton actionListener="#{cruiseManagedBean.clean}" value="#{msg.clean}" reRender="resultsCounter, resultList, advancedPanel" onclick="this.disabled=true; globalNS.runButton=this;" oncomplete="globalNS.runButton.disabled=false;"/>
                                                                            <a4j:commandButton actionListener="#{cruiseManagedBean.search}" value="#{msg.searchCruise}" reRender="resultsCounter, resultList" onclick="this.disabled=true; globalNS.runButton=this;" oncomplete="globalNS.runButton.disabled=false;"/>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </a4j:region>
                                                        </a4j:outputPanel>
                                                    </rich:tab>
                                                </rich:tabPanel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="100%" valign="top">
                                                <div style="font-family: Arial; font-size: 11px; padding-left: 30px"><h:outputText value="#{cruiseManagedBean.resultsCounter}" id="resultsCounter"/></div>
                                                <rich:panel id="resultList" header="#{msg.t_results}">
                                                    <div class="scroll2">
                                                        <rich:dataTable var="cruise" value="#{cruiseManagedBean.resultList}" width="100%" cellpadding="1" binding="#{cruiseManagedBean.resultsTable}" columnsWidth="100px, 100px, 50%, 100px">
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
                                                            <rich:column style="background-color: #EFF4FA; text-align: center">
                                                                <f:facet name="header">
                                                                    <h:outputText value="#{msg.t_show}" />
                                                                </f:facet>   
                                                                <span class="gris">
                                                                    <a4j:commandLink actionListener="#{cruiseManagedBean.showDetails}" 
                                                                                     reRender="details,details3,minLat,minLon,maxLat,maxLon,divMapaResult"
                                                                                     oncomplete="#{rich:component('detailsPanel')}.show();" 
                                                                                     onclick="clearMap();defaultCenterMap();">
                                                                        <h:graphicImage alt="show" url="images/details.gif" style="border: 0" width="25px"/>
                                                                    </a4j:commandLink></span>
                                                                </rich:column>
                                                            </rich:dataTable>
                                                    </div>
                                                </rich:panel>
                                                <rich:panel id="divMapaResult" >
                                                    <script type="text/javascript">
                                                        Richfaces.showModalPanel('detailsPanel');
                                                        clearMap();
                                                        defaultCenterMap();
                                                        polygon(<h:outputText value="#{cruiseManagedBean.minLat}"/>, 
                                                        <h:outputText value="#{cruiseManagedBean.minLon}"/>, 
                                                        <h:outputText value="#{cruiseManagedBean.maxLat}"/>, 
                                                        <h:outputText value="#{cruiseManagedBean.maxLon}"/>);
                                                    </script>
                                                </rich:panel>

                                                <a4j:form>
                                                    <rich:modalPanel width="600" id="detailsPanel" autosized="true" onshow="map.checkResize();">
                                                        <f:facet name="header">
                                                            <h:panelGroup>
                                                                <h:outputText value="#{msg.detail_title}"></h:outputText>
                                                            </h:panelGroup>
                                                        </f:facet>                                                    
                                                        <f:facet name="controls">
                                                            <h:panelGroup>
                                                                <h:graphicImage value="/images/close.png" id="hidelink"/>
                                                                <rich:componentControl for="detailsPanel" attachTo="hidelink" operation="hide" event="onclick"/>
                                                            </h:panelGroup>
                                                        </f:facet>   
                                                        <div class="scroll3">
                                                            <rich:panel id="details">
                                                                <table width="100%" style="text-align: left;">
                                                                    <tr>
                                                                        <th width="30%">
                                                                            <h:outputText value="#{msg.cruise_name}"/>
                                                                        </th>
                                                                        <td>
                                                                            <h:outputText value="#{cruiseManagedBean.selectedInventory.cruiseName}"/>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th width="30%">
                                                                            <h:outputText value="#{msg.ship_name}"/>
                                                                        </th>
                                                                        <td>
                                                                            <a target="_blank" class="naranja" href="<h:outputText value="#{cruiseManagedBean.selectedInventory.shipName.shipUri}"/>">
                                                                                <h:outputText value="#{cruiseManagedBean.selectedInventory.shipName.shipName}"/>
                                                                            </a>
                                                                            <br>
                                                                            <a target="_blank" href="<h:outputText value="#{cruiseManagedBean.selectedInventory.shipName.shipUri}"/>">
                                                                                <h:graphicImage value="#{cruiseManagedBean.selectedInventory.shipName.shipPicture}" height="100" style="border: 0"/>
                                                                            </a>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th>
                                                                            <h:outputText value="#{msg.cruise_period}"/>
                                                                        </th>
                                                                        <td>
                                                                            <h:outputText value="#{cruiseManagedBean.selectedInventory.beginDate}">
                                                                                <f:convertDateTime type="date" pattern="dd/MM/yyyy"/>
                                                                            </h:outputText> - 
                                                                            <h:outputText value="#{cruiseManagedBean.selectedInventory.endDate}">
                                                                                <f:convertDateTime type="date" pattern="dd/MM/yyyy"/>
                                                                            </h:outputText>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th>
                                                                            <h:outputText value="#{msg.cruise_institutions}"/>
                                                                        </th>
                                                                        <td>
                                                                            <a4j:repeat value="#{cruiseManagedBean.institutions}" var="institution">
                                                                                <b><h:outputText value="#{institution.abbreviation}"/></b>
                                                                                <h:outputText value="#{institution.institution}"/><br>
                                                                            </a4j:repeat>   
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th>
                                                                            <h:outputText value="#{msg.cruise_port_of_departure}"/>
                                                                        </th>
                                                                        <td>
                                                                            <h:outputText value="#{cruiseManagedBean.selectedInventory.unlocodePort.name}"/>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th>
                                                                            <h:outputText value="#{msg.cruise_port_of_return}"/>
                                                                        </th>
                                                                        <td>
                                                                            <h:outputText value="#{cruiseManagedBean.selectedInventory.unlocodePort1.name}"/>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th>
                                                                            <h:outputText value="#{msg.cruise_chief_scientist}"/>
                                                                        </th>
                                                                        <td>
                                                                            <a4j:repeat value="#{cruiseManagedBean.selectedInventory.invChiefScientistCruiseCollection}" var="chiefScientist">
                                                                                <h:outputText value="#{chiefScientist.invChiefScientist.firstName}"/> <b><h:outputText value="#{chiefScientist.invChiefScientist.lastName}"/></b> - 
                                                                            </a4j:repeat>
                                                                        </td>
                                                                    </tr>
                                                                </table>

                                                            </rich:panel>
                                                            <rich:panel id="details2">

                                                                <table width="100%" style="text-align: left;"> 
                                                                    <tr>
                                                                        <th>
                                                                            <h:outputText value="#{msg.cruise_ocean_sea_areas}"/>
                                                                        </th>
                                                                        <td>
                                                                            <table>
                                                                                <tr>
                                                                                    <td colspan="3" align="center">
                                                                                        <h:outputText value="#{cruiseManagedBean.selectedInventory.maxLat}" id="maxLat"/>
                                                                                    </td>
                                                                                </tr>                                                                                
                                                                                <tr>
                                                                                    <td>
                                                                                        <h:outputText value="#{cruiseManagedBean.selectedInventory.minLon}" id="minLon"/>
                                                                                    </td>
                                                                                    <td>                                                                                        
                                                                                        <rich:gmap gmapVar="map" zoom="6" 
                                                                                                   style="width:400px;height:400px" 
                                                                                                   gmapKey="ABQIAAAAyrwFPf71xa3x2zoW0lc_JhSCd7RKMffV5e49tgk6lSz_-7l8WBSFGD_N331e_K7cHpLoIHqaq9FYbg" 
                                                                                                   id="gmap"
                                                                                                   lat="12"                                                                                                    
                                                                                                   lng="-82">
                                                                                        </rich:gmap>

                                                                                    </td>
                                                                                    <td>
                                                                                        <h:outputText value="#{cruiseManagedBean.selectedInventory.maxLon}" id="maxLon"/>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td colspan="3" align="center">
                                                                                        <h:outputText value="#{cruiseManagedBean.selectedInventory.minLat}" id="minLat"/>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                </table>

                                                            </rich:panel>
                                                            <rich:panel id="details3">

                                                                <table width="100%" style="text-align: left;"> 
                                                                    <tr>
                                                                        <th>
                                                                            <h:outputText value="#{msg.details_laboratories}"/>
                                                                        </th>
                                                                        <td>
                                                                            <a4j:repeat value="#{cruiseManagedBean.selectedInventory.invLaboratoriesCruisesCollection}" var="laboratories">
                                                                                <b><h:outputText value="#{laboratories.invLaboratories.country.paiNombrePais}"/></b>
                                                                                <h:outputText value="#{laboratories.invLaboratories.nameLab}"/><br>
                                                                            </a4j:repeat>                                      
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th>
                                                                            <h:outputText value="#{msg.cruise_measurements}"/>
                                                                        </th>
                                                                        <td>
                                                                            <a4j:repeat value="#{cruiseManagedBean.selectedInventory.invCruiseBodcCategoryCollection}" var="category">
                                                                                <h:outputText value="#{category.bodcCategory.title}"/><br>
                                                                            </a4j:repeat>                                      
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th>
                                                                            <h:outputText value="#{msg.uri_metadata}"/>
                                                                        </th>
                                                                        <td>
                                                                            <a class="naranja" href="<h:outputText value="#{cruiseManagedBean.selectedInventory.metadataUrl}"/>" target="blank_">
                                                                                <h:outputText value="#{cruiseManagedBean.selectedInventory.metadataTitle}"/>
                                                                            </a><br>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th>
                                                                            <h:outputText value="#{msg.uri_report}"/>
                                                                        </th>
                                                                        <td>
                                                                            <a class="naranja" href="<h:outputText value="#{cruiseManagedBean.selectedInventory.idReport.uri}"/>" target="blank_">
                                                                                <h:outputText value="#{cruiseManagedBean.selectedInventory.idReport.title}"/>
                                                                            </a>
                                                                        </td>
                                                                    </tr>
                                                                </table>      

                                                            </rich:panel>
                                                        </div>
                                                    </rich:modalPanel>
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

