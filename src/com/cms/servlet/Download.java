package com.cms.servlet;

import intranet.history.History;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cms.security.Session;
import com.cms.vsystem.object.ContentFile;

public class Download extends HttpServlet{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        OutputStream out = response.getOutputStream();
        ContentFile contentF = null;
		
        try{
            if(request.getParameter("idExternalFile") != null && request.getParameter("name") != null){
                int idExternalFile = Integer.parseInt((String)request.getParameter("idExternalFile"));
                String fileName = request.getParameter("name");
                
                if(request.getParameter("idFile") != null){
                    History.addHistoryFile(Integer.parseInt(request.getParameter("idFile").toString()), 
                            				((Session)request.getSession().getAttribute("sessionApp")).getUser().getIdUser(), 
                            				"download" );
                }
                
				contentF = new ContentFile();
            	contentF.setIdExternalFile(idExternalFile);
            	contentF.setName(fileName);
            	contentF.load();
                contentF.beginReadContent();
            	
            	response.addHeader("Content-Type", contentF.getContentType());
            	response.addHeader("Content-Disposition", "attachment; filename=" + contentF.getName().replaceAll("[ ]", "_") + ";");
            	InputStream file = contentF.getContent();

            	int ln;
	    	    byte buffer[] = new byte[12*1024];
	    	    while((ln = file.read(buffer)) != -1)
	    	        out.write(buffer, 0, ln);
		    	
				out.flush();
		    	contentF.endReadContent();
		    	contentF = null;
				out = null;
            }
        }catch(Exception e){
            e.printStackTrace();			
        }finally{
			try{contentF.endReadContent();}catch(Exception e1){}
			try{contentF.close();}catch(Exception e1){}
		    contentF = null;
		}
    }
}
