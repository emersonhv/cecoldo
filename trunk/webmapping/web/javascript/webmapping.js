

var ge = null;
var isShowInfo= false;
var context;

function init() {
    google.earth.createInstance("map3d", initCallback, failureCallback);

}

function generarGrafica(category){
    var chart = new FusionCharts("FusionCharts/FCF_Line.swf", "ChartId", "300", "300");
    chart.setDataXML('../datos.xml');		   
    chart.render("chartdiv");
}

function initCallback(object) {
    ge = object;
    ge.getWindow().setVisibility(true);
    ge.getOptions().setFlyToSpeed(0.2);
    ge.getOptions().setGridVisibility(true);
    ge.getNavigationControl().setVisibility(true);
}

function failureCallback(object) {
    alert('Fallo la carga del plugin de Google Earth');
}

function drawPoints(names, lons, lats, colors, categories) {
    for (i = 0; i < lons.length; i++) {
        drawPoint(names[i], lats[i], lons[i], colors[i], categories[i]);
    }
}
function drawGridPoints(names, lons, lats) {
    for (i = 0; i < lons.length; i++) {
        drawPoint(names[i], lats[i], lons[i], 1, "GRID");
    }
}
function goTo(cont){
    var la = ge.createLookAt('');
    la.set(latArray[latArray.length-1], lonArray[lonArray.length-1], 0, ge.ALTITUDE_RELATIVE_TO_GROUND, 
    0, 400, 1500000);
    ge.getView().setAbstractView(la); 
    context = cont;
}


function drawPoint(nombre, latitude, longitude, color, category) {
    //    console.log('nombre:' + nombre + ", latitud:" + latitude + ", longitude:" + longitude + ", color:" + color);
    // Crear la marca de posición - PlaceMark
    var placemark = ge.createPlacemark('');
    placemark.setDescription(nombre + ' Categoria:' + category + ' [lat:' + latitude + ' lon:' + longitude + ']');    

    google.earth.addEventListener(placemark, 'click', function(event) {
        // create the balloon and show it in Earth
        var balloon = ge.createHtmlStringBalloon('');
        balloon.setMaxWidth(350);
        balloon.setFeature(placemark);
        balloon.setContentString('<div align="center">'+ category +'<div><img src="'+ context +'/ChartGenerator"/>');
        ge.setBalloon(balloon); 
        
        // Prevent default balloon from popping up for marker placemarks
        event.preventDefault(); 
        // wrap alerts in API callbacks and event handlers
        // in a setTimeout to prevent deadlock in some browsers
        setTimeout(function() {
            generarGrafica(category);
        }, 0);
    });    // Create style map for placemark
    var normal = ge.createIcon('');
    normal.setHref(context + '/images/circle-'+ color+'.png');
    var iconNormal = ge.createStyle('');
    iconNormal.getIconStyle().setIcon(normal);
    var highlight = ge.createIcon('');
    highlight.setHref(context + '/images/circle-'+ color+'.png');
    var iconHighlight = ge.createStyle('');
    iconHighlight.getIconStyle().setIcon(highlight);
    var styleMap = ge.createStyleMap('');
    styleMap.setNormalStyle(iconNormal);
    styleMap.setHighlightStyle(iconHighlight);
    placemark.setStyleSelector(styleMap);
        
    // Crear punto	
    var point = ge.createPoint('');
    point.setLatitude(latitude);
    point.setLongitude(longitude);
    placemark.setGeometry(point);
        
    ge.getFeatures().appendChild(placemark);  
}

function viewContinue(){
    if(document.getElementById('yesSelection').checked){
        document.getElementById('continua').style.visibility='';
        document.getElementById('observations').style.visibility='hidden';
        document.getElementById('observations').style.height='0px';
    }
}

function viewObservations(){
    if(document.getElementById('noSelection').checked){
        document.getElementById('observations').style.visibility='';
        document.getElementById('observations').style.height='250px';
        document.getElementById('continua').style.visibility='';
    }
}


function showInfo(){
    if(!isShowInfo){
        document.getElementById('info').style.height='210px';
        document.getElementById('info').style.visibility='';
        document.getElementById('showinfo').innerHTML='-Ayuda';
        isShowInfo = true;
    }else{
        document.getElementById('info').style.visibility='hidden';
        document.getElementById('info').style.height='0px';
        document.getElementById('showinfo').innerHTML='+Ayuda';
        isShowInfo = false;                    
    }
}

