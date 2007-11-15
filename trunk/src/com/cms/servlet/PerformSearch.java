/*
 * Created on 3/11/2004
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.cms.servlet;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.Hashtable;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cms.security.Session;
import com.cms.vsystem.object.Folder;

/**
 * @author admin
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class PerformSearch extends HttpServlet{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1885103462855598619L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        PrintWriter out = response.getWriter();
        
        try{
            if(request.getParameter("idFile") != null){
		        int idFile = Integer.parseInt((String)request.getParameter("idFile"));
		        Folder file = new Folder();
		        file.setIdFile(idFile);
		        file.load();
		        
		        String pathArray[] = /*file.getPathRoot().split("[,]")*/ new String[1];
		        int page = Integer.parseInt(pathArray[pathArray.length - 1]);
		        int section = Integer.parseInt(pathArray[1]);
		        int idNew = file.getIdFile();
		        
		        Session session = (Session)request.getSession().getAttribute("sessionApp");
		        
		        if(session != null){
		            Folder pageFile = new Folder();
		            pageFile.setIdFile(page);
		            pageFile.load();
		          
		            Vector pages = session.getPages(pageFile.getName());
		            if(pages.size() > 0 ){
		                int idPage = Integer.parseInt( ((Hashtable)pages.get(0)).get("ID_PAGE").toString() );
		                
		                out.println("<script>");
		                out.println("document.location='/index.jsp?page=" + idPage + "&section=" + section + "&idNew=" + idNew + "';");
		                out.println("</script>");
		            }else
		                out.println("No existe una pagina que coincida con la carpeta: " + file.getName());
		        }else
		            out.println("La sesion es nula");
            }else{
                out.println("Se necesita el id del archivo");
            }
	    	
        }catch(Exception e){
            out.println("Error en el servidor");
            e.printStackTrace();
        }
    }
}
