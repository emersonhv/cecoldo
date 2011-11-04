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
    <f:loadBundle basename="ApplicationMessages" var="msg"/> 
    <head>
        <script src="javascript/dictionary.js"></script>
        <link rel="stylesheet" type="text/css" href="styles/styles.css" />
        <style type="text/css">
            .smallmap {
                border:1px solid #CCCCCC;
                height:500px;
                width:100%;
            }
            .olControlEditingToolbar  {
                float:none;
                top: 10px;
                margin-top: 10px;
                right: 0px;
                height: 30px; 
                width: 200px;
            }
            .results{
                border: 1px solid #0173a3;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta al Diccionario</title>
    </head>
    <body>
        <f:view>
            <h:form id="myform">
                <div class="efecto_sobre" align="center">
                    <table width="975px" align="center" class="main">
                        <tr>
                            <td width="975px" align="center" class="linea_inferior">
                                <table border="0" width="100%" class="header1">
                                    <tr>
                                        <td>Ultima actualización: 03/03/2009</td>
                                        <td class="header_azul"><a href="/">Inicio</a> | <a href="#">Contactenos</a> | <a href="#">Preguntas frecuentes</a> | <a href="#">Mapa del Sitio</a></td>
                                        <td><a href="#" class="header_selected">Español</a> | <a href="#">English</a></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" width="756px">
                                            <table width="100%">
                                                <tr>
                                                    <td>
                                                        <img src="images/dimar.png" alt="Logo DIMAR">
                                                    </td>
                                                    <td>
                                                        <img src="images/logo.jpg" alt="Logo CECOLDO">
                                                    </td>
                                                    <td align="right">
                                                        <img src="images/iode.jpg" alt="Logo IODE">
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <table width="100%">
                                    <tr>
                                        <td valign="top" width="100%">
                                            <a4j:region id="userRegion">
                                                <rich:panel header="Información del Solicitante" style="padding-left: 10px" id="globalInformation">
                                                    <table width="100%" bgcolor="">
                                                        <tr>
                                                            <td width="200px">
                                                                Fecha:                                                        
                                                            </td>
                                                            <td width="20px">
                                                                <span id="h.fecha">
                                                                    <img src="images/help_icon.gif" alt="help"/> 
                                                                    <rich:toolTip for="h.fecha">
                                                                        <span style="white-space:nowrap">
                                                                            Fecha de solicitud de los parámetros. 
                                                                        </span>
                                                                    </rich:toolTip>
                                                                </span>                                                                                    
                                                            </td>
                                                            <td>
                                                                <h:outputText value="#{newParameterBackendBean.date}">
                                                                    <f:convertDateTime pattern="dd/MM/yyyy"/>
                                                                </h:outputText>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                Institución:
                                                            </td>
                                                            <td>
                                                                <span id="h.institution">
                                                                    <img src="images/help_icon.gif" alt="help"/> 
                                                                    <rich:toolTip for="h.institution">
                                                                        <span style="white-space:nowrap">
                                                                            Institución a la cual pertenese quien realiza la solicitud de los 
                                                                            nuevos parámetros. 
                                                                        </span>
                                                                    </rich:toolTip>
                                                                </span>                                                                                    
                                                            </td>
                                                            <td>
                                                                <h:inputText value="#{newParameterBackendBean.institutionName}" size="40" id="institutionName">
                                                                    <rich:ajaxValidator event="onblur"/>
                                                                </h:inputText>
                                                                <rich:message for="institutionName" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                Solicitante:
                                                            </td>
                                                            <td>
                                                                <span id="h.user">
                                                                    <img src="images/help_icon.gif" alt="help"/> 
                                                                    <rich:toolTip for="h.user">
                                                                        <span style="white-space:nowrap">
                                                                            Nombres y apellidos completos del solicitante. 
                                                                        </span>
                                                                    </rich:toolTip>
                                                                </span>                                                                                    
                                                            </td>
                                                            <td>
                                                                <h:inputText value="#{newParameterBackendBean.applicant}" size="40" id="applicant">
                                                                    <rich:ajaxValidator event="onblur"/>
                                                                </h:inputText>
                                                                <rich:message for="applicant" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                Cargo:
                                                            </td>
                                                            <td>
                                                                <span id="h.position">
                                                                    <img src="images/help_icon.gif" alt="help"/> 
                                                                    <rich:toolTip for="h.position">
                                                                        <span style="white-space:nowrap">
                                                                            Cargo del solitante dentro de la entidad. 
                                                                        </span>
                                                                    </rich:toolTip>
                                                                </span>                                                                                    
                                                            </td>
                                                            <td>
                                                                <h:inputText value="#{newParameterBackendBean.applicantPosition}" size="40" id="applicantPosition">
                                                                    <rich:ajaxValidator event="onblur"/>
                                                                </h:inputText>
                                                                <rich:message for="applicantPosition"/>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                Correo electrónico:
                                                            </td>
                                                            <td>
                                                                <span id="h.email">
                                                                    <img src="images/help_icon.gif" alt="help"/> 
                                                                    <rich:toolTip for="h.email">
                                                                        <span style="white-space:nowrap">
                                                                            Dirección de correo electrónico de contacto. 
                                                                        </span>
                                                                    </rich:toolTip>
                                                                </span>                                                                                    
                                                            </td>
                                                            <td>
                                                                <h:inputText value="#{newParameterBackendBean.email}" size="30" id="email">
                                                                    <rich:ajaxValidator event="onblur"/>
                                                                </h:inputText>
                                                                <rich:message for="email"/>
                                                                
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                Teléfono:
                                                            </td>
                                                            <td>
                                                                <span id="h.phone">
                                                                    <img src="images/help_icon.gif" alt="help"/> 
                                                                    <rich:toolTip for="h.phone">
                                                                        <span style="white-space:nowrap">
                                                                            Número de teléfono fijo y extensión, o número de <br>
                                                                            celular de contacto.
                                                                        </span>
                                                                    </rich:toolTip>
                                                                </span>                                                                                    
                                                            </td>
                                                            <td>
                                                                <h:inputText value="#{newParameterBackendBean.phone}" size="40" id="phone">
                                                                    <rich:ajaxValidator event="onblur"/>
                                                                </h:inputText>
                                                                <rich:message for="phone"/>
                                                                
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                País:
                                                            </td>
                                                            <td>
                                                                <span id="h.country">
                                                                    <img src="images/help_icon.gif" alt="help"/> 
                                                                    <rich:toolTip for="h.country">
                                                                        <span style="white-space:nowrap">
                                                                            País de domicilio del solicitante. 
                                                                        </span>
                                                                    </rich:toolTip>
                                                                </span>                                                                                    
                                                            </td>
                                                            <td>
                                                                <h:selectOneMenu id="countries" value="#{newParameterBackendBean.selectedCountry}">
                                                                    <f:selectItems value="#{newParameterBackendBean.countryList}" />
                                                                    <a4j:support event="onchange" actionListener="#{newParameterBackendBean.countryChangeListener}" reRender="departamentsPanel"/>
                                                                </h:selectOneMenu>                                                            
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                Departamento:
                                                            </td>
                                                            <td>
                                                                <span id="h.departament">
                                                                    <img src="images/help_icon.gif" alt="help"/> 
                                                                    <rich:toolTip for="h.departament">
                                                                        <span style="white-space:nowrap">
                                                                            Departamento de domicilio del solicitante.
                                                                        </span>
                                                                    </rich:toolTip>
                                                                </span>                                                                                    
                                                            </td>
                                                            <td>
                                                                <a4j:outputPanel id="departamentsPanel">
                                                                    <h:selectOneMenu id="departaments" value="#{newParameterBackendBean.selectedDepartament}">
                                                                        <f:selectItems value="#{newParameterBackendBean.departamentList}" />
                                                                        <a4j:support event="onchange" actionListener="#{newParameterBackendBean.departamentChangeListener}" reRender="citiesPanel"/>
                                                                    </h:selectOneMenu>                
                                                                </a4j:outputPanel>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                Municipios:
                                                            </td>
                                                            <td>
                                                                <span id="h.city">
                                                                    <img src="images/help_icon.gif" alt="help"/> 
                                                                    <rich:toolTip for="h.city">
                                                                        <span style="white-space:nowrap">
                                                                            Municipio o ciudad de domicilio del solicitantte.
                                                                        </span>
                                                                    </rich:toolTip>
                                                                </span>                                                                                    
                                                            </td>
                                                            <td>
                                                                <a4j:outputPanel id="citiesPanel">
                                                                    <h:selectOneMenu id="cities" value="#{newParameterBackendBean.selectedCity}" immediate="true">
                                                                        <f:selectItems value="#{newParameterBackendBean.cityList}" />
                                                                    </h:selectOneMenu>           
                                                                </a4j:outputPanel>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </rich:panel>
                                            </a4j:region>
                                            <rich:spacer height="20px"/>
                                            <rich:panel style="padding-left: 10px">
                                                <f:facet name="header">
                                                    <h:outputText value="Parámetros Nuevos Solicitados"/> 
                                                </f:facet>
                                                <span id="h.table">
                                                    Ayuda <img src="images/help_icon.gif" alt="help"/>
                                                    <rich:toolTip for="h.table">
                                                        <span style="white-space:nowrap">
                                                            Listado de parámetros solicitados hasta el momento.
                                                        </span>
                                                    </rich:toolTip>                                                    
                                                </span>
                                                <rich:dataTable value="#{newParameterBackendBean.parameters}" var="parameter" width="100%" cellpadding="1" id="parametersTable">
                                                    <rich:column>
                                                        <f:facet name="header">
                                                            <h:outputText value="Group" />
                                                        </f:facet>
                                                        <h:outputText value="#{parameter.groupCode.code}"/> - <h:outputText value="#{parameter.groupCode.fullTitle}"/>
                                                    </rich:column>
                                                    <rich:column>
                                                        <f:facet name="header">
                                                            <h:outputText value="Units" />
                                                        </f:facet>
                                                        <h:outputText value="#{parameter.unitCode.fullTitle}"/> [<h:outputText value="#{parameter.unitCode.shortTitle}"/>]
                                                    </rich:column>
                                                    <rich:column>
                                                        <f:facet name="header">
                                                            <h:outputText value="Full Title" />
                                                        </f:facet>
                                                        <h:outputText value="#{parameter.fullTitle}"/>
                                                    </rich:column>
                                                    <rich:column>
                                                        <f:facet name="header">
                                                            <h:outputText value="Definition" />
                                                        </f:facet>
                                                        <h:outputText value="#{parameter.definition}"/>
                                                    </rich:column>
                                                    <rich:column>
                                                        <f:facet name="header">
                                                            <h:outputText value="Min. Value" />
                                                        </f:facet>
                                                        <h:outputText value="#{parameter.minPermissVal}">
                                                            <f:convertNumber minFractionDigits="0"/>
                                                        </h:outputText>
                                                    </rich:column>
                                                    <rich:column>
                                                        <f:facet name="header">
                                                            <h:outputText value="Max. Value" />
                                                        </f:facet>
                                                        <h:outputText value="#{parameter.maxPermissVal}">
                                                            <f:convertNumber minFractionDigits="0"/>
                                                        </h:outputText>
                                                    </rich:column>
                                                </rich:dataTable>
                                            </rich:panel>
                                            <a4j:region id="detailsRegion">
                                                <rich:panel id="details" header="Detalles del parámetro" style="padding-left: 10px">
                                                    <table width="100%">
                                                        <tr>
                                                            <td>
                                                                Title: 
                                                            </td>
                                                            <td>
                                                                <span id="h.title">
                                                                    <img src="images/help_icon.gif" alt="help"/> 
                                                                    <rich:toolTip for="h.title">
                                                                        <span style="white-space:nowrap">
                                                                            Nombre del parámetro. Si es un parámetro biológico deberá expresarse <br>
                                                                            también el serial taxonómico <strong>(TSN)</strong> y el nombre científico del organismo.
                                                                        </span>
                                                                    </rich:toolTip>
                                                                </span>
                                                            </td>
                                                            <td>
                                                                <h:inputTextarea value="#{newParameterBackendBean.currentParameter.fullTitle}" cols="50" rows="3" id="fullTitle">
                                                                    <rich:ajaxValidator event="onblur"/>
                                                                </h:inputTextarea>
                                                                <rich:message for="fullTitle"/>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                Definition (Methodology):
                                                            </td>
                                                            <td>
                                                                <span id="h.definition">
                                                                    <img src="images/help_icon.gif" alt="help"/> 
                                                                    <rich:toolTip for="h.definition">
                                                                        <span style="white-space:nowrap">
                                                                            Metodología e instrumento utilizado.
                                                                        </span>
                                                                    </rich:toolTip>
                                                                </span>                                                            
                                                            </td>
                                                            <td>
                                                                <h:inputTextarea value="#{newParameterBackendBean.currentParameter.definition}" cols="50" rows="3" id="definition">
                                                                    <rich:ajaxValidator event="onblur"/>
                                                                </h:inputTextarea>
                                                                <rich:message for="definition"/>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                Category 
                                                            </td>
                                                            <td width="20px">
                                                                <span id="h.category">
                                                                    <img src="images/help_icon.gif" alt="help"/> 
                                                                    <rich:toolTip for="h.category">
                                                                        <span style="white-space:nowrap">
                                                                            <strong>Categoría</strong> a la cual pertenece el parámetro, seleccione <br>
                                                                            una categoría de la lista y a continuación aparecerán los <strong>grupos</strong> <br>
                                                                            asociados.
                                                                        </span>
                                                                    </rich:toolTip>
                                                                </span>
                                                            </td>
                                                            <td>
                                                                <h:selectOneMenu id="categories" value="#{newParameterBackendBean.categoryCode}">
                                                                    <f:selectItems value="#{newParameterBackendBean.categories}" />
                                                                    <a4j:support event="onchange" actionListener="#{newParameterBackendBean.categoryChangeListener}" reRender="groupsPanel"/>
                                                                </h:selectOneMenu>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                Group      
                                                            </td>
                                                            <td>
                                                                <span id="h.group">
                                                                    <img src="images/help_icon.gif" alt="help"/> 
                                                                    <rich:toolTip for="h.group">
                                                                        <span style="white-space:nowrap">
                                                                            Indica el <strong>Grupo</strong> al cual pertenecen los parámetros. <br>
                                                                            Seleccione un grupo de la lista. Si no existe uno acorde <br>
                                                                            al parámetro digite el que considere más apropiado. <br> 
                                                                            ej: Bacteria taxonomy-related abundance in sediment
                                                                        </span>
                                                                    </rich:toolTip>
                                                                </span>
                                                            </td>
                                                            <td>
                                                                <a4j:outputPanel id="groupsPanel">
                                                                    <rich:comboBox value="#{newParameterBackendBean.currentGroup}" suggestionValues="#{newParameterBackendBean.groupList}" style="text-align:left" width="400px" selectFirstOnUpdate="true">
                                                                    </rich:comboBox>               
                                                                </a4j:outputPanel>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                Units:
                                                            </td>
                                                            <td>
                                                                <span id="h.units">
                                                                    <img src="images/help_icon.gif" alt="help"/> 
                                                                    <rich:toolTip for="h.units">
                                                                        <span style="white-space:nowrap">
                                                                            <strong>Unidades</strong> en la cual es registrada la medida u observación.<br>
                                                                            si no existe en la lista las unidades apropiadas puede digitarlas <br>
                                                                            respetando el formato: <b>descripción de las unidades [formato abreviado]</b><br>
                                                                            ej: centimeters per second [cm/s]
                                                                        </span>
                                                                    </rich:toolTip>
                                                                </span>
                                                            </td>
                                                            <td>
                                                                <rich:comboBox value="#{newParameterBackendBean.currentUnits}" suggestionValues="#{newParameterBackendBean.unitList}" style="text-align:left" width="400px">
                                                                </rich:comboBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                Min. Value:
                                                            </td>
                                                            <td>
                                                                <span id="h.minvalue">
                                                                    <img src="images/help_icon.gif" alt="help"/> 
                                                                    <rich:toolTip for="h.minvalue">
                                                                        <span style="white-space:nowrap">
                                                                            Valor <strong>mínimo</strong> que registra el instrumento, la escala o el sistema <br>
                                                                            de referencia utilizado. 
                                                                        </span>
                                                                    </rich:toolTip>
                                                                </span>                                                                                    
                                                            </td>
                                                            <td>
                                                                <h:inputText value="#{newParameterBackendBean.currentParameter.minPermissVal}" id="minValue">
                                                                    <rich:ajaxValidator event="onblur"/>
                                                                    <f:convertNumber integerOnly="true"/> 
                                                                </h:inputText>
                                                                <rich:message for="minValue"/>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                Max. Value:
                                                            </td>
                                                            <td>
                                                                <span id="h.maxvalue">
                                                                    <img src="images/help_icon.gif" alt="help"/> 
                                                                    <rich:toolTip for="h.maxvalue">
                                                                        <span style="white-space:nowrap">
                                                                            Valor <strong>máximo</strong> que registra el instrumento, la escala o el sistema <br>
                                                                            de referencia utilizado.
                                                                        </span>
                                                                    </rich:toolTip>
                                                                </span>                            
                                                            </td>
                                                            <td>
                                                                <h:inputText value="#{newParameterBackendBean.currentParameter.maxPermissVal}" id="maxValue">
                                                                    <rich:ajaxValidator event="onblur"/>
                                                                    <f:convertNumber integerOnly="true"/> 
                                                                </h:inputText>
                                                                <rich:message for="maxValue"/>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3" align="center">
                                                                <a4j:commandButton actionListener="#{newParameterBackendBean.addParameterListener}" value="Agregar el parámetro a la tabla de solicitudes" reRender="parametersTable, details"/>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </rich:panel>                  
                                            </a4j:region>                          
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <a4j:region id="submit">
                                                <rich:panel header="Observaciones" style="padding-left: 10px">
                                                    <h:inputTextarea cols="80" rows="4" value="#{newParameterBackendBean.observations}"/>
                                                </rich:panel>
                                                <a4j:commandButton value="Envíar Solicitud" actionListener="#{newParameterBackendBean.endAddParameterListener}" reRender="globalInformation" oncomplete="alert('Un mensaje de correo electrónico ha sido enviado al Administrador del sistema\n indicando la solicitud de nuevos parámetros')"/>
                                            </a4j:region>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
            </h:form>            
        </f:view>
        <table width="975px" align="center">
            <tr>
                <td>
                    <table width="100%" class="footer">
                        <tr>
                            <td class="borde_derecho" align="center">
                                <table>
                                    <tr valign="middle">
                                        <td>
                                            <img src="{/root/gui/url}/images/cco.png"/>
                                        </td>
                                        <td>
                                            <img src="{/root/gui/url}/images/cpps.png"/>
                                        </td>
                                        <td>
                                            <img src="{/root/gui/url}/images/grasp.png"/>
                                        </td>
                                        <td>
                                            <img src="{/root/gui/url}/images/iode.png"/>
                                        </td>
                                        <td>
                                            <img src="{/root/gui/url}/images/nacionesUnidas.png"/>
                                        </td>
                                        <td>
                                            <img src="{/root/gui/url}/images/odincarsa.png"/>
                                        </td>
                                    </tr>
                                </table>
                           </td>
                            <td class="borde_derecho" align="center">
                                CECOLDO  |  Todos los derechos reservados  |  Políticas de privacidad  |  DIMAR  |  Resolución Óptima 1024 x 768 
                            </td>
                            <td align="center">
                                <img src="images/gobiernoEnLinea.png">
                                <img src="images/repDeColombia.png">
                            </td>
                        </tr>
                    </table>
                </td>            
            </tr>
        </table>         
    </body>
</html>


