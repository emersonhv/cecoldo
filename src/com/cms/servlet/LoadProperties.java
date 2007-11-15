/*
 * Created on 15/03/2005
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.cms.servlet;


import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cms.util.IntranetProperties;

/**
 * @author admin
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class LoadProperties extends HttpServlet{
    /**
	 * 
	 */
	private static final long serialVersionUID = 5632691251693762668L;

	public void init(ServletConfig cfg) throws ServletException{
        super.init(cfg);
        log("Cargando propiedades----------.");
        String cfgFile = cfg.getServletContext().getRealPath("WEB-INF/site.properties");
        try{
            Properties prop = new Properties();
            prop.load(new FileInputStream(cfgFile));
            
            IntranetProperties.DATABASE_TYPE 			= Integer.parseInt(prop.getProperty("database.type"));
            IntranetProperties.DATABASE_USER_NAME		= prop.getProperty("database.user.name");
            IntranetProperties.DATABASE_USER_PASSWD		= prop.getProperty("database.user.passwd");
            IntranetProperties.DATABASE_MAX_CONNECTIONS	= Integer.parseInt(prop.getProperty("database.maxconnections"));
            IntranetProperties.DATABASE_MIN_CONNECTIONS	= Integer.parseInt(prop.getProperty("database.minconnections"));
            IntranetProperties.DATABASE_NAME			= prop.getProperty("database.name");
            IntranetProperties.DATABASE_PORT			= prop.getProperty("database.port");
            IntranetProperties.DATABASE_HOST			= prop.getProperty("database.host");
           
            IntranetProperties.USE_CACHE				= Boolean.valueOf(prop.getProperty("dayware.use.cache").trim()).booleanValue();
			IntranetProperties.INTRA_BASE_URL			= prop.getProperty("intra.base.url");
            IntranetProperties.INTRA_BASE_HOST			= prop.getProperty("intra.base.host");
            IntranetProperties.INTRA_BASE_NAME			= prop.getProperty("intra.base.name");
            IntranetProperties.BASE_PATH				= cfg.getServletContext().getRealPath("/");
            IntranetProperties.CHART_BASE				= prop.getProperty("chart.base");
            IntranetProperties.LOGOUT_TIME_OUT			= prop.getProperty("logout.time.out");
            log("base.path=>>>>>"+IntranetProperties.BASE_PATH);
        }catch(Exception e){
            log("No se pudo cargar las propiedades");
            throw new ServletException(e);
        }
    }
    
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        doGet(request, response);
    }	

    public void doGet(HttpServletRequest httpservletrequest, HttpServletResponse httpservletresponse) throws ServletException, IOException{
    }

}

