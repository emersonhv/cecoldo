/*
 * Created on 11/02/2005
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.cms.portal;


import java.util.Hashtable;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;

import com.cms.dao.DataBase;
import com.cms.dao.DataBaseFactory;
import com.cms.util.IntranetProperties;

/**
 * @author admin
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class PageZone {
    private int idZone;
    private int idPage;
    private boolean needUpdate;
    private Vector pageContents;
    private Hashtable aditionalParameters;
	private DataBase dataBase;
	private HttpServletRequest request;
	private HttpServletResponse response;
	private PageContext pageContext;
	private JspWriter out;
    
    public PageZone(){
        idZone = 0;
        needUpdate = false;
        pageContents = new Vector();
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
     * @return Returns the dataBase.
     */
    public DataBase getDataBase() {
        return dataBase;
    }
    /**
     * @param dataBase The dataBase to set.
     */
    public void setDataBase(DataBase dataBase) {
        this.dataBase = dataBase;
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
     * @return Returns the needUpdate.
     */
    public boolean isNeedUpdate() {
        return needUpdate;
    }
    /**
     * @param needUpdate The needUpdate to set.
     */
    public void setNeedUpdate(boolean needUpdate) {
        this.needUpdate = needUpdate;
    }
    /**
     * @return Returns the pageContents.
     */
    public Vector getPageContents() {
        return pageContents;
    }
    /**
     * @param pageContents The pageContents to set.
     */
    public void setPageContents(Vector pageContents) {
        this.pageContents = pageContents;
    }
    
    public void addPageContent(PageContent pageC){
        pageContents.addElement(pageC);
    }
    
    public void insertPageContent(int insertAt, PageContent pageC){
		if(pageC.isInDataBase())
			setNeedUpdate(true);
					
        pageContents.insertElementAt(pageC, insertAt);
        
        for(int i = insertAt + 1; i < getPageContentCount(); i++)
            getPageContentAt(i).setPosition(i + 1);
      
    }
    
    public void setPageContentAt(int index, PageContent pageC) throws Exception{
    	if(pageContents.size() == index){
			addPageContent(pageC);
    		return;
    	}
    	
        if(pageC.getPosition() - 1 == index)
            pageContents.set(index, pageC);
        else
            throw new Exception("Invalid update position.");
    }
    
    public int getPageContentCount(){
        return pageContents.size();
    }
    
    public PageContent getPageContentAt(int index){
        if(index >= 0 && index < getPageContentCount())
            return (PageContent)pageContents.get(index);
        
        return null;
    }
    
    public void removeContent(PageContent pageC){
        if(pageC.isInDataBase())
            setNeedUpdate(true);
        
        pageContents.remove(pageC.getPosition() - 1);
        
        for(int i = pageC.getPosition() - 1; i < getPageContentCount(); i++)
            getPageContentAt(i).setPosition(i + 1);
        
    }
    
    public void load() throws Exception{
		DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
		String sql = "SELECT position, id_file, file_type, include_file " +
						"FROM page_content " +
						"WHERE id_page = " + this.idPage + " AND id_zone = " + idZone;
		
		dataBase.db_query(sql, false, null);
		Hashtable row;
		pageContents = new Vector();
		
		while((row = dataBase.db_fetch_array()) != null){
			PageContent pageContent = new PageContent();
			pageContent.setIdZone(idZone);
			pageContent.setIdPage(idPage);
			pageContent.setPosition((row.get("POSITION") != null)? Integer.parseInt(row.get("POSITION").toString()) : 0);
			pageContent.setIdFile((row.get("ID_FILE") != null)? Integer.parseInt(row.get("ID_FILE").toString()): 0);
			pageContent.setFileType((row.get("FILE_TYPE") != null)? row.get("FILE_TYPE").toString() : null);
			pageContent.setIncludeFile((row.get("INCLUDE_FILE") != null)? row.get("INCLUDE_FILE").toString() : null);
			pageContent.setInDataBase(true);
			pageContent.setOut(out);
			pageContent.setPageContext(pageContext);
			pageContent.setRequest(request);
			pageContent.setResponse(response);
			pageContents.addElement(pageContent);
		}
		
		dataBase.close();
		
    }
    
    public void commitZone() throws Exception{
    	if(isNeedUpdate()){
    		for(int i = 0; i < getPageContentCount(); i++){
    			getPageContentAt(i).setIdPage(this.idPage);
    			getPageContentAt(i).setIdZone(this.idZone);
    		    getPageContentAt(i).setInDataBase(false);
				getPageContentAt(i).setSaveProperties(true);
				getPageContentAt(i).loadProperties();
    		}
			
			DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
			String sql = "DELETE " +
							"FROM page_content " +
							"WHERE id_page = " + this.idPage + " AND id_zone = " + idZone;
							
			dataBase.db_query(sql, false, null);
			dataBase.close();
    	}

		for(int i = 0; i < getPageContentCount(); i++){
			getPageContentAt(i).commit();
		}
    }
    
    public void generateHtml() throws Exception{
        if( request.getParameter( "admin" ) != null )	{
        	out.print(
    			"<table width=\"100%\" style=\"height:100%\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\">" + 
    			"<tr>" + 
    			"	<td class=\"zone\" width=\"50%\"><a href=\"#\" onClick=\"addContent(" + getIdPage() + ", " + getIdZone() + ", " + (getPageContentCount() + 1) + ");\">Agregar Contenido</a></td>" + 
    			"	<td class=\"zone\"><a href=\"#\" onClick=\"duplicateZone(" + getIdPage() + ", " + getIdZone() + ");\">Duplicar Zona</a></td>" + 
    			"</tr>" + 
    			"<tr>" + 
    			"<td colspan=\"2\">"
        	);
        	/*
            out.println("<table width=\"100%\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#CCCCCC\" onMouseOut=\"this.bgColor='#CCCCCC'\" onMouseOver=\"this.bgColor='#CCCCFF'\">");
    	    out.println("<tr class=\"zone\"><td align=\"center\" height=\"100%\">");
    	    out.println("<a href=\"#\"  onClick=\"addContent(" + getIdPage() + ", " + getIdZone() + ", " + (getPageContentCount() + 1) + ");\"><b>Agregar Contenido</b></a>");
    	    out.println("</td></tr><tr><td align=\"left\" width='100%'>");
    	    */
        }
        
    	for(int i = 0; i < getPageContentCount(); i++){
    	    getPageContentAt(i).setOut(out);
    	    getPageContentAt(i).setRequest(request);
    	    getPageContentAt(i).setResponse(response);
    	    getPageContentAt(i).setPageContext(pageContext);
    	    getPageContentAt(i).generateHtml();
    	}
    	
    	if(request.getParameter("admin") != null){
            out.println("</td></tr>");
    	    out.println("</table>");
        }
    }
}
