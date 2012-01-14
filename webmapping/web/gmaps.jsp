<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@taglib uri="http://richfaces.org/a4j" prefix="a4j"%>
<%@taglib uri="http://richfaces.org/rich" prefix="rich"%>

<%@taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="ol" uri="http://osi.tetratech.com/jsf/geofaces/openlayers"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%--
    This file is an entry point for JavaServer Faces application.
--%>

<html>
    <head>
        <f:view>
            <script 
                src="http://maps.google.com/maps?file=api&amp;v=2.80&amp;key=ABQIAAAAyrwFPf71xa3x2zoW0lc_JhTyuK9OZJ2mOK7lYs8WD7yWXp9BiRQNYl0jyCOT0UULjVjQvKAcxJ-LNA"
            type="text/javascript"></script>
            <script src="javascript/dragzoom_modded.js" type="text/javascript"></script>



            <script type="text/javascript">
                //<![CDATA[

                var map;
                var themarker
  
                function load() {
                    if (GBrowserIsCompatible()) {
                        map = new GMap2(document.getElementById("map"));
                        map.addControl(new GSmallMapControl());
                        map.addControl(new GMapTypeControl());
                        var point = new GLatLng(4.4, -74.4);
                        map.setCenter(point, 5);
                        map.setMapType(G_NORMAL_MAP);

                        var otherOpts = {
                            buttonHTML: "<img src='images/square.png'/>",
                            buttonZoomingHTML: "<img src='images/square_pressed.png'/>",
                            stickyZoomEnabled: true
                        };
   
                        var callbacks = {
                            dragend: function(nw,ne,se,sw,nwpx,nepx,sepx,swpx){
                                parent.document.getElementById('myform:minLon').value = sw.lng();
                                parent.document.getElementById('myform:minLat').value = sw.lat();
                                parent.document.getElementById('myform:maxLon').value = ne.lng();
                                parent.document.getElementById('myform:maxLat').value = ne.lat();
                                //document.theForm.BBOX.value = sw.lng()+","+sw.lat()+","+ne.lng()+","+ne.lat();
                                setCoords(sw.lat(),sw.lng(),ne.lat(),ne.lng());
                            }
                        };
                        var dragZoomControl =  new DragZoomControl({}, otherOpts, callbacks);
                        map.addControl(dragZoomControl);
                    }
                }
	
                //]]>
            </script>
            <a4j:jsFunction name="setCoords"  actionListener="#{cruiseManagedBean.test}"> 
                <a4j:actionparam name="minLat" assignTo="#{cruiseManagedBean.advMinLat}"/>
                <a4j:actionparam name="minLon" assignTo="#{cruiseManagedBean.advMinLon}"/>
                <a4j:actionparam name="maxLat" assignTo="#{cruiseManagedBean.advMaxLat}"/>
                <a4j:actionparam name="maxLon" assignTo="#{cruiseManagedBean.advMaxLon}"/>
            </a4j:jsFunction>                    

        </head>

        <body onload="load()">
            <h:form id="myform">
                <div id="map" style="width: 380px; height: 380px"></div>
            </h:form>
        </body>
    </f:view>
</html>
