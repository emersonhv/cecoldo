package com.cms.vsystem.object.basic;


import java.io.InputStream;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Properties;
import java.util.Vector;

import com.cms.dao.DataBase;
import com.cms.dao.DataBaseFactory;
import com.cms.util.IntranetProperties;
import com.cms.vsystem.File;
import com.cms.vsystem.object.ContentFile;
import com.cms.vsystem.object.FileProperty;
	
public abstract class ExternalFile extends File{
		protected int idExternalFile;
		//protected String fileType;
		protected Vector fileContents;
		protected Properties fileProperties;
		
		public ExternalFile() throws Exception{
		    super();
		    
			this.fileContents = new Vector();
			this.fileProperties = new Properties();
		}
		
		public void setIdExternalFile(int a){
			this.idExternalFile = a;
		}
		
		public int getIdExternalFile(){
			return this.idExternalFile;
		}
		
		public void setFileType(String a){
			this.fileType = a;
		}
		
		public String getFileType(){
			return this.fileType;
		}
		
		public void removeProperty( String key ){
			this.fileProperties.remove( key );
		}
		
		public FileProperty getProperty(String key){			
			return (FileProperty)this.fileProperties.get(key);
		}
		
		public void setProperty(String key, String value) throws Exception{
		    FileProperty fileP = new FileProperty();
		    
			if(getProperty(key) != null){
				fileP = getProperty(key);
				fileP.setValue(value);
			}else{
				fileP.setIdExternalFile(this.idExternalFile);
				fileP.setName(key);
				fileP.setNewName(key);
				fileP.setValue(value);
			}
			
			this.fileProperties.put(key, fileP);
		}
		
		public int getFileContentCount(){
			return this.fileContents.size();
		}
		
		public Hashtable getFileContent(int index){
		    if(index < this.fileContents.size())
		        return (Hashtable)this.fileContents.get(index);
		    else
		        return null;
		}
		
		public Hashtable getFileContent(String contentName){
		    for(int i = 0; i < this.fileContents.size(); i++)
		        if(((Hashtable)this.fileContents.get(i)).get("name").toString().equals(contentName))
		            return (Hashtable)this.fileContents.get(i);
		    
		    return null;
		}
		
		public void setFileContent(String name, String contentType){
			Hashtable contentFile = new Hashtable();
			contentFile.put("name", name);
			contentFile.put("contentType", contentType);
			
			this.fileContents.addElement(contentFile);
		}
		
		public void storeContentFile( String name, String contentType, InputStream content ) throws Exception	{			
		    ContentFile contentF = new ContentFile( );
			contentF.setIdExternalFile( idExternalFile );
			contentF.setName( name );
			contentF.setContentType( contentType );
			contentF.setContent( content );
			
			if( getFileContent( name ) != null )
				contentF.setNewContent( false );
			
			contentF.commit( );
				
			setFileContent( name, contentType );
		}
		
		public void delContent(String name) throws Exception{
		    DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
			String sql = "DELETE FROM file_contents " +
							"WHERE name='" + name + "' AND id_external_file=" + this.idExternalFile;
					
			dataBase.db_query(sql, false, null);			
			dataBase.close();
			dataBase = null;
			
			Vector contentTemp = new Vector();
			Hashtable row;
			
			for(int i = 0; i < this.fileContents.size(); i++){
			    row = (Hashtable)this.fileContents.get(i);
			    
				if(!row.get("name").equals(name))
					contentTemp.addElement(this.fileContents.get(i));
			}
			
			this.fileContents = contentTemp;
			contentTemp = null;
			System.gc();
		}
		
		public void commitExternal() throws Exception{
			this.commitFile();
			
			Enumeration keys = this.fileProperties.keys();
			
			while(keys.hasMoreElements()){
				((FileProperty)this.fileProperties.get(keys.nextElement())).commit();
			}
			
			storeCache();
		}
		
		public void loadContent() throws Exception{
		    DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
		    
			String sql = "SELECT name, content_type, convert(varchar, content_date, 112) as content_date " +
						"FROM file_contents " +
						"WHERE id_external_file = " + this.idExternalFile + " " +
						"ORDER BY content_date DESC";
						
			dataBase.db_query(sql, false, null);
			this.fileContents = new Vector();
			Hashtable row;
			
			while((row = dataBase.db_fetch_array()) != null){
				row.put("name", row.get("NAME"));
				row.put("contentType", row.get("CONTENT_TYPE"));
				row.put("contentDate", (row.get("CONTENT_DATE") != null)? row.get("CONTENT_DATE") : "");
				
				this.fileContents.addElement(row);
			}
			
			dataBase.close();
			dataBase = null;
		}
		
		public void loadProperties() throws Exception{
		    DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
		    
			String sql = "SELECT * " +
							"FROM file_properties " +
							"WHERE id_external_file = " + this.idExternalFile;
					
			dataBase.db_query(sql, false, null);
			this.fileProperties = new Properties();
			Hashtable row;
			
			while((row = dataBase.db_fetch_array()) != null){
			    FileProperty fileP = new FileProperty();
				fileP.setIdExternalFile(this.idExternalFile);
				fileP.setName(row.get("NAME").toString());
				fileP.setNewName(row.get("NAME").toString());
				fileP.setValue((row.get("VALUE") != null)? row.get("VALUE").toString() : "");
				fileP.setNewProperty(false);
				
				this.fileProperties.put(fileP.getName(), fileP);
			}
			
			dataBase.close();
			dataBase = null;
		}
		
		public void loadExternal() throws Exception{
			this.loadFile();
			
			if(idFile != 0){
				if(this.referenceFile != 0){
					this.idExternalFile = this.referenceFile;
					this.loadContent();
					this.loadProperties();
				}else{
					DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
					
					String sql = "INSERT INTO " +
									"external_files " +
									"( file_type, id_file) " +
									"VALUES " +
									"( '" + this.fileType + "', " + idFile + ")";
					
					Object key = dataBase.db_query(sql, false, "external_seq");
					this.idExternalFile = Integer.parseInt(key.toString());
					
					sql = "UPDATE files SET reference_file=" + this.idExternalFile + " WHERE id_file = " + this.idFile;
					dataBase.db_query(sql, false, null);
					
					dataBase.close();
					dataBase = null;
				}
			}
		}
		
		protected void storeCache() throws Exception{
			DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
			String sql = "SELECT id_file FROM search_cache WHERE id_file = " + this.idFile;
			dataBase.db_query(sql, false, null);
			Hashtable row = dataBase.db_fetch_array();
			
			String content = "";
			
			for( Enumeration e = fileProperties.elements(); e.hasMoreElements();  ){
				content += ( (FileProperty)e.nextElement() ).getValue() + " ";
			}
			
			if( row != null ){
				sql = "UPDATE search_cache " +
						"SET name = '" + this.name + "', " +
						"content = '" + content.replaceAll( "'", "\\\\'" ) + "' " +
						"WHERE id_file = " + this.idFile;
			}else{
				sql = "INSERT INTO search_cache " +
						"( id_file, name, content ) " + 
						"VALUES " +
						"( " + this.idFile + ",  '" + this.name + "', '" + content.replaceAll( "'", "\\\\'" ) + "' )";
			}
			
			dataBase.db_query(sql, false, null);
			dataBase.close();
		}
		
		protected void cleanUp() throws Exception{
		    
		}
	}