package com.cms.security;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Vector;

import com.cms.dao.DataBase;
import com.cms.dao.DataBaseFactory;
import com.cms.portal.Page;
import com.cms.portal.Site;
import com.cms.util.IntranetProperties;
import com.cms.util.Node;
import com.cms.util.Tree;
import com.cms.vsystem.File;
import com.cms.vsystem.FileManager;
import com.cms.vsystem.object.Folder;

/**
 * Esta clase es la encargada de gestionar todas las peticiones provenientes de la
 * interfaz grafica, para la administracion de usuarios y el sistema de archivos
 * del <b>CMS</b>. 
 * 
 * @author admin
 * @version %I%, %G%
 */

public class Session {
    private User sessionUser;
    private FileManager fileManager;
    private Hashtable sitePages;
    private Tree menu;
    private Site site;
    
    public Session( ) throws Exception{
        sessionUser = null;
        fileManager = null;
        menu = null;

		DataBase dataBase = DataBaseFactory.getInstance( IntranetProperties.DATABASE_TYPE );
		String sql = "SELECT id_site FROM sites WHERE main_site = 1";
		dataBase.db_query(sql, false, null);
		Hashtable row = dataBase.db_fetch_array( );
		
		if(row == null)
			throw new Exception("No main site configured.");
		
		site = new Site( );
		site.setIdSite(Integer.parseInt(row.get("ID_SITE").toString( )));
		site.load( );
    }
    
    public void setIdSite(int idSite) throws Exception{
        if(site == null || site.getIdSite( ) != idSite){
            site = new Site( );
            site.setIdSite(idSite);
            site.load( );
        }
    }
    
    public Site getSite( ){
        return site;
    }
   
    
    public int getIdPage( ) throws Exception{
        return site.getHomePage( );
    }

    public String getFullUserName( ) {
        return sessionUser.getFirstName( ) + " " + sessionUser.getLastName( );
    }

    public User getUser( ) {
        return sessionUser;
    }
    
    public void setUser(User user){
        this.sessionUser = user;
    }
    
    public Tree getAppMenu( ){
        return menu;
    }

    public boolean userCanWrite(int idFile) throws Exception {
        return sessionUser.userCanWrite(idFile);
    }
    
	public Vector getPhoneRanges( String searchKey ) throws Exception{
        DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
        
        String sql = "SELECT id_phone_range, range " +
        				"FROM phone_ranges ";
     
        if(searchKey != null) 
            sql += "WHERE LOWER( range ) LIKE '%" + searchKey.toLowerCase() + "%' ";
      
        Vector ranges = new Vector(); 
        dataBase.db_query(sql, false, null); 
        Hashtable row;
        
        while((row = dataBase.db_fetch_array()) != null) 
            ranges.addElement(row);
        
        dataBase.close();
        dataBase = null;
      
        return ranges; 
    }
    
	
    public void validateUser(String login, String passwd) throws Exception {
        DataBase dataBase = DataBaseFactory.getInstance( IntranetProperties.DATABASE_TYPE );
        
        String sql = "SELECT id_user " + 
        				"FROM users " + 
        				"WHERE login = '" + login + "' " + "AND passwd = '" + passwd + "' AND (id_site = " + site.getIdSite( ) + " OR id_site IS NULL)";

        dataBase.db_query(sql, false, null);
        Hashtable row = dataBase.db_fetch_array( );
        
        dataBase.close( );
        dataBase = null;
        
        if (row != null) {
            sessionUser = new User( );
            sessionUser.setIdUser(Integer.parseInt(row.get("ID_USER").toString( )));
            sessionUser.load( );
            
                       
            if(sessionUser.getUserState( ) == 1){
               				
	            Calendar lastLoginDate = Calendar.getInstance( );
	            String lastLogin = lastLoginDate.get(Calendar.YEAR) + "-" + (lastLoginDate.get(Calendar.MONTH) + 1) + "-" + lastLoginDate.get(Calendar.DATE);
	            sessionUser.setLastLogin(lastLogin);
	            sessionUser.commit( );
	            fileManager = new FileManager( );
	            fileManager.setIdUser( sessionUser.getIdUser() );
	            fileManager.setUserObj( sessionUser );
 	            loadMenus( );
            }else
                throw new Exception("Este usuario se encuentra inactivo en el sistema.");
        } else
            throw new Exception("Nombre de usuario o contraseña invalidos.");
    }
    
/* DEPRECATED */
/* public Product getProductByCode(String productCode) */
    
    public Vector getUsersByLogin ( String login, String email ) throws Exception	{
        DataBase dataBase = DataBaseFactory.getInstance( IntranetProperties.DATABASE_TYPE );
		Vector users = new Vector ( );
        
        String sql = "SELECT id_user " + 
        				"FROM users " + 
        				"WHERE (id_site = " + site.getIdSite( ) + " OR id_site IS NULL) ";
		if ( login != null )
			sql += "AND LOWER(login) = '" + login.toLowerCase( ) + "' ";

		if ( email != null )
			sql += "AND LOWER(email) = '" + email.toLowerCase( ) + "' ";

        dataBase.db_query(sql, false, null);
        Hashtable row;

        while( (row = dataBase.db_fetch_array( )) != null )	{
            User user = new User( );
            user.setIdUser(Integer.parseInt(row.get("ID_USER").toString( )));
            user.load( );
			users.addElement( user );
		}
		        
        dataBase.close( );
        dataBase = null;
		
		return users;
    }

    public File createObject(String fileType) throws Exception{ 
        return FileManager.createObject(fileType); 
    }
      
    public Vector getPages(String searchKey) throws Exception{
        DataBase dataBase = DataBaseFactory.getInstance( IntranetProperties.DATABASE_TYPE );
        
        String sql = "SELECT id_page, name " +
        				"FROM page " +
        				"WHERE id_site = " + site.getIdSite( );
     
        if(searchKey != null) 
            sql += "AND LOWER(name) LIKE '%" + searchKey.toLowerCase( ) + "%' ";
      
        Vector pages = new Vector( ); 
        dataBase.db_query(sql, false, null); 
        Hashtable row;
        
        while((row = dataBase.db_fetch_array( )) != null) 
            pages.addElement(row);
        
        dataBase.close( );
        dataBase = null;
      
        return pages; 
    }
    
    public Vector getSites(String searchKey) throws Exception{
        DataBase dataBase = DataBaseFactory.getInstance( IntranetProperties.DATABASE_TYPE );
        
        String sql = "SELECT id_site, name " +
        				"FROM sites ";
     
        if(searchKey != null) 
            sql += "WHERE LOWER(name) LIKE '%" + searchKey.toLowerCase( ) + "%' ";
      
        Vector sites = new Vector( ); 
        dataBase.db_query(sql, false, null); 
        Hashtable row;
        
        while((row = dataBase.db_fetch_array( )) != null) 
            sites.addElement(row);
        
        dataBase.close( );
        dataBase = null;
      
        return sites; 
    }
    
    public void delPage(int idPage) throws Exception{ 
        DataBase dataBase = DataBaseFactory.getInstance( IntranetProperties.DATABASE_TYPE );
        
        String sql = "DELETE FROM page WHERE id_page=" + idPage;
      	dataBase.db_query(sql, false, null);
      	
      	dataBase.close( );
      	dataBase = null;
    }
      
    public void delSite( int idSite ) throws Exception { 
        DataBase dataBase = DataBaseFactory.getInstance( IntranetProperties.DATABASE_TYPE );
        
        String sql = "DELETE FROM sites WHERE id_site=" + idSite;
      	dataBase.db_query(sql, false, null);
      	
      	dataBase.close( );
      	dataBase = null;
    }
      
    public Page getPageById(int idPage) throws Exception{ 
        Page defaultPage = new Page( );
     	defaultPage.setName("Error"); 
      
     	return (sitePages.get(idPage + "") != null)? (Page)sitePages.get(idPage + "") : defaultPage; 
    }
     
    public int getIdPageByName(String name){
        Enumeration pagesKeys = sitePages.keys( );
        
        while(pagesKeys.hasMoreElements( )){
            Page page = (Page)sitePages.get(pagesKeys.nextElement( ));
            if(page.getName( ).equals(name)){
                return page.getIdPage( );
            }
        }
        
        return 0; 
    }
      
    public void loadPagesArray( ) throws Exception{
        DataBase dataBase = DataBaseFactory.getInstance( IntranetProperties.DATABASE_TYPE );
        
        sitePages = new Hashtable( ); 
        String sql = "SELECT * FROM page WHERE id_site = " + site.getIdSite( );
     
        dataBase.db_query(sql, false, null); 
        Hashtable row;
        
        while((row = dataBase.db_fetch_array( )) != null){ 
            Page page = new Page( );
            page.setIdPage( Integer.parseInt( row.get( "ID_PAGE" ).toString( ) ) );
            page.setIdTemplate( Integer.parseInt( row.get( "ID_TEMPLATE" ).toString( ) ) );
            page.setName( row.get( "NAME" ).toString( ) );

            sitePages.put( page.getIdPage( ) + "", page ); 
        }
        
        dataBase.close( );
        dataBase = null;
     }
     
     public Vector getUsers(String searhKey) throws Exception{
         DataBase dataBase = DataBaseFactory.getInstance( IntranetProperties.DATABASE_TYPE );
         
     	String sql = "SELECT id_user, first_name, last_name, email " + 
     					"FROM users " +
     					"WHERE (id_site = " + site.getIdSite( ) + " OR id_site IS NULL) ";
     
     	if(searhKey != null) 
     	    sql += "AND LOWER(first_name) LIKE '%" + searhKey + "%' OR LOWER(last_name) LIKE '%" + searhKey + "%' ";

     	sql += "ORDER BY first_name, last_name";

     	Vector users = new Vector( ); 
     	dataBase.db_query(sql, false, null); 
     	Hashtable row;
     	
     	while((row = dataBase.db_fetch_array( )) != null) 
     	    users.addElement(row);
     
     	dataBase.close( );
     	dataBase = null;
     	
     	return users; 
     }
      
     public void delUser(int idUser) throws Exception{
         DataBase dataBase = DataBaseFactory.getInstance( IntranetProperties.DATABASE_TYPE );
         
         String sql = "DELETE " + 
		 			"FROM users " + 
         			"WHERE id_user = " + idUser;
     
         dataBase.db_query(sql, false, null);
         
         dataBase.close( );
         dataBase = null;
     }
     
     public Vector getIntranetUsers(String searhKey) throws Exception{
         DataBase dataBase = DataBaseFactory.getInstance( IntranetProperties.DATABASE_TYPE );
         
     	String sql = "SELECT id_user, name, last_name, email " + 
     					"FROM intranet_users ";
     					     
     	if(searhKey != null) 
     	    sql += "WHERE LOWER(name) LIKE '%" + searhKey + "%' OR LOWER(last_name) LIKE '%" + searhKey + "%' ";

     	sql += "ORDER BY last_name, name";

     	Vector users = new Vector( ); 
     	dataBase.db_query(sql, false, null); 
     	Hashtable row;
     	
     	while((row = dataBase.db_fetch_array( )) != null) 
     	    users.addElement(row);
     
     	dataBase.close( );
     	dataBase = null;
     	
     	return users; 
     }
      
     public void delIntranetUser(int idUser) throws Exception{
         DataBase dataBase = DataBaseFactory.getInstance( IntranetProperties.DATABASE_TYPE );
         
         String sql = "DELETE " + 
		 			"FROM intranet_users " + 
         			"WHERE id_user = " + idUser;
     
         dataBase.db_query(sql, false, null);
         
         dataBase.close( );
         dataBase = null;
     }
     
     public Vector getGroups( String searhKey ) throws Exception{
         DataBase dataBase = DataBaseFactory.getInstance( IntranetProperties.DATABASE_TYPE );
         
         String sql = "" + 
		 	"SELECT id_group, name " + 
			"FROM groups " +
			"WHERE (id_site = " + site.getIdSite( ) + " OR id_site IS NULL) ";
     
         if ( searhKey != null ) 
             sql += "AND LOWER(name) LIKE '%" + searhKey.toLowerCase( ) + "%' ";
     
         sql += "ORDER BY name";
     
         Vector groups = new Vector( );
         dataBase.db_query(sql, false, null); 
         Hashtable row;
         
         while((row = dataBase.db_fetch_array( )) != null) 
             groups.addElement(row);
     
         dataBase.close( );
         dataBase = null;
		
		return groups;
     }
      
     public void delGroup(int idGroup) throws Exception{
         DataBase dataBase = DataBaseFactory.getInstance( IntranetProperties.DATABASE_TYPE );
         
         String sql = "" + 
		 	"DELETE " + 
			"FROM groups " + 
			"WHERE id_group = " + idGroup;

         dataBase.db_query(sql, false, null);
         
         dataBase.close( );
         dataBase = null;
     }
     
     

     public Vector getTemplates ( String searhKey ) throws Exception	{
		Vector templates = new Vector( );
		Hashtable row;
		DataBase dataBase = DataBaseFactory.getInstance( IntranetProperties.DATABASE_TYPE );
         
		String sql = "SELECT id_template, name " + 
					"FROM template " +
					"WHERE (id_site = " + site.getIdSite( ) + " OR id_site IS NULL) ";
		 
		if ( searhKey != null ) 
			sql += "AND LOWER(name) LIKE '%" + searhKey + "%' ";
		
		sql += "ORDER BY name";
		 
		dataBase.db_query(sql, false, null); 
		     
		while ( (row = dataBase.db_fetch_array( )) != null ) 
			templates.addElement(row);
		 
		dataBase.close( );
		dataBase = null;
		     
		return templates;
	}
      
     public void delTemplate ( int idTemplate ) throws Exception	{
         DataBase dataBase = DataBaseFactory.getInstance( IntranetProperties.DATABASE_TYPE );
         
         String sql = "DELETE " + 
     				"FROM template " + 
     				"WHERE id_template = " + idTemplate;

         dataBase.db_query(sql, false, null);
         
         dataBase.close( );
         dataBase = null;
     }
     
    public Tree getUserFileTree(boolean adminMode) throws Exception{ 
        return this.fileManager.getUserFileTree(site.getIdSite( ), adminMode); 
    }
      
    public Tree getFileTree(boolean adminMode) throws Exception{ 
        return this.fileManager.getFileTree(site.getIdSite( ), adminMode); 
    }
      
    public Vector getFileTypes( ) throws Exception{
        DataBase dataBase = DataBaseFactory.getInstance( IntranetProperties.DATABASE_TYPE );
        
    	String sql = "SELECT * " + 
    					"FROM file_types "; 
    	sql += "ORDER BY name";
      
    	Vector fileTypes = new Vector( );
    	dataBase.db_query(sql, false, null);
    	Hashtable row;
    	
    	while((row = dataBase.db_fetch_array( )) != null) 
    	    fileTypes.addElement(row);
      
    	dataBase.close( );
    	dataBase = null;
    	
    	return fileTypes; 
   }
    
   public void setActualFolder(int folderId){
       this.fileManager.setActualFolder(folderId); 
   }
      
   public int getActualFolder( ){ 
       return this.fileManager.getActualFolder( ); 
   }
      
	public int addNewFile ( String newFileName, String newFileType ) throws Exception	{
		return addNewFile ( newFileName, newFileType, site.getIdSite( ) ); 
	} 
   
	public int addNewFile ( String newFileName, String newFileType, int idSite ) throws Exception	{
		return this.fileManager.addFile( newFileName, newFileType, idSite ); 
	} 
   
   public int addFolderToRoot(String fileName) throws Exception{
       return fileManager.addFolderToRoot(fileName, site.getIdSite( ));
   }
     
    public void sendToTrash(int idFile) throws Exception{ 
        this.fileManager.sendToTrash(idFile); 
    }
      
    public void restoreFile(int idFile) throws Exception{ 
        this.fileManager.restoreFile(idFile); 
    }
     
    public void deleteFile(int idFile) throws Exception{ 
        this.fileManager.deleteFile(idFile); 
    }
    
    public String getViewTrashContent(int viewType) throws Exception{ 
        return this.fileManager.getTrashContent(site.getIdSite( )); 
    }
    
    public String getViewUserFolderContent(int viewType, boolean adminMode) throws Exception{ 
        return this.fileManager.getUserFolderContentFormat(viewType, site.getIdSite( ), adminMode); 
    }
      
    public String getViewFolderContent(int viewType, boolean adminMode) throws Exception{ 
        return this.fileManager.getFolderContentFormat(viewType, site.getIdSite( ), adminMode); 
    }
      
    public Vector getDefaultApplications( ) throws Exception{
        DataBase dataBase = DataBaseFactory.getInstance( IntranetProperties.DATABASE_TYPE );
        
        String sql = "SELECT applications.name, applications.action, file_type_applications.type_name " + 
        				"FROM applications, file_type_applications " + 
        				"WHERE applications.name = file_type_applications.application_name AND applications.is_default = 1";
     
        Vector applications = new Vector( );
     
        dataBase.db_query(sql, false, null); 
        Hashtable row;
        
        while((row = dataBase.db_fetch_array( )) != null) 
            applications.addElement(row);
     
        dataBase.close( );
        dataBase = null;
        
        return applications; 
    }
     
    public Hashtable getFileAttributes(int idFile) throws Exception{ 
        return this.fileManager.getFileAttributes(idFile); 
    }
    
    public void moveFile(int idFile, int idFolder) throws Exception{
        if(sessionUser.userCanWrite(idFile))
            fileManager.moveFile(idFile, idFolder);
        else
            throw new Exception("El usuario no tiene permisos para mover el archivo!");
    }
    
    public Vector searchFiles(String pattern, int startIndex, int numRows, boolean adminMode) throws Exception{
        return fileManager.searchFiles(pattern, startIndex, numRows, site.getIdSite( ), adminMode);
    }
    
	
	/**
	 * NELSON
	 * Esta funcion debe buscar en los contenidos de todos los tipos visibles
	 * Retorna un vector de Hashtables con id, titulo y contenido del file
	**/
	
	public Vector searchFilesContent ( String pattern, Vector fileTypeFilter, Vector fileTypeExclude ) throws Exception	{
        DataBase dataBase = DataBaseFactory.getInstance( IntranetProperties.DATABASE_TYPE );
		Vector files = new Vector( );
		
		Vector folderTypeFilter = new Vector( );
		folderTypeFilter.addElement( "Carpeta" );
		String tmp = new String( );
		int idUser = ( this.sessionUser != null ? this.sessionUser.getIdUser( ) : 0 );

		Vector folders = (new Folder ( )).getFilesPrivilegesRecursive( idUser, folderTypeFilter, dataBase, 1, false);

		pattern = "%" + pattern.replaceAll( " ", "%" ).replaceAll( "'", "\'" ).toLowerCase( ) + "%";
		
		for ( int c = 0; c < folders.size( ); c++ )	{
			if ( c > 0 )
				tmp += ", ";
			tmp += ((Hashtable)folders.elementAt( c )).get( "ID_FILE" );
		}
			
		String sql = "" + 
				"SELECT result.id_file, result.file_type, result.name, result.intro, result.content, result.keywords " + 
				"FROM ( " + 
				" " + 
				"	SELECT files.id_file, files.file_type, files.name, ' ' as intro, ' ' as content, ' ' as keywords " + 
				"	WHERE files.id_file IN ( " + 
				"		SELECT distinct(files.id_file) " + 
				"		FROM files, external_files, file_properties " + 
				"		WHERE files.trash IS NULL " + 
				"		AND files.parent_file IN ( " + tmp + " ) " + 
				"		AND files.id_file = external_files.id_file " + 
				"		AND files.reference_file = file_properties.id_external_file " + 
				"		AND ( " + 
				"			lower(files.name) LIKE '%" + pattern.toLowerCase ( ) + "%' " + 
				"			OR lower(file_properties.value) LIKE '%" + pattern.toLowerCase ( ) + "%' " + 
				"		) " + 
				"		AND ( " +
				"			files.id_site = " + getSite( ).getIdSite ( ) + " " +
				"			OR files.id_file IN ( " +
				"				SELECT files.id_file " +
				"				FROM file_share, files " +
				"				WHERE file_share.id_file = files.id_file " +
				"				AND file_share.id_site = " + getSite( ).getIdSite ( ) + " " +
				"			) " +
				"		) " +
				"		AND files.id_file NOT IN ( " + 
				"			SELECT file_privileges.id_file " + 
				"			FROM file_privileges, groups, user_groups " + 
				"			WHERE file_privileges.id_group = groups.id_group " + 
				"			AND groups.id_group = user_groups.id_group " + 
				"			AND user_groups.id_user = 0 " + 
				"			AND file_privileges.hidden IS NOT NULL " + 
				"			GROUP BY file_privileges.id_file " + 
				"		) " + 
				"	) " + 
				"	 " + 
				"	UNION " + 
				"	 " + 
				"	SELECT files.id_file, files.file_type, files.name, documents.short_content as intro, documents.full_content as content, documents.author as keywords " + 
				"	FROM files, documents " + 
				"	WHERE files.id_file = documents.id_file " + 
				"	AND files.parent_file IN ( " + tmp + " ) " + 
				"	AND files.trash IS NULL " + 
				"	AND ( " + 
				"		lower(documents.author) LIKE '%" + pattern.toLowerCase ( ) + "%' " + 
				"		OR lower(files.name) LIKE '%" + pattern.toLowerCase ( ) + "%' " + 
				"		OR lower(documents.short_content) LIKE '%" + pattern.toLowerCase ( ) + "%' " + 
				"		OR lower(documents.full_content) LIKE '%" + pattern.toLowerCase ( ) + "%' " + 
				"	) " + 
				"	AND ( " +
				"		files.id_site = " + getSite( ).getIdSite ( ) + " " +
				"		OR files.id_file IN ( " +
				"			SELECT files.id_file " +
				"			FROM file_share, files " +
				"			WHERE file_share.id_file = files.id_file " +
				"			AND file_share.id_site = " + getSite( ).getIdSite ( ) + " " +
				"		) " +
				"	) " +
				"	AND files.id_file NOT IN ( " + 
				"		SELECT file_privileges.id_file " + 
				"		FROM file_privileges, groups, user_groups " + 
				"		WHERE file_privileges.id_group = groups.id_group " + 
				"		AND groups.id_group = user_groups.id_group " + 
				"		AND user_groups.id_user = 0 " + 
				"		AND file_privileges.hidden IS NOT NULL " + 
				"		GROUP BY file_privileges.id_file " + 
				"	) " + 
				"	GROUP BY files.id_file, files.file_type, files.name, intro, content, keywords " + 
				"	 " + 
				"	UNION " + 
				"	 " + 
				"	SELECT files.id_file, files.file_type, files.name, distributors.nit as intro, ' ' as content, distributors.url as keywords " + 
				"	FROM files, distributors " + 
				"	WHERE files.id_file = distributors.id_file " + 
				"	AND files.parent_file IN ( " + tmp + " ) " + 
				"	AND files.trash IS NULL " + 
				"	AND ( " + 
				"		lower(distributors.nit) LIKE '%" + pattern.toLowerCase ( ) + "%' " + 
				"		OR lower(files.name) LIKE '%" + pattern.toLowerCase ( ) + "%' " + 
				"		OR lower(distributors.url) LIKE '%" + pattern.toLowerCase ( ) + "%' " + 
				"	) " + 
				"	AND ( " +
				"		files.id_site = " + getSite( ).getIdSite ( ) + " " +
				"		OR files.id_file IN ( " +
				"			SELECT files.id_file " +
				"			FROM file_share, files " +
				"			WHERE file_share.id_file = files.id_file " +
				"			AND file_share.id_site = " + getSite( ).getIdSite ( ) + " " +
				"		) " +
				"	) " +
				"	AND files.id_file NOT IN ( " + 
				"		SELECT file_privileges.id_file " + 
				"		FROM file_privileges, groups, user_groups " + 
				"		WHERE file_privileges.id_group = groups.id_group " + 
				"		AND groups.id_group = user_groups.id_group " + 
				"		AND user_groups.id_user = 0 " + 
				"		AND file_privileges.hidden IS NOT NULL " + 
				"		GROUP BY file_privileges.id_file " + 
				"	) " + 
				"	GROUP BY files.id_file, files.file_type, files.name, intro, content, keywords " + 
				"	 " + 
				"	UNION " + 
				"	 " + 
				"    SELECT files.id_file, files.file_type, files.name, faqs.question as intro, faqs.answer as content, faqs.keywords as keywords " + 
				"    FROM files, faqs " + 
				"    WHERE files.id_file = faqs.id_file " + 
				"    AND files.parent_file IN ( " + tmp + " ) " + 
				"    AND files.trash IS NULL " + 
				"    AND ( " + 
				"         lower(faqs.question) LIKE '%" + pattern.toLowerCase ( ) + "%' " + 
				"         OR lower(files.name) LIKE '%" + pattern.toLowerCase ( ) + "%' " + 
				"         OR lower(faqs.intro) LIKE '%" + pattern.toLowerCase ( ) + "%' " + 
				"         OR lower(faqs.keywords) LIKE '%" + pattern.toLowerCase ( ) + "%' " + 
				"         OR lower(faqs.answer) LIKE '%" + pattern.toLowerCase ( ) + "%' " + 
				"     ) " + 
				"		AND ( " +
				"			files.id_site = " + getSite( ).getIdSite ( ) + " " +
				"			OR files.id_file IN ( " +
				"				SELECT files.id_file " +
				"				FROM file_share, files " +
				"				WHERE file_share.id_file = files.id_file " +
				"				AND file_share.id_site = " + getSite( ).getIdSite ( ) + " " +
				"			) " +
				"		) " +
				"     AND files.id_file NOT IN ( " + 
				"         SELECT file_privileges.id_file " + 
				"         FROM file_privileges, groups, user_groups " + 
				"         WHERE file_privileges.id_group = groups.id_group " + 
				"         AND groups.id_group = user_groups.id_group " + 
				"         AND user_groups.id_user = 0 " + 
				"         AND file_privileges.hidden IS NOT NULL " + 
				"         GROUP BY file_privileges.id_file " + 
				"     ) " + 
				"     GROUP BY files.id_file, files.file_type, files.name, faqs.question, content, keywords " + 
				") as result " + 
				"WHERE true ";

			if ( fileTypeFilter != null && fileTypeFilter.size( ) > 0 )	{
		        String fileTypes = "";
		        for ( int c = 0; c < fileTypeFilter.size( ); c ++ )	{
		            fileTypes += "'" + fileTypeFilter.elementAt( c ) + "'";
		            if ( c < fileTypeFilter.size( ) - 1 )
		                fileTypes += ", ";
		        }
		        
		        sql += "AND result.file_type IN ( " + fileTypes + " ) ";
		    }

			if ( fileTypeExclude != null && fileTypeExclude.size( ) > 0 )	{
		        String fileTypes = "";
		        for ( int c = 0; c < fileTypeExclude.size( ); c ++ )	{
		            fileTypes += "'" + fileTypeExclude.elementAt( c ) + "'";
		            if ( c < fileTypeExclude.size( ) - 1 )
		                fileTypes += ", ";
		        }
		        
		        sql += "AND result.file_type NOT IN ( " + fileTypes + " ) ";
		    }
			
			sql += "GROUP BY result.id_file, result.file_type, result.name, result.intro, result.content, result.keywords ";

			dataBase.db_query( sql, false, null );
			Hashtable row;
			
			while ( ( row = dataBase.db_fetch_array( ) ) != null )	{
				files.addElement( row );
			}
			return files;
	}
	
    public void createError(String section, String error) throws Exception{
        DataBase dataBase = DataBaseFactory.getInstance( IntranetProperties.DATABASE_TYPE );
        
        String sql = "INSERT INTO intra_errors " +
        			"(user_name, section, error_date, description) " +
        			"VALUES " +
        			"('" + this.getFullUserName( ) + "', '" + section + "', NOW( ), '" + error + "')";
        
        dataBase.db_query(sql, false, null);
        
        dataBase.close( );
        dataBase = null;
    }
    
    public void registerUserSurvey(int idSurvey) throws Exception{
        DataBase dataBase = DataBaseFactory.getInstance( IntranetProperties.DATABASE_TYPE );
        
        String sql = "INSERT " +
        				"INTO poll_answered " +
        				"(id_user, id_poll) " +
        				"VALUES " +
        				"(" + this.sessionUser.getIdUser( ) + ", " + idSurvey + ")";
        
        dataBase.db_query(sql, false, null);
        
        dataBase.close( );
        dataBase = null;
    }
    
    public boolean isUserSurveyAnswered(int idSurvey) throws Exception{
        DataBase dataBase = DataBaseFactory.getInstance( IntranetProperties.DATABASE_TYPE );
        
        String sql = "SELECT id_user " +
						"FROM poll_answered " +
						"WHERE id_user = " + this.sessionUser.getIdUser( ) + " AND id_poll = " + idSurvey;
		        
        dataBase.db_query(sql, false, null);
        Hashtable row = dataBase.db_fetch_array( );
        
        dataBase.close( );
        dataBase = null;
        
        return (row != null)? true : false;
    }
    
    public Vector getCountries(Vector notInclude) throws Exception{
        DataBase dataBase = DataBaseFactory.getInstance( IntranetProperties.DATABASE_TYPE );
        
        String sql = "SELECT id_country, name " + 
        				"FROM countries ";
        
        if(notInclude != null)
            sql += "WHERE id_country NOT IN (" + notInclude.toString( ) + ")";
     
        Vector countries = new Vector( );
     
        dataBase.db_query(sql, false, null); 
        Hashtable row;
        
        while((row = dataBase.db_fetch_array( )) != null) 
            countries.addElement(row);
     
        dataBase.close( );
        dataBase = null;
        
        return countries;
        
    }
    
    public Vector getDepartments(Vector notInclude, boolean useLocation) throws Exception{
        DataBase dataBase = DataBaseFactory.getInstance( IntranetProperties.DATABASE_TYPE );
        
        String sql = "SELECT d.id_department, d.name ";
        
        if(useLocation)
            sql += ", c.name AS country_name ";
        
        sql += "FROM departments d ";
        
        if(useLocation)
            sql += ", countries c ";
        
        if(notInclude != null)
            sql += "WHERE d.id_department NOT IN (" + notInclude.toString( ) + ")";
        
        if(useLocation)
            sql += " AND d.id_country = c.id_country";
     
        Vector departments = new Vector( );
     
        dataBase.db_query(sql, false, null); 
        Hashtable row;
        
        while((row = dataBase.db_fetch_array( )) != null) 
            departments.addElement(row);
     
        dataBase.close( );
        dataBase = null;
        
        return departments;
    }
    
    public Vector getCities(Vector notInclude, boolean useLocation) throws Exception{
        DataBase dataBase = DataBaseFactory.getInstance( IntranetProperties.DATABASE_TYPE );
        
        String sql = "SELECT cy.id_city, cy.name ";
        
        if(useLocation)
            sql += ", d.name AS dept_name, c.name AS country_name ";
        
        sql += "FROM cities cy ";
        
        if(useLocation)
            sql += ", departments d, countries c ";
        
        sql += "WHERE true ";
        
        if(notInclude != null)
            sql += " AND cy.id_city NOT IN (" + notInclude.toString( ) + ")";
        
        if(useLocation)
            sql += " AND cy.id_department = d.id_department AND d.id_country = c.id_country";
        
        sql += " ORDER BY ";
        
        if(useLocation)
            sql += " c.name ASC, d.name ASC, ";
        
        sql += " cy.name ASC";
     
        Vector departments = new Vector( );
     
        dataBase.db_query(sql, false, null); 
        Hashtable row;
        
        while((row = dataBase.db_fetch_array( )) != null) 
            departments.addElement(row);
     
        dataBase.close( );
        dataBase = null;
        
        return departments;
    }
    
    public Vector getMenuGroups(int idMenu) throws Exception{
        DataBase dataBase = DataBaseFactory.getInstance( IntranetProperties.DATABASE_TYPE );
        
        String sql = "SELECT mp.id_group " + 
        				"FROM menu_privileges mp " +
        				"WHERE mp.id_menu = " + idMenu;
        
        Vector groups = new Vector( );
        dataBase.db_query(sql, false, null); 
        Hashtable row;
        
        while((row = dataBase.db_fetch_array( )) != null) 
            groups.addElement(row.get("ID_GROUP").toString( ));
     
        dataBase.close( );
        dataBase = null;
        
        return groups;
    }
    
    public void changeMenuPrivileges(int idMenu, Vector groups) throws Exception{
        DataBase dataBase = DataBaseFactory.getInstance( IntranetProperties.DATABASE_TYPE );
        dataBase.initTransaction( );
        
        String sql = "DELETE FROM menu_privileges WHERE id_menu = " + idMenu;
        dataBase.db_query(sql, false, null);
        
        for ( int i = 0; i < groups.size( ); i++){
            sql = "INSERT INTO " +
            		"menu_privileges " +
            		"(id_menu, id_group) " +
            		"VALUES " +
            		"(" + idMenu + ", " + groups.get(i) + ")";
            
            dataBase.db_query(sql, false, null);
        }
     
        dataBase.db_commit( );
        dataBase.endTransaction( );
        dataBase.close( );
        dataBase = null;
    }
    
    public Tree getFullAppMenu( ) throws Exception{
        
        DataBase dataBase = DataBaseFactory.getInstance( IntranetProperties.DATABASE_TYPE );
        
        String sql = "" + 
			"SELECT m.id_menu, m.name, m._function, m.parent_menu, m._position " + 
			"FROM menus m " + 
			"ORDER BY m.parent_menu, m._position ";
       
        Tree fullMenu = new Tree( );
        Vector menus = new Vector( );
        dataBase.db_query(sql, false, null); 
        Hashtable row;
        
        while((row = dataBase.db_fetch_array( )) != null) 
            menus.addElement(row);
     
        dataBase.close( );
        dataBase = null;
        
	    int parentMenuId;
	    Node root = new Node( );
	    
		for ( int c = 0; c < menus.size( ); c++){
		    row = (Hashtable)menus.get(c);
		    parentMenuId = (row.get("PARENT_MENU") != null)? Integer.parseInt(row.get("PARENT_MENU").toString( )) : 0;
		    
			if(parentMenuId == 0){
			    
				Node node = new Node( );
				node.setId( Integer.parseInt(row.get("ID_MENU").toString( )) );
				node.setName( row.get("NAME").toString( ) );
				node.setUrl( row.get("_FUNCTION").toString( ) );
				node.setTarget( (row.get("_POSITION") != null)? row.get("_POSITION").toString( ) : "" );
				node.setBaseUrl( IntranetProperties.INTRA_BASE_URL );
				node.setImage( "cms/images/types/folder.gif" );
				node.setChilds( searchChildMenusFrom(-1, node, menus) );
				root.addChild( node );
			}
		}
		
		fullMenu.setRoot(root);
		return fullMenu;
    }
    
    public Node loadMenu(int idMenu) throws Exception{
        DataBase dataBase = DataBaseFactory.getInstance( IntranetProperties.DATABASE_TYPE );
        Node node = null;
        
        String sql = "SELECT id_menu, name, _function, _position, parent_menu " +
        				"FROM menus " +
        				"WHERE id_menu = " + idMenu;
        
        dataBase.db_query(sql, false, null);
        Hashtable row = dataBase.db_fetch_array( );
        
        if(row != null){
            node = new Node( );
            node.setId( Integer.parseInt(row.get("ID_MENU").toString( )) );
			node.setName( row.get("NAME").toString( ) );
			node.setUrl( row.get("_FUNCTION").toString( ) );
			node.setTarget( (row.get("_POSITION") != null)? row.get("_POSITION").toString( ) : "" );
			node.setObject( (row.get("PARENT_MENU") != null)? row.get("PARENT_MENU").toString( ) : null);
        }
        
        dataBase.close( );
        dataBase = null;
        
        return node;
    }
    
    public int storeMenu(Node node) throws Exception{
        DataBase dataBase = DataBaseFactory.getInstance( IntranetProperties.DATABASE_TYPE );
        String sql = "";
        
        if(node.getId( ) != 0){
	        sql = "UPDATE menus " +
    				"SET " +
    				"name = '" + node.getName( ) + "', " +
    				"_function = '" + node.getUrl( ) + "', " + 
    				"_position = '" + node.getTarget( ) + "', " +
    				"parent_menu = " + (node.getObject( ) != null? "'" + node.getObject( ) + "'": "NULL") + " " +
    				"WHERE id_menu = " + node.getId( );
	        
	        dataBase.db_query(sql, false, null);
        }else{
            sql = "INSERT INTO menus " +
            		"( name, _function, _position, parent_menu)" + 
            		"VALUES" +
            		"( '" + node.getName( ) + "', '" + node.getUrl( ) + "', '" + node.getTarget( ) + "', " + (node.getObject( ) != null? "'" + node.getObject( ) + "'": "NULL") + ")";
            
            Object key = dataBase.db_query(sql, false, "menu_seq");
            node.setId( Integer.parseInt( key.toString( ) ) );            
        }

        dataBase.close( );
        dataBase = null;
        
        return node.getId( );
    }
    
    public void deleteMenu(int idMenu) throws Exception{
        DataBase dataBase = DataBaseFactory.getInstance( IntranetProperties.DATABASE_TYPE );
        
        String sql = "DELETE FROM menus WHERE id_menu = " + idMenu;
        dataBase.db_query(sql, false, null);
        
        dataBase.close( );
        dataBase = null;
    }
    
    private void loadMenus( ) throws Exception{
        if(menu != null)
            return;
        
        DataBase dataBase = DataBaseFactory.getInstance( IntranetProperties.DATABASE_TYPE );
        Vector groups = sessionUser.getGroupsId( );
        String groupString = "";
        String sql = "";
        menu = new Tree( );
        Vector menus = new Vector( );
        Hashtable row;
        
        if (groups.size() > 0) {
	        for ( int i = 0; i < groups.size( ); i++)
	            groupString += groups.get(i) + (i < groups.size( ) - 1? ", " : "");
	            
	        sql = "" + 
				"SELECT m.id_menu, m.name, m._function, m.parent_menu, m._position " + 
				"FROM menus as m, menu_privileges as mp " + 
				"WHERE mp.id_group IN ( " + groupString + " ) " + 
				"AND mp.id_menu = m.id_menu " +
				"GROUP BY m.id_menu, m.parent_menu, m._position, m.name, m._function " + 
				"ORDER BY m.parent_menu, m._position ";
	        
	        dataBase.db_query(sql, false, null); 
	        
	        while((row = dataBase.db_fetch_array( )) != null) 
	            menus.addElement(row);
	     
	        dataBase.close( );
	        dataBase = null;
        }
       
	    int parentMenuId;
	    Node root = new Node( );
	    
		for ( int c = 0; c < menus.size( ); c++){
		    row = (Hashtable)menus.get(c);
		    parentMenuId = (row.get("PARENT_MENU") != null)? Integer.parseInt(row.get("PARENT_MENU").toString( )) : 0;
		    
			if(parentMenuId == 0){
			    
				Node node = new Node( );
				node.setId( Integer.parseInt(row.get("ID_MENU").toString( )) );
				node.setName( row.get("NAME").toString( ) );
				node.setUrl( row.get("_FUNCTION").toString( ) );
				node.setTarget( (row.get("_POSITION") != null)? row.get("_POSITION").toString( ) : "" );
				node.setChilds( searchChildMenusFrom(-1, node, menus) );
				root.addChild( node );
			}
		}
		
		menu.setRoot(root);
    }
    
    public static Vector searchChildMenusFrom(int index, Node parent, Vector nodeArray){
	    Hashtable row;
	    int parentMenuId;
	    Vector childs = new Vector( );
	    
		for (int c = index + 1; c < nodeArray.size( ); c++){
		    row = (Hashtable)nodeArray.get(c);
		    parentMenuId = (row.get("PARENT_MENU") != null)? Integer.parseInt(row.get("PARENT_MENU").toString( )) : 0;
		    
			if (parent.getId( ) == parentMenuId){
				Node node = new Node( );
				node.setId( Integer.parseInt(row.get("ID_MENU").toString( )) );
				node.setName( row.get("NAME").toString( ) );
				node.setUrl( row.get("_FUNCTION").toString( ) );
				node.setTarget( (row.get("_POSITION") != null)? row.get("_POSITION").toString( ) : "" );
				node.setBaseUrl( IntranetProperties.INTRA_BASE_URL );
				node.setImage( "cms/images/types/folder.gif" );
				node.setChilds( searchChildMenusFrom(-1, node, nodeArray) );
				childs.addElement( node );
			}
		}
		
		return childs;
	}
    
/********** NELSON: UBICACIONES - START *************/
    
    public Tree getFullAppUbication( ) throws Exception{
        
        DataBase dataBase = DataBaseFactory.getInstance( IntranetProperties.DATABASE_TYPE );
        
        String sql = "" + 
			"SELECT id_ubication, name, code, parent, description " + 
			"FROM ubication " + 
			"ORDER BY parent, name ";
       
        Tree fullUbication = new Tree( );
        Vector ubications = new Vector( );
        dataBase.db_query( sql, false, null ); 
        Hashtable row;
        
        while ( ( row = dataBase.db_fetch_array( ) ) != null ) 
            ubications.addElement( row );
     
        dataBase.close( );
        dataBase = null;
        
	    int parentUbicationId;
	    Node root = new Node( );
	    
		for ( int c = 0; c < ubications.size( ); c ++ )	{
		    row = (Hashtable)ubications.get( c );
		    parentUbicationId = ( row.get( "PARENT" ) != null )? Integer.parseInt( row.get( "PARENT" ).toString( ) ) : 0;
		    
			if ( parentUbicationId == 0 )	{
			    
				Node node = new Node( );
				node.setId( Integer.parseInt( row.get( "ID_UBICATION" ).toString( ) ) );
				node.setName( row.get( "NAME" ).toString( ) );
				node.setUrl( row.get( "NAME" ).toString( ) );
				node.setTarget( ( row.get("CODE") != null ) ? row.get( "CODE" ).toString( ) : "" );
				node.setBaseUrl( IntranetProperties.INTRA_BASE_URL );
				node.setImage( "cms/images/types/folder.gif" );
				node.setChilds( searchChildUbicationsFrom( -1, node, ubications ) );
				root.addChild( node );
			}
		}
		
		fullUbication.setRoot( root );
		return fullUbication;
    }
    
    public Node loadUbication ( int idUbication ) throws Exception	{
        DataBase dataBase = DataBaseFactory.getInstance( IntranetProperties.DATABASE_TYPE );
        Node node = null;
        
        String sql = "" + 
			"SELECT id_ubication, name, code, parent, description, DANEcode, code1, code2, potencial_marcket " + 
			" FROM ubication " + 
        	"WHERE id_ubication = " + idUbication;

        dataBase.db_query( sql, false, null );
        Hashtable row = dataBase.db_fetch_array( );
        
        if ( row != null )	{
            node = new Node( );
            node.setId( Integer.parseInt( row.get( "ID_UBICATION" ).toString( ) ) );
			node.setName( row.get( "NAME" ).toString( ) );
			node.setUrl( ( row.get( "DESCRIPTION" ) != null ) ? row.get( "DESCRIPTION" ).toString( ) : "" );
			node.setTarget( ( row.get( "CODE" ) != null ) ? row.get( "CODE" ).toString( ) : "" );
			node.setImage( ( row.get( "DANECODE" ) != null ) ? row.get( "DANECODE" ).toString( ) : "" );
			node.setColor( ( row.get( "CODE1" ) != null ) ? row.get( "CODE1" ).toString( ) : "" );
			node.setStyle( ( row.get( "CODE2" ) != null ) ? row.get( "CODE2" ).toString( ) : "" );
			node.setObject( ( row.get( "PARENT" ) != null)? row.get( "PARENT" ).toString( ) : null );
			node.setShared( ( row.get( "POTENCIAL_MARCKET" ).toString().equals("1") )? true : false );
			//potencial_marcket es creado para saber si es o no un mercado potencial. cuando se tiene un 0 quiere decir que no es potencial.
        }
        
        dataBase.close( );
        dataBase = null;
        
        return node;
    }
    
    public int storeUbication ( Node node ) throws Exception	{
        DataBase dataBase = DataBaseFactory.getInstance( IntranetProperties.DATABASE_TYPE );
        String sql = "";
        
        if ( node.getId( ) != 0 )	{
	        sql = "" + 
				"UPDATE ubication " +
				"SET " +
				"name = '" + node.getName( ) + "', " +
				"description = '" + node.getUrl( ) + "', " + 
				"code = '" + node.getTarget( ) + "', " +
				"DANEcode = '" + node.getImage( ) + "', " +
				"code1 = '" + node.getColor( ) + "', " +
				"code2 = '" + node.getStyle( ) + "', " +
				"potencial_marcket = " + (node.isShared( )? 1 : 0) + ", " +
				"parent = " + ( node.getObject( ) != null ? "'" + node.getObject( ) + "'": "NULL") + " " +
				"WHERE id_ubication = " + node.getId( );
	        dataBase.db_query( sql, false, null );
        }
		else	{
            sql = "" + 
				"INSERT INTO ubication " +
				"( name, description, code, parent, DANEcode, code1, code2, potencial_marcket ) " + 
				"VALUES " +
				"( '" + node.getName( ) + "', '" + node.getUrl( ) + "', '" + node.getTarget( ) + "', " + ( node.getObject( ) != null ? "'" + node.getObject( ) + "'": "NULL" ) + ", '" + node.getImage( ) + "', '" + node.getColor( ) + "', '" + node.getStyle( ) + "', "  + (node.isShared( ) ? 1 : 0 )+ " )";
            
            Object key = dataBase.db_query( sql, false, "ubication_seq" );
            node.setId( Integer.parseInt( key.toString( ) ) );
        }

        dataBase.close( );
        dataBase = null;
        
        return node.getId( );
    }
    
    public void deleteUbication( int idUbication ) throws Exception	{
        DataBase dataBase = DataBaseFactory.getInstance( IntranetProperties.DATABASE_TYPE );
        
        String sql = "DELETE FROM ubication WHERE id_ubication = " + idUbication;
        dataBase.db_query( sql, false, null );
        
        dataBase.close( );
        dataBase = null;
    }

    public static Vector searchChildUbicationsFrom(int index, Node parent, Vector nodeArray){
	    Hashtable row;
	    int parentUbicationId;
	    Vector childs = new Vector( );
	    
		for (int c = index + 1; c < nodeArray.size( ); c++){
		    row = (Hashtable)nodeArray.get(c);
		    parentUbicationId = ( row.get("PARENT") != null ) ? Integer.parseInt( row.get( "PARENT" ).toString( ) ) : 0;
		    
			if ( parent.getId( ) == parentUbicationId ) {
				Node node = new Node( );
				node.setId( Integer.parseInt( row.get( "ID_UBICATION" ).toString( ) ) );
				node.setName( row.get( "NAME" ).toString( ) );
				node.setUrl( row.get( "NAME" ).toString( ) );
				node.setTarget( ( row.get("CODE") != null ) ? row.get( "CODE" ).toString( ) : "" );
				node.setBaseUrl( IntranetProperties.INTRA_BASE_URL );
				node.setImage( "cms/images/types/folder.gif" );
				node.setChilds( searchChildUbicationsFrom( -1, node, nodeArray ) );
				childs.addElement( node );
			}
		}
		
		return childs;
	}
    
/********** NELSON: UBICACIONES - END *************/

    public Vector getOrderStates( ) throws Exception{
        DataBase dataBase = DataBaseFactory.getInstance( IntranetProperties.DATABASE_TYPE );
        
        try{
	        String sql = "SELECT id_order_state, state " +
							"FROM order_states " +
							"ORDER BY state";
	        
	        dataBase.db_query(sql, false, null);
	        Hashtable row;
	        Vector states = new Vector( );
	        
	        while((row = dataBase.db_fetch_array( )) != null)
	            states.addElement(row);
	            
	        dataBase.close( );
	        dataBase = null;
	        
	        return states;
        }catch(Exception e){
            try{ dataBase.close( ); }catch(Exception exc){}
            dataBase = null;
            
            throw e;
        }
	}
    
/* DEPRECATED */
/* public int setUserFileObject(User user) */
    
    protected void finalize( ){
        try{
            sessionUser = null;
            fileManager = null;
            sitePages = null;
            menu = null;
        }catch(Exception e){
        }
    }
}
