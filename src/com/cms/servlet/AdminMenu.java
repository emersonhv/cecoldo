/*
 * Created on 18/01/2005
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
import java.awt.image.RenderedImage;
import java.awt.image.renderable.ParameterBlock;
import java.io.File;
import java.io.IOException;

import javax.media.jai.Interpolation;
import javax.media.jai.JAI;
import javax.media.jai.RenderedOp;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cms.util.IntranetProperties;
import com.cms.util.Util;
import com.sun.media.jai.codec.ImageCodec;
import com.sun.media.jai.codec.ImageEncoder;

/**
 * @author admin
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class AdminMenu extends HttpServlet{
    
    /**
	 * 
	 */
	private static final long serialVersionUID = -2044330202712776695L;
	public final static int MENU_BUTTON_OUT = 0;
    public final static int MENU_BUTTON_OVER = 1;
    public final static int SUBMENU_BUTTON_OUT = 2;
    public final static int SUBMENU_BUTTON_OVER = 3;
    
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        
        try{
            if(request.getParameter("title") != null){
                ImageEncoder encoder = ImageCodec.createImageEncoder("PNG", response.getOutputStream(), null);

                response.addHeader("Content-type", "image/png");
                response.addHeader("Content-disposition", "inline; filename=titulo.png;");
                
                String title = request.getParameter("title");
                int imageType = (request.getParameter("imageType") != null)? Integer.parseInt(request.getParameter("imageType")) : 0;
                
                BufferedImage finalImage = new BufferedImage(10, 10, BufferedImage.TYPE_INT_ARGB);
                Graphics2D g = (Graphics2D)finalImage.createGraphics();
                g.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                g.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
                
                Font font = null;
                Rectangle2D bounds = null;
                int fontWidth = 0;
                int fontHeight = 0;
                int imageWidth = 0;
                int imageHeight = 0;
                
                switch(imageType){
	            	case 0:
	            	    font = new Font("Arial", Font.BOLD, 11);
	            	    bounds = font.getStringBounds(title.toUpperCase(), g.getFontRenderContext());
	            	    fontWidth = (int)Math.ceil(bounds.getWidth());
	                    fontHeight = (int)bounds.getHeight();
	            	    imageWidth = fontWidth + 30;
                	    imageHeight = 25;
                	    finalImage = treePiecesImage(title.toUpperCase(), "button_orange.png", fontWidth, fontHeight, imageWidth, imageHeight, font, Color.WHITE, new Color(125, 125, 125));
	            	    break;
	            	case 1:
	            	    font = new Font("Arial", Font.BOLD, 11);
	            	    bounds = font.getStringBounds(title.toUpperCase(), g.getFontRenderContext());
	            	    fontWidth = (int)Math.ceil(bounds.getWidth());
	                    fontHeight = (int)bounds.getHeight();
	                    imageWidth = fontWidth + 30;
                	    imageHeight = 25;
                	    finalImage = treePiecesImage(title.toUpperCase(), "button_gray.png", fontWidth, fontHeight, imageWidth, imageHeight, font, Color.WHITE, new Color(125, 125, 125));
	            	    break;
	            	case 2:
	            	    font = new Font("Arial", Font.BOLD, 11);
	            	    bounds = font.getStringBounds(Util.ucWords(title), g.getFontRenderContext());
	            	    fontWidth = (int)Math.ceil(bounds.getWidth());
	                    fontHeight = (int)bounds.getHeight();
	            	    imageWidth = fontWidth + 20;
                	    imageHeight = 20;
                	    finalImage = onePieceImage(Util.ucWords(title), "sub_menu.png", fontWidth, fontHeight, imageWidth, imageHeight, font, new Color(125, 125, 125), null);
	            	    break;
	            	case 3:
	            	    font = new Font("arial", Font.BOLD, 11);
	            	    bounds = font.getStringBounds(Util.ucWords(title), g.getFontRenderContext());
	            	    fontWidth = (int)Math.ceil(bounds.getWidth());
	                    fontHeight = (int)bounds.getHeight();
	            	    imageWidth = fontWidth + 20;
                	    imageHeight = 20;
                	    finalImage = onePieceImage(Util.ucWords(title), "sub_menu_over.png", fontWidth, fontHeight, imageWidth, imageHeight, font, new Color(102, 102, 102), null);
	            	    break;
	            	default:
	            	    return;
	            }

                encoder.encode(finalImage);
            }
	    	
        }catch(Exception e){
            System.out.println("Error en el servidor");
            e.printStackTrace();
        }
    }
    
    public BufferedImage treePiecesImage(String title, String imageName, int fontWidth, int fontHeight, int imageWidth, int imageHeight, Font font, Color front, Color back){
        RenderedOp base = JAI.create("fileload", IntranetProperties.BASE_PATH + "cms" + File.separatorChar + "images" + File.separatorChar + "DinamicMenu" + File.separatorChar + "middle_" + imageName);
        RenderedOp middleButtonOp = scaleToPix(base, fontWidth, imageHeight);
        BufferedImage middleButton = middleButtonOp.getAsBufferedImage();
        Graphics2D g = (Graphics2D)middleButton.createGraphics();
        g.setFont(font);
        g.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
        g.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
        if(back != null){
            g.setColor(back);
            g.drawString(title, 1, middleButton.getHeight()/2 + fontHeight/2 + 1);
        }
        
        if(front != null){
            g.setColor(front);
            g.drawString(title, 0, middleButton.getHeight()/2 + fontHeight/2);
        }

        RenderedOp leftButtonOp = JAI.create("fileload", IntranetProperties.BASE_PATH + "cms" + File.separatorChar + "images" + File.separatorChar + "DinamicMenu" + File.separatorChar + "left_" + imageName);
        BufferedImage leftButton = leftButtonOp.getAsBufferedImage();
        RenderedOp rightButtonOp = JAI.create("fileload", IntranetProperties.BASE_PATH + "cms" + File.separatorChar + "images" + File.separatorChar + "DinamicMenu" + File.separatorChar + "right_" + imageName);
        BufferedImage rightButton = rightButtonOp.getAsBufferedImage();
        
        BufferedImage finalImage = new BufferedImage(leftButton.getWidth() + middleButton.getWidth() + rightButton.getWidth(), leftButton.getHeight(), BufferedImage.TYPE_4BYTE_ABGR);
        g = (Graphics2D)finalImage.createGraphics();
        g.drawImage(leftButton, 0, 0, null);
        g.drawImage(middleButton, leftButton.getWidth(), 0, null);
        g.drawImage(rightButton, leftButton.getWidth() + middleButton.getWidth(), 0, null);
        
        return finalImage;
    }
    
    public BufferedImage onePieceImage(String title, String imageName, int fontWidth, int fontHeight, int imageWidth, int imageHeight, Font font, Color front, Color back){
        RenderedOp base = JAI.create("fileload", IntranetProperties.BASE_PATH + "cms" + File.separatorChar + "images" + File.separatorChar + "DinamicMenu" + File.separatorChar + imageName);
        RenderedOp middleButtonOp = scaleToPix(base, imageWidth, imageHeight);
        BufferedImage finalImage = middleButtonOp.getAsBufferedImage();
        Graphics2D g = (Graphics2D)finalImage.createGraphics();
        g.setFont(font);
        g.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
        g.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
        if(back != null){
            g.setColor(back);
            g.drawString(title, finalImage.getWidth()/2 - fontWidth/2 + 1, finalImage.getHeight()/2 + fontHeight/2 + 1);
        }
        
        if(front != null){
            g.setColor(front);
            g.drawString(title, finalImage.getWidth()/2 - fontWidth/2, finalImage.getHeight()/2 + fontHeight/2);
        }        
        
        return finalImage;
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
