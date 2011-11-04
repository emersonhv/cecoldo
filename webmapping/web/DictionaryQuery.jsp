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
                    <table width="900px" align="center" class="main">
                        <tr>
                            <td width="900px" align="center" class="linea_inferior">
                                <table border="0" width="100%" class="header1">
                                    <tr>
                                        <td>Ultima actualización: 03/08/2009</td>
                                        <td class="header_azul"><a href="/">Inicio</a> | <a href="#">Contactenos</a> | <a href="#">Preguntas frecuentes</a> | <a href="#">Mapa del Sitio</a></td>
                                        <td><a href="#" class="header_selected">Español</a> | <a href="#">English</a></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" width="900px">
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
                                        <td valign="top" width="100%" colspan="2">
                                            <a4j:outputPanel rendered="#{sessionScope.sendedNotification}">
                                                <div class="naranja">
                                                    La solicitud de nuevos parámeros fue enviada con éxito, si desea solicitar más parametros de clic <a href="faces/NewDictionaryParameterRequest.jsp" class="naranja" style="font-family: Arial; font-weight: bold; font-size: 11px; text-decoration: underline">aquí</a>
                                                </div>
                                            </a4j:outputPanel> 
                                            <a4j:outputPanel rendered="#{!sessionScope.sendedNotification}">
                                                    <a href="faces/NewDictionaryParameterRequest.jsp" class="naranja" style="font-family: Arial; font-weight: bold; font-size: 11px; text-decoration: underline">Solicitud de Nuevos Códigos</a>
                                            </a4j:outputPanel> 
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top" width="100%" colspan="2">
                                            <rich:tabPanel switchType="client">
                                                <rich:tab label="Consulta Sencilla">
                                                    <div id="leftColumn">
                                                        <rich:panel header="Parámetros del Diccionario" styleClass="command">
                                                            <a4j:region id="sitesOfInterest">
                                                                <h:selectOneRadio id="malla" value="#{dictionaryManagedBean.queryType}" required="true" styleClass="gris">
                                                                    <f:selectItem id="item1" itemLabel="Código" itemValue="code"  />
                                                                    <f:selectItem id="item2" itemLabel="Título" itemValue="fullTitle" />
                                                                    <f:selectItem id="item3" itemLabel="Metodología" itemValue="definition" />
                                                                </h:selectOneRadio>    
                                                                <table>
                                                                    <tr>
                                                                        <td width="30px">
                                                                            <a4j:status for="sitesOfInterest">
                                                                                <f:facet name="start">
                                                                                    <h:graphicImage  value="images/ajax-loader.gif"/>
                                                                                </f:facet>
                                                                            </a4j:status>
                                                                        </td>
                                                                        <td>
                                                                            <h:inputText id="suggest" size="50" value="#{dictionaryManagedBean.suggest}"/>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                <h:outputText id="objects" style="font-weight:bold"/>
                                                                <a4j:commandButton styleClass="command" actionListener="#{dictionaryManagedBean.search}" onclick="this.disabled=true; globalNS.runButton=this;" oncomplete="globalNS.runButton.disabled=false;" value="Search" id="zonas2" reRender="resultList, resultsCounter">
                                                                </a4j:commandButton>
                                                            </a4j:region>
                                                        </rich:panel>
                                                    </div>
                                                </rich:tab>
                                                <rich:tab label="Consulta Avanzada">
                                                    <a4j:region id="categoriesRegion">
                                                        <table width="100%">
                                                            <tr>
                                                                <td>
                                                                    Categoria      
                                                                </td>
                                                                <td>
                                                                    <h:selectOneMenu id="categories2" value="#{dictionaryManagedBean.categoryCode}">
                                                                        <f:selectItems value="#{dictionaryManagedBean.categories}" />
                                                                        <a4j:support event="onchange" actionListener="#{dictionaryManagedBean.categoryChangeListener}" reRender="groupsPanel"/>
                                                                    </h:selectOneMenu>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Grupo      
                                                                </td>
                                                                <td>
                                                                    <a4j:outputPanel id="groupsPanel">
                                                                        <h:selectOneMenu value="#{dictionaryManagedBean.groupCode}" style="width:500px;">
                                                                            <f:selectItems value="#{dictionaryManagedBean.groups}"/>
                                                                        </h:selectOneMenu>
                                                                    </a4j:outputPanel>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2">
                                                                    <a4j:commandButton actionListener="#{dictionaryManagedBean.searchByGroup}" value="Buscar" reRender="resultList, resultsCounter" id="searchAdv" onclick="">
                                                                    </a4j:commandButton>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </a4j:region>
                                                </rich:tab>
                                            </rich:tabPanel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="60%" valign="top">
                                            <div style="font-family: Arial; font-size: 11px; padding-left: 30px"><h:outputText value="#{dictionaryManagedBean.resultsCounter}" id="resultsCounter"/></div>
                                            <rich:panel id="resultList" header="Resultados">
                                                <div class="scroll2">
                                                    <rich:dataTable var="parameter" value="#{dictionaryManagedBean.parameters}" width="100%" cellpadding="1" binding="#{dictionaryManagedBean.resultsTable}">
                                                        <rich:column style="background-color: #EFF4FA">
                                                            <f:facet name="header">
                                                                <h:outputText value="Parámetro" />
                                                            </f:facet>    
                                                            <a4j:commandLink actionListener="#{dictionaryManagedBean.showDetails}" value="#{parameter.code}" reRender="details" style="color: #CC3300;">
                                                            </a4j:commandLink>
                                                        </rich:column>
                                                        <rich:column style="background-color: #EFF4FA">
                                                            <f:facet name="header">
                                                                <h:outputText value="Full Title" />
                                                            </f:facet>    
                                                            <span class="gris">  <h:outputText value="#{parameter.fullTitle}" styleClass="gris"/></span>
                                                        </rich:column>
                                                        <rich:column style="background-color: #EFF4FA">
                                                            <f:facet name="header">
                                                                <h:outputText value="Definition" />
                                                            </f:facet>    
                                                            <span class="gris"> <h:outputText value="#{parameter.definition}" styleClass="gris"/></span>
                                                        </rich:column>
                                                    </rich:dataTable>
                                                </div>
                                            </rich:panel>
                                        </td>
                                        <td width="40%" valign="top">
                                            <rich:panel id="details" header="Code #{dictionaryManagedBean.selectedParameter.code}">
                                                <table width="100%" cellpadding="2" cellspacing="3">
                                                    <tr>
                                                        <td width="20%">
                                                            Categoria: 
                                                        </td>
                                                        <td style="background-color: #EFF4FA">
                                                            <b><h:outputText value="#{dictionaryManagedBean.selectedCategory.code}"/></b> -
                                                            <h:outputText value="#{dictionaryManagedBean.selectedCategory.title}"/>
                                                        </td>
                                                    </tr>                                    
                                                    <tr>
                                                        <td style="padding-left: 10px">
                                                            Grupo: 
                                                        </td>
                                                        <td style="background-color: #EFF4FA">
                                                            <b><h:outputText value="#{dictionaryManagedBean.selectedParameter.groupCode.code}"/></b> -
                                                            <h:outputText value="#{dictionaryManagedBean.selectedParameter.groupCode.fullTitle}"/><br>
                                                            <b>Metodología:</b> <h:outputText value="#{dictionaryManagedBean.selectedParameter.groupCode.definition}"/>
                                                        </td>
                                                    </tr>       
                                                    <tr>
                                                        <td style="padding-left: 20px">
                                                            Título: 
                                                        </td>
                                                        <td style="background-color: #EFF4FA">
                                                            <h:outputText value="#{dictionaryManagedBean.selectedParameter.fullTitle}"/>
                                                        </td>
                                                    </tr>                                       
                                                    <tr>
                                                        <td style="padding-left: 20px">
                                                            Nombre Abreviado: 
                                                        </td>
                                                        <td style="background-color: #EFF4FA">
                                                            <h:outputText value="#{dictionaryManagedBean.selectedParameter.shortTitle}"/>
                                                        </td>
                                                    </tr>                                       
                                                    <tr>
                                                        <td style="padding-left: 20px">
                                                            Metodología: 
                                                        </td>
                                                        <td style="background-color: #EFF4FA">
                                                            <h:outputText value="#{dictionaryManagedBean.selectedParameter.definition}"/>
                                                        </td>
                                                    </tr>                                       
                                                    <tr>
                                                        <td style="padding-left: 20px">
                                                            Unidades: 
                                                        </td>
                                                        <td style="background-color: #EFF4FA">
                                                            <h:outputText value="#{dictionaryManagedBean.selectedParameter.unitCode.fullTitle}"/> (<h:outputText value="#{dictionaryManagedBean.selectedParameter.unitCode.code}"/>)
                                                        </td>
                                                    </tr>                                       
                                                    <tr>
                                                        <td style="padding-left: 20px">
                                                            Min. Valor: 
                                                        </td>
                                                        <td style="background-color: #EFF4FA">
                                                            <h:outputText value="#{dictionaryManagedBean.selectedParameter.minPermissVal}">
                                                                <f:convertNumber minFractionDigits="0"/>
                                                            </h:outputText>
                                                        </td>
                                                    </tr>                                       
                                                    <tr>
                                                        <td style="padding-left: 20px">
                                                            Max. Valor: 
                                                        </td>
                                                        <td style="background-color: #EFF4FA">
                                                            <h:outputText value="#{dictionaryManagedBean.selectedParameter.maxPermissVal}">
                                                                <f:convertNumber minFractionDigits="0"/>
                                                            </h:outputText>
                                                        </td>
                                                    </tr>                                       
                                                    <tr>
                                                        <td style="padding-left: 20px">
                                                            Dato Ausente:
                                                        </td>
                                                        <td style="background-color: #EFF4FA">
                                                            <h:outputText value="#{dictionaryManagedBean.selectedParameter.dummyVal}">
                                                                <f:convertNumber minFractionDigits="0"/>
                                                            </h:outputText>
                                                        </td>
                                                    </tr>                                 
                                                </table>
                                                
                                                
                                            </rich:panel>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
            </h:form>            
        </f:view>
        <table width="900px" align="center">
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

