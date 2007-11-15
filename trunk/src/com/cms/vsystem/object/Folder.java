package com.cms.vsystem.object;


import java.util.Hashtable;
import java.util.Properties;
import java.util.Vector;

import com.cms.dao.DataBase;
import com.cms.dao.DataBaseFactory;
import com.cms.security.User;
import com.cms.util.IntranetProperties;
import com.cms.util.Log;
import com.cms.util.Node;
import com.cms.util.Tree;
import com.cms.util.Util;
import com.cms.vsystem.File;
import com.cms.vsystem.FileManager;

public class Folder extends File{
		private int idUser;
		private User userObj;
		private int objectOrder;
		
		public static final int ICON_VIEW = 0;
		public static final int LIST_VIEW = 1;
		public static final int PREVIEW_VIEW = 2;
		
		public static final int ORDER_NAME_ASC = 1;
		public static final int ORDER_NAME_DESC = 2;
		public static final int ORDER_POSITION_ASC = 3;
		public static final int ORDER_POSITION_DESC = 4;
		public static final int ORDER_DATE_ASC = 5;
		public static final int ORDER_DATE_DESC = 6;
		
		public Folder() throws Exception{
		    objectOrder = ORDER_POSITION_ASC;
		}
		
        public User getUserObj() {
			return userObj;
		}

		public void setUserObj(User userObj) {
			this.userObj = userObj;
		}

		/**
         * @return Returns the objectOrder.
         */
        public int getObjectOrder() {
            return objectOrder;
        }
        /**
         * @param objectOrder The objectOrder to set.
         */
        public void setObjectOrder(int objectOrder) {
            this.objectOrder = objectOrder;
        }
        /**
         * @return Returns the dataBase.
         */
      
		public void setIdUser( int a ){
			this.idUser = a;
		}
		
		public int getIdUser(){
			return this.idUser;
		}
		
		/**
		 * Retorna un arreglo con todos los archivos contenidos en un folder, si idFileFolder es 0
		 * la busqueda comienza desde la raiz del sistema de archivos.
		 * 
		 * @param idFileFolder
		 * @param dataBase
		 * @param fileTypesFilter
		 * @return Una arreglo con los archivos que pueden ser vistos por el usuario
		 * @throws Exception
		 */
		
		public Vector getFilesPrivilegesRecursive(int idFileFolder, Vector fileTypesFilter, DataBase dataBase, int idSite, boolean adminMode) throws Exception{
		    
		    try{
		    	Folder folder = new Folder ();
				folder.setIdFile (idFileFolder);
				folder.load ();
				
			    Vector files = new Vector();
				String sql = "" +
						"SELECT f.id_file, f.parent_file, f.name, f.id_site, f.creationdate, fT.image " +
						"FROM files f, file_types fT " +
						"WHERE f.file_type = fT.name " +
						"AND f.trash IS NULL " +
						"AND ( " +
								"f.id_site = " + idSite + " " +
								"OR f.id_file IN ( " +
									"SELECT files.id_file " +
									"FROM file_share, files " +
									"WHERE file_share.id_file = files.id_file " +
									"AND file_share.id_site = " + idSite + " " +
								") " +
							") " +
						"";
									
				if(fileTypesFilter != null){
				    String fileFilterType = "";
				    for(int i = 0; i < fileTypesFilter.size(); i++)
				        fileFilterType += "'" + fileTypesFilter.get(i) + "'" + ((i < fileTypesFilter.size() - 1)? ", " : "" );
				    
				    sql += "AND f.file_type IN (" + fileFilterType + ") ";
				}
				
				sql += "" + 
				"AND f.id_file " +
					"NOT IN ( " +
						"SELECT file_privileges.id_file " +
						"FROM file_privileges, user_groups " +
						"WHERE file_privileges.id_group = user_groups.id_group " + 
						"AND user_groups.id_user = " + this.idUser + " " +
						"AND file_privileges.hidden" + (adminMode? "" : "_nav") + " IS NOT NULL " +
						"GROUP BY file_privileges.id_file " +
					") ";
						
				sql += " AND f.path LIKE '" + folder.getPath() + (folder.getIdFile() != 0? folder.getIdFile() + "," : "" ) + "%' ";
					
				sql += "ORDER BY f.path, f.name";
				
				dataBase.db_query( sql, false, null);
				Hashtable row;
				        
				while((row = dataBase.db_fetch_array()) != null )
				    files.addElement(row);
				
				
				return files;
		    }catch(Exception e){
		        throw e;
		    }
		}
		
		public Vector getFileTree(int idFileFolder, int idSite, boolean adminMode) throws Exception{
		    DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
		    
		    try{
				Vector folders = new Vector();
				String sql  = "" + 
					"SELECT f.id_file, f.parent_file, f.id_site, f.name, f.creationdate, fT.image " +
					"FROM files f, file_types fT " +
					"WHERE f.trash IS NULL " +
					"AND f.file_type = fT.name " + 
					"AND f.file_type = 'Carpeta' " + 
					"AND ( " +
							"f.id_site = " + idSite + " " +
							"OR f.id_file IN ( " +
								"SELECT files.id_file " +
								"FROM file_share, files " +
								"WHERE file_share.id_file = files.id_file " +
								"AND file_share.id_site = " + idSite + " " +
							") " +
						") " +
					"ORDER BY f.name";
				
				dataBase.db_query(sql, false, null);
				Hashtable row;
				
				while((row = dataBase.db_fetch_array()) != null)
					folders.addElement(row);			
				
				dataBase.close();
				dataBase = null;
				
				return folders;
		    }catch(Exception e){
		        try{dataBase.close();}catch(Exception exc){}
		        dataBase = null;
		        
		        throw e;
		    }finally{
		        try{dataBase.close();}catch(Exception exc){}
		        dataBase = null;
		    }
		}
			
		public Tree loadTreeFilesPrivileges(Properties prop, int idSite, boolean adminMode) throws Exception{
		    DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
		    
		    try{
				Vector files = getFilesPrivilegesRecursive(0, null, dataBase, idSite, adminMode);
				dataBase.close();
				dataBase = null;
				
				Node root = new Node();
				root.setId(0);
				root.setName( this.name );
				root.setShared ( this.idSite == idSite );
				root.setExpanded( true );
				root.setBaseUrl( IntranetProperties.INTRA_BASE_URL );
				root.setImage( (prop != null )? prop.getProperty("image", "cms/images/types/folder.gif") : "cms/images/types/folder.gif");
				root.setTarget( (prop != null )? prop.getProperty("target", "") : "" );
				root.setUrl( (prop != null )? prop.getProperty("url", "#") : "#" );
				
				Tree tree = Util.buildTree(root, 0, files, prop, idSite);
				
				return tree;
		    }catch(Exception e){
		        try{dataBase.close();}catch(Exception exc){}
		        dataBase = null;
		        
		        throw e;
		    }finally{
		        try{dataBase.close();}catch(Exception exc){}
		        dataBase = null;
		    }
		}
		
		public Tree getTreeFilePrivileges(Properties prop, int idSite, boolean adminMode) throws Exception{
		    DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
		    
		    try{
				Vector folders = getFilesPrivilegesRecursive(this.idFile, (prop != null && prop.get("fileTypeFilter") != null)? (Vector)prop.get("fileTypeFilter") : null, dataBase, idSite, adminMode);
				dataBase.close();
				dataBase = null;
					
				Node root = new Node();
				root.setId(0);
				root.setName( this.name );
				root.setExpanded( true );
				root.setBaseUrl( IntranetProperties.INTRA_BASE_URL );
				root.setImage( (prop != null )? prop.getProperty("image", "cms/images/types/folder.gif") : "cms/images/types/folder.gif");
				root.setTarget( (prop != null )? prop.getProperty("target", "show") : "show" );
				root.setUrl( (prop != null )? prop.getProperty("url", "content.jsp") : "content.jsp" );
				
				Tree tree = Util.buildTree(root, this.idFile, folders, prop, idSite);
				
				if(this.idFile == 0){
					Node node = new Node();
					node.setName( "Papelera" );
					node.setExpanded( true );
					node.setBaseUrl( IntranetProperties.INTRA_BASE_URL );
					node.setImage( "cms/images/types/rec.gif" );
					node.setTarget( "show" );
					node.setUrl( "content.jsp?viewTrash=" );
					tree.getRoot().addChild(node);
				}
				
				return tree;
			}catch(Exception e){
		        try{dataBase.close();}catch(Exception exc){}
		        dataBase = null;
		        
		        throw e;
		    }finally{
		        try{dataBase.close();}catch(Exception exc){}
		        dataBase = null;
		    }
		}
		
		public Tree getTreeFile(Properties prop, int idSite, boolean adminMode) throws Exception{
		    Vector folders = getFileTree(this.idFile, idSite, adminMode);
			
		    Node root = new Node();
			root.setId(0);
			root.setName( this.name );
			root.setExpanded( true );
			root.setBaseUrl( IntranetProperties.INTRA_BASE_URL );
			root.setImage( (prop != null )? prop.getProperty("image", "cms/images/types/folder.gif") : "cms/images/types/folder.gif");
			root.setTarget( (prop != null )? prop.getProperty("target", "show") : "show" );
			root.setUrl( (prop != null )? prop.getProperty("url", "content.jsp") : "content.jsp" );
			
			Tree tree = Util.buildTree(root, this.idFile, folders, prop, idSite);
			
			if(this.idFile == 0){
				Node node = new Node();
				node.setName( "Papelera" );
				node.setExpanded( true );
				node.setBaseUrl( IntranetProperties.INTRA_BASE_URL );
				node.setImage( "cms/images/types/rec.gif" );
				node.setTarget( "show" );
				node.setUrl( "content.jsp?viewTrash=" );
				tree.getRoot().addChild(node);
			}
			
			return tree;
		}
		
		public Tree getViewTreeFile(Properties prop, int idSite, boolean adminMode) throws Exception{
			if(this.idUser != 0)
				return getTreeFilePrivileges(prop, idSite, adminMode);
			else
				return getTreeFile(prop, idSite, adminMode);
		}
		
		public Vector getFolderContent(int idSite) throws Exception{
		    DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
		    
		    try{
				String sql  = "" + 
						"SELECT f.id_file, f.parent_file, f.name, f.id_site, f.file_type, f.creationdate, fT.image, ( u.first_name + ' ' + u.last_name ) AS owner, f.file_position " +
						"FROM files f, file_types fT, users u " + 
						"WHERE f.trash IS NULL " + 
						"AND f.file_type = fT.name " + 
						"AND f.owner = u.id_user " + 
						"AND ( " +
								"f.id_site = " + idSite + " " +
								"OR f.id_file IN ( " +
									"SELECT files.id_file " +
									"FROM file_share, files " +
									"WHERE file_share.id_file = files.id_file " +
									"AND file_share.id_site = " + idSite + " " +
								") " +
							") " +
						"";

				if(this.idFile != 0)
					sql += " AND f.parent_file = " + this.idFile + " ";
				else
					sql += " AND f.parent_file IS NULL ";
					
				sql += "ORDER BY f.file_position, f.name";
				
				dataBase.db_query(sql, false, null);
				Vector files = new Vector();
				Hashtable row;
				
				while((row = dataBase.db_fetch_array()) != null)
					files.addElement(row);
	
				dataBase.close();
				dataBase = null;
				
				return files;
		    }catch(Exception e){
		        try{dataBase.close();}catch(Exception exc){}
		        dataBase = null;
		        
		        throw e;
		    }finally{
		        try{dataBase.close();}catch(Exception exc){}
		        dataBase = null;
		    }
		}
		
		public Vector getUserFolderContent(int idSite, boolean adminMode) throws Exception{
		    DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
		    
		    try{
			    String sql = "" + 
					"SELECT f.id_file, f.parent_file, f.file_type, f.name, f.id_site, convert( varchar, f.creationdate, 112 ) AS creationdate, fT.image, f.file_position " +
					", ( " + 
						"SELECT COUNT( files.id_file )  " + 
						"FROM file_share, files " + 
						"WHERE file_share.id_file = f.id_file " + 
						"AND ( " +
							"file_share.id_site = " + idSite + " " + 
							"OR ( " + 
								"files.id_site = " + idSite + " " +
								"AND file_share.id_site <> " + idSite + " " +
							") " +
						") " +
					") as shared " + 
					"FROM files f, file_types fT " +
					"WHERE f.trash IS NULL AND f.file_type = fT.name " + 
					"AND ( " +
							"f.id_site = " + idSite + " " +
							"OR f.id_file IN ( " +
								"SELECT files.id_file " +
								"FROM file_share, files " +
								"WHERE file_share.id_file = files.id_file " +
								"AND file_share.id_site = " + idSite + " " +
							") " +
						") " +
					"AND f.id_file " +
						"NOT IN ( " +
							"SELECT file_privileges.id_file " +
							"FROM file_privileges, user_groups " +
							"WHERE file_privileges.id_group = user_groups.id_group " + 
							"AND user_groups.id_user = " + this.idUser + " " +
							"AND file_privileges.hidden" + (adminMode? "" : "_nav") + " IS NOT NULL " +
							"GROUP BY file_privileges.id_file " +
						") ";
				
				if(this.idFile != 0)
					sql += " AND f.parent_file = " + this.idFile + " ";
				else
					sql += " AND f.parent_file IS NULL ";
					
				sql += "ORDER BY f.file_position, f.name";
				
				
				dataBase.db_query(sql, true, null);
				Vector files = new Vector();
				Hashtable row;
				//
				while ( ( row = dataBase.db_fetch_array( ) ) != null )
					files.addElement( row );
				
				dataBase.close();
				dataBase = null;
				
				return files;
		    }catch(Exception e){
		    	e.printStackTrace();
		        try{dataBase.close();}catch(Exception exc){}
		        dataBase = null;
		        
		        throw e;
		    }finally{
		        try{dataBase.close();}catch(Exception exc){}
		        dataBase = null;
		    }
		}
		
		public Vector getFolders(int idSite, boolean adminMode) throws Exception{
		    DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
		    
		    try{
			    String sql = "" + 
				"SELECT f.id_file, f.name, f.id_site, f.file_position, f.modifieddate " +
				", ( " + 
					"SELECT COUNT( files.id_file ) " + 
					"FROM file_share, files " + 
						"WHERE file_share.id_file = f.id_file " + 
						"AND ( " +
							"file_share.id_site = " + idSite + " " + 
							"OR ( " + 
								"files.id_site = " + idSite + " " +
								"AND file_share.id_site <> " + idSite + " " +
							") " +
						") " +
				") as shared " + 
				"FROM files f " +
				"WHERE f.trash IS NULL " + 
				"AND f.file_type = 'Carpeta' " + 
				"AND ( " +
						"f.id_site = " + idSite + " " +
						"OR f.id_file IN ( " +
							"SELECT files.id_file " +
							"FROM file_share, files " +
							"WHERE file_share.id_file = files.id_file " +
							"AND file_share.id_site = " + idSite + " " +
						") " +
					") " +
				"AND f.id_file " +
					"NOT IN ( " +
						"SELECT file_privileges.id_file " +
						"FROM file_privileges, user_groups " +
						"WHERE file_privileges.id_group = user_groups.id_group " + 
						"AND user_groups.id_user = " + this.idUser + " " +
						"AND file_privileges.hidden" + (adminMode? "" : "_nav") + " IS NOT NULL " +
						"GROUP BY file_privileges.id_file " +
					") ";
				
				if(this.idFile != 0 )
				    sql += "AND f.parent_file=" + this.idFile + " ";
				else
				    sql += "AND f.parent_file IS NULL ";
				
				switch(objectOrder){
					case ORDER_DATE_ASC:
					    sql += "ORDER BY f.modifieddate ASC, f.name ";
					    break;
					case ORDER_DATE_DESC:
					    sql += "ORDER BY f.modifieddate DESC, f.name ";
					    break;
					case ORDER_NAME_ASC:
					    sql += "ORDER BY f.name ASC ";
					    break;
					case ORDER_NAME_DESC:
					    sql += "ORDER BY f.name DESC ";
					    break;
					case ORDER_POSITION_ASC:
					    sql += "ORDER BY f.file_position ASC, f.name ";
					    break;
					case ORDER_POSITION_DESC:
					    sql += "ORDER BY f.file_position DESC, f.name ";
					    break;
				}
				
				dataBase.db_query(sql, false, null);
				Vector files = new Vector();
				Hashtable row;
				
				while((row = dataBase.db_fetch_array()) != null)
				    files.addElement(row);
				
				dataBase.close();
				dataBase = null;
				
				return files;
		    }catch(Exception e){
		        try{dataBase.close();}catch(Exception exc){}
		        dataBase = null;
		        
		        throw e;
		    }finally{
		        try{dataBase.close();}catch(Exception exc){}
		        dataBase = null;
		    }
		}
		
		public Vector getFolderObjects(int idSite, boolean adminMode) throws Exception{
		    Vector folders = getFolders(idSite, adminMode);
		    
		    for(int i = 0; i < folders.size(); i++){
		        Hashtable row = (Hashtable)folders.get(i);
		        Folder folder = new Folder();
		        folder.setIdFile(Integer.parseInt(row.get("ID_FILE").toString()));
		        folder.load();
		        
		        folders.setElementAt(folder, i);
		    }
		    
		    return folders;
		}
		
		public int getFileCount(int idSite, boolean adminMode) throws Exception{
		    DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
		    
		    try{
			    String sql = "" + 
					"SELECT count(*) AS total_files " +
					"FROM files f " +
					"WHERE f.trash IS NULL " + 
					"AND ( " +
							"f.id_site = " + idSite + " " +
							"OR f.id_file IN ( " +
								"SELECT files.id_file " +
								"FROM file_share, files " +
								"WHERE file_share.id_file = files.id_file " +
								"AND file_share.id_site = " + idSite + " " +
							") " +
						") " +
					"AND f.id_file " +
						"NOT IN ( " +
							"SELECT file_privileges.id_file " +
							"FROM file_privileges, user_groups " +
							"WHERE file_privileges.id_group = user_groups.id_group " + 
							"AND user_groups.id_user = " + this.idUser + " " +
							"AND file_privileges.hidden" + (adminMode? "" : "_nav") + " IS NOT NULL " +
							"GROUP BY file_privileges.id_file " +
						") ";
	
				if(this.idFile != 0 )
				    sql += "AND f.parent_file=" + this.idFile + " ";
				else
				    sql += "AND f.parent_file IS NULL ";
			    
				dataBase.db_query(sql, false, null);
				Hashtable row = dataBase.db_fetch_array();
				dataBase.close();
				dataBase = null;
				
			    return Integer.parseInt(row.get("TOTAL_FILES").toString());
		    }catch(Exception e){
		        try{dataBase.close();}catch(Exception exc){}
		        dataBase = null;
		        
		        throw e;
		    }finally{
		        try{dataBase.close();}catch(Exception exc){}
		        dataBase = null;
		    }
		}
		
		public String createIconContentFormat(Vector files){
			boolean shared = false;
			String sharedImage = "";
			String html =  "";
			int horizontalFileCount = 3;
			Hashtable row;
			
			for(int i = 0; i < files.size(); i++){
			    row = (Hashtable)files.get(i);
				shared = ( row.get( "SHARED" ) == null || row.get( "SHARED" ).toString( ).toLowerCase( ) == "false" || row.get("SHARED").toString( ).equals( "0" ) ) ? false : true;
				sharedImage = ( row.get( "ID_SITE" ) == null || !row.get( "ID_SITE" ).toString( ).equals( this.idSite + "" ) ) ? "shared2.gif" : "shared.gif";
				if(i%horizontalFileCount == 0 ){
					if( i != 0 )
						html += "</tr>\n";
						
					html += "\n<tr>";
				}
				
				String image = ( row.get( "IMAGE" ) != null ) ? row.get( "IMAGE" ).toString( ) : "cms/images/types/no.gif";
				html += "<td width='" + (Math.round(100/horizontalFileCount)) + "%' class='textos' >" +
							"<table width='100%' cellpadding='3' cellspacing='0' border='0'>" +
								"<tr>" + 
									( shared ? "<td width='100%' class='textos shared' background='" + IntranetProperties.INTRA_BASE_URL + image + "'>" : "<td width='100%' class='textos'>" ) +
										"<a href=\"javascript:openFile2( '" + row.get("FILE_TYPE") + "', " + row.get("ID_FILE") + " );\" target='show' id='" + row.get("ID_FILE") + "' style='text-decoration: none;' ><img src='" + IntranetProperties.INTRA_BASE_URL + ( shared ? "cms/images/types/" + sharedImage : image ) + "' border='0' align='left' id='" + row.get("ID_FILE") + "' name='" + row.get("NAME") + "' >" + row.get("NAME") + "<br><font color='#BBBBBB' style='text-decoration: none;'>" + row.get("CREATIONDATE") + "<br>" + row.get("FILE_TYPE") + "</font></a>" +
									"</td>" +
								"</tr>" +
							"</table>" +
						"</td>";
			}
			
			html += "</tr>\n";
			return html;
		}
		
		private String createListContentFormat(Vector files){
		    String html =  "<thead>" +
		    				"<tr bgcolor='#DDDDDD'>" +
		    					"<th class='textos' height='25'></th>" +
		    					"<th class='textos' height='25'><a href='#' onClick='sortTable(this);return false;'><b>&nbsp;NOMBRE</b></a></th>" +
		    					"<th class='textos'><a href='#' onClick='sortTable(this);return false;'><b>&nbsp;TIPO</b></a></th>" +
		    					"<th class='textos'><a href='#' onClick='sortTable(this);return false;'><b>&nbsp;FECHA</b></a></th>" +
		    				"</tr>" + 
		    				"</thead>";
			Hashtable row;
			
			for(int i = 0; i < files.size(); i++){
			    row = (Hashtable)files.get(i);
				
				String image = (row.get("IMAGE") != null)? row.get("IMAGE").toString() : "cms/images/types/no.gif";
				html += "<tr>" +
							"<td width='5' height='22' class='textos' style='cursor:pointer; cursor:hand;' onClick=\"javascript:openFile2( '" + row.get("FILE_TYPE") + "', " + row.get("ID_FILE") + " );\" ><img src='" + IntranetProperties.INTRA_BASE_URL + image + "' width='17' border='0' align='middle' id='" + row.get("ID_FILE") + "' name='" + row.get("NAME") + "' hspace=\"5\" ></td>" +
							"<td width='50%' height='22' class='textos' style='cursor:pointer; cursor:hand;' onClick=\"javascript:openFile2( '" + row.get("FILE_TYPE") + "', " + row.get("ID_FILE") + " );\" >&nbsp;" + row.get("NAME") + "</td>" +
							"<td bgcolor='#EEEEEE' class='textos'>&nbsp;" + row.get("FILE_TYPE") + "</td>" +
							"<td class='textos'>&nbsp;" + row.get("CREATIONDATE") + "</td>" +
						"</tr>";
			}
			
			return html;
		}
		
		private String createPreviewContentFormat(Vector files){
		    return "";
		}
		
		public String getViewFolderContent(int viewType, int idSite, boolean adminMode) throws Exception{
		    Vector files;
		    
			if(this.idUser != 0)
				files = getUserFolderContent(idSite, adminMode);
			else
				files = getFolderContent(idSite);
			
			switch(viewType){
				case ICON_VIEW:
					return createIconContentFormat(files);
				case LIST_VIEW:
					return createListContentFormat(files);
				case PREVIEW_VIEW:
					return createPreviewContentFormat(files);
				default:
					return createIconContentFormat(files);
			}
		}
		
		public void commit() throws Exception{
		    commitFile();
			storeCache();
		}
		
		public void load() throws Exception{
			loadFile();
		}
		
		/**
         * 
         * Metodos para contenidos generales
         *  
         */
		
		public Hashtable searchFilesOnFolder(String pattern, Vector fileTypeFilter, Vector fileTypeExclude, boolean adminMode, int start, int searchResults, int idSite, boolean loadObjects, boolean useRecursion, boolean crossSites) throws Exception{
		    DataBase dataBase = DataBaseFactory.getInstance( IntranetProperties.DATABASE_TYPE );
			Vector files = new Vector( );
			String subFoldersString = "";
			
			if(useRecursion){
				Vector folderTypeFilter = new Vector();
				folderTypeFilter.addElement("Carpeta");
				Vector folders = getFilesPrivilegesRecursive(this.idFile, folderTypeFilter, dataBase, idSite, adminMode);

				for(int i = 0; i < folders.size(); i++)
					subFoldersString += ((Hashtable)folders.get(i)).get("ID_FILE") + ",";
			}
			
			subFoldersString += this.idFile;
			String sql = "SELECT count(*) AS total " +
							"FROM search_cache sc, files f " +
							"WHERE sc.id_file = f.id_file " + 
							"AND f.trash IS NULL " +
							"AND f.parent_file IN (" + subFoldersString + ") "; 
			
			
			if(fileTypeFilter != null && fileTypeFilter.size() > 0){
				String fileTypes = "";
				for(int i = 0; i < fileTypeFilter.size(); i++){
					fileTypes += "'" + fileTypeFilter.get(i) + "'";
					if(i < fileTypeFilter.size() - 1)
						fileTypes += ", ";
				}
				
				sql += "AND f.file_type IN (" + fileTypes + ") ";
			}
			
			sql += "AND sc.content ~* '" + pattern + "'";
			
			dataBase.db_query( sql, false, null );
			Hashtable row = dataBase.db_fetch_array( );
			int totalFiles = Integer.parseInt( row.get( "TOTAL" ).toString() );
			sql = "SELECT ";
			if( searchResults > 0 )		
			    sql += " TOP " + searchResults;
			sql += " sc.id_file, sc.name, sc.content, f.file_type, f.reference_file, f.modifieddate  " +
					"FROM search_cache sc, files f  " +
					"WHERE  sc.id_file = f.id_file " +
					"AND f.trash IS NULL " +
					"AND f.parent_file IN (" + subFoldersString + ") "; 
					
			if(fileTypeFilter != null && fileTypeFilter.size() > 0){
				String fileTypes = "";
				for(int i = 0; i < fileTypeFilter.size(); i++){
					fileTypes += "'" + fileTypeFilter.get(i) + "'";
					if(i < fileTypeFilter.size() - 1)
						fileTypes += ", ";
				}
				
				sql += "AND f.file_type IN (" + fileTypes + ") ";
			}
			
			sql += "AND sc.content ~* '" + pattern + "' ";
			
/*			if( searchResults > 0 )		
				sql += "ORDER BY sc.name " + 
						"LIMIT " + searchResults + " OFFSET " + start;
	*/				
			if( searchResults > 0 )		
				sql += "ORDER BY sc.name "; 			

			dataBase.db_query( sql, false, null );
			while ( ( row = dataBase.db_fetch_array( ) ) != null )	{
				try{
					File file = FileManager.createObject(row.get("FILE_TYPE").toString());
					
					if(file != null){
						file.setIdFile(Integer.parseInt(row.get("ID_FILE").toString()));
						file.setName((String)row.get("NAME"));
						file.setModifiedDate (row.get("MODIFIEDDATE").toString() );
						file.setFileType(row.get("FILE_TYPE").toString());
						file.setReferenceFile( (row.get("REFERENCE_FILE") != null)? Integer.parseInt( row.get("REFERENCE_FILE").toString() ) : 0 );
						
						if( loadObjects )
							file.load();
						
						Hashtable object = new Hashtable();
						object.put( "FILE", file ); 
						object.put( "CONTENT", row.get( "CONTENT" ) ); 
						
						files.addElement(object);	
					}
					
				}catch(Exception e){
					e.printStackTrace();
				}
			}
			
			Hashtable resultSearch = new Hashtable();
			resultSearch.put("total", String.valueOf(totalFiles));
			resultSearch.put("files", files);
			
			return resultSearch;
		
		}
		
		public Vector getObjectsNames(int notIncludeFile, Vector fileTypeFilter, boolean useRecursion, int rownum, int idSite, boolean adminMode) throws Exception{
		    DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
		    
		    try{		    
			    String sql = " SELECT ";
				if(rownum > 0)
			        sql += " TOP " + rownum ;
				sql += "  f.id_file, f.parent_file, f.id_site, f.file_type, f.name, convert( varchar, f.modifieddate, 103 ) AS modifieddate, f.file_position, f.reference_file " +
					"FROM files f ";
				
				if (useRecursion) {
					sql += ", file_parents fpp ";
				}
				
				sql += "WHERE f.trash IS NULL " + 
					"AND f.file_workflow = " + File.FILE_APPROVED + " " + 
					"AND ( " +
							"f.id_site = " + idSite + " " +
							"OR f.id_file IN ( " +
								"SELECT files.id_file " +
								"FROM file_share, files " +
								"WHERE file_share.id_file = files.id_file " +
								"AND file_share.id_site = " + idSite + " " +
							") " +
						") " +
					"AND f.id_file " +
						"NOT IN ( " +
							"SELECT file_privileges.id_file " +
							"FROM file_privileges, user_groups " +
							"WHERE file_privileges.id_group = user_groups.id_group " + 
							"AND user_groups.id_user = " + this.idUser + " " +
							"AND file_privileges.hidden" + (adminMode? "" : "_nav") + " IS NOT NULL " +
							"GROUP BY file_privileges.id_file " +
						") ";
			    
			    if(fileTypeFilter != null){
			        String fileTypes = "";
			        for(int i = 0; i < fileTypeFilter.size(); i++){
			            fileTypes += "'" + fileTypeFilter.get(i) + "'";
			            if(i < fileTypeFilter.size() - 1)
			                fileTypes += ", ";
			        }
			        
			        sql += "AND f.file_type IN (" + fileTypes + ") ";
			    }
			    
			    if(useRecursion) {
			        sql += "AND f.id_file = fpp.id_file " +
							"AND fpp.parent_file = " + this.idFile + " ";
			    } else
			        sql += "AND f.parent_file = " + this.idFile + " ";
				
				if( notIncludeFile != 0 )
					sql += "AND f.id_file != " + notIncludeFile + " ";
				
				
				switch(objectOrder){
					case ORDER_DATE_ASC:
					    sql += "ORDER BY f.path, f.modifieddate ASC, f.name ";
					    break;
					case ORDER_DATE_DESC:
					    sql += "ORDER BY f.path, f.modifieddate DESC, f.name ";
					    break;
					case ORDER_NAME_ASC:
					    sql += "ORDER BY f.path, f.name ASC ";
					    break;
					case ORDER_NAME_DESC:
					    sql += "ORDER BY f.path, f.name DESC ";
					    break;
					case ORDER_POSITION_ASC:
					    sql += "ORDER BY f.path, f.file_position ASC, f.name ";
					    break;
					case ORDER_POSITION_DESC:
					    sql += "ORDER BY f.path, f.file_position DESC, f.name ";
					    break;
				}
				
				/*if(rownum > 0)
			        sql += " LIMIT " + rownum + " OFFSET 0";*/
				
				dataBase.db_query(sql, false, null);
				Vector files = new Vector();
				Hashtable row;
				
				while((row = dataBase.db_fetch_array()) != null){
				    try{
				        File file = FileManager.createObject(row.get("FILE_TYPE").toString());
					
				        if(file != null){
				            file.setIdFile(Integer.parseInt(row.get("ID_FILE").toString()));
				            file.setName((String)row.get("NAME"));
				            file.setModifiedDate((String)row.get("MODIFIEDDATE"));
							file.setFileType(row.get("FILE_TYPE").toString());
							file.setReferenceFile( (row.get("REFERENCE_FILE") != null)? Integer.parseInt( row.get("REFERENCE_FILE").toString() ) : 0 );
	
				            files.addElement(file);	
				        }
				        
				    }catch(Exception e){
				    }
				}
				
				dataBase.close();
				dataBase = null;
				
				return files;
		    }catch(Exception e){
		        try{dataBase.close();}catch(Exception exc){}
		        dataBase = null;
		        
		        throw e;
		    }finally{
		        try{dataBase.close();}catch(Exception exc){}
		        dataBase = null;
		    }
		}
		
		public File getContentObject(int idFile, Vector fileTypeFilter, boolean useRecursion, int idSite, boolean adminMode) throws Exception{
		    DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
		    
		    try{
			    
				if(idFile != 0){
					String sql = "SELECT file_type FROM files WHERE id_file = " + idFile;
					dataBase.db_query(sql, false, null);
					Hashtable row;
					
					if((row = dataBase.db_fetch_array()) != null){
					    dataBase.close();
					    dataBase = null;
					    
					    File file = FileManager.createObject(row.get("FILE_TYPE").toString());
					    
						if(file != null){
						    file.setIdFile(idFile);
						    file.load();
	
							return file;
						}else{
							return null;
						}
					}else
						return null;
					
				}else{
				    String sql = "" + 
						"SELECT top 1 f.id_file, f.parent_file, f.id_site, f.file_type, f.name, convert( varchar, f.modifieddate, 103 ) AS modifieddate, f.file_position " +
						"FROM files f ";
				    
				    if (useRecursion) {
						sql += ", file_parents fpp ";
					}
				    
					sql +=	"WHERE f.trash IS NULL AND f.file_workflow = " + File.FILE_APPROVED + " " + 
						"AND ( " +
								"f.id_site = " + idSite + " " +
								"OR f.id_file IN ( " +
									"SELECT files.id_file " +
									"FROM file_share, files " +
									"WHERE file_share.id_file = files.id_file " +
									"AND file_share.id_site = " + idSite + " " +
								") " +
							") " +
						"AND f.id_file " +
							"NOT IN ( " +
								"SELECT file_privileges.id_file " +
								"FROM file_privileges, user_groups " +
								"WHERE file_privileges.id_group = user_groups.id_group " + 
								"AND user_groups.id_user = " + this.idUser + " " +
								"AND file_privileges.hidden" + (adminMode? "" : "_nav") + " IS NOT NULL " +
								"GROUP BY file_privileges.id_file " +
							") ";
				    
				    if(fileTypeFilter != null){
				        String fileTypes = "";
				        for(int i = 0; i < fileTypeFilter.size(); i++){
				            fileTypes += "'" + fileTypeFilter.get(i) + "'";
				            if(i < fileTypeFilter.size() - 1)
				                fileTypes += ", ";
				        }
				        
				        sql += "AND f.file_type IN (" + fileTypes + ") ";
				    }
				    
				    if(useRecursion) {
				        sql += "AND f.id_file = fpp.id_file " +
								"AND fpp.parent_file = " + this.idFile + " ";
				    } else
				        sql += "AND f.parent_file = " + this.idFile + " ";
				    
				    switch(objectOrder){
						case ORDER_DATE_ASC:
						    sql += "ORDER BY f.modifieddate ASC, f.name ";
						    break;
						case ORDER_DATE_DESC:
						    sql += "ORDER BY f.modifieddate DESC, f.name ";
						    break;
						case ORDER_NAME_ASC:
						    sql += "ORDER BY f.name ASC ";
						    break;
						case ORDER_NAME_DESC:
						    sql += "ORDER BY f.name DESC ";
						    break;
						case ORDER_POSITION_ASC:
						    sql += "ORDER BY f.file_position ASC, f.name ";
						    break;
						case ORDER_POSITION_DESC:
						    sql += "ORDER BY f.file_position DESC, f.name ";
						    break;
				    }
					//sql += " LIMIT 1 OFFSET 0"; 
				  		
					dataBase.db_query(sql, false, null);
					Hashtable row;
					
					if((row = dataBase.db_fetch_array()) != null){
					    dataBase.close();
					    dataBase = null;
					    
					    File file = FileManager.createObject(row.get("FILE_TYPE").toString());
					    if(file != null){
						    file.setIdFile(Integer.parseInt(row.get("ID_FILE").toString()));
						    file.load();
						    
							return file;
						}else
							return null;
						
					}else{
						return null;
					}
				}
		    }catch(Exception e){
		        try{dataBase.close();}catch(Exception exc){}
		        dataBase = null;
		        
		        throw e;
		    }finally{
		        try{dataBase.close();}catch(Exception exc){}
		        dataBase = null;
		    }
		}
		
		public Vector getObjects(int rownum, Vector fileTypeFilter, boolean useRecursion, boolean randomContent, int idSite, boolean adminMode) throws Exception{
		    DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
		    
		    try{
			    String sql = new String();
			    Hashtable row;
			    
			    if(randomContent == false){
				    sql = "SELECT ";
					if(rownum > 0)
				        sql += " TOP " + rownum;
					sql += "" +
						" f.id_file, f.parent_file, f.id_site, f.file_type, f.name, convert( varchar, f.modifieddate, 103 ) AS modifieddate, f.file_position " +
						"FROM files f ";
					
					if (useRecursion) {
						sql += ", file_parents fpp ";
					}
					
					sql +=	"WHERE f.trash IS NULL " + 
						"AND f.file_workflow = " + File.FILE_APPROVED + " " + 
						"AND ( " +
								"f.id_site = " + idSite + " " +
								"OR f.id_file IN ( " +
									"SELECT files.id_file " +
									"FROM file_share, files " +
									"WHERE file_share.id_file = files.id_file " +
									"AND file_share.id_site = " + idSite + " " +
								") " +
							") " +
						"AND f.id_file " +
							"NOT IN ( " +
								"SELECT file_privileges.id_file " +
								"FROM file_privileges, user_groups " +
								"WHERE file_privileges.id_group = user_groups.id_group " + 
								"AND user_groups.id_user = " + this.idUser + " " +
								"AND file_privileges.hidden" + (adminMode? "" : "_nav") + " IS NOT NULL " +
								"GROUP BY file_privileges.id_file " +
							") ";
				    
				    if(fileTypeFilter != null){
				        String fileTypes = "";
				        for(int i = 0; i < fileTypeFilter.size(); i++){
				            fileTypes += "'" + fileTypeFilter.get(i) + "'";
				            if(i < fileTypeFilter.size() - 1)
				                fileTypes += ", ";
				        }
				        
				        sql += "AND f.file_type IN (" + fileTypes + ") ";
				    }
				    
				    if(useRecursion) {
				        sql += "AND f.id_file = fpp.id_file " +
								"AND fpp.parent_file = " + this.idFile + " ";
				    } else
				        sql += "AND f.parent_file = " + this.idFile + " ";
					
					sql += "GROUP BY f.id_file, f.parent_file, f.id_site, f.file_type, f.name, f.modifieddate, f.file_position ";
									
				    switch(objectOrder){
						case ORDER_DATE_ASC:
						    sql += "ORDER BY f.modifieddate ASC, f.name ";
						    break;
						case ORDER_DATE_DESC:
						    sql += "ORDER BY f.modifieddate DESC, f.name ";
						    break;
						case ORDER_NAME_ASC:
						    sql += "ORDER BY f.name ASC ";
						    break;
						case ORDER_NAME_DESC:
						    sql += "ORDER BY f.name DESC ";
						    break;
						case ORDER_POSITION_ASC:
						    sql += "ORDER BY f.file_position ASC, f.name ";
						    break;
						case ORDER_POSITION_DESC:
						    sql += "ORDER BY f.file_position DESC, f.name ";
						    break;
					}

				   /* if(rownum > 0)
				        sql += " LIMIT " + rownum + " OFFSET 0";*/
			    }else{
			    	int totalFiles = 0;
			    	
		    		sql = "" + 
						"SELECT count(*) AS total_files " +
						"FROM files f " +
						"WHERE f.trash IS NULL " + 
						"AND ( " +
								"f.id_site = " + idSite + " " +
								"OR f.id_file IN ( " +
									"SELECT files.id_file " +
									"FROM file_share, files " +
									"WHERE file_share.id_file = files.id_file " +
									"AND file_share.id_site = " + idSite + " " +
								") " +
							") " +
						"AND f.id_file " +
							"NOT IN ( " +
								"SELECT file_privileges.id_file " +
								"FROM file_privileges, user_groups " +
								"WHERE file_privileges.id_group = user_groups.id_group " + 
								"AND user_groups.id_user = " + this.idUser + " " +
								"AND file_privileges.hidden" + (adminMode? "" : "_nav") + " IS NOT NULL " +
								"GROUP BY file_privileges.id_file " +
							") ";

			    		if(useRecursion) {
					        sql += "AND f.id_file = fpp.id_file " +
									"AND fpp.parent_file = " + this.idFile + " ";
					    } else
					        sql += "AND f.parent_file = " + this.idFile + " ";
					   
					   if(fileTypeFilter != null){
					        String fileTypes = "";
					        for(int j = 0; j < fileTypeFilter.size(); j++){
					            fileTypes += "'" + fileTypeFilter.get(j) + "'";
					            if(j < fileTypeFilter.size() - 1)
					                fileTypes += ", ";
					        }
					        
					        sql += " AND f.file_type IN (" + fileTypes + ") ";
					    }
					   
					   dataBase.db_query(sql, false, null);
					   row = dataBase.db_fetch_array();
					   totalFiles = Integer.parseInt(row.get("TOTAL_FILES").toString());
			    	
			        Vector randomIndex = new Vector();
			        Object generateIndex = "-1";
			        sql = "";
			        
					// Nelson: cuando uno pide todos ( rownum = -1 ) no sale nada
					if ( rownum == -1 );
						//rownum = totalFiles;
					
			        for(int i = 0; i < rownum; i++){
			          
			            do{
			                generateIndex = ((int)(Math.random()*totalFiles)) + "";
			                
			            }while(randomIndex.contains(generateIndex));
			            randomIndex.addElement(generateIndex);
			            
			            sql += "" +
						"( " + 
							"SELECT TOP 1 f.id_file, f.parent_file, f.id_site, f.file_type, f.name, convert( varchar, f.modifieddate, 103 ) AS modifieddate, f.file_position " +
							"FROM files f ";
			            
			            if (useRecursion) {
							sql += ", file_parents fpp ";
						}
			            
						sql +=	"WHERE f.trash IS NULL " + 
							"AND f.file_workflow = " + File.FILE_APPROVED + " " + 
							"AND ( " +
									"f.id_site = " + idSite + " " +
									"OR f.id_file IN ( " +
										"SELECT files.id_file " +
										"FROM file_share, files " +
										"WHERE file_share.id_file = files.id_file " +
										"AND file_share.id_site = " + idSite + " " +
									") " +
								") " +
							"AND f.id_file " +
								"NOT IN ( " +
									"SELECT file_privileges.id_file " +
									"FROM file_privileges, user_groups " +
									"WHERE file_privileges.id_group = user_groups.id_group " + 
									"AND user_groups.id_user = " + this.idUser + " " +
									"AND file_privileges.hidden" + (adminMode? "" : "_nav") + " IS NOT NULL " +
									"GROUP BY file_privileges.id_file " +
								") ";
			            
			            if(fileTypeFilter != null){
					        String fileTypes = "";
					        for(int j = 0; j < fileTypeFilter.size(); j++){
					            fileTypes += "'" + fileTypeFilter.get(j) + "'";
					            if(j < fileTypeFilter.size() - 1)
					                fileTypes += ", ";
					        }
					        
					        sql += "AND f.file_type IN (" + fileTypes + ") ";
					    }
			            
			            if(useRecursion) {
					        sql += "AND f.id_file = fpp.id_file " +
									"AND fpp.parent_file = " + this.idFile + " ";
					    } else
					        sql += "AND f.parent_file = " + this.idFile + " ";
			            
						sql += "ORDER BY f.file_position, f.modifieddate DESC " + ")";
			            
			            if(i < rownum - 1)
			                sql += " UNION ";
			        }
			    }
				
				dataBase.db_query(sql, false, null);
				Vector files = new Vector();
				
				while((row = dataBase.db_fetch_array()) != null){
				    try{
				        File file = FileManager.createObject(row.get("FILE_TYPE").toString());
				        
						if(file != null){
							file.setIdFile(Integer.parseInt(row.get("ID_FILE").toString()));
							file.load();
							files.addElement(file);	
						}
						
				    }catch(Exception e){
				        e.printStackTrace();
				    }
				}

				dataBase.close();
				dataBase = null;
				
				return files;
		    }catch(Exception e){
		        try{dataBase.close();}catch(Exception exc){}
		        dataBase = null;
		        
		        throw e;
		    }finally{
		        try{dataBase.close();}catch(Exception exc){}
		        dataBase = null;
		    }
		}
		
		/*
         * 
         * Metodos para contenidos especificos - Folder
         *  
         */
				
		public Vector searchFiles(String pattern, String startDate, String endDate, Vector fileTypeFilter, int startIndex, int numRows, int idSite, boolean adminMode) throws Exception{
		    DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
		    
		    try{
			    Vector folderTypeFilter = new Vector();
		        folderTypeFilter.addElement("Carpeta");
			    Vector folders = getFilesPrivilegesRecursive(this.idFile, folderTypeFilter, dataBase, idSite, adminMode);
				String tmp = new String();
	
				for(int i = 0; i < folders.size(); i++)
					tmp += ((Hashtable)folders.get(i)).get("ID_FILE") + ",";
				
				tmp += this.idFile;			
				
				dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
				
				String sql = "" +
					"SELECT  TOP " + numRows + " a.* FROM (" +
					"SELECT f.id_file, f.modifieddate, f.file_type, f.id_site " +
					"FROM files f, external_files eF, file_properties fP " + 
					"WHERE f.trash IS NULL " + 
					"AND f.parent_file IN (" + tmp + ") " + 
					"AND f.reference_file = eF.id_external_file " + 
					"AND ef.id_external_file = fP.id_external_file " + 
					"AND (f.name ~* '" + pattern + "' OR fP.value ~* '" + pattern + "') " + 
					"AND (f.id_site = " + idSite + " OR f.id_site IS NULL) " + 
					"AND ( " +
							"f.id_site = " + idSite + " " +
							"OR f.id_file IN ( " +
								"SELECT files.id_file " +
								"FROM file_share, files " +
								"WHERE file_share.id_file = files.id_file " +
								"AND file_share.id_site = " + idSite + " " +
							") " +
						") " +
					"AND f.id_file " +
						"NOT IN ( " +
							"SELECT file_privileges.id_file " +
							"FROM file_privileges, user_groups " +
							"WHERE file_privileges.id_group = user_groups.id_group " + 
							"AND user_groups.id_user = " + this.idUser + " " +
							"AND file_privileges.hidden" + (adminMode? "" : "_nav") + " IS NOT NULL " +
							"GROUP BY file_privileges.id_file " +
						") " +
					"GROUP BY f.id_file, f.modifieddate, f.file_type " +
					"UNION " +
					"SELECT f.id_file, f.modifieddate, f.file_type " +
					"FROM files f, documents doc " + 
					"WHERE f.trash IS NULL " + 
					"AND f.file_type != 'Encuesta' " + 
					"AND f.parent_file IN (" + tmp + ") " + 
					"AND f.reference_file = doc.id_document " + 
					"AND (doc.author ~* '" + pattern + "' OR f.name ~* '" + pattern + "' OR doc.short_content ~* '" + pattern + "') " + 
					"AND ( " +
							"f.id_site = " + idSite + " " +
							"OR f.id_file IN ( " +
								"SELECT files.id_file " +
								"FROM file_share, files " +
								"WHERE file_share.id_file = files.id_file " +
								"AND file_share.id_site = " + idSite + " " +
							") " +
						") " +
					"AND f.id_file " +
						"NOT IN ( " +
							"SELECT file_privileges.id_file " +
							"FROM file_privileges, user_groups " +
							"WHERE file_privileges.id_group = user_groups.id_group " + 
							"AND user_groups.id_user = " + this.idUser + " " +
							"AND file_privileges.hidden" + (adminMode? "" : "_nav") + " IS NOT NULL " +
							"GROUP BY file_privileges.id_file " +
						") " +
					"GROUP BY f.id_file, f.modifieddate, f.file_type " +
				") a WHERE true ";
				if(startDate != null && startDate != "" && endDate != null && endDate != "")
				    sql +=		"AND a.modifieddate >= '" + startDate + "' AND a.modifieddate <= '" + endDate + "' ";
				
				if(fileTypeFilter != null){
			        String fileTypes = "";
			        for(int i = 0; i < fileTypeFilter.size(); i++){
			            fileTypes += "'" + fileTypeFilter.get(i) + "'";
			            if(i < fileTypeFilter.size() - 1)
			                fileTypes += ", ";
			        }
			        
			        sql += "AND a.file_type IN (" + fileTypes + ") ";
			    }
				
				sql +=			"ORDER BY a.modifieddate DESC ";
				
				dataBase.db_query(sql, false, null);
				Vector files = new Vector();
				Hashtable row;
				
				while((row = dataBase.db_fetch_array()) != null){
				    try{
				        File file = FileManager.createObject(row.get("FILE_TYPE").toString());
				        
						if(file != null){
							file.setIdFile(Integer.parseInt(row.get("ID_FILE").toString()));
							file.load();
							files.addElement(file);
						}
						
				    }catch(Exception e){
				        Log.print(e.toString());
				    }
				}
	
				dataBase.close();
				dataBase = null;
				
				return files;
		    }catch(Exception e){
		        try{dataBase.close();}catch(Exception exc){}
		        dataBase = null;
		        
		        throw e;
		    }finally{
		        try{dataBase.close();}catch(Exception exc){}
		        dataBase = null;
		    }
		}
		/*
                    Metodo para encontrar todos los tickets creados por un usuarios
                 */
        public Vector getTicketsRecursive( String searchKey, int rownum, int idSite, boolean adminMode ) throws Exception{
            DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
		    
		    String sql = new String();
		    Hashtable row;
		    String subFoldersString = null;
		    
		    try{
                Vector folderTypeFilter = new Vector();
                folderTypeFilter.addElement("Carpeta");
                Vector folders = getFilesPrivilegesRecursive(this.idFile, folderTypeFilter, dataBase, idSite, adminMode);
                subFoldersString = "";

                for(int i = 0; i < folders.size(); i++)
                    subFoldersString += ((Hashtable)folders.get(i)).get("ID_FILE") + ",";

                subFoldersString += this.idFile;
	    		sql = "SELECT " ;     
                if(rownum > 0)
                    sql += " TOP " + rownum;
				sql += "" + 
					" f.id_file, f.parent_file, f.id_site, f.file_type, f.name, convert( varchar, f.modifieddate, 103 ) AS modifieddate " +
					"FROM files f, tck_ticket t " +
					"WHERE f.trash IS NULL " + 
					"AND f.reference_file = t.id_ticket " + 
					"AND (f.id_site = " + idSite + " OR f.id_site IS NULL) " + 
					"AND (t.title ~* '" + searchKey + "' OR t.description ~* '" + searchKey + "' OR t.id_ticket like '" + searchKey + "') " + 
					"AND ( " +
							"f.id_site = " + idSite + " " +
							"OR f.id_file IN ( " +
								"SELECT files.id_file " +
								"FROM file_share, files " +
								"WHERE file_share.id_file = files.id_file " +
								"AND file_share.id_site = " + idSite + " " +
							") " +
						") " +
					"AND f.id_file " +
						"NOT IN ( " +
							"SELECT file_privileges.id_file " +
							"FROM file_privileges, user_groups " +
							"WHERE file_privileges.id_group = user_groups.id_group " + 
							"AND user_groups.id_user = " + this.idUser + " " +
							"AND file_privileges.hidden" + (adminMode? "" : "_nav") + " IS NOT NULL " +
							"GROUP BY file_privileges.id_file " +
						") ";
                
                sql += "AND f.file_type LIKE 'Ticket' ";
				sql += "AND f.owner = " + this.idUser ;					
                sql += "AND f.parent_file IN (" + subFoldersString + ") ";
                sql += "ORDER BY f.modifieddate DESC ";

               /* if(rownum > 0)
                    sql += "LIMIT " + rownum + " OFFSET 0";*/
		    	
				dataBase.db_query(sql, false, null);
				Vector files = new Vector();
				
				while((row = dataBase.db_fetch_array()) != null){
				    try{
				        File file = FileManager.createObject(row.get("FILE_TYPE").toString());
				        
						if(file != null){
							file.setIdFile(Integer.parseInt(row.get("ID_FILE").toString()));
							file.load();
							files.addElement(file);	
						}
						
				    }catch(Exception e){
				        Log.print(e.toString());
				    }
				}
				
				dataBase.close();
				dataBase = null;
				
				return files;
		    }catch(Exception e){
		        try{dataBase.close();}catch(Exception exc){}
		        dataBase = null;
		        
		        throw e;
		    }finally{
		        try{dataBase.close();}catch(Exception exc){}
		        dataBase = null;
		    }
		}
		public void finalize(){
		}
		
		protected void cleanUp() throws Exception{
		}
		
		protected void storeCache() throws Exception{
			DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
			String sql = "SELECT id_file FROM search_cache WHERE id_file = " + this.idFile;
			dataBase.db_query(sql, false, null);
			Hashtable row = dataBase.db_fetch_array();
			
			if( row != null ){
				sql = "UPDATE search_cache " +
						"SET name = '" + this.name + "', " +
						"content = NULL " +
						"WHERE id_file = " + this.idFile;
			}else{
				sql = "INSERT INTO search_cache " +
						"( id_file, name, content ) " + 
						"VALUES " +
						"( " + this.idFile + ",  '" + this.name + "', NULL )";
			}
			
			dataBase.db_query(sql, false, null);
			dataBase.close();
		}
		
	}
