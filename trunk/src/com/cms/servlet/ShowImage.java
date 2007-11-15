package com.cms.servlet;


import java.awt.image.BufferedImage;
import java.awt.image.RenderedImage;
import java.awt.image.renderable.ParameterBlock;
import java.io.*;
import java.util.Hashtable;

import javax.media.jai.Interpolation;
import javax.media.jai.JAI;
import javax.media.jai.RenderedOp;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cms.util.IntranetProperties;
import com.cms.vsystem.object.ContentFile;
import com.cms.vsystem.object.basic.Image;
import com.sun.media.jai.codec.ImageCodec;
import com.sun.media.jai.codec.ImageEncoder;
import com.sun.media.jai.codec.MemoryCacheSeekableStream;
import com.sun.media.jai.codec.JPEGEncodeParam;

public class ShowImage extends HttpServlet{
    
    /**
	 * 
	 */
	private static final long serialVersionUID = -5711370365798456864L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        Image image 				= null;
		ContentFile contentFile 	= null;
		InputStream fileImg 		= null;
		OutputStream out 			= response.getOutputStream();
		BufferedImage finalImage 	= null;
		RenderedOp source			= null;
		
        try{
            if(request.getParameter("idFile") != null){
		        int idFile = Integer.parseInt((String)request.getParameter("idFile"));
		        int boundWidth = (request.getParameter("boundWidth") != null)? Integer.parseInt((String)request.getParameter("boundWidth")) : 0;
		    	int boundHeight = (request.getParameter("boundHeight") != null)? Integer.parseInt((String)request.getParameter("boundHeight")) : 0;
		    	boolean storeCache = false;
				
				response.addHeader("Content-Type", "image/jpeg");
				response.addHeader("Content-disposition", "inline; filename=imagen.jpg;");
				
				if (!IntranetProperties.USE_CACHE || !(new File(IntranetProperties.BASE_PATH + "/CACHE/" + idFile + request.getParameter("contentName") + "IMG")).exists() || true) {
					storeCache = true;
					image = new Image();
					image.setIdFile(idFile);
					image.load();
					
					contentFile = new ContentFile();
					Hashtable row;
					
					if(request.getParameter("contentName") == null)
						row = image.getFileContent(0);
					else
						row = image.getFileContent(request.getParameter("contentName"));
					
					if(row != null){
						contentFile.setIdExternalFile(image.getIdExternalFile());
						contentFile.setName((String)row.get("name"));
						contentFile.load( );
						contentFile.beginReadContent( );
						fileImg = contentFile.getContent( );
					} else {
						fileImg = new FileInputStream(IntranetProperties.BASE_PATH + "site/images/" + File.separator + "no_disponible.jpg");
					}
				
					ParameterBlock pb = new ParameterBlock();
					MemoryCacheSeekableStream stream = new MemoryCacheSeekableStream (fileImg);
					pb.add(stream);
					source = JAI.create("stream", pb);
					
					if(boundWidth != 0 && boundHeight != 0){
						int width = source.getWidth();
						int height = source.getHeight();
						if(width > height){
							if(width > boundWidth){
								height = (boundWidth*height)/width;
								width = boundWidth;
							}
						}else{
							if(height > boundHeight){
								width = (boundHeight*width)/height;
								height = boundHeight;
							}
						}
						
						source = scaleToPix(source, width, height);
					}
					
					finalImage = source.getAsBufferedImage();
                }
				
				if (storeCache && IntranetProperties.USE_CACHE) {
					FileOutputStream  fout = new FileOutputStream (IntranetProperties.BASE_PATH + "/CACHE/" + idFile + request.getParameter("contentName") + "IMG");
					JPEGEncodeParam encodeParam = new JPEGEncodeParam();
     				encodeParam.setQuality(1.0f);
					ImageEncoder encoder = ImageCodec.createImageEncoder("JPEG", fout, encodeParam);
		        	encoder.encode(finalImage);
					fout.close();
					fout = null;
					contentFile.endReadContent(); 
		    		contentFile.close();
				}
		    	
				if (IntranetProperties.USE_CACHE) {
					int ln;
					byte buffer[] = new byte[12*1024];
					fileImg = new FileInputStream(IntranetProperties.BASE_PATH + "/CACHE/" + idFile + request.getParameter("contentName") + "IMG");
					while((ln = fileImg.read(buffer)) != -1){
						out.write(buffer, 0, ln);
					}
					
					out.flush();
					fileImg.close();
					fileImg = null;
				} else {
					JPEGEncodeParam encodeParam = new JPEGEncodeParam();
     				encodeParam.setQuality(1.0f);
					ImageEncoder encoder = ImageCodec.createImageEncoder("JPEG", out, encodeParam);
		        	encoder.encode(finalImage);
				}
				
				finalImage 	= null;
		    	image 		= null;
		    	source 		= null;
		    	contentFile = null;
            }
	    	
        }catch(Exception e){
            e.printStackTrace();
			try{contentFile.endReadContent();}catch(Exception e1){}
		    try{contentFile.close();}catch(Exception e1){}
		    image = null;
		    contentFile = null;
        }finally{
			try{contentFile.endReadContent();}catch(Exception e1){}
		    try{contentFile.close();}catch(Exception e1){}
		    image = null;
		    contentFile = null;
		}
    }
    
    public static RenderedOp scaleToPix(RenderedImage source , double pixX,double pixY){
        if(source==null)
            return null;
        
	      int ww = source.getWidth();
	      int hh = source.getHeight();
	      float fattX=(float)(pixX/ww);
	      float fattY=(float)(pixY/hh);
	   
	      Interpolation interp = Interpolation.getInstance(Interpolation.INTERP_NEAREST);//See note at the end of this answer
	      ParameterBlock parSC = new ParameterBlock();
	      parSC.addSource(source);
	      parSC.add(fattX);
	      parSC.add(fattY);
	      parSC.add(0.0f);
	      parSC.add(0.0f);
	      parSC.add(interp);
	      
	      try{
	        return JAI.create("scale", parSC);
	      }catch (Exception e){
	        e.printStackTrace();
	        return null;
	      }
    }
}
