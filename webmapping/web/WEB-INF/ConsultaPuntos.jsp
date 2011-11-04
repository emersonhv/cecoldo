<%-- 
    Document   : ConsultaPuntos
    Created on : 08-oct-2008, 19:01:41
    Author     : Alexander Mogollon 
    
--%>

<f:view xmlns:h="http://java.sun.com/jsf/html"
        xmlns:f="http://java.sun.com/jsf/core"
           
    <ice:outputDeclaration doctypeRoot="HTML"
                           doctypePublic="-//W3C//DTD XHTML 1.0 Transitional//EN"
                           doctypeSystem="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" />
    
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8"></meta>
            <title>Validacion Puntos</title>
            <script
                src="http://www.google.com/jsapi?key=ABQIAAAAOZZKo6kpjTVUj8JOi-8E_RRU1FX0YkrdHh5uAJq3F8l74eduTBS1ohJFXi_gfD6hhWGkP0aGecFzAQ"
                type="text/javascript"></script>
            <script type="text/javascript">
                google.load("earth", "1");

                var ge = null;

                function init() {
                    google.earth.createInstance("map3d", initCallback, failureCallback);
                }

                function initCallback(object) {
                    ge = object;
                    ge.getWindow().setVisibility(true);
                    ge.getOptions().setFlyToSpeed(0.2);
                }

                function failureCallback(object) {
                    alert('Fallo la carga del plugin de Google Earth');
                }

                function gotoLocation(nombre, latitude, longitude) {
                    var la = ge.createLookAt('');
                    la.set(latitude, longitude, 100, ge.ALTITUDE_RELATIVE_TO_GROUND, 
                    10, 40, 4000);
                    ge.getView().setAbstractView(la); 
    
                    // Crear la marca de posición - PlaceMark
                    var placemark = ge.createPlacemark('');
                    placemark.setName(nombre);    
    
                    // Crear punto	
                    var point = ge.createPoint('');
                    point.setLatitude(latitude);
                    point.setLongitude(longitude);
                    placemark.setGeometry(point);
        
                    ge.getFeatures().appendChild(placemark);  
                }

                function getCoordenadasPunto(){
                    var locationString = document.getElementById('form:punto').value;
                    var params = locationString.split(';');
        
                    // Vuela a la ciudad seleccionada
                    gotoLocation(params[0], parseFloat(params[1]), parseFloat(params[2]));
                }


            </script>
        </head>
        
        <body onload="init()" id="body">
            
            <f:view>
                <h1><h:outputText value="Consulta Puntos" /></h1>
                
                <h:form id="form">
                    
                    <h:div id="map3d"></t:div>
                    
                    <h:panelGrid columns="2">
                        
                        <h:outputText value="Puntos" />
                        
                        <h:commandButton label="Consultar" onclick="getCoordenadasPunto()"></h:commandButton>
                    </h:panelGrid>
                </h:form>
                
            </f:view>
        </body>
        
    </html>
</f:view>