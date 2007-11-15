/*
 * Created on 22/11/2004
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.cms.servlet;


import java.io.IOException;
import java.io.OutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Hashtable;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cms.security.Session;
import com.cms.util.IntranetProperties;
import com.cms.util.Log;
import com.globfx.swiffchart.SwiffChart;

/**
 * @author admin
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class Trafic extends HttpServlet{
    /**
	 * 
	 */
	private static final long serialVersionUID = -727048878388264354L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        OutputStream out = response.getOutputStream();
        SwiffChart chart= new SwiffChart(IntranetProperties.CHART_BASE);
        
        try{
            chart.initInstallDir(IntranetProperties.CHART_BASE);
            chart.SetServletInfo(request,response);
            String sep= ";";
            chart.SetSeparators(sep, true);

            Vector trafic = Log.getTrafic(request.getParameter("startDate"), request.getParameter("endDate"));
            Calendar dateS = Calendar.getInstance();
        	Calendar dateE = Calendar.getInstance();
        	DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        	dateS.setTime(formatter.parse(request.getParameter("startDate")));
        	dateS.set(Calendar.HOUR, 0);
        	dateS.set(Calendar.MINUTE, 0);
        	dateS.set(Calendar.SECOND, 0);
        	dateS.set(Calendar.MILLISECOND, 0);
        	dateE.setTime(formatter.parse(request.getParameter("endDate")));
        	dateE.set(Calendar.HOUR, 0);
        	dateE.set(Calendar.MINUTE, 0);
        	dateE.set(Calendar.SECOND, 0);
        	dateE.set(Calendar.MILLISECOND, 0);
        	
        	String seriesX1 = "";
        	String seriesY1 = "";
        	String seriesY2 = "";
        	
        	int vectorIndex = 0;
        	
        	while(dateS.getTimeInMillis() <= dateE.getTimeInMillis()){
        	    seriesX1 += dateS.get(Calendar.YEAR) + "-" + (dateS.get(Calendar.MONTH) + 1) + "-" + dateS.get(Calendar.DATE) + sep;
    	        
        	    if(vectorIndex < trafic.size()){
        	        Hashtable row = (Hashtable)trafic.get(vectorIndex);
        	        
        	        if(row.get("DATE").toString().equals(dateS.get(Calendar.YEAR) + "-" + (dateS.get(Calendar.MONTH) + 1 < 10? "0" : "") + (dateS.get(Calendar.MONTH) + 1) + "-" + (dateS.get(Calendar.DATE) < 10? "0" : "") + dateS.get(Calendar.DATE))){
        	            seriesY1 += row.get("TOTAL_USERS") + sep;
            	        seriesY2 += row.get("TOTAL_ACCESS") + sep;
            	        
            	        vectorIndex++;
        	        }else{
            	        seriesY1 += "0" + sep;
            	        seriesY2 += "0" + sep;
        	        }
        	    }else{
        	        seriesY1 += "0" + sep;
        	        seriesY2 += "0" + sep;
        	    }
        	    
        	    dateS.set(Calendar.DATE, dateS.get(Calendar.DATE) + 1);
        	}
        	
        	System.out.println(seriesX1);
        	System.out.println(seriesY1);
        	
        	if(request.getParameter("type").equals("page")){
	            chart.AddSeries();
	            chart.SetSeriesXValuesFromString(0, seriesX1);
	            chart.SetSeriesYValuesFromString(0, seriesY2);
        	}else{
	            chart.AddSeries();
	            chart.SetSeriesXValuesFromString(0, seriesX1);
	            chart.SetSeriesYValuesFromString(0, seriesY1);
        	}
        	
        	chart.SetTitle(request.getParameter("title") + " (" + request.getParameter("startDate") + " hasta " + request.getParameter("endDate") + ")");
        	chart.SetCategoriesFromArray(seriesX1.split("[;]"));
            String style = request.getParameter("style");
            chart.LoadStyle( style );
            chart.SetWidth( Integer.parseInt(request.getParameter("width")) );
            chart.SetHeight( Integer.parseInt(request.getParameter("height")) );
            chart.SetLooping( false );

            chart.SetOutputFormat("SWF");
            byte array[] = chart.ExportAsBinary();
            
            out.write(array, 0, array.length);
            chart.close();
            chart = null;
        }catch(Exception e){
            String msg = "Error en el servidor";
            out.write(msg.getBytes(), 0, msg.length());
            e.printStackTrace();
            try{chart.close();}catch(Exception e1){}
            chart = null;
        }finally{
            try{chart.close();}catch(Exception e1){}
            chart = null;
        }
    }
}
