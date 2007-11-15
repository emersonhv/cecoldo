package com.cms.vsystem;


import java.util.Hashtable;
import java.util.Properties;
import java.util.Vector;

import com.cms.dao.DataBase;
import com.cms.dao.DataBaseFactory;
import com.cms.security.User;
import com.cms.util.IntranetProperties;
import com.cms.util.Tree;
import com.cms.vsystem.object.Bulletin;
import com.cms.vsystem.object.Document;
import com.cms.vsystem.object.Faq;
import com.cms.vsystem.object.Folder;
import com.cms.vsystem.object.LinkFile;
import com.cms.vsystem.object.Poll;
import com.cms.vsystem.object.basic.Banner;
import com.cms.vsystem.object.basic.Clip;
import com.cms.vsystem.object.basic.Download;
import com.cms.vsystem.object.basic.Image;
import com.cms.vsystem.object.basic.JavaScript;
import com.cms.vsystem.object.basic.Remote;

public class FileManager{
		private int idUser;
		private String userName;
		private int actualFolder;
		private User userObj;
		
		public FileManager() throws Exception{
			actualFolder = 0;
		}
		
		public User getUserObj() {
			return userObj;
		}

		public void setUserObj(User userObj) {
			this.userObj = userObj;
		}
		
		public void setIdUser( int idUser ){
			this.idUser = idUser;
		}
		
		public void setUserName(String a){
			this.userName = a;
		}
		
		public String getUserName(){
			return this.userName;
		}
		
		public int getActualFolder(){
			return actualFolder;
		}
		
		public void setActualFolder( int a ){
			this.actualFolder = a;
		}
		
		public int getIdUser(){
			return this.idUser;
		}
		
		public Tree getUserFileTree(int idSite, boolean adminMode) throws Exception{
			Folder folder = new Folder();
			folder.setIdFile( 0 );
			folder.setIdUser( this.idUser );
			folder.setUserObj (userObj);
			
			Vector filter = new Vector();
			filter.add("Carpeta");
			Properties prop = new Properties();
			prop.put("fileTypeFilter", filter);
			
			return folder.getViewTreeFile(prop, idSite, adminMode);
		}
		
		public Tree getFileTree(int idSite, boolean adminMode) throws Exception{
			Folder folder = new Folder();
			folder.setIdFile(0);
			folder.setIdUser(0);
			
			return folder.getViewTreeFile(null, idSite, adminMode);
		}
		
		public String getUserFolderContentFormat(int viewType, int idSite, boolean adminMode) throws Exception{
			Folder folder = new Folder();
			folder.setIdFile( this.actualFolder );
			folder.setIdUser( this.idUser );
			folder.setIdSite( idSite );
			folder.setUserObj (userObj);

			return folder.getViewFolderContent(viewType, idSite, adminMode);
		}
		
		public String getFolderContentFormat(int viewType, int idSite, boolean adminMode) throws Exception{
			Folder folder = new Folder();
			folder.setIdFile( this.actualFolder );
			folder.setIdUser( 0 );
			
			return folder.getViewFolderContent(viewType, idSite, adminMode);
		}
		
		public static File createObject(String fileType) throws Exception{
		    File obj = null;
		    
			if(fileType.toLowerCase().equals("documento")){
			    obj = new Document();
				return obj;
			}
			
			if(fileType.toLowerCase().equals("imagen")){
				obj = new Image();
				return obj;
			}
			
			if(fileType.toLowerCase().equals("carpeta")){
			    obj = new Folder();
			    return obj;
			}
			
			if(fileType.toLowerCase().equals("clipping")){
			    obj = new Clip();
				return obj;
			}
			
			if(fileType.toLowerCase().equals("banner")){
			    obj = new Banner();
				return obj;
			}
			
			if(fileType.toLowerCase().equals("poll")){
			    obj = new Poll();
			    return obj;
			}
			
			
			if(fileType.toLowerCase().equals("descargable")){
			    obj = new Download();
			    return obj;
			}
			
			if(fileType.toLowerCase().equals("boletin")){
			    obj = new Bulletin();
			    return obj;
			}
			
			if(fileType.toLowerCase().equals("enlace")){
			    obj = new LinkFile();
			    return obj;
			}
			
			if (fileType.toLowerCase().equals("faq")) {
			    obj = new Faq ();
			    return obj;
			}
			
			if (fileType.toLowerCase().equals("script")) {
			    obj = new JavaScript ();
			    return obj;
			}
			if (fileType.toLowerCase().equals("remoto")) {
			    obj = new Remote ();
			    return obj;
			}

			throw new Exception("Class Not found in function FileManager.createObject\nClass Name: " + fileType);
		}
		public int addFile(String fileName, String fileType, int idSite ) throws Exception{
			return addFile( fileName, fileType, idSite, actualFolder  );			
		}
		public int addFile(String fileName, String fileType, int idSite, int folder) throws Exception{
		    DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
		    
		    try{
			    String sql = "" + 
					"SELECT count(*) AS total_files " +
			    	"FROM files " +
			    	"WHERE parent_file = " + folder + " " + 
					"AND name = '" + fileName + "' " + 
					"AND file_type = '" + fileType + "' ";
	
			    if( idSite != 0 )
			        sql += "AND id_site = " + idSite;
			    
			    dataBase.db_query(sql, false, null);
				Hashtable row = dataBase.db_fetch_array();
				
				if(Integer.parseInt(row.get("TOTAL_FILES").toString()) == 0){
					Vector groupsArr = userObj.getGroupsId();
					
					if(groupsArr.size() > 0){
						int idDefaultGroup = Integer.parseInt(groupsArr.get(0).toString());
					    String groups = "";
					    
					    for (int i = 0; i < groupsArr.size(); i++)
						    groups += groupsArr.get(i) + (i < groupsArr.size() - 1 ? "," : "");
					    
						if( this.actualFolder != 0 ){
							sql = "SELECT write " +
									"FROM file_privileges " +
									"WHERE id_file = " + this.actualFolder + " " + 
									"AND id_group IN (" + groups + ")";
						}else{
							sql = "SELECT write " +
									"FROM file_privileges " +
									"WHERE id_file IS NULL " + 
									"AND id_group IN (" + groups + ")";
						}
								
						dataBase.db_query(sql, false, null);
						
						if( (row = dataBase.db_fetch_array()) != null ){
							if( row.get("WRITE") != null ){
							    String workFlow = "NULL";
							    
							    sql = "SELECT path " +  
										"FROM files " +
										"WHERE id_file = " + this.actualFolder; 
								dataBase.db_query (sql, false, null);
								String pathString = ",";
								if ((row = dataBase.db_fetch_array()) != null) {
									pathString = row.get("PATH").toString() + this.actualFolder + ",";
								}
							    
						        sql = "SELECT workflow_group FROM files WHERE id_file = " + actualFolder;
						        dataBase.db_query(sql, false, null);
						        row = dataBase.db_fetch_array();
						        if(row.get("WORKFLOW_GROUP") == null)
						            workFlow = String.valueOf(File.FILE_APPROVED);
							    
								sql = "INSERT INTO files " + 
										"( parent_file, file_type, name, creationdate, modifieddate, trash, reference_file, owner, file_workflow, workflow_group, id_site, path) " +
										"VALUES " +
										"( " + (this.actualFolder != 0? String.valueOf(this.actualFolder) : "NULL" ) + ", '" + fileType + "', '" + fileName + "', getDate(), getDate(), NULL, NULL, '" + this.idUser + "', " + workFlow + ", NULL, " + (idSite != 0? String.valueOf(idSite) : "NULL") + ", '" + pathString + "')";
								
								Object key = dataBase.db_query(sql, false, "file_seq");
								int idFile = Integer.parseInt(key.toString());
								
								sql = "INSERT INTO file_privileges " +
										"(id_group, id_file, \"read\", write, read_nav) " +
										"VALUES " +
										"(" + idDefaultGroup + ", " + idFile + ", 1, 1, 1 )";
										
								dataBase.db_query(sql, false, null);
								
								/**
								*	Registra los id de los padres para el nuevo archivo
								*/
								String pathArray[] = pathString.split("[,]");
								for (int i = 0; i < pathArray.length; i++) {
									if (!pathArray[i].trim().equals("")) {
										sql = "INSERT INTO file_parents " +
												"(id_file, parent_file) " +
												"VALUES " +
												"(" + idFile + ", " + pathArray[i] + ")";
										dataBase.db_query (sql, false, null);
									}
								}
								
								dataBase.close();
								dataBase = null;
								
								return idFile;
							}else{
							    dataBase.close();
							    dataBase = null;
							    
								throw new Exception("El usuario no tiene los permisos necesarios para escribir en esta carpeta.");
							}
						}else{
						    dataBase.close();
						    dataBase = null;
						    
							throw new Exception("El usuario no tiene los permisos necesarios para escribir en esta carpeta.");
						}
					}else{
					    dataBase.close();
					    dataBase = null;
					    
					    throw new Exception("No se puede agregar el privilegio del nuevo archivo al usuario,\\n debido a que el usuario no pertenece a ningun grupo!");
					}
				}else{
				    dataBase.close();
				    dataBase = null;
				    
				    throw new Exception("En esta carpeta ya se encuentra un archivo con el mismo nombre.");
				}
		    } catch (Exception exc) {
		    	try {dataBase.close();} catch (Exception ex) {}
		    	dataBase = null;
		    	
		    	throw exc;		    	
		    } finally {
		    	try {dataBase.close();} catch (Exception ex) {}
		    	dataBase = null;
		    }
		}
		
		public void deleteFile( int idFile ) throws Exception{
		    DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
		    
		    try{
				Vector groupsArr = userObj.getGroupsId();
				
			    if (groupsArr.size() > 0){
					String sql;
					Hashtable row = null;
					String groups = "";
					
					for (int i = 0; i < groupsArr.size(); i++)
					    groups += groupsArr.get(i) + (i < groupsArr.size() - 1 ? "," : "");
					    
					sql = "SELECT write " +
							"FROM file_privileges " +
							"WHERE id_file = " + idFile + " AND id_group IN (" + groups + ")";
					
					dataBase.db_query(sql, false, null);
					row = dataBase.db_fetch_array();
					
					if(row != null){
						sql = "DELETE FROM file_parents WHERE id_file=" + idFile;
						dataBase.db_query(sql, false, null);
						
						sql = "DELETE FROM files WHERE id_file=" + idFile;
						dataBase.db_query(sql, false, null);
						
						dataBase.close();
						dataBase = null;
						
					}else{
					    dataBase.close();
					    dataBase = null;
					    
					    throw new Exception("El usuario no tiene permisos para eliminar este archivo");
					}
			    }else{
			        dataBase.close();
			        dataBase = null;
			        
			        throw new Exception("El usuario no tiene permisos para eliminar este archivo");
			    }
		    } catch (Exception exc) {
		    	try {dataBase.close();} catch (Exception ex) {}
		    	dataBase = null;
		    	
		    	throw exc;		    	
		    } finally {
		    	try {dataBase.close();} catch (Exception ex) {}
		    	dataBase = null;
		    }
		}
		
		public int addFolderToRoot(String fileName, int idSite) throws Exception{
		    DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
		    
		    try{
			    String sql = "SELECT count(*) AS total_files " +
								"FROM files " +
								"WHERE parent_file IS NULL " +
								"AND name = '" + fileName + "' " +
								"AND file_type = 'Carpeta'";
			    
				dataBase.db_query(sql, false, null);
				Hashtable row = dataBase.db_fetch_array();
				
				if(Integer.parseInt(row.get("TOTAL_FILES").toString()) == 0){
				    sql = "INSERT INTO files " +
							"( parent_file, file_type, name, creationdate, modifieddate, trash, reference_file, owner, id_site, path ) " +
							"VALUES " +
							"( NULL, 'Carpeta', '" + fileName + "', getDate(), getDate(), NULL, NULL, '" + this.idUser + "', " + idSite + " , ',')";
		
				    Object key = dataBase.db_query(sql, false, "file_seq");
				    dataBase.close();
				    dataBase = null;
				    
				    return Integer.parseInt(key.toString());
				}
				
				dataBase.close();
			    dataBase = null;
			    
				throw new Exception("En esta carpeta ya se encuentra un archivo con el mismo nombre.");
		    } catch (Exception exc) {
		    	try {dataBase.close();} catch (Exception ex) {}
		    	dataBase = null;
		    	
		    	throw exc;		    	
		    } finally {
		    	try {dataBase.close();} catch (Exception ex) {}
		    	dataBase = null;
		    }
		}
		
		public void sendToTrash( int idFile ) throws Exception{
		    DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
		    
		    try{
				Vector groupsArr = userObj.getGroupsId();
				
			    if (groupsArr.size() > 0){
					String sql;
					Hashtable row = null;
					String groups = "";
					
					for (int i = 0; i < groupsArr.size(); i++)
					    groups += groupsArr.get(i) + (i < groupsArr.size() - 1 ? "," : "");
				    
					sql = "SELECT write " +
							"FROM file_privileges " +
							"WHERE id_file = " + idFile + " AND id_group IN (" + groups + ")";
					
					dataBase.db_query(sql, false, null);
					row = dataBase.db_fetch_array();
					
					if (row != null) {
					    sql = "UPDATE files SET trash = 1 WHERE id_file = " + idFile;
				        dataBase.db_query(sql, false, null);
				        dataBase.close();
				        dataBase = null;
					}else{
					    dataBase.close();
					    dataBase = null;
					    
					    throw new Exception("El usuario no tiene permisos para eliminar este archivo");
					}
			    }else{
			        dataBase.close();
			        dataBase = null;
			        
			        throw new Exception("El usuario no tiene permisos para eliminar este archivo");
			    }
		    } catch (Exception exc) {
		    	try {dataBase.close();} catch (Exception ex) {}
		    	dataBase = null;
		    	
		    	throw exc;		    	
		    } finally {
		    	try {dataBase.close();} catch (Exception ex) {}
		    	dataBase = null;
		    }
			   
		}
		
		public void restoreFile( int idFile ) throws Exception{
		    DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
		    
			try{
				Vector groupsArr = userObj.getGroupsId();
				
				if (groupsArr.size() > 0){
					String sql;
					Hashtable row = null;
					String groups = "";
					
					for (int i = 0; i < groupsArr.size(); i++)
					    groups += groupsArr.get(i) + (i < groupsArr.size() - 1 ? "," : "");
					
					sql = "SELECT write " +
							"FROM file_privileges " +
							"WHERE id_file = " + idFile + " AND id_group IN (" + groups + ")";
					
					dataBase.db_query(sql, false, null);
					row = dataBase.db_fetch_array();
					
					if(row != null){
					    sql = "UPDATE files SET trash = NULL WHERE id_file = " + idFile;
					    dataBase.db_query(sql, false, null);
					    dataBase.close();
					    dataBase = null;
					}else{
					    dataBase.close();
					    dataBase = null;
					    
					    throw new Exception("El usuario no tiene permisos para restaurar este archivo");
					}
			    }else{
			        dataBase.close();
			        dataBase = null;
			        
			        throw new Exception("El usuario no tiene permisos para restaurar este archivo");
			    }
			} catch (Exception exc) {
		    	try {dataBase.close();} catch (Exception ex) {}
		    	dataBase = null;
		    	
		    	throw exc;		    	
		    } finally {
		    	try {dataBase.close();} catch (Exception ex) {}
		    	dataBase = null;
		    }
		}
		
		public void moveFile(int idFileMove, int destIdFolder) throws Exception{
		    DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
		    
		    try {
			    Vector groupsArr = userObj.getGroupsId();
				
				if(groupsArr.size() > 0){
					String sql;
					Hashtable row = null;
					String groups = "";
					
					for (int i = 0; i < groupsArr.size(); i++)
					    groups += groupsArr.get(i) + (i < groupsArr.size() - 1 ? "," : "");
					
					sql = "SELECT write " +
							"FROM file_privileges " +
							"WHERE id_file = " + destIdFolder + " AND id_group IN (" + groups + ")";
					
					dataBase.db_query(sql, false, null);
					row = dataBase.db_fetch_array();
					
					if(row != null){
						/**
						*	Actualiza las rutas para indexar las busquedas
						*/
						
						//// Actualizacion de indices dentro de la tabla file <deprecated>
							/// Trae la vieja ruta del Archivo
							sql = "SELECT path " +
									"FROM files " +
									"WHERE id_file = " + idFileMove; 

							dataBase.db_query (sql, false, null);
							String oldPathString = ",";
							if ((row = dataBase.db_fetch_array()) != null) {
								oldPathString = row.get("PATH").toString();
							}

							/// Trae la nueva ruta del Archivo
							sql = "SELECT path " +
									"FROM files " +
									"WHERE id_file = " + destIdFolder; 
							
							dataBase.db_query (sql, false, null);
							String newPathString = ",";
							if ((row = dataBase.db_fetch_array()) != null) {
								newPathString = row.get("PATH").toString();
							}
							newPathString += destIdFolder + ",";
							
							sql = "UPDATE files " +
									"SET path = REPLACE(path, '" + oldPathString + idFileMove + ",', '" + newPathString + idFileMove + ",') " +
									"WHERE path LIKE '" + oldPathString + idFileMove + ",%'";
							dataBase.db_query (sql, false, null);
							
							/// Actualizacion de indices en file_parents
							sql = "SELECT id_file " +
									"FROM file_parents " +
									"WHERE parent_file = " + idFileMove; 
							dataBase.db_query (sql, false, null);
							Vector filesUpdate = new Vector();
							while ((row = dataBase.db_fetch_array()) != null) {
								filesUpdate.addElement (row.get("ID_FILE").toString());
							}
							
							String newPathArray[] = newPathString.split ("[,]");
							
							// Actualiza los hijos de idFileMove
							for (int i = 0; i < filesUpdate.size(); i++) {
								sql = "DELETE " +
										"FROM file_parents " +
										"WHERE parent_file IN (0" + oldPathString + "0) " +
										"AND id_file = " + filesUpdate.get (i);
								dataBase.db_query (sql, false, null);
								
								for (int j = 0; j < newPathArray.length; j++) {
									if (!newPathArray[j].trim().equals("")) {
										sql = "INSERT INTO file_parents " +
												"(id_file, parent_file) " +
												"VALUES " +
												"(" + filesUpdate.get (i) + ", " + newPathArray[j] + ")";
										dataBase.db_query (sql, false, null);
									}
								}
							}
							
							// Se actualiza el propio idFileMove
							sql = "DELETE " +
									"FROM file_parents " +
									"WHERE id_file = " + idFileMove;
							dataBase.db_query (sql, false, null);
							
							for (int j = 0; j < newPathArray.length; j++) {
								if (!newPathArray[j].trim().equals("")) {
									sql = "INSERT INTO file_parents " +
											"(id_file, parent_file) " +
											"VALUES " +
											"(" + idFileMove + ", " + newPathArray[j] + ")";
									dataBase.db_query (sql, false, null);
								}
							}
						
						/// END UPDATE
						
						/**
						*/
							
						sql = "UPDATE files " +
								"SET parent_file = " + ((destIdFolder != 0)? destIdFolder + "": "NULL" ) + ", " +
								"path = '" + newPathString + "' " +
								"WHERE id_file = " + idFileMove;
						
					    dataBase.db_query(sql, false, null);
					    dataBase.close();
					    dataBase = null;
					}else{
					    dataBase.close();
					    dataBase = null;
					    
					    throw new Exception("El usuario no tiene permisos para mover a esta carpeta");
					}
			    }else{
			        dataBase.close();
			        dataBase = null;
			        
			        throw new Exception("El usuario no tiene permisos para mover el archivo");
			    }
		    } catch (Exception exc) {
		    	try {dataBase.close();} catch (Exception ex) {}
		    	dataBase = null;
		    	
		    	throw exc;		    	
		    } finally {
		    	try {dataBase.close();} catch (Exception ex) {}
		    	dataBase = null;
		    }
		}
		
		public Hashtable getFileAttributes( int idFile ) throws Exception{
		    DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
		    
			String sql = "SELECT f.id_file, f.name, f.file_type, f.creationdate, f.modifieddate, f.random_content, u.first_name + ' ' + u.last_name AS owner " + 
			    			"FROM files f, users u " +
			    			"WHERE f.id_file = " + idFile + " " +
			    			"AND f.owner = u.id_user";
			
			dataBase.db_query(sql, false, null);
			Hashtable row = dataBase.db_fetch_array();
			dataBase.close();
			dataBase = null;
			    
			return row;
		}
		
		public String getTrashContent(int idSite) throws Exception{
		    DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
		    
		    String sql = 	"SELECT f.id_file, f.parent_file, f.file_type, f.name, f.creationdate, fT.image " +
							"FROM files f, file_types fT " +
							"WHERE f.trash IS NOT NULL AND f.file_type = fT.name AND (f.id_site = " + idSite + " OR f.id_site IS NULL) AND f.id_file " +
								"NOT IN ( " +
									"SELECT file_privileges.id_file " +
									"FROM file_privileges, user_groups " +
									"WHERE file_privileges.id_group = user_groups.id_group " + 
									"AND user_groups.id_user = " + this.idUser + " " +
									"AND file_privileges.hidden IS NOT NULL " +
									"GROUP BY file_privileges.id_file " +
								") " + 
					       "ORDER BY f.name ";
					
			dataBase.db_query(sql, false, null);
			Vector files = new Vector();
			Hashtable row;
			
			while((row = dataBase.db_fetch_array()) != null)
				files.addElement(row);
			
			dataBase.close();
			dataBase = null;
			
			return createIconContentFormat(files);
		}
		
		public String createIconContentFormat(Vector files){
			String html =  "";
			int horizontalFileCount = 3;
			Hashtable row;
			
			for(int i = 0; i < files.size(); i++){
				if(i%horizontalFileCount == 0 ){
					if( i != 0 )
						html += "</tr>\n";
						
					html += "\n<tr>";
				}
				
				row = (Hashtable)files.get(i);
				String image = (row.get("IMAGE") != null)? row.get("IMAGE").toString() : "imagenes/tipos/no.gif";
				html += "<td width='" + (Math.round(100/horizontalFileCount)) + "%' class='textos' >" +
							"<table width='100%' cellpadding='3' cellspacing='0' border='0'>" +
								"<tr>" +
									"<td width='100%' class='textos' style=''>" +
										"<a href=\"javascript:alert('Los archivos en la papelera no se pueden abrir!');\" target='show' id='" + row.get("ID_FILE") + "' style='text-decoration: none;' >" +
											"<img src='" + IntranetProperties.INTRA_BASE_URL + image + "' border='0' align='left' id='" + row.get("ID_FILE") + "' style='filter: alpha(opacity=50); -moz-opacity: 0.5;' ><font color='#777777' style='text-decoration: none;'>" + row.get("NAME") + "</font><br><font color='#BBBBBB' style='text-decoration: none;'>" + row.get("CREATIONDATE") + "<br>" + row.get("FILE_TYPE") + "</font>" +
										"</a>" +
									"</td>" +
								"</tr>" +
							"</table>" +
						"</td>";
			}
			
			html += "</tr>\n";
			
			return html;
		}
		
		public Vector searchFiles(String pattern, int startIndex, int numRows, int idSite, boolean adminMode) throws Exception{
		    Folder folder = new Folder();
		    folder.setIdFile(0);
		    folder.setIdUser(this.idUser);
		    return folder.searchFiles(pattern, "", "", null, startIndex, numRows, idSite, adminMode);
		}
		
		protected void finalize(){
	    }
}
