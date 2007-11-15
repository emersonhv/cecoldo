/*
 * Created on 7/02/2005
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.cms.portal;


import java.io.Serializable;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Properties;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;

import com.cms.dao.DataBase;
import com.cms.dao.DataBaseFactory;
import com.cms.security.Session;
import com.cms.util.IntranetProperties;
import com.cms.util.Util;
import com.cms.vsystem.object.LinkFile;

/**
 * @author Administrador
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class PageContent implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int idPage;
	private int idZone;
	private int idFile;
	private String includeFile;
	private int position;
	private boolean isInDataBase;
	private String fileType;
	private Properties properties;
	private boolean saveProperties;
	private Hashtable aditionalParameters;
	private HttpServletRequest request;
	private HttpServletResponse response;
	private PageContext pageContext;
	private JspWriter out;
	/**
	 * 
	 */
	public PageContent( ) {
		this.idPage = 0;
		this.idZone = 0;
		this.idFile = 0;
		this.position = 0;
		this.fileType = "";
		this.properties = null;
		isInDataBase = false;
		saveProperties = false;
		includeFile = null;
	}
	
    /**
     * @return Returns the aditionalParameters.
     */
    public Hashtable getAditionalParameters() {
        return aditionalParameters;
    }
    /**
     * @param aditionalParameters The aditionalParameters to set.
     */
    public void setAditionalParameters(Hashtable aditionalParameters) {
        this.aditionalParameters = aditionalParameters;
    }
    /**
     * @return Returns the out.
     */
    public JspWriter getOut() {
        return out;
    }
    /**
     * @param out The out to set.
     */
    public void setOut(JspWriter out) {
        this.out = out;
    }
    /**
     * @return Returns the pageContext.
     */
    public PageContext getPageContext() {
        return pageContext;
    }
    /**
     * @param pageContext The pageContext to set.
     */
    public void setPageContext(PageContext pageContext) {
        this.pageContext = pageContext;
    }
    /**
     * @return Returns the request.
     */
    public HttpServletRequest getRequest() {
        return request;
    }
    /**
     * @param request The request to set.
     */
    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }
    
    /**
     * @return Returns the includeURL.
     */
    public String getIncludeFile() {
        return includeFile;
    }
    /**
     * @param includeURL The includeURL to set.
     */
    public void setIncludeFile(String includeURL) {
        this.includeFile = includeURL;
    }
    /**
     * @return Returns the response.
     */
    public HttpServletResponse getResponse() {
        return response;
    }
    /**
     * @param response The response to set.
     */
    public void setResponse(HttpServletResponse response) {
        this.response = response;
    }
    /**
     * @return Returns the saveProperties.
     */
    public boolean isSaveProperties() {
        return saveProperties;
    }
    /**
     * @param saveProperties The saveProperties to set.
     */
    public void setSaveProperties(boolean saveProperties) {
        this.saveProperties = saveProperties;
    }
    /**
     * @return Returns the isInDataBase.
     */
    public boolean isInDataBase() {
        return isInDataBase;
    }
    /**
     * @param isInDataBase The isInDataBase to set.
     */
    public void setInDataBase(boolean isInDataBase) {
        this.isInDataBase = isInDataBase;
    }
    
    public int getPropertiesCount(){
    	if(properties != null)
    		return properties.size();
    	else
    		return 0;
    } 
    /**
     * @return Returns the properties.
     */
    public Properties getProperties() throws Exception{
		if(properties == null)
			loadProperties();
					
        return properties;
    }
    /**
     * @param properties The properties to set.
     */
    public void setProperties(Properties properties) {
        if(this.properties == null)
            this.properties = new Properties();
        
        this.properties = properties;
    }
	/**
	 * @return Returns the idFile.
	 */
	public int getIdFile() {
		return idFile;
	}
	/**
	 * @param idFile The idFile to set.
	 */
	public void setIdFile(int idFile) {
		this.idFile = idFile;
	}
	/**
	 * @return Returns the idPage.
	 */
	public int getIdPage() {
		return idPage;
	}
	/**
	 * @param idPage The idPage to set.
	 */
	public void setIdPage(int idPage) {
		this.idPage = idPage;
	}	
	/**
	 * @return Returns the idZone.
	 */
	public int getIdZone() {
		return idZone;
	}
	/**
	 * @param idZone The idZone to set.
	 */
	public void setIdZone(int idZone) {
		this.idZone = idZone;
	}
	/**
	 * @return Returns the position.
	 */
	public int getPosition() {
		return position;
	}
	/**
	 * @param position The position to set.
	 */
	public void setPosition(int position) {
		this.position = position;
	}

	/**
	 * @return Returns the fileType.
	 */
	public String getFileType() {
		return fileType;
	}
	/**
	 * @param fileType The fileType to set.
	 */
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	/**
	 * @return Returns the properties.
	 */
	public String getProperty( String name ) throws Exception{
		if(properties == null)
			loadProperties();
					
		return this.properties.getProperty(name, "");
	}
	/**
	 * @param properties The properties to set.
	 */
	public void setProperty(String name, String value) throws Exception{
		if(properties == null)
			properties = new Properties();
		this.properties.setProperty(name, value);
	}
	
	public void load() throws Exception {
		if(idPage != 0 && idZone != 0 ){
		    DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);

			String sql = "SELECT id_file, file_type, include_file, position " +
							"FROM page_content " +
							"WHERE id_page = " + this.idPage + " AND id_zone = " + idZone;
			 
			dataBase.db_query(sql, false, null);
			Hashtable row = dataBase.db_fetch_array();
			
			if(row != null){
				this.idFile = (row.get("ID_FILE") != null ) ? Integer.parseInt( row.get("ID_FILE").toString() ) : 0;
				this.position = (row.get("POSITION") != null ) ? Integer.parseInt( row.get("POSITION").toString() ) : 0;
				this.fileType = (row.get("FILE_TYPE")!= null)? row.get("FILE_TYPE").toString() : null;
				this.includeFile = (row.get("INCLUDE_FILE") != null)? row.get("INCLUDE_FILE").toString() : null;
				loadProperties();
				setInDataBase(true);
			}
			
			dataBase.close();
		}
		this.loadProperties();
	}

	/* (non-Javadoc)
	 * @see intranet.filesystem.File#commit()
	 */
	public void commit() throws Exception {
	    DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
	    
		String sql = "";

		if(isInDataBase()){
			sql = "UPDATE page_content SET " +
					"id_file = " + (this.idFile != 0? String.valueOf(this.idFile) : "NULL") + ", " + 
					"position = " + this.position + ", " +
					"file_type = " + (this.fileType != null && !this.fileType.equals("")? "'" + this.fileType + "'" : "NULL") + ", " +
					"include_file = " + (this.includeFile != null? "'" + this.includeFile + "'" : "NULL") + " " +
					"WHERE id_page = " + this.idPage + " AND id_zone = " + idZone + " AND position = " + this.position;
			
			dataBase.db_query( sql, false, null );
		}
		else{
			
			sql = "INSERT INTO " +
					"page_content " + 
					"(id_page, id_zone, id_file, position, file_type, include_file)" +
					" VALUES " +
					"(" + this.idPage + ", " + this.idZone + ", " + (this.idFile != 0? String.valueOf(this.idFile) : "NULL") + ", " + this.position + ", " + (this.fileType != null && !this.fileType.equals("")? "'" + this.fileType + "'" : "NULL") + ", " + (this.includeFile != null? "'" + this.includeFile + "'" : "NULL") + ")";
			
			dataBase.db_query(sql, false, null);
			setInDataBase(true);
		}
		dataBase.close();
		
		commitProperties();
	}

	public void erase() throws Exception {
		if(isInDataBase()){
		    DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
		    
			String sql = "DELETE FROM page_content " +
							"WHERE id_page = " + this.idPage + " AND id_zone = " + idZone + " AND position = " + position;

			dataBase.db_query( sql, false, null );
			this.position = 0;
			dataBase.close();
		}
	}
	
	public void commitProperties() throws Exception{
	    if(isInDataBase() && isSaveProperties()){
	        DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
	        
			String sql = "DELETE FROM " +
							"page_content_property " +
							"WHERE id_page = " + this.idPage + " AND id_zone = " + idZone + " AND position = " + position;
			
			dataBase.db_query( sql, false, null );
			
			Enumeration keys = this.properties.keys();
			while(keys.hasMoreElements( ) )	{
				String key = (String)keys.nextElement( );
				sql = "INSERT INTO " +
						"page_content_property " +
						"(id_page, id_zone, position, name, value) " +
						"VALUES " +
						"(" + this.idPage + ", " + this.idZone + ", " + this.position + ", '" + key + "', '" + this.properties.get(key) + "' )";
				
				dataBase.db_query(sql, false, null);
			}
			
			dataBase.close();
	    }
	}

	public void loadProperties() throws Exception{
	    if(this.properties == null)
            this.properties = new Properties();
	   
	    DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);

		String sql = "SELECT name, value " +
						"FROM page_content_property " +
						"WHERE id_page = " + this.idPage + " AND id_zone = " + idZone + " AND position = " + position;
		
		dataBase.db_query(sql, false, null);
		Hashtable row;
		
		while((row = dataBase.db_fetch_array()) != null)
			properties.setProperty(row.get("NAME").toString(), row.get("VALUE").toString());
		
		dataBase.close();
	}

	public void generateHtml() throws Exception {
	    if(request.getParameter("admin") != null){
	        out.println("<table bgcolor='#FFFFFF' cellpaddig='0' width='100%' cellspacing='0' border='0' style='border: 1px dashed #366AB5;'>"); 
	        out.println("<tr class=\"zone\">"); 
	        out.println("<td bgcolor='#CCCCCC' style='font-face: Arial; font-size: 9px; color: #333333;'><a href='#' onClick='removeContent(" + getIdPage() + ", " + getIdZone() + ", " + getPosition() + ");'>Eliminar</a></td>");
	        out.println("<td bgcolor='#CCCCCC' style='font-face: Arial; font-size: 9px; color: #333333;'><a href='#' onClick='editContent(" + getIdPage() + ", " + getIdZone() + ", " + getPosition() + ");'>Editar</a></td>");
	        out.println("</tr><tr><td colspan='2' width='100%'>");
	    }
	    
	    request.setAttribute("properties", properties);
	    if(includeFile == null){
			if(properties == null)
				loadProperties();

			boolean useIFrame = ( properties.getProperty("viewUseIFrame", "false").equals("true") )? true : false;
			boolean useIFrameScroll = ( properties.getProperty("viewUseIFrameScroll", "false").equals("true") )? true : false;
			
			if (fileType.equals("Enlace") && request.getParameter("admin") == null) {
				LinkFile fileLink = new LinkFile();
				fileLink.setIdFile(idFile);
				fileLink.load();
				
				idFile = fileLink.getLinkFile();
				fileType = fileLink.getLinkFileType();
			}
			
			if( !useIFrame ){
				String file = Util.getViewFile(fileType, ((Session)request.getSession().getAttribute("sessionApp")).getSite().getName());
				
				request.setAttribute("idFile", String.valueOf(idFile));
				
				if(file != null)
					pageContext.include("/" + file);
				else
					pageContext.include("/" + Util.getViewFile("default", ((Session)request.getSession().getAttribute("sessionApp")).getSite().getName()));
			}else{
				long sessionId = Calendar.getInstance().getTimeInMillis();
				request.getSession().setAttribute( sessionId + "Prop", properties );
				String additionalParams = "";
				if( request.getParameter("idFile") != null )
					additionalParams += "&idFile=" + request.getParameter("idFile");
				
				if( request.getAttribute("showFile") != null )	
					additionalParams += "&showFile=" + request.getAttribute("showFile");
				
				out.println( "<iframe width=\"" + properties.getProperty("viewUseIFrameWidth", "100%") + "\" height=\"" + properties.getProperty("viewUseIFrameHeight", "100%") + "\" frameborder=\"0\" marginheight=\"0\" marginwidth=\"0\" scrolling=\"" + ( useIFrameScroll ? "yes" : "no" ) + "\" src=\"site/mvc/show_content.jsp?idFile_=" + idFile + "&fileType=" + fileType + "&sessionId=" + sessionId + additionalParams + "\"></iframe>" );
			}		
	    }else{
	        pageContext.include((!includeFile.startsWith("/")? "/" : "") + includeFile);
	    }
	    
	    if(request.getParameter("admin") != null){
	        out.println("</td></tr>"); 
	        out.println("</table>"); 
	    }
	}

	public Object copyObject() throws Exception{
		PageContent pageContent = new PageContent();
		pageContent.setIdPage(idPage);
		pageContent.setIdZone(idZone);
		pageContent.setPosition(position);
		pageContent.setIdFile(idFile);
		pageContent.setFileType(fileType);
		pageContent.setIncludeFile(includeFile);
		pageContent.setOut(out);
		pageContent.setRequest(request);
		pageContent.setResponse(response);
		pageContent.setPageContext(pageContext);
		pageContent.setInDataBase(isInDataBase);
		pageContent.setSaveProperties(saveProperties);
		
		for(Enumeration e = properties.keys(); e.hasMoreElements(); ){
			String key = e.nextElement().toString();
			pageContent.setProperty(key, properties.getProperty(key));
		}
			
		return pageContent;
	}
	
	public void finalize(){
	}
}
