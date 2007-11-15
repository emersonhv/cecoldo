/*
 * Created on 4/02/2005
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.cms.portal;


import java.io.Serializable;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;

import com.cms.dao.DataBase;
import com.cms.dao.DataBaseFactory;
import com.cms.util.IntranetProperties;

import java.io.*;

/**
 * @author Administrador
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class Page implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int idPage;
	private int idTemplate;
	private String name;
	private int idSite;
	private boolean homePage;
	private Vector pageZones;
	private String pageContentHtml;
	private int idUser;
	private Hashtable aditionalParameters;
	private HttpServletRequest request;
	private HttpServletResponse response;
	private PageContext pageContext;
	private JspWriter out;
	/**
	 * 
	 */
	public Page() throws Exception{
	    idSite = this.idPage = 0;
		this.idTemplate = 0;
		this.name = "";
		pageContentHtml = null;
		idUser = 0;
		aditionalParameters = new Hashtable();
		request = null;
		response = null;
		pageContext = null;
		out = null;
	}
	
    /**
     * @return Returns the idSite.
     */
    public int getIdSite() {
        return idSite;
    }
    /**
     * @param idSite The idSite to set.
     */
    public void setIdSite(int idSite) {
        this.idSite = idSite;
    }
    /**
     * @return Returns the homePage.
     */
    public boolean isHomePage() {
        return homePage;
    }
    /**
     * @param homePage The homePage to set.
     */
    public void setHomePage(boolean homePage) {
        this.homePage = homePage;
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
     * @return Returns the pageContentHtml.
     */
    public String getPageContentHtml() {
        return pageContentHtml;
    }
    /**
     * @param pageContentHtml The pageContentHtml to set.
     */
    public void setPageContentHtml(String pageContentHtml) {
        this.pageContentHtml = pageContentHtml;
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
     * @param pageZones The pageZones to set.
     */
    public void setPageZones(Vector pageZones) {
        this.pageZones = pageZones;
    }
    /**
     * @return Returns the idUser.
     */
    public int getIdUser(){
        return idUser;
    }
    /**
     * @param idUser The idUser to set.
     */
    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }
    
    public void addParameter(String name, String value){
        aditionalParameters.put(name, value);
    }
    
    public String getParameter(String name){
        return (String)aditionalParameters.get(name);
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
	 * @return Returns the idTemplate.
	 */
	public int getIdTemplate() {
		return idTemplate;
	}
	/**
	 * @param idTemplate The idTemplate to set.
	 */
	public void setIdTemplate(int idTemplate) {
		this.idTemplate = idTemplate;
	}
	/**
	 * @return Returns the name.
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name The name to set.
	 */
	public void setName(String name) {
		this.name = name;
	}

    public void load(boolean loadComplete) throws Exception {
        if ( this.idPage != 0 ) {
            DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
            
            String sql = "SELECT z.position, p.id_page, p.name, p.id_template, p.home_page, p.id_site, z.id_zone " +
							"FROM page p, zone z " + 
							"WHERE p.id_page = " + this.idPage + " AND p.id_template = z.id_template " +
							"ORDER BY position ASC";
							
            dataBase.db_query(sql, false, null);
            Hashtable row = dataBase.db_fetch_array();
			pageZones = new Vector();

            this.idPage = Integer.parseInt ( row.get( "ID_PAGE" ).toString( ) );
            this.idTemplate = Integer.parseInt ( row.get( "ID_TEMPLATE" ).toString( ) );
            this.name = row.get("NAME").toString();
            this.idSite = Integer.parseInt ( row.get( "ID_SITE" ).toString( ) );
            this.homePage = ( row.get( "HOME_PAGE" ) != null && ( row.get( "HOME_PAGE" ).toString( ).equals( "1" ) || row.get( "HOME_PAGE" ).toString( ).toLowerCase( ).equals( "true" ) ) )? true : false;
            
            PageZone pageZone = new PageZone();
			pageZone.setIdPage(idPage);
			pageZone.setIdZone(Integer.parseInt(row.get("ID_ZONE").toString()));
			pageZones.addElement(pageZone);
			
			while((row = dataBase.db_fetch_array()) != null){
				pageZone = new PageZone();
				pageZone.setIdPage(idPage);
				pageZone.setIdZone(Integer.parseInt(row.get("ID_ZONE").toString()));
				pageZones.addElement(pageZone);
			}
			
			if(loadComplete){
				sql = "SELECT id_zone, id_file, position, file_type, include_file " +
						"FROM page_content " +
						"WHERE id_page = " + idPage + " " +
						"ORDER BY id_zone ASC, position ASC";
						
				dataBase.db_query(sql, false, null);
				
				Vector pageConts = new Vector();
				while((row = dataBase.db_fetch_array()) != null)
				    pageConts.addElement(row);
				
				for(int i = 0; i < pageConts.size(); i++){
				    row = (Hashtable)pageConts.get(i);
					PageContent content = new PageContent();
					content.setIdZone((row.get("ID_ZONE") != null)? Integer.parseInt( row.get("ID_ZONE").toString() ) : 0);
					content.setIdFile((row.get("ID_FILE") != null)? Integer.parseInt( row.get("ID_FILE").toString() ) : 0);
					content.setPosition((row.get("POSITION") != null)? Integer.parseInt(row.get("POSITION").toString()) : 0);
					content.setFileType((row.get("FILE_TYPE") != null)? row.get("FILE_TYPE").toString() : null);
					content.setIncludeFile((row.get("INCLUDE_FILE") != null)? row.get("INCLUDE_FILE").toString() : null);
					content.setIdPage(idPage);
					content.setInDataBase(true);

					content.setProperty("idUser", String.valueOf(idUser));
					for(Enumeration keys = aditionalParameters.keys(); keys.hasMoreElements();){
					    String key = keys.nextElement().toString();
					    content.setProperty(key, aditionalParameters.get(key).toString());
					}
					
					for(int j = 0; j < pageZones.size(); j++){
					    if(((PageZone)pageZones.get(j)).getIdZone() == content.getIdZone()){
					        ((PageZone)pageZones.get(j)).addPageContent(content);
					        break;
					    }
					}
				}
				
				sql = "SELECT id_zone, position, name, value " +
						"FROM page_content_property " +
						"WHERE id_page = " + this.idPage + " " +
						"ORDER BY id_zone ASC, position ASC";
		
				dataBase.db_query(sql, false, null);
				while((row = dataBase.db_fetch_array()) != null){
				    int idZoneLoad = Integer.parseInt(row.get("ID_ZONE").toString());
				    
				    for(int j = 0; j < pageZones.size(); j++){
					    if(((PageZone)pageZones.get(j)).getIdZone() == idZoneLoad){
					        ((PageZone)pageZones.get(j)).getPageContentAt(Integer.parseInt(row.get("POSITION").toString()) - 1).setProperty(row.get("NAME").toString(), row.get("VALUE").toString());
					        break;
					    }
					}
				}
			}
			
			dataBase.close();
        }
    }

    public void commit(boolean commitComplete) throws Exception{
        String sql = "";

        if(this.idTemplate != 0){
            DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
            
            if(this.homePage){
	            sql = "SELECT id_page " +
	            		"FROM page " +
	            		"WHERE id_site = " + idSite + " AND home_page = 1";
	            dataBase.db_query(sql, false, null);
	            Hashtable row = dataBase.db_fetch_array();
	            if(row != null){
	                if(idPage == 0 || idPage != Integer.parseInt(row.get("ID_PAGE").toString()))
	                    throw new Exception("Otro sitio ya esta definido como sito principal");
	            }
            }
            
	        if(this.idPage != 0){
	            sql = "UPDATE page SET " + 
						"id_template = " + this.idTemplate + ", " + 
	            		"name='" + this.name + "', " +
	            		"home_page = " + ( this.homePage ? "1" : "0" ) + " " +
	            		"WHERE id_page = " + this.idPage;
	
	            dataBase.db_query(sql, false, null);
	        }else{
	            sql = "INSERT " +
						"INTO page " +
						"(id_template, name, id_site, home_page) " +
						"VALUES " +
						"( " + this.idTemplate + ", '" + this.name + "', " + idSite + ", " + ( this.homePage ? "1" : "0" ) + ")";
	
	            Object key = dataBase.db_query(sql, false, "page_seq");
	            this.idPage = Integer.parseInt(key.toString());
	        }
	        
	        dataBase.close();
        }
        
        if(commitComplete){
        	for(Enumeration e = this.getPageZones(); e.hasMoreElements(); ){
				PageZone pgZone = (PageZone)e.nextElement();
				pgZone.commitZone();
        	}
        }
    }

	public void erase() throws Exception {
		if(this.idPage != 0){
		    DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
		    
			String sql = "DELETE " +
							"FROM page " +
							"WHERE id_page = " + this.idPage;

			dataBase.db_query(sql, false, null);
			dataBase.close();
		}
	}
	
	public Enumeration getPageZones() throws Exception{
		if(pageZones != null)
			return pageZones.elements();
			
		return null;
	}
	
	public PageZone getPageZoneById(int idZone) throws Exception{
		if(pageZones != null){
		    for(int j = 0; j < pageZones.size(); j++){
			    if(((PageZone)pageZones.get(j)).getIdZone() == idZone){
			        return (PageZone)pageZones.get(j);
			    }
			}
		}
			
		return null;
	}

	public String getTemplateContent() throws Exception{
		if(pageContentHtml != null)
			return pageContentHtml;
		
		if(idTemplate != 0){
		    DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
		    
			pageContentHtml = "";
		    String sql = "SELECT content FROM template " +
							"WHERE id_template = " + this.idTemplate;
		    
			dataBase.db_query(sql, false, null);
			Hashtable row = dataBase.db_fetch_array();
			
			if(row != null)
				pageContentHtml = row.get("CONTENT").toString();
			
			dataBase.close();
		}
		
		return pageContentHtml;
	}
	
	public void alterPageContent(PageContent pageCont, boolean isInsert) throws Exception{
	    PageZone pageZone = null;
	    
	    for(int j = 0; j < pageZones.size(); j++){
		    if(((PageZone)pageZones.get(j)).getIdZone() == pageCont.getIdZone()){
		        pageZone = (PageZone)pageZones.get(j);
		        break;
		    }
		}
	    
	    if(isInsert)
	        pageZone.insertPageContent(pageCont.getPosition() - 1, pageCont);
		else
		    pageZone.addPageContent(pageCont);
	}
	
	public void delPageContent(PageContent pageCont) throws Exception{
	    for(int j = 0; j < pageZones.size(); j++){
		    if(((PageZone)pageZones.get(j)).getIdZone() == pageCont.getIdZone()){
		        ((PageZone)pageZones.get(j)).removeContent(pageCont);
		        return;
		    }
		}
	}

	public void generateHtml( ) throws Exception {
		String html = "";
		
		if(this.idPage != 0){
			html = getTemplateContent();			
			if(html.length() > 0){
			    request.setAttribute("aditionalParameters", aditionalParameters);
			    
				if( !(new File (IntranetProperties.BASE_PATH + "CACHE/" + this.getIdPage())).exists() || !IntranetProperties.USE_CACHE){
					
					int startPosition = 0;
					int endPosition = 0;
					for(int i = 0; i < pageZones.size(); i++){
						String searchTag = Template.splitStartTag + ((PageZone)pageZones.get(i)).getIdZone() + Template.splitMiddleTag;
						endPosition = html.indexOf(searchTag, startPosition);
						if(endPosition != -1){
							out.println(html.substring(startPosition, endPosition));
							((PageZone)pageZones.get(i)).setOut(out);
							((PageZone)pageZones.get(i)).setRequest(request);
							((PageZone)pageZones.get(i)).setResponse(response);
							((PageZone)pageZones.get(i)).setPageContext(pageContext);
							((PageZone)pageZones.get(i)).generateHtml();
							out.flush();
							endPosition += searchTag.length( );
	
							if ( !Template.splitEndTag.equals ( "" ) && html.indexOf ( Template.splitEndTag, endPosition ) > -1 )
								startPosition = html.indexOf ( Template.splitEndTag, endPosition ) + Template.splitEndTag.length();
						}
					}
					out.println(html.substring(startPosition, html.length()));
					out.flush();
				}else{
					FileInputStream pageCacheFile = new FileInputStream(IntranetProperties.BASE_PATH + "CACHE/" + this.getIdPage());
					byte buffer[] = new byte[12*1024];
					while( pageCacheFile.read(buffer) != -1)
						out.print(new String (buffer));
						
					out.flush();
					pageCacheFile.close();
				}
			}
		}
	}
	
	public void finalize(){
	}
}
