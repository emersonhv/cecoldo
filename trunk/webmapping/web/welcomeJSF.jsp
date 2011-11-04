<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://richfaces.org/a4j" prefix="a4j"%>
<%@taglib uri="http://richfaces.org/rich" prefix="rich"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<%--
    This file is an entry point for JavaServer Faces application.
--%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"></meta>
        <title>::CECOLDO Web Mapping::</title>
        <link rel="stylesheet" type="text/css" href="styles/styles.css" />
        <script src="http://www.google.com/jsapi?key=ABQIAAAAyrwFPf71xa3x2zoW0lc_JhTtl9iMu1G27LvQoPismnf26mWYERRGnxvtm5_yh3wpssnvL1vU4cAX8g"
                type="text/javascript"></script>
        <!--script src="http://www.google.com/jsapi?key=ABQIAAAAOZZKo6kpjTVUj8JOi-8E_RRU1FX0YkrdHh5uAJq3F8l74eduTBS1ohJFXi_gfD6hhWGkP0aGecFzAQ"
                type="text/javascript"></script-->
        <script src="javascript/webmapping.js" type="text/javascript"></script>
        <script src="javascript/FusionCharts.js" type="text/javascript"></script>            
        <script src="javascript/Concurrent.Thread.js" type="text/javascript"></script>            
        <script type="text/javascript">
            google.load("earth", "1");
            google.load("maps", "2.99");
            var lonArray = [];
            var latArray = [];
            var lonArray2 = [];
            var latArray2 = [];
            var idArray = [];
            var idArray2 = [];
            var colorArray2 = [];
            var categoryArray2 = [];
    
        </script>
    </head>
    
    <body onload="init()" onunload="google.maps.Unload()" id="body">
    <f:view>
        <h:form>
            <div class="efecto_sobre" align="center">
                <table width="975px" align="center" class="main">
                    <tr>
                        <td width="975px" align="center" class="linea_inferior">
                            <table border="0" width="100%" class="header1">
                                <tr>
                                    <td>Ultima actualización: 04/08/2009</td>
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
                                    <td>
                                        <a id="showinfo" href="#" onclick="showInfo()" class="info-title" style="text-align: left;">+ Ayuda</a>
                                    </td>
                                    <td align="right">
                                        <div class="steps">paso 5 de 7</div> 
                                    </td>
                                </tr>
                            </table>
                            <div id="info" class="info" style="visibility: hidden; height: 1px;">
                                <span class="info-title">Módulo de Web Mapping</span><br>
                                <table width="100%">
                                    <tr>
                                        <th>
                                            1
                                        </th>
                                        <td>
                                            Identificar la correspondencia entre la malla de muestreo y los datos cargados.
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            2
                                        </th>
                                        <td>
                                            En la columna de la izquierda se encuentra la malla de muestreo y los datos cargados, para verlos de clic en el título (Malla de Muestreo o Estaciones Cargadas).
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            3
                                        </th>
                                        <td>
                                            El mapa es sensible a los eventos del mouse, para hacer zoom gire la rueda del mouse, para hacer un paneo de clic y arrastre.
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            4
                                        </th>
                                        <td>
                                            El mapa contiene una malla de latitudes y longitudes que le servirá para realizar las verificaciones de correspondencia entre los puntos.
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            5
                                        </th>
                                        <td>
                                            De clic en el botón "ubicar puntos" para dibujar sobre el mapa las estaciones cargadas (íconos naranja) y la malla de muestreo (íconos rojos).
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            6
                                        </th>
                                        <td style="border-bottom: none">
                                            Si desea más información sobre un punto en particular, de clic sobre el mismo en el mápa.
                                        </td>
                                    </tr>
                                </table>
                                
                            </div>
                            
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table width="100%" class="contenido">
                                <tr>
                                    <td width="20%" style="padding: 0px">
                                        <table cellpadding="0" cellspacing="0" styles="height: 100%; padding: 0px; margin: 0px;" >
                                            <tr>
                                                <td height="450px" valign="top">
                                                    <rich:panel header="Convenciones">
                                                        <table width="100%">
                                                            <tr>
                                                                <th class="linea_inferior" >Categoria</th>
                                                                <th class="linea_inferior" >Icono</th>
                                                            </tr>
                                                            <a4j:repeat value="#{MappinWEbJSFManagedBean.categoryColors}" var="categoryColors" id="categoryColors">
                                                                <tr>
                                                                    <td class="linea_inferior" align="left">
                                                                        <h:outputText value="#{categoryColors.category}"/>                                                    
                                                                    </td>
                                                                    <td class="linea_inferior">
                                                                        <img width="30px" height="30px" alt="" src='images/circle-<h:outputText value="#{categoryColors.colorNumber}"/>.png'/>
                                                                    </td>
                                                                </tr>
                                                            </a4j:repeat>
                                                        </table>        
                                                    </rich:panel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td styles="vertical-align : bottom">
                                                    <a href="#" onclick="goTo('http://172.25.2.53/WebMappingFaces');drawGridPoints(idArray,lonArray,latArray);drawPoints(idArray2,lonArray2,latArray2,colorArray2,categoryArray2)"><img border="0" src="images/button.png" alt="Ubicar Puntos"></a>
                                                </td>
                                            </tr>
                                        </table>
                                        <div style="vertical-align : bottom">
                                        </div>
                                    </td>
                                    <td width="80%">
                                        <div id='map3d_container' style='border: 1px solid silver; height: 500px;width:100%'>
                                            <div id='map3d' style='height:100%;width:100%'></div>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="contenido">
                            <rich:panelBar width="100%" selectedPanel="datos">
                                <rich:panelBarItem label="Malla de Muestreo" name="malla">
                                    <div class="scroll">
                                        <table width="100%">
                                            <a4j:repeat value="#{MappinWEbJSFManagedBean.lista}" var="puntos2" id="pointList">
                                                <tr>
                                                    <td class="punteado">
                                                        <span class="naranja"><b><h:outputText value="#{puntos2.id}"/></b></span>
                                                    </td>
                                                    <td class="punteado">
                                                        <img width="25px" height="25px" alt="" src='images/circle-1.png'/>
                                                        <h:outputText value="#{puntos2.categoryTitle}"/>
                                                    </td>
                                                    <td class="punteado">
                                                        <h:outputText value="#{puntos2.lat}"/>
                                                    </td>
                                                    <td class="punteado">
                                                        <h:outputText value="#{puntos2.lon}"/>
                                                        <script>
                                                            lonArray.push(<h:outputText value="#{puntos2.lon}"/>);                            
                                                            latArray.push(<h:outputText value="#{puntos2.lat}"/>);                            
                                                            idArray.push('<h:outputText value="#{puntos2.id}"/>');                            
                                                        </script>
                                                    </td>
                                                </tr>
                                            </a4j:repeat>
                                        </table>
                                    </div>
                                </rich:panelBarItem>
                                <rich:panelBarItem label="Datos Cargados" name="datos">
                                    <div class="scroll">
                                        <table width="100%">
                                            
                                            <a4j:repeat value="#{MappinWEbJSFManagedBean.bodcDataList}" var="puntos" id="pointList2">
                                                <tr>
                                                    <td class="punteado">
                                                        <span class="naranja"><b><h:outputText value="#{puntos.category}"/></b></span>
                                                    </td>
                                                    <td class="punteado">
                                                        <img width="25px" height="25px" alt="" src='images/circle-<h:outputText value="#{puntos.color}"/>.png'/>
                                                        <h:outputText value="#{puntos.categoryTitle}"/>
                                                    </td>
                                                    <td class="punteado">
                                                        <h:outputText value="#{puntos.lat}"/>
                                                    </td>
                                                    <td class="punteado">
                                                        <h:outputText value="#{puntos.lon}"/>
                                                        <script>
                                                            lonArray2.push(<h:outputText value="#{puntos.lon}"/>);                            
                                                            latArray2.push(<h:outputText value="#{puntos.lat}"/>);                            
                                                            idArray2.push('<h:outputText value="#{puntos.id}"/>');                            
                                                            colorArray2.push('<h:outputText value="#{puntos.color}"/>');                            
                                                            categoryArray2.push('<h:outputText value="#{puntos.categoryTitle}"/>');                            
                                                        </script>
                                                    </td>
                                                </tr>
                                            </a4j:repeat>
                                        </table>
                                    </div>
                                </rich:panelBarItem>
                            </rich:panelBar>
                        </td>
                    </tr>
                    <tr>
                        <td class="contenido" align="center"> 
                            <span >La distribución espacial es correcta?</span>
                            <br>
                            Si <input type="radio" id="yesSelection" name="selection" value="yes" onchange="viewContinue();"/>
                            No <input type="radio" id="noSelection" name="selection" value="no" onchange="viewObservations();"/>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2">
                            <div class="caja_boton" style="visibility: hidden" id="continua">
                                <a href="http://172.25.2.53/openreports/uploadedDataSummary.action" class="boton"> Continuar </a>
                            </div>                    
                        </td>                            
                    </tr>
                    <tr>
                        <td align="center" id="observations" style="visibility: hidden">
                            <div class="naranja">
                                <b>Observaciones</b>
                            </div>
                            <textarea cols="90" rows="8" name="observations" id="obs"></textarea><br>
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
</html>
