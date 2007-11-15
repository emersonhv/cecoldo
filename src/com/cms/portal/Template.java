/*
 * Created on 4/02/2005
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.cms.portal;


import java.util.Hashtable;
import java.util.Vector;

import com.cms.dao.DataBase;
import com.cms.dao.DataBaseFactory;
import com.cms.util.IntranetProperties;

/**
 * @author Administrador
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class Template {
	private int idTemplate;
	private String name;
	private String content;
	private int idSite;
	public static final String splitStartTag = "<div id=\"";
	public static final String splitMiddleTag = "\" name=\"templateZone\">";
	public static final String splitEndTag = "</div>";
	
	/**
	 * 
	 */
	public Template( ) {
		this.idTemplate = 0;
		this.name = "";
		this.content = "";
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
	 * @return Returns the content.
	 */
	public String getContent() {
		return content;
	}
	/**
	 * @param content The content to set.
	 */
	public void setContent(String content) {
		this.content = content;
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

	public void setValidZonePosition ( ) throws Exception	{
		String startTag = Template.splitStartTag;
		String endTag = Template.splitMiddleTag + Template.splitEndTag;
		int position = 1;
		
		if ( this.idTemplate != 0 )	{
			int endZone = 0, startZone = this.content.indexOf ( startTag );

			while ( startZone > -1 )	{
				startZone += startTag.length();
				
				if ( !endTag.equals ( "" ) && this.content.indexOf ( endTag, startZone ) != -1 )	{
					endZone = this.content.indexOf ( endTag, startZone );
	
					int idZone = 0;
					try {
						idZone = Integer.parseInt ( this.content.substring ( startZone, endZone ) );
					}
					catch ( Exception e )	{
					}
					
					if ( idZone != 0 )	{
						Zone zone = new Zone ( );
						zone.setIdZone( idZone );
						zone.load( );
						if ( zone.getPosition() != position )	{
							zone.setPosition( position );
							zone.commit();
						}
						position ++;
					}
				}
				startZone = this.content.indexOf ( startTag, startZone );
			}
		}
	}
	
	public int reshapeZonesByTag ( String startTag, String endTag ) throws Exception	{
		String temp_content = this.content.toLowerCase( );
		int totalZones = 0;
		startTag = startTag.toLowerCase();
		endTag = endTag.toLowerCase();
		
		if ( this.idTemplate != 0 && startTag.length ( ) > 0 )	{
			int endZone = 0, startZone = temp_content.indexOf ( startTag );

			while ( startZone > -1 )	{
				Zone zone = new Zone ( );
				zone.setIdTemplate( this.idTemplate );
				totalZones ++;
				
				if ( !endTag.equals ( "" ) && temp_content.indexOf ( endTag ) != -1 )
					endZone = temp_content.indexOf ( endTag ) + endTag.length();
				else
					endZone = startZone + startTag.length();
	
				zone.commit();
				
				this.content = this.content.substring ( 0, startZone ) + splitStartTag + zone.getIdZone( ) + splitMiddleTag + splitEndTag + this.content.substring ( endZone );
				
				temp_content = this.content.toLowerCase( );
				startZone = temp_content.indexOf ( startTag );
			}
		}
		return totalZones;
	}
	
    public void load() throws Exception {
        if ( this.idTemplate != 0 ) {
            DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
            
            String sql = "SELECT * FROM template WHERE id_template = " + this.idTemplate;
            dataBase.db_query(sql, false, null);
            Hashtable row = dataBase.db_fetch_array();

            this.idTemplate = Integer.parseInt ( row.get( "ID_TEMPLATE" ).toString( ) );
            this.name = row.get("NAME").toString();
            this.content = row.get("CONTENT").toString();
            this.idSite = (row.get( "ID_SITE" ) != null)? Integer.parseInt ( row.get( "ID_SITE" ).toString( ) ) : 0;
            
            dataBase.close();
        }
    }

    public void commit() throws Exception {

        DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
        String sql = "", temp;
        temp = this.content.replaceAll( "'", "\\\\\'" );

        if ( this.idTemplate != 0 )	{
            sql = "UPDATE template SET " + 
            		"name='" + this.name + "', " + 
            		"content='" + temp + "', " +
            		"id_site = " + (idSite != 0? String.valueOf(idSite) : "NULL") + " " +
            		"WHERE id_template = " + this.idTemplate;

            dataBase.db_query(sql, false, null);
        } else {
            sql = "INSERT INTO template ( name, content, id_site ) VALUES ( '" + this.name + "', '" + temp + "', " + (idSite != 0? String.valueOf(idSite) : "NULL") + " )";

            Object key = dataBase.db_query(sql, false, "template_seq");
            this.idTemplate = Integer.parseInt(key.toString());
        }
        dataBase.close();
        setValidZonePosition ( );
    }
    
	public void erase() throws Exception {
		if ( this.idTemplate != 0 )	{
			DataBase database = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
			String sql = "DELETE FROM template WHERE id_template = " + this.idTemplate;

			database.db_query( sql, false, null );
			database.close();
		}
	}
	
    public Vector getZones ( ) throws Exception	{
	    Vector zones = new Vector();
	    
	    if ( this.idTemplate != 0 )	{
		    DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
		    String sql = "SELECT * FROM zone WHERE id_template = " + this.idTemplate;
			dataBase.db_query(sql, false, null);
			Hashtable row;
			
			while((row = dataBase.db_fetch_array()) != null){
				Zone zone = new Zone();

				zone.setIdZone ( Integer.parseInt ( row.get( "ID_ZONE" ).toString( ) ) );
				zone.setIdTemplate ( Integer.parseInt ( row.get( "ID_TEMPLATE" ).toString( ) ) );

				zones.addElement( zone );
			}
			dataBase.close();
	    }
	    
		return zones;
    }
    
    public int duplicateZoneByPage( int idPage, int idZone, int idSite ) throws Exception	{
    	int totalPages = 0;
    	if ( this.idTemplate != 0 )	{
	    	PageZone pageZone = new PageZone( );
	    	pageZone.setIdPage( idPage );
	    	pageZone.setIdZone( idZone );
	    	pageZone.load( );
	    	int contents = pageZone.getPageContentCount( );
	    	
	    	DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
		    String sql = "SELECT id_page " +
		    	"FROM page " +
		    	"WHERE id_template = " + this.idTemplate + " " + 
		    	"AND id_site = " + idSite + " " +
		    	"AND id_page != " + idPage;
			dataBase.db_query(sql, false, null);
			Hashtable row;
			
			while((row = dataBase.db_fetch_array()) != null){
				pageZone.setIdPage( Integer.parseInt( row.get( "ID_PAGE" ).toString( ) ) );
				pageZone.setNeedUpdate( true );
				pageZone.commitZone( );
		    	for( int c = 0; c < contents; c ++ )	{
		    		PageContent pageContent = pageZone.getPageContentAt( c );
		    		pageContent.loadProperties( );
		    		pageContent.setIdPage( pageZone.getIdPage( ) );
		    		pageContent.commit( );
		    	}
				totalPages ++;
			}
			dataBase.close();
    	}
    	return totalPages;
    }
}
