package com.cms.vsystem;


import java.util.Hashtable;
import java.util.Vector;

import com.cms.dao.DataBase;
import com.cms.dao.DataBaseFactory;
import com.cms.util.IntranetProperties;
import com.cms.util.Log;


public abstract class File{
		protected int idFile;
		protected int parentFile;
		protected String fileType;
		protected String name;
		protected String creationDate;
		protected String modifiedDate;
		protected boolean trash;
		protected int referenceFile;
		protected String owner;
		protected int ownerId;
		protected Hashtable relatedFiles;
		protected int fileWorkFlow;
		protected int workFlowGroupId;
		protected int idSite;
		protected int referSite;
		protected int filePosition;
		protected boolean filePositionChanged;
		protected String path;
		/* Idioma actual */
		protected String idiom;
		
		public static int FILE_APPROVED = 1;
		
		public File() throws Exception{
		    this.idFile = 0;
		    relatedFiles = new Hashtable();
		    this.path = ",";
		    this.idiom = "ES";
		}
		
		public String getPath () {
			return this.path;
		}
		
		public void setPath (String path) {
			this.path = path;
		}
		
        /**
         * @return Returns the referSite.
         */
        public int getReferSite() {
            return referSite;
        }
        /**
         * @param referSite The referSite to set.
         */
        public void setReferSite(int referSite) {
            this.referSite = referSite;
        }
		public void setIdSite(int idSite){
		    this.idSite = idSite;
		}
		
		public int getIdSite(){
		    return idSite;
		}
        /**
         * @return Returns the workFlowGroupId.
         */
        public int getWorkFlowGroupId() {
            return workFlowGroupId;
        }
        /**
         * @param workFlowGroupId The workFlowGroupId to set.
         */
        public void setWorkFlowGroupId(int workFlowGroupId) {
            this.workFlowGroupId = workFlowGroupId;
        }
        /**
         * @return Returns the fileWorkFlow.
         */
        public int getFileWorkFlow() {
            return fileWorkFlow;
        }
        /**
         * @param fileWorkFlow The fileWorkFlow to set.
         */
        public void setFileWorkFlow(int fileWorkFlow) {
            this.fileWorkFlow = fileWorkFlow;
        }
        /**
         * @return Returns the ownerId.
         */
        public int getOwnerId() {
            return ownerId;
        }
        /**
         * @param ownerId The ownerId to set.
         */
        public void setOwnerId(int ownerId) {
            this.ownerId = ownerId;
        }
        /**
         * @return Returns the relatedFiles.
         */
        public Hashtable getRelatedFiles() {
            return relatedFiles;
        }
        /**
         * @param relatedFiles The relatedFiles to set.
         */
        public void setRelatedFiles(Hashtable relatedFiles) {
            this.relatedFiles = relatedFiles;
        }
        /**
         * @return Returns the creationDate.
         */
        public String getCreationDate() {
            return creationDate;
        }
        /**
         * @param creationDate The creationDate to set.
         */
        public void setCreationDate(String creationDate) {
            this.creationDate = creationDate;
        }
        /**
         * @return Returns the fileType.
         */
        public String getFileType() {
            return fileType;
        }
        /**
         * @param fileType The fileType to set.
         */
        public void setFileType(String fileType) {
            this.fileType = fileType;
        }
        /**
         * @return Returns the idFile.
         */
        public int getIdFile() {
            return idFile;
        }
        /**
         * @param idFile The idFile to set.
         */
        public void setIdFile(int idFile) {
            this.idFile = idFile;
        }
        /**
         * @return Returns the modifiedDate.
         */
        public String getModifiedDate() {
            return modifiedDate;
        }
        /**
         * @param modifiedDate The modifiedDate to set.
         */
        public void setModifiedDate(String modifiedDate) {
            this.modifiedDate = modifiedDate;
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
        /**
         * @return Returns the owner.
         */
        public String getOwner() {
            return owner;
        }
        /**
         * @param owner The owner to set.
         */
        public void setOwner(String owner) {
            this.owner = owner;
        }
        /**
         * @return Returns the parentFile.
         */
        public int getParentFile() {
            return parentFile;
        }
        /**
         * @param parentFile The parentFile to set.
         */
        public void setParentFile(int parentFile) {
            this.parentFile = parentFile;
        }
        /**
         * @return Returns the referenceFile.
         */
        public int getReferenceFile() {
            return referenceFile;
        }
        /**
         * @param referenceFile The referenceFile to set.
         */
        public void setReferenceFile(int referenceFile) {
            this.referenceFile = referenceFile;
        }
        /**
         * @param filePosition The position of file.
         */
        public void setFilePosition(int position) {
			this.filePositionChanged = ( this.filePosition != position );
            this.filePosition = position;
        }
        /**
         * @return Returns the filePosition.
         */
        public int getFilePosition() {
            return filePosition;
        }
        /**
         * @return Returns the trash.
         */
        public boolean isTrash() {
            return trash;
        }
        /**
         * @param trash The trash to set.
         */
        public void setTrash(boolean trash) {
            this.trash = trash;
        }
		public void addRelationFile(int relatedFile, String fileType) throws Exception{
		    DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
		    try{
		        String sql = "INSERT " +
		        				"INTO file_relations " +
		        				"(id_file, related_file) " +
		        				"VALUES " +
		        				"( " + this.idFile + ", " + relatedFile + ")";
		        dataBase.db_query(sql, false, null);
		        
		        relatedFiles.put(String.valueOf(relatedFile), fileType);
		        
				dataBase.close();
				dataBase = null;
		    }catch(Exception e){
		        try{dataBase.close();}catch(Exception exc){}
		        dataBase = null;
		        
		        throw e;
		    }
		}
		
		public int getRelationFileCount(){
		    return relatedFiles.size();
		}
		
		public void quitRelationFile(int relatedFile) throws Exception{
		    DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
		    try{
		        String sql = "DELETE " +
		        				"FROM file_relations " +
		        				"WHERE id_file = " + this.idFile + " AND related_file = " + relatedFile;
		        dataBase.db_query(sql, false, null);
		        
		        relatedFiles.remove(String.valueOf(relatedFile));
		        
				dataBase.close();
				dataBase = null;
		    }catch(Exception e){
		        try{dataBase.close();}catch(Exception exc){}
		        dataBase = null;
		        
		        throw e;
		    }
		}
		
		public File getRelatedFileAt(int index) throws Exception{
		    int relatedFileId = getRelatedFileIdAt(index);
		    File file = FileManager.createObject(relatedFiles.get(String.valueOf(relatedFileId)).toString());
		    file.setIdFile(relatedFileId);
		    file.load();
		    
		    return file;
		}
		
		public int getRelatedFileIdAt(int index){
		    Object keys[] = relatedFiles.keySet().toArray();
		    if(index >= 0 && index < getRelationFileCount())
		        return Integer.parseInt(keys[index].toString());
		    
		    return -1;
		}
		
		public Vector getPathParentRecursive(int idPFile, DataBase dataBase) throws Exception{
			String sql = "SELECT pf.id_file, pf.name " +
							"FROM files f, files pf " +
							"WHERE f.id_file = " + idPFile + " AND f.parent_file = pf.id_file";
			
			dataBase.db_query(sql, false, null);
			Hashtable row = dataBase.db_fetch_array();
	
			Vector parentsFile = new Vector();
			if(row != null && row.get("ID_FILE") != null ){
			    parentsFile.addElement(row);
			    
			    Vector tmp = getPathParentRecursive(Integer.parseInt(row.get("ID_FILE").toString()), dataBase);
			    for(int i = 0; i < tmp.size(); i++)
			        parentsFile.addElement(tmp.get(i));
			    
				return parentsFile;
			}

			return parentsFile;
		}
		
		public Vector getPathRoot() throws Exception{
			Vector path = new Vector();
			
			if(this.idFile != 0){
			    DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
			    
			    Hashtable row = new Hashtable();
			    row.put("ID_FILE", String.valueOf(idFile));
			    row.put("NAME", name);
			    path.addElement(row);
			    
				Vector tmp = getPathParentRecursive(this.idFile, dataBase);
				
			    for(int i = 0; i < tmp.size(); i++)
			        path.addElement(tmp.get(i));
				
				dataBase.close();
				dataBase = null;
			}
			
			return path;
		}
		
		public void loadFile() throws Exception{
			if(this.idFile != 0 && idiom != null){
			    DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
			    
				String sql = "SELECT f.parent_file, f.name, f.file_type, f.creationdate, f.modifieddate, f.trash, f.reference_file, f.file_workflow, f.workflow_group, f.owner AS owner_id, u.first_name + ' ' + u.last_name AS owner, f.id_site, f.refer_site, f.file_position " +
								"FROM files f, users u " + 
								"WHERE f.id_file = " + this.idFile + " AND f.owner = u.id_user";
				
				dataBase.db_query(sql, false, null);
				Hashtable row = dataBase.db_fetch_array();
				relatedFiles = new Hashtable();
				if(row != null){
					this.parentFile = (row.get("PARENT_FILE") != null)? Integer.parseInt(row.get("PARENT_FILE").toString()) : 0;
					this.name = row.get("NAME").toString();
					this.fileType = row.get("FILE_TYPE").toString();
					this.creationDate = row.get("CREATIONDATE").toString();
					this.modifiedDate = row.get("MODIFIEDDATE").toString();
					this.trash = (row.get("TRASH") != null)? true : false;
					this.ownerId = (row.get("OWNER_ID") != null)? Integer.parseInt(row.get("OWNER_ID").toString()) : 0;
					this.owner = (row.get("OWNER") != null)? row.get("OWNER").toString() : "";
					this.fileWorkFlow = (row.get("FILE_WORKFLOW") != null)? Integer.parseInt(row.get("FILE_WORKFLOW").toString()) : 0;
					this.workFlowGroupId = (row.get("WORKFLOW_GROUP") != null)? Integer.parseInt(row.get("WORKFLOW_GROUP").toString()) : 0;
					this.idSite = (row.get("ID_SITE") != null)? Integer.parseInt(row.get("ID_SITE").toString()) : 0;
					this.referSite = (row.get("REFER_SITE") != null)? Integer.parseInt(row.get("REFER_SITE").toString()) : 0;
					this.filePosition = (row.get("FILE_POSITION") != null)? Integer.parseInt(row.get("FILE_POSITION").toString()) : 0;
					this.path = (row.get("PATH") != null)? row.get("PATH").toString() : "";
					
					/*@TODO file_reference */
					sql = " SELECT reference_file FROM file_reference WHERE id_file = " + this.idFile +
						  " AND idiom = '" + this.idiom+"'";
					dataBase.db_query(sql, false, null);					
					if((row = dataBase.db_fetch_array()) != null){
						this.referenceFile = (row.get("REFERENCE_FILE") != null)? Integer.parseInt(row.get("REFERENCE_FILE").toString()) : 0;
					}
					
					sql = "SELECT fR.related_file, f.file_type " +
							"FROM file_relations fR, files f " + 
							"WHERE fR.id_file = " + this.idFile + " AND fR.related_file = f.id_file";
					dataBase.db_query(sql, false, null);
					while((row = dataBase.db_fetch_array()) != null)
					    relatedFiles.put(row.get("RELATED_FILE").toString(), row.get("FILE_TYPE").toString());
					
				}else{
				    Log.print("Error loading File: " + sql);
				}
				
				this.filePositionChanged = false;
				dataBase.close();
				dataBase = null;
			}
		}
		 
		public void commitFile() throws Exception{
		    DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
		    String sql = "";
		    
		    sql = "SELECT count(*) AS other_sites " +
		    		"FROM files " +
		    		"WHERE name = '" + this.name + "' AND parent_file " + (parentFile != 0? "= " + parentFile : "IS NULL") + " AND id_file != " + idFile + " AND file_type = '" + this.fileType + "' ";
		    
		    if(idSite != 0)
		        sql += "AND id_site = " + idSite + " ";
		    
		    dataBase.db_query(sql, false, null);
	        Hashtable row = dataBase.db_fetch_array();
	        if(Integer.parseInt(row.get("OTHER_SITES").toString()) > 0)
	            throw new Exception("Ya existe un archivo con este nombre en esta carpeta.");
		    
	        /*Vector parentPathVector = getPathParentRecursive(this.idFile, dataBase);
			String parentPathStr = ",";
			for (int i = parentPathVector.size() - 1; i >= 0; i--) {
				parentPathStr += ((Hashtable)parentPathVector.get(i)).get("ID_FILE") + ",";
			}
			
			String pathArray[] = parentPathStr.split ("[,]");
			System.out.println (idFile + ": " + parentPathStr);
			
			sql = "DELETE " +
					"FROM file_parents " +
					"WHERE id_file = " + idFile;
			dataBase.db_query (sql, false, null);
			for (int j = 0; j < pathArray.length; j++) {
				if (!pathArray[j].trim().equals("")) {
					sql = "INSERT INTO file_parents " +
							"(id_file, parent_file) " +
							"VALUES " +
							"(" + idFile + ", " + pathArray[j] + ")";
					dataBase.db_query (sql, false, null);
				}
			}*/

			sql = "UPDATE files " +
					"SET name='" + this.name + "', " +
					"parent_file = " + ((this.parentFile != 0)? String.valueOf(this.parentFile) : "NULL") + ", " +
					"modifieddate = getDate(), " +
					"trash = " + (this.trash? "1" : "NULL") + ", " +
					"owner = " + ownerId + ", " +
					"file_workflow = " + (fileWorkFlow != 0? String.valueOf(fileWorkFlow) : "NULL") + ", " +
					"workflow_group = " + (workFlowGroupId != 0? String.valueOf(workFlowGroupId) : "NULL") + ", " +
					"id_site = " + (idSite != 0? String.valueOf(idSite) : "NULL") + ", " +
					"refer_site = " + (referSite != 0? String.valueOf(referSite) : "NULL") + ", " +
					"file_position = " + String.valueOf( filePosition ) + " " +
					"WHERE id_file = " + this.idFile;
			
			dataBase.db_query(sql, false, null);
			if ( this.filePositionChanged )
				setValidPosition ( );
			
			dataBase.close();
			dataBase = null;
		}
		
		public void rateFile( int rate, String comment ) throws Exception{
		    if ( this.idFile != 0 )	{
			    DataBase dataBase = DataBaseFactory.getInstance( IntranetProperties.DATABASE_TYPE );
				String sql = "INSERT INTO file_rates ( id_file, rate, rate_comment ) VALUES ( " + idFile + ", " + rate + ", '" + comment + "') ";
				dataBase.db_query( sql, false, null );
				
				dataBase.close();
				dataBase = null;
			}
		}
		
		
		/* Sort or set position in current folder */
		private void setValidPosition ( ) throws Exception	{
			Vector files = new Vector( );
	
			if ( this.idFile != 0 )	{
				DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
				String sql = "" + 
					"SELECT id_file, file_position " + 
					"FROM files " + 
					"WHERE parent_file " + ( this.parentFile == 0  ? "IS NULL " : "= " + this.parentFile ) + " " +
					"AND id_file <> " + this.idFile + " " +
					"ORDER BY file_position";
				
				dataBase.db_query( sql, false, null );
				Hashtable row;
				
				while( ( row = dataBase.db_fetch_array( ) ) != null )	{
					File file = FileManager.createObject( "carpeta" );
					
					file.idFile = (row.get("ID_FILE") != null)? Integer.parseInt(row.get("ID_FILE").toString()) : 0;
					file.filePosition = (row.get("FILE_POSITION") != null)? Integer.parseInt(row.get("FILE_POSITION").toString()) : 0;

					files.addElement( file );
				}
	
				if ( this.filePosition <= 0 || this.filePosition > files.size( ) )	{
					this.filePosition = files.size( ) + 1;
					files.addElement( this );
				}
				else	{
					files.insertElementAt( this, this.filePosition - 1 );
				}
	
				// Sort positions
				for ( int c = 0, pos = 1; c < files.size( ); c ++ )	{
					if ( ((File)files.elementAt( c )).getFilePosition( ) != pos || ((File)files.elementAt( c )).getIdFile() == this.idFile )	{
						((File)files.elementAt( c )).setFilePosition( pos );
						sql = "" + 
							"UPDATE files SET " +
							"file_position = " + pos + " " +
							"WHERE id_file = " + ((File)files.elementAt( c )).getIdFile( );
						
						dataBase.db_query( sql, false, null );
					}
					pos ++;
				}
				dataBase.close( );
			}
		}
		
		/* Sites for current file */
	    public Vector getSites( ) throws Exception	{
			Vector sites = new Vector( );

			DataBase dataBase = DataBaseFactory.getInstance( IntranetProperties.DATABASE_TYPE );
			
			String sql = "" + 
					"SELECT id_site " + 
					"FROM file_share " + 
					"WHERE id_file = " + this.idFile;
			
			dataBase.db_query ( sql, false, null );
			Hashtable row;
			
			while ( ( row = dataBase.db_fetch_array( ) ) != null ) 
				sites.addElement( row );
			
			dataBase.close( );
			dataBase = null;
			
			return sites; 
		}

		/* Add Del sites for current file */
	    public void setSites( Vector sites, int recursiveLevels ) throws Exception	{

			DataBase dataBase = DataBaseFactory.getInstance( IntranetProperties.DATABASE_TYPE );
			
			String sql = "" + 
					"DELETE " + 
					"FROM file_share " + 
					"WHERE id_file = " + this.idFile;
			
			dataBase.db_query ( sql, false, null );

			for ( int c = 0; c < sites.size( ); c ++ )	{
				sql = "" + 
					"INSERT INTO file_share ( id_file, id_site ) " + 
					"VALUES ( " + this.idFile + ", " + sites.elementAt( c ) + " )";
			
				dataBase.db_query ( sql, false, null );

				if ( parentFile != 0 )	{
					File parent = FileManager.createObject( "carpeta" );
					parent.setIdFile ( parentFile );
					parent.addSite ( Integer.parseInt ( sites.elementAt( c ).toString( ) ) );
				}
			}
			
			if ( recursiveLevels != 0 )	{
				recursiveLevels --;
				File temp = FileManager.createObject( "carpeta" );
				sql = "" + 
					"SELECT id_file FROM files WHERE parent_file = " + this.idFile;
				
				dataBase.db_query ( sql, false, null );
				Hashtable row;
				
				while ( ( row = dataBase.db_fetch_array( ) ) != null )	{
					temp.setIdFile( Integer.parseInt( row.get( "ID_FILE" ).toString( ) ) );
					temp.setSites( sites, recursiveLevels );
				}
			}
		}

		/* !! */
	    public void addSite( int site ) throws Exception	{

			DataBase dataBase = DataBaseFactory.getInstance( IntranetProperties.DATABASE_TYPE );
			
			String sql = "" + 
					"SELECT * " + 
					"FROM file_share " + 
					"WHERE id_file = " + this.idFile + " " +
					"AND id_site = " + site;
			
			dataBase.db_query ( sql, false, null );
			
			if ( dataBase.db_num_rows ( ) == 0 )	{
				sql = "" + 
					"INSERT INTO file_share ( id_file, id_site ) " + 
					"VALUES ( " + this.idFile + ", " + site + " )";
			
				dataBase.db_query ( sql, false, null );
			}
			
			if ( parentFile != 0 )	{
				File parent = FileManager.createObject( "carpeta" );
				parent.setIdFile ( parentFile );
				parent.addSite ( site );
			}
		}

		public abstract void load() throws Exception;
		
		public abstract void commit() throws Exception;
		
		protected abstract void cleanUp() throws Exception;
		
		protected abstract void storeCache() throws Exception;
		
		protected void finalize(){
	        try{
	            cleanUp();
	        }catch(Exception e){
	        }
	    }

		public String getIdiom() {
			return idiom;
		}

		public void setIdiom(String idiom) {
			this.idiom = idiom;
		}
}