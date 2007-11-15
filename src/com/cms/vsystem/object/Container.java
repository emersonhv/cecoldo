/*
 * Created on 19-sep-2005
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.cms.vsystem.object;


import java.util.Hashtable;
import java.util.Vector;

import com.cms.dao.DataBase;
import com.cms.dao.DataBaseFactory;
import com.cms.util.IntranetProperties;
import com.cms.vsystem.File;

/**
 * @author admin
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class Container extends File{
	private int idContainer;
	private Vector contents;
	
	public Container() throws Exception{
	    super();
	}
	
	public int getIdContainer(){
		return idContainer;
	}
	
	public void setIdContainer( int idContainer ){
		this.idContainer = idContainer;
	}
	
    public void addContent(int idFile, int position, boolean special){
        if(contents == null)
            contents = new Vector();
       
	   boolean exists = false;
	   
	  	for(int i = 0; i < contents.size(); i++){
			int idFileTmp = Integer.parseInt( ( (Hashtable)contents.get(i) ).get("ID_FILE").toString() );
			
			if( idFile == idFileTmp ){
				( (Hashtable)contents.get(i) ).put( "POSITION", String.valueOf( position ) );
				( (Hashtable)contents.get(i) ).put( "SPECIAL", String.valueOf( special ) );
				exists = true;
				break;
			}
		}
		
		if( !exists ){
			Hashtable row = new Hashtable();
			row.put("ID_FILE", String.valueOf( idFile ) );
			row.put("POSITION", String.valueOf( position ) );
			row.put("SPECIAL", String.valueOf( special ) );
			contents.addElement( row );
		}	
    }
    
    public void delContent( int idFile ){
        Vector tmp = new Vector();
        
        for(int i = 0; i < contents.size(); i++){
            int idFileTmp = Integer.parseInt( ( (Hashtable)contents.get(i) ).get("ID_FILE").toString() );
           
            if( idFileTmp != idFile ){
                tmp.addElement( contents.get(i) );
			}
        }
        
        contents = tmp;
    }
    
    public Hashtable getContentAt( int i ){
        return ( Hashtable )contents.get(i);
    }
    
    public int getContentCount(){
        return contents.size();
    }
    
    public void commitContents() throws Exception{
        DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
        
        String sql = "DELETE FROM container_files " +
        				"WHERE id_container = '" + this.idContainer + "' ";
        dataBase.db_query(sql, false, null);

        for(int i = 0; i < contents.size(); i++){
            sql = "INSERT " +
            		"INTO container_files " +
            		"( id_container, id_file, position, special ) " +
            		"VALUES " +
            		"('" + this.idContainer + "', '" + (( Hashtable )contents.get(i)).get("ID_FILE") + "', '" + (( Hashtable )contents.get(i)).get("POSITION") + "', '" + (( Hashtable )contents.get(i)).get("SPECIAL") + "')";
            dataBase.db_query(sql, false, null);
        }
            
        dataBase.close();
        dataBase = null;
    }
    
    public void loadContents() throws Exception{
        contents = new Vector();
        DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
        
        String sql = "SELECT id_file, position, special " +
        				"FROM container_files " +
        				"WHERE id_container = '" + this.idContainer + "' " + 
        				"ORDER BY position";
        dataBase.db_query(sql, false, null);
        Hashtable row;
        while( ( row = dataBase.db_fetch_array() ) != null){
			contents.addElement(row);
		}
            
        dataBase.close();
        dataBase = null;
    }
	
	public void load() throws Exception{
		loadFile();
		
		DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
		if( this.referenceFile != 0 ){
			this.idContainer = this.referenceFile;
			//String sql = "SELECT id_file FROM containers WHERE id_container = " + this.idContainer;
			//dataBase.db_query(sql, false, null);
			//Hashtable row = dataBase.db_fetch_array();
			
		}else{
			String sql = "INSERT INTO " +
							"containers " +
							"( id_container, id_file ) " +
							"VALUES " +
							"( ?, " + idFile + " )";
			
			Object key = dataBase.db_query(sql, false, "container_seq" );
			this.idContainer = Integer.parseInt(key.toString());
			
			sql = "UPDATE files SET reference_file=" + this.idContainer + " WHERE id_file = " + this.idFile;
			dataBase.db_query(sql, false, null);
		}
		dataBase.close();
		dataBase = null;

		loadContents();
	}
	
	public void commit() throws Exception{
		commitFile();
		commitContents();
		storeCache();
	}
	
	protected void storeCache() throws Exception{}
	
	protected void cleanUp() throws Exception{
	}
}