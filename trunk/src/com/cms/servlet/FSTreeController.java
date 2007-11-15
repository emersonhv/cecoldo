package com.cms.servlet;


import java.io.IOException;
import java.io.OutputStream;
import java.util.Hashtable;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cms.util.IntranetProperties;
import com.cms.vsystem.object.Folder;

public class FSTreeController extends HttpServlet{
    
	static final long serialVersionUID = 2222222;
	
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
    	OutputStream out = response.getOutputStream();
    	String sol = "[";
    	try{		
    		
	    	String data = (request.getParameter("data") != null)? request.getParameter("data").toString() : "";			
	    	boolean enabledfolder = (request.getParameter("enabled") != null && request.getParameter("data").toString().equals("true") );			

	    	data.replaceAll("\"","");
	    	int startval = data.indexOf("widgetId")+11;	
	    	int value = 0;
	    	String a = data.substring(startval, data.indexOf("\"", startval));
    		value = Integer.parseInt( a );

    		Folder folder = new Folder();   		
   			folder.setIdFile(value);
   			folder.load();
   			Vector files = folder.getUserFolderContent(1, false);			
   			int k = 0;
			for(int i = 0; i < files.size(); i++){
				Hashtable row = (Hashtable)files.get(i);
				System.out.println( row );
			    boolean shared = ( row.get( "SHARED" ) == null || ( ( row.get("SHARED").toString().toLowerCase() == "false" || row.get("SHARED").toString().toLowerCase() == "0" ) ) ) ? false : true;
//				String sharedImage = ( row.get( "ID_SITE" ) == null || !row.get( "ID_SITE" ).toString( ).equals( folder.getIdSite() + "" ) ) ? "shared2.gif" : "shared.gif";
				String image = ( row.get( "IMAGE" ) != null ) ? row.get( "IMAGE" ).toString( ) : "imagenes/tipos/no.gif";
				//if (row.get("FILE_TYPE").equals("Carpeta") || enabledfolder) {
					if ( k > 0 )
						sol += ",";
					String title = "<span class='textos'>";				
					if (shared)
						title += "<span style='width:15px; background:url(" + IntranetProperties.INTRA_BASE_URL + image + ");background-repeat:no-repeat'><img border='0' src='" + IntranetProperties.INTRA_BASE_URL + "imagenes/menu/shared.gif' style='width:15px;'></span>";
					else
						title += "<img border='0' src='" + IntranetProperties.INTRA_BASE_URL + image + "' style='width:15px;'>";
					title += row.get("NAME");
					title += "</span>";
					if (row.get("FILE_TYPE").equals("Carpeta") || enabledfolder )  {
						sol += "{title:\""+ title +"\",isFolder:true,objectId:\""  + row.get("ID_FILE") + "\",widgetId:\"" + row.get("ID_FILE") + "\"}" ;
					} else {
						sol += "{title:\""+ title +"\",isFolder:false,objectId:\"" + row.get("ID_FILE") + "\",widgetId:\"" + row.get("ID_FILE") + "\"}" ;					
					}
					k++;
				//}
			}   			
    	} catch(Exception e){
    		e.printStackTrace();
			sol+="{}";
    	}
    	sol += "]";    	
    	response.addHeader("Content-Type", "text/txt");	 
    	out.write(sol.getBytes());
    }   
}

