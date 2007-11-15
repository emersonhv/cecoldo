/*
 * Created on 10/11/2004
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.cms.servlet;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.media.jai.codec.ImageCodec;
import com.sun.media.jai.codec.ImageEncoder;

/**
 * @author admin
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class TitleImage extends HttpServlet{
    /**
	 * 
	 */
	private static final long serialVersionUID = -2016559417434726413L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        
        try{
            if(request.getParameter("title") != null){
                
                ImageEncoder encoder = ImageCodec.createImageEncoder("PNG", response.getOutputStream(), null);
                response.addHeader("Content-Type", "image/png");
                response.addHeader("Content-Disposition", "inline; filename=titulo.png;");
                
                int width = 400;
                int height = 30;
                /*float ratioG = 1.0f;
                
                float startGradientX = 0;
                float endGradientX = width;
                Color bgColor = null;
                
                if(ratioG < 0.5f){
                    endGradientX = width*(1 - 0.5f + ratioG);
                    bgColor = new Color(94, 161, 203);
                }
                
                if(ratioG > 0.5f){
                    startGradientX = width*(ratioG - 0.5f);
                    bgColor = new Color(0, 0, 0);
                }*/
                
                if(request.getParameter("width") != null)
                    width = Integer.parseInt(request.getParameter("width"));
                
                if(request.getParameter("height") != null)
                    height = Integer.parseInt(request.getParameter("height"));
           
                String title = request.getParameter("title");
                
                BufferedImage outputImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
                Graphics2D g = (Graphics2D)outputImage.createGraphics();
               
                
                g.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                g.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
                
                g.setColor(new Color(255, 255, 255));
                g.fill(new Rectangle2D.Float(0, 0, width, height));
                g.setColor(new Color(58, 73, 90));
                g.setFont(new Font("arial", Font.BOLD, 19));
                g.drawString(title, 1, outputImage.getHeight()/2 + 7);

                encoder.encode(outputImage);
            }
	    	
        }catch(Exception e){
            System.out.println("Error en el servidor");
            e.printStackTrace();
        }
    }
}
