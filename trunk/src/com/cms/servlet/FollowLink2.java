/*
 * Created on 13/02/2005
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.cms.servlet;


import java.io.IOException;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cms.dao.DataBase;
import com.cms.dao.DataBaseFactory;
import com.cms.security.Session;
import com.cms.util.IntranetProperties;
import com.cms.vsystem.File;
import com.cms.vsystem.object.Folder;
import com.cms.vsystem.object.LinkFile;

/**
 * @author jun
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class FollowLink2 extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 2720623194857958651L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
	    
	    if(request.getSession().getAttribute("sessionApp") == null){
	        try{ request.setAttribute("sessionApp", new Session()); }catch(Exception exc){}
	    }
	    
	    if(request.getParameter("action") != null){
	        if(request.getParameter("action").equals("logout")){
	            
	            for(Enumeration i = request.getSession().getAttributeNames(); i.hasMoreElements();)
	                request.getSession().removeAttribute(i.nextElement().toString());
	            
	            response.sendRedirect(IntranetProperties.INTRA_BASE_URL + "index.jsp");
	            return;
	        }
	    }
	    
	    if(request.getParameter("page_name") != null){
			DataBase dataBase = null;
	        try{	          
	            dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
	            
	            String sql = "SELECT id_page " +
								"FROM page " +
								"WHERE LOWER(name) LIKE '" + request.getParameter("page_name").toLowerCase() + "' AND id_site = " + ((Session)request.getSession().getAttribute("sessionApp")).getSite().getIdSite() + " ";
 
				dataBase.db_query(sql, false, null);
				Hashtable row;
				String page = "";
				if((row = dataBase.db_fetch_array()) != null)
				    page = row.get("ID_PAGE").toString();

	            dataBase.close();
	            dataBase = null;
	            System.gc();
	            
	            String aditionalParameters = "";
	            for(Enumeration e = request.getParameterNames(); e.hasMoreElements();){
	                String parameter = e.nextElement().toString();
	                if(!parameter.equals("page_name"))
	                    aditionalParameters += "&" + parameter + "=" + request.getParameter(parameter);
	            }
	            
	            response.sendRedirect(IntranetProperties.INTRA_BASE_URL + "index.jsp?page=" + page + aditionalParameters);
	            return;
	        }catch(Exception e){
				try{dataBase.close();}catch(Exception e1){}
				dataBase = null;
	            response.sendRedirect(IntranetProperties.INTRA_BASE_URL + "index.jsp");
	        }finally{
				try{dataBase.close();}catch(Exception e1){}
				dataBase = null;
			}
	    }
	    
	    if(request.getParameter("idFile") != null){
	        try{
	            File file = new Folder();
	            file.setIdFile(Integer.parseInt(request.getParameter("idFile").trim()));
	            file.load();
	            
				if (file.getFileType().equals ("Enlace")) {
					LinkFile fileLink = new LinkFile();
					fileLink.setIdFile(file.getIdFile());
					fileLink.load();
				
					file.setFileType (fileLink.getLinkFileType());
				}
				
				//int fromPage = (request.getParameter("fromPage") != null)? Integer.parseInt(request.getParameter("fromPage")) : 0; 
				int idSite = (request.getParameter("idSite") == null)? ((Session)request.getSession().getAttribute("sessionApp")).getSite().getIdSite() : Integer.parseInt (request.getParameter("idSite"));  
	            String contentType = (request.getParameter("displayType").equals("complete"))? "'fullContent', " + 
																								"'showObjectsFullContent', " +
																								"'showObjectsFullContentPreview' "
																								: 
																								"'contentPreview', " +
																								"'showObjectsContentPreview'";
	            String page = "";
	            String site = "";
				
	            Vector path = file.getPathRoot();
				Hashtable possiblePages = returnPossiblePages (idSite, path, contentType);
				if(request.getParameter("idSite") == null && possiblePages.isEmpty ())
					possiblePages = returnPossiblePages (0, path, contentType);
				
				for (int i = 0; i < path.size(); i++){
					String idPFile = ((Hashtable) path.get (i)).get ("ID_FILE").toString();
					
					if (possiblePages.get (idPFile) != null){
						Hashtable pageData 		= (Hashtable) possiblePages.get (idPFile);
						for(Enumeration pages = pageData.keys(); pages.hasMoreElements(); ){
							page 					= (String) pages.nextElement();
							Hashtable pageValues 	= (Hashtable) pageData.get (page);
							site					= (String) pageValues.get ("SITE");
							
							if (!file.getFileType().equals ("Carpeta")){
								if (pageValues.get ("VALID_TYPES") != null){
									String validTypes[] = pageValues.get ("VALID_TYPES").toString().split("[,]");
									boolean contains = false;
									for (int j = 0; j < validTypes.length; j++ ) {
										if( validTypes[j].equals( file.getFileType() ) ){
											contains = true;
											break;
										}
									}
									//if (contains && (pageValues.get ("DISPLAY").toString().equals("showObjectsFullContent") || pageValues.get ("DISPLAY").toString().equals("showContentNames") || pageValues.get ("DISPLAY").toString().equals("fullContentCustom3")))
									if ( contains )
										break;
									else
										site = page = "";
								}else
									break;
							}else{
								if(!(pageValues.get ("DISPLAY").toString().equals("showObjectsFullContent") || pageValues.get ("DISPLAY").toString().equals("showContentNames") || pageValues.get ("DISPLAY").toString().equals("fullContentCustom3")))
									break;
							}
						}	
					}
					
					if(!page.equals (""))
						break;
				}
				
	            possiblePages = null;

	            if(site.equals("")){
	                if(request.getParameter("idSite") == null)
	                    site = String.valueOf(file.getIdSite());
	                else
	                    site = request.getParameter("idSite");
	            }
	            
	           	response.sendRedirect(IntranetProperties.INTRA_BASE_URL + "index.jsp?page=" + page + "&site=" + site + "&idFile=" + request.getParameter("idFile").trim() + (request.getParameter("adminMode") != null && request.getParameter("adminMode").equals("true")? "&admin=" : "") + (request.getParameter("ancla") != null? "#" + request.getParameter("ancla") : ""));
	            return;
	        }catch(Exception e){
	            e.printStackTrace();
	            response.sendRedirect(IntranetProperties.INTRA_BASE_URL + "index.jsp");
	        }
	    }
	    
	    
	}
	
	private Hashtable returnPossiblePages (int idSite, Vector path, String contentType) throws Exception{
		DataBase dataBase = null;
		Hashtable possiblePages = new Hashtable();
		
		try{
			dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
			
			String parentPath = "";
			for(int i = 0; i < path.size(); i++)
				parentPath += ((Hashtable) path.get (i)).get ("ID_FILE") + (i < path.size() - 1? "," : "");
						
			String sql = "SELECT pc.id_page, pc.id_file, f.id_site, pcpFilter.value AS valid_type, pcp.value AS display_type " +
							"FROM   page p, " +
							"       page_content pc " + 
							"       LEFT JOIN page_content_property pcpFilter ON pc.id_zone = pcpFilter.id_zone AND pc.id_page = pcpFilter.id_page AND pcpFilter.name = 'fileTypeFilter', " + 
							"       page_content_property pcp, " + 
							"" +
							"       files f " +
							"WHERE p.id_page = pc.id_page ";
			if (idSite > 0)
				sql += 		"AND p.id_site = " + idSite + " ";	
							
			sql +=			"AND pc.id_file IN (" + parentPath + ") " +
							"AND pc.id_zone = pcp.id_zone " +
							"AND pc.id_page = pcp.id_page " +
							"AND pc.position = pcp.position " +
							"AND pcp.name = 'display_type' " +
							"AND pcp.value IN (" + contentType + ") " +
							"AND pc.id_file = f.id_file " + 
							"ORDER BY pc.id_page DESC ";
			
			dataBase.db_query(sql, false, null);
			Hashtable row;
			while((row = dataBase.db_fetch_array()) != null){
	
				if (possiblePages.get (row.get ("ID_FILE").toString()) == null)
					possiblePages.put (row.get ("ID_FILE").toString(), new Hashtable());
					
				Hashtable pageData = (Hashtable) possiblePages.get (row.get ("ID_FILE").toString());
				
				if (pageData.get (row.get ("ID_PAGE").toString()) == null)
					pageData.put (row.get ("ID_PAGE").toString(), new Hashtable());
					
				Hashtable pageValues = (Hashtable) pageData.get (row.get ("ID_PAGE").toString());
				
				if (pageValues.get ("VALID_TYPES") == null)
					pageValues.put ("VALID_TYPES", new Vector());
				
				pageValues.put ("SITE", row.get ("ID_SITE").toString());	
				pageValues.put ("DISPLAY", row.get ("DISPLAY_TYPE"));
				pageValues.put ("VALID_TYPES", (row.get ("VALID_TYPE") != null)? row.get ("VALID_TYPE").toString().trim() : "");
								
				pageData.put (row.get ("ID_PAGE").toString(), pageValues);
				possiblePages.put (row.get ("ID_FILE").toString(), pageData);
			}
			
			dataBase.close();
			dataBase = null;
					
			return possiblePages;
		}catch( Exception e ){
			try{dataBase.close();}catch(Exception e1){}
			dataBase = null;
		}finally{
			try{dataBase.close();}catch(Exception e1){}
			dataBase = null;
		}
		
		return possiblePages;
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		doGet(request, response);
	}
}