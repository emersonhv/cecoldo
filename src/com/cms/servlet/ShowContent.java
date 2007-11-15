/*
 * Created on 10/02/2005
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.cms.servlet;


import java.io.*;
import java.util.Hashtable;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cms.util.IntranetProperties;
import com.cms.vsystem.object.ContentFile;
import com.cms.vsystem.object.basic.Image;

/**
 * @author admin
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class ShowContent extends HttpServlet{
    /**
	 * 
	 */
	private static final long serialVersionUID = -6965707602620962284L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        OutputStream out 		= response.getOutputStream();
        ContentFile contentFile	= null;
        try{
            if(request.getParameter("idFile") != null){
                int idFile = Integer.parseInt((String)request.getParameter("idFile"));
				
				if (!IntranetProperties.USE_CACHE || !(new File(IntranetProperties.BASE_PATH + "/CACHE/" + idFile + "CNT")).exists()) {
					Image image = new Image();
					image.setIdFile(idFile);
					image.load();
					
					Hashtable row = image.getFileContent(0);
					
					if(row != null){
						contentFile = new ContentFile();
						
						contentFile.setIdExternalFile(image.getIdExternalFile());
						contentFile.setName((String)row.get("name"));
						contentFile.load();
						contentFile.beginReadContent();
						
						InputStream file = contentFile.getContent();
						FileOutputStream  fout = null;
						if (IntranetProperties.USE_CACHE)
							fout = new FileOutputStream (IntranetProperties.BASE_PATH + "/CACHE/" + idFile + "CNT");
							
						int ln;
						byte buffer[] = new byte[12*1024];
						while((ln = file.read(buffer)) != -1){
							out.write(buffer, 0, ln);
							
							if (IntranetProperties.USE_CACHE)
								fout.write(buffer, 0, ln);
						}
						
						if (IntranetProperties.USE_CACHE)
							fout.close();
						contentFile.endReadContent();
						contentFile = null;
						image = null;
						fout = null;
					}
				} else {
					int ln;
					byte buffer[] = new byte[12*1024];
					FileInputStream fileImg = new FileInputStream(IntranetProperties.BASE_PATH + "/CACHE/" + idFile + "CNT");
					while((ln = fileImg.read(buffer)) != -1){
						out.write(buffer, 0, ln);
					}
					
					out.flush();
					fileImg.close();
					fileImg = null;
				}
            }
        }catch(Exception e){
			try{contentFile.endReadContent();}catch(Exception e1){}
		   	contentFile = null;
            e.printStackTrace();
        }finally{
			try{contentFile.endReadContent();}catch(Exception e1){}
		   	contentFile = null;
		}
    }
}
