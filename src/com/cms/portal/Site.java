/*
 * Created on 12/03/2005
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.cms.portal;


import java.util.Hashtable;

import com.cms.dao.DataBase;
import com.cms.dao.DataBaseFactory;
import com.cms.util.IntranetProperties;

/**
 * @author admin
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class Site {
    private int idSite;
    private String name;
    private String description;
    private String contact;
    private boolean mainSite;
    
    public Site(){
        mainSite = false;
    }
    
    public int getHomePage() throws Exception{
        DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
        try{
            String sql = "SELECT id_page " +
            				"FROM page " +
            				"WHERE id_site = " + this.idSite + " AND home_page = 1";
            dataBase.db_query(sql, false, null);
            Hashtable row = dataBase.db_fetch_array();
            
            dataBase.close();
            dataBase = null;
            
            if(row != null)
                return Integer.parseInt(row.get("ID_PAGE").toString());
            
            throw new Exception("No home page for this site");
        }catch(Exception e){
            try{dataBase.close();}catch(Exception exc){}
            dataBase = null;
            
            throw e;
        }
    } 
    
    /**
     * @return Returns the description.
     */
    public String getDescription() {
        return description;
    }
    /**
     * @param description The description to set.
     */
    public void setDescription(String description) {
        this.description = description;
    }
    /**
     * @return Returns the contact.
     */
    public String getContact() {
        return contact;
    }
    /**
     * @param contact The contact to set.
     */
    public void setContact(String contact) {
        this.contact = contact;
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
     * @return Returns the mainSite.
     */
    public boolean isMainSite() {
        return mainSite;
    }
    /**
     * @param mainSite The mainSite to set.
     */
    public void setMainSite(boolean mainSite) {
        this.mainSite = mainSite;
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
    
    public void load() throws Exception{
        DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
        try{
            String sql = "SELECT * " +
            				"FROM sites " +
            				"WHERE id_site = " + idSite;
            dataBase.db_query(sql, false, null);
            Hashtable row = dataBase.db_fetch_array();

            name = row.get("NAME").toString();
            description = (String)row.get("DESCRIPTION");
            contact = (String)row.get("CONTACT");
			mainSite = ( row.get("MAIN_SITE").toString().toLowerCase() == "true" || row.get("MAIN_SITE").toString().toLowerCase() == "1" );

			
            dataBase.close();
            dataBase = null;
        }catch(Exception e){
            try{dataBase.close();}catch(Exception exc){}
            dataBase = null;
            
            throw e;
        }
    }
    
    public void commit() throws Exception{
        DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
        try{
            if(mainSite){
                String sql = "SELECT id_site FROM sites WHERE main_site = true";
                dataBase.db_query(sql, false, null);
                Hashtable row = null;
                if((row = dataBase.db_fetch_array()) != null){
                    if(idSite == 0 || idSite != Integer.parseInt(row.get("ID_SITE").toString()))
                        throw new Exception("Otro sitio ya esta definido como sitio principal");
                }
            }
            
            if(this.idSite != 0){
	            String sql = "UPDATE sites " +
	            				"SET name = '" + name + "', " +
	            				"description = " + (description != null? "'" + description + "'" : "NULL") + "," +
	            				"contact = " + (contact != null? "'" + contact + "'" : "NULL") + "," +
	            				"main_site = " + mainSite + " " +
	            				"WHERE id_site = " + idSite;
	            dataBase.db_query(sql, false, null);
            }else{
                String sql = "INSERT INTO sites " +
                				"(id_site, name, description, main_site, contact) " +
                				"VALUES " +
                				"(?, '" + name + "', " + (description != null? "'" + description + "'" : "NULL") + ", " + (contact != null? "'" + contact + "'" : "NULL") + ", " + mainSite + ")";
                
                Object key = dataBase.db_query(sql, false, "site_seq");
                idSite = Integer.parseInt(key.toString());
            }
            
            dataBase.close();
            dataBase = null;
        }catch(Exception e){
            try{dataBase.close();}catch(Exception exc){}
            dataBase = null;
            
            throw e;
        }
    }
}
