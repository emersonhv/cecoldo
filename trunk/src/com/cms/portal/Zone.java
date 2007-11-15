/*
 * Created on 4/02/2005
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
 * @author Administrador
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class Zone {
	private int idZone;
	private int idTemplate;
	private int position;
	
	
	/**
	 * 
	 */
	public Zone( ) {
		this.idZone = 0;
		this.idTemplate = 0;
		this.position = 0;
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
	 * @return Returns the position.
	 */
	public int getPosition() {
		return position;
	}
	/**
	 * @param position The position to set.
	 */
	public void setPosition(int position) {
		this.position = position;
	}

	public void load( ) throws Exception {
        if ( this.idZone != 0 ) {
            DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
            
            String sql = "SELECT * FROM zone WHERE id_zone = " + this.idZone;
            dataBase.db_query( sql, false, null );
            Hashtable row = dataBase.db_fetch_array( );

            this.idZone = Integer.parseInt ( row.get( "ID_ZONE" ).toString( ) );
            this.idTemplate = Integer.parseInt ( row.get( "ID_TEMPLATE" ).toString( ) );
            this.position = row.get( "POSITION" ) != null ? Integer.parseInt ( row.get( "POSITION" ).toString( ) ) : 0;
            
            dataBase.close();
        }
    }

    public void commit() throws Exception {
        DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
        
        String sql = "";

        if ( this.idTemplate != 0 )	{
	        if ( this.idZone != 0 ) {
	            sql = "UPDATE zone SET " + 
					"id_template = " + this.idTemplate + ", " + 
					"\"position\" = " + this.position + " " + 
	            		"WHERE id_zone = " + this.idZone;
	
	            dataBase.db_query( sql, false, null );
	        } else {
	            sql = "INSERT INTO zone ( id_template, \"position\" ) VALUES ( " + this.idTemplate + ", " + this.position + " )";
	
	            Object key = dataBase.db_query( sql, false, "zone_seq" );
	            this.idZone = Integer.parseInt( key.toString( ) );
	        }
        }
        dataBase.close( );
    }

    public void erase( ) throws Exception {
		if ( this.idZone != 0 )	{
			DataBase database = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
			String sql = "DELETE FROM zone WHERE id_zone = " + this.idZone;

			database.db_query( sql, false, null );
			database.close();
		}
	}

	public String getContentByPage ( int idPage ) {
		
		String html = "";
		
		
		return html;
	}

}
