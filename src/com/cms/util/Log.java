/*
 * Created on 8/10/2004
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.cms.util;


import java.util.Hashtable;
import java.util.Vector;

import com.cms.dao.DataBase;
import com.cms.dao.DataBaseFactory;
import com.cms.vsystem.File;
import com.cms.vsystem.FileManager;

/**
 * @author admin
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class Log {
    public static void print(String message){
        System.out.println(message);
    }

    public static void print(int idUser, String page, String section, String file, String actionPerformed, String actionDescription, int idSite) throws Exception{
       
return ;/*
	DataBase dataBase = null;//DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
        try{
         String sql = "INSERT INTO application_log " +
            				"( id_user, page, section, file, action_date, action_performed, action_description, id_site) " +
            				"VALUES " +
            				"('" + idUser + "', " + (page != null? page : "NULL" ) + ", " + (section != null? section : "NULL" ) + ", " + (file != null? file : "NULL" ) + ", NOW(), '" + actionPerformed + "', '" + actionDescription + "', " + idSite + ")";
            
            dataBase.db_query(sql, false, null);
            dataBase.close();
            dataBase = null;
        }catch(Exception e){
            try{ dataBase.close(); }catch(Exception e1){}
            dataBase = null;
        }finally{
            try{ dataBase.close(); }catch(Exception e1){}
            dataBase = null;
        }*/
    }
    
    public static void print(int idUser, String actionPerformed, String actionDescription) throws Exception{
        return ;/*
	DataBase dataBase = null;//DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
        try{
            String sql = "INSERT INTO admin_log " +
            				"( id_user, action_date, action_performed, action_description) " +
            				"VALUES " +
            				"('" + idUser + "', NOW(), '" + actionPerformed + "', '" + actionDescription + "')";
            
            dataBase.db_query(sql, false, null);
            dataBase.close();
            dataBase = null;
        }catch(Exception e){
            try{ dataBase.close(); }catch(Exception e1){}
            dataBase = null;
        }finally{
            try{ dataBase.close(); }catch(Exception e1){}
            dataBase = null;
        }*/
    }
    
    public static Vector getUserTraficRanking(String name ) throws Exception{
        
	DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
        try{
            String sql = "SELECT AVG(a.user_access) AS user_promedy, MAX(a.user_access) AS max_actions, a.id_user, INITCAP(b.first_name) AS first_name, INITCAP(b.last_name) AS last_name " +
            				"FROM ( " +	
				            	"SELECT TO_CHAR(action_date, 'YYYY-MM-DD') AS date_action, count(id_user) AS user_access, id_user " +
				            	"FROM application_log " +
				            	//"WHERE id_site = " + idSite + " " + 
				            	"GROUP BY date_action, id_user " + 
				            ") a, users b " +
				            "WHERE a.id_user = b.id_user ";
            
            if(name != null)
                sql		+=	"AND (b.first_name || ' ' || b.last_name) ~* '(" + name + ")' ";
            
			sql +=          "GROUP BY a.id_user, b.first_name, b.last_name " +
				            "ORDER BY user_promedy DESC";
            
            Vector userLog = new Vector();
            
            dataBase.db_query(sql, false, null);
			Hashtable row;
			
			while((row = dataBase.db_fetch_array()) != null)
			    userLog.addElement(row);
			
            dataBase.close();
            dataBase = null;
            
            return userLog;
        }catch(Exception e){
            try{ dataBase.close(); }catch(Exception e1){}
            dataBase = null;
            throw e;
        } 
    }
    
    public static Vector getTrafic(String startDate, String endDate) throws Exception{
        DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
        try{
            String sql = "SELECT TO_CHAR(action_date, 'YYYY-MM-DD') AS date_action, count(id_user) AS user_access " +
            				"FROM application_log " +
            				"WHERE action_date >= '" + startDate + "' AND action_date <= '" + endDate + " 23:59:59' AND page IS NOT NULL " +
            				"GROUP BY date_action, id_user " +
            				"ORDER BY date_action ASC";
            
            dataBase.db_query(sql, false, null);

            Hashtable row;
            Vector trafic = new Vector();
            String date = "";
            int totalAccess = 0;
            int totalUsers = 0;
            
            while((row = dataBase.db_fetch_array()) != null){
                
                if(!row.get("DATE_ACTION").toString().equals(date)){
                    if(!date.equals("")){
                        Hashtable totalTrafic = new Hashtable();
                        totalTrafic.put("DATE", date);
                        totalTrafic.put("TOTAL_USERS", String.valueOf(totalUsers));
                        totalTrafic.put("TOTAL_ACCESS", String.valueOf(totalAccess));
                        trafic.addElement(totalTrafic);
                        
                        totalUsers = totalAccess = 0;
                    }
                    
                    date = row.get("DATE_ACTION").toString();
                }
                
                totalAccess += Integer.parseInt(row.get("USER_ACCESS").toString());
                totalUsers++;
            }
            
            if(!date.equals("")){
                Hashtable totalTrafic = new Hashtable();
                totalTrafic.put("DATE", date);
                totalTrafic.put("TOTAL_USERS", String.valueOf(totalUsers));
                totalTrafic.put("TOTAL_ACCESS", String.valueOf(totalAccess));
                trafic.addElement(totalTrafic);
                
                totalUsers = totalAccess = 0;
            }
            
            dataBase.close();
            dataBase = null;
            
            return trafic;
        }catch(Exception e){
            try{ dataBase.close(); }catch(Exception e1){}
            dataBase = null;
            throw e;
        }
    }
    
    public static Vector getTopFileRate(int startIndex, int numRows ) throws Exception{
        DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
        try{
            String sql = "SELECT f.id_file, f.file_type, AVG(rate) AS rate " +
            				"FROM files f, file_rates fR  " +
            				"WHERE f.id_file = fR.id_file " +
            				"GROUP BY f.id_file, f.file_type " +
            				"ORDER BY rate DESC " + 
            				"LIMIT " + numRows + " OFFSET " + startIndex;
            
            dataBase.db_query(sql, false, null);
			Vector files = new Vector();
			Hashtable row;
			
			while((row = dataBase.db_fetch_array()) != null){
			    try{
			        File file = FileManager.createObject(row.get("FILE_TYPE").toString());
			        
					if(file != null){
						file.setIdFile(Integer.parseInt(row.get("ID_FILE").toString()));
						file.load();
						file.setFileType(row.get("FILE_TYPE").toString());
						
						Hashtable pack = new Hashtable();
						pack.put("file", file);
						pack.put("rate", (row.get("RATE") != null)? row.get("RATE") : "0");
						
						files.addElement(pack);
					}
					
			    }catch(Exception e){
			        Log.print(e.toString());
			    }
			}
            
            dataBase.close();
            dataBase = null;
            
            return files;
        }catch(Exception e){
            try{ dataBase.close(); }catch(Exception e1){}
            dataBase = null;
            throw e;
        }    
    }
    
    public static Vector getUserTops(int idUser) throws Exception{
        DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
        try{
            String sql = "SELECT count(appL.file) AS total_view, f.name, f.file_type " +
            				"FROM application_log appL, files f " +
            				"WHERE appL.id_user = " + idUser + " AND appL.file IS NOT NULL AND appL.file = f.id_file " +
            				"GROUP BY appL.file, f.name, f.file_type " +
            				"ORDER BY total_view DESC " +
            				"LIMIT 5 OFFSET 0";
            
            Vector userLog = new Vector();
            
            dataBase.db_query(sql, false, null);
			Vector top5Files = new Vector();
			Hashtable row;
			
			while((row = dataBase.db_fetch_array()) != null)
			    top5Files.addElement(row);
			
			sql = "SELECT count(appL.page) AS total_view, f.name AS section, p.name " +
					"FROM application_log appL LEFT JOIN files f ON f.id_file = appL.section, page p " +
					"WHERE appL.id_user = " + idUser + " AND appL.file IS NOT NULL AND appL.page = p.id_page " +
					"GROUP BY appL.file, f.name, p.name " +
					"ORDER BY total_view DESC " +
					"LIMIT 5 OFFSET 0";
			
			dataBase.db_query(sql, false, null);
			Vector top5Pages = new Vector();
			
			while((row = dataBase.db_fetch_array()) != null)
			    top5Pages.addElement(row);
			
			sql = "SELECT count(action_performed) AS total_actions, action_performed " +
					"FROM application_log " +
					"WHERE id_user = " + idUser + " " +
					"GROUP BY action_performed " +
					"ORDER BY total_actions DESC";
			
			dataBase.db_query(sql, false, null);
			Vector actions = new Vector();
			
			while((row = dataBase.db_fetch_array()) != null)
			    actions.addElement(row);
            
			userLog.addElement(top5Files);
			userLog.addElement(top5Pages);
			userLog.addElement(actions);
			
            dataBase.close();
            dataBase = null;
            
            return userLog;
        }catch(Exception e){
            try{ dataBase.close(); }catch(Exception e1){}
            dataBase = null;
            throw e;
        } 
    }
    
    public static Vector getUserStatics(int idUser,  String startDate, String endDate, int idSite) throws Exception{
        DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
        try{
            String sql = "SELECT TO_CHAR(action_date, 'YYYY-MM-DD') AS date, count(id_user) AS total_access " +
							"FROM application_log " +
							"WHERE action_date >= '" + startDate + "' AND action_date <= '" + endDate + " 23:59:59' AND page IS NOT NULL AND id_user = " + idUser + " AND id_site = " + idSite + " " +
							"GROUP BY date " +
							"ORDER BY date ASC";
            
            Vector userLog = new Vector();
            
            dataBase.db_query(sql, false, null);
			Hashtable row;
			
			while((row = dataBase.db_fetch_array()) != null)
			    userLog.addElement(row);
			
            dataBase.close();
            dataBase = null;
            
            return userLog;
        }catch(Exception e){
            try{ dataBase.close(); }catch(Exception e1){}
            dataBase = null;
            throw e;
        } 
    }
    
    public static Vector getUserActionDescription(int idUser, String actionPerformed, String date, int startIndex, int numRows) throws Exception{
        DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
        try{
            String sql = "SELECT TO_CHAR(appL.action_date, 'YYYY-MM-DD HH:MI') AS action_date, appL.action_description, p.name AS page, f.name AS section " +
							"FROM application_log appL LEFT JOIN page p ON appL.page = p.id_page LEFT JOIN files f ON appL.section = f.id_file " +
							"WHERE action_performed = '" + actionPerformed + "' AND appL.id_user = " + idUser + " ";
            
            if(date != null)
                sql += 		"AND action_date >= '" + date + " 0:0:0' AND action_date <= '" + date + " 23:59:59' AND page IS NOT NULL AND id_user = " + idUser + " ";
            
			sql +=			"ORDER BY action_date ASC " +
							"LIMIT " + numRows + " OFFSET " + startIndex;
            
            Vector userLog = new Vector();
            
            dataBase.db_query(sql, false, null);
			Hashtable row;
			
			while((row = dataBase.db_fetch_array()) != null)
			    userLog.addElement(row);
			
            dataBase.close();
            dataBase = null;
            
            return userLog;
        }catch(Exception e){
            try{ dataBase.close(); }catch(Exception e1){}
            dataBase = null;
            throw e;
        }
    }
    
    public static Vector getRegisteredUsers(String startDate, String endDate, int idSite) throws Exception{
        DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
        try{
            String sql = "SELECT TO_CHAR(inscription_date, 'YYYY-MM-DD') AS date, INITCAP(first_name)||' '||INITCAP(last_name) AS user_name, TO_CHAR(last_login, 'YYYY-MM-DD') AS last_login " +
							"FROM users " +
							"WHERE inscription_date >= '" + startDate + "' AND inscription_date <= '" + endDate + " 23:59:59' AND (id_site = " + idSite + " OR id_site IS NULL) " +
							"ORDER BY inscription_date DESC";
            
            Vector userLog = new Vector();
            
            dataBase.db_query(sql, false, null);
			Hashtable row;
			
			while((row = dataBase.db_fetch_array()) != null)
				    userLog.addElement(row);
				
            dataBase.close();
            dataBase = null;
            
            return userLog;
        }catch(Exception e){
            try{ dataBase.close(); }catch(Exception e1){}
            dataBase = null;
            throw e;
        } 
    }
	
	public static Vector getPedidos(String startDate, String endDate, int idSite) throws Exception{
		DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
        try{
            String sql = "SELECT f.id_file, TO_CHAR(f.creationdate, 'YYYY-MM-DD') AS date, INITCAP(u.first_name)||' '||INITCAP(u.last_name) AS user_name, f.file_type, mc.razon_social AS nombre " +
							"FROM files f, users u, plug_agr_users pu, agr_maestro_clientes mc " +
							"WHERE f.creationdate >= '" + startDate + " 00:00:00' AND f.creationdate <= '" + endDate + " 23:59:59' " +
							"AND f.file_type = 'Pedido' " + 
							"AND f.id_site = " + idSite + " " + 
							"AND f.owner = u.id_user " +
							"AND u.id_user = pu.id_user " + 
							"AND pu.agr_user = mc.codigo_cliente " +  
							"ORDER BY f.creationdate DESC, mc.razon_social";
            
            Vector userLog = new Vector();
            
            dataBase.db_query(sql, false, null);
			Hashtable row;
			
			while((row = dataBase.db_fetch_array()) != null)
			    userLog.addElement(row);
			
            dataBase.close();
            dataBase = null;
            
            return userLog;
        }catch(Exception e){
            try{ dataBase.close(); }catch(Exception e1){}
            dataBase = null;
            throw e;
        } 
	}
}
