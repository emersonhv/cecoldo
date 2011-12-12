<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@taglib uri="http://richfaces.org/a4j" prefix="a4j"%>
<%@taglib uri="http://richfaces.org/rich" prefix="rich"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<%@taglib prefix="ol" uri="http://osi.tetratech.com/jsf/geofaces/openlayers"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Geo-Faces OpenLayes Example</title>
        <style type="text/css">
            body {
                padding:0px;
                margin:0px;    
            }
            #olMap {
                width:1200px;
                height:800px;
                padding:0px;
                margin:0px;
            }


        </style>
        <script type="text/javascript">
            var map;
            var control = new OpenLayers.Control();
            OpenLayers.Util.extend(control, {
                draw: function () {
                    // this Handler.Box will intercept the shift-mousedown
                    // before Control.MouseDefault gets to see it
                    this.box = new OpenLayers.Handler.Box( control,
                        {"done": this.notice},
                        {keyMask: OpenLayers.Handler.MOD_SHIFT});
                    this.box.activate();
                },
            
                notice: function (bounds) {
                    OpenLayers.Console.userError(bounds);
                }
            });
            map.addControl(control);
        </script>
    </head>
    <body> 
        <f:view>
            <h:panelGrid columns="1" title="Geo-Faces Open Layers Example" style=" ">
                <rich:panel header="Geo-Faces Open Layers Example"  style="padding:0px;">
                    <ol:openlayers id="olMap"  centerX="-77.02506256103516" centerY="38.90180969238281" zoomLevel="13" mapOptions="{ controls: [new OpenLayers.Control.PanZoomBar(),new OpenLayers.Control.MousePosition(),new OpenLayers.Control.ScaleLine(),new OpenLayers.Control.OverviewMap(),new OpenLayers.Control.Permalink(), new OpenLayers.Control.ZoomBox() ] }" />
                </rich:panel>
            </h:panelGrid>
        </f:view>
    </body>
</html>

