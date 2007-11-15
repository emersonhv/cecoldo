package com.cms.security;


import java.util.Hashtable;

import com.cms.dao.DataBase;
import com.cms.dao.DataBaseFactory;
import com.cms.util.IntranetProperties;
/**
 * 
 * @author Harold
 *
 */
public class Group {
    private int idGroup;
    
    private String name;

    private String description;    

    public Group() throws Exception{
        idGroup = 0;
        name = "";
        description = "";
    }

    /**
     * @return Returns the description.
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description
     *            The description to set.
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * @return Returns the idGroup.
     */
    public int getIdGroup() {
        return idGroup;
    }

    /**
     * @param idGroup
     *            The idGroup to set.
     */
    public void setIdGroup(int idGroup) {
        this.idGroup = idGroup;
    }

    /**
     * @return Returns the name.
     */
    public String getName() {
        return name;
    }

    /**
     * @param name
     *            The name to set.
     */
    public void setName(String name) {
        this.name = name;
    }

    public void load() throws Exception{
        
        if(this.idGroup != 0){
            DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
            
            String sql = "SELECT * FROM groups WHERE id_group = " + this.idGroup; 
            dataBase.db_query(sql, false, null); 
            Hashtable row = dataBase.db_fetch_array();
     
            this.name = row.get("NAME").toString(); 
            this.description = (row.get("DESCRIPTION") != null)? row.get("DESCRIPTION").toString() : "";
            
            dataBase.close();
            dataBase = null;
        } 
    }

    public void commit() throws Exception{
        DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
        
        if(this.idGroup != 0){ 
            String sql = "UPDATE groups SET " + 
            				"name = '" + this.name + "', " + 
            				"description = '" + this.description + "' " +
            				"WHERE id_group = " + this.idGroup;
     
            dataBase.db_query(sql, false, null); 
        }else{ 
            String sql = "INSERT INTO groups " + 
            				"( name, description ) " + 
            				"VALUES " + 
            				"( '" + this.name + "', '" + this.description + "' ) ";
            
            Object key = dataBase.db_query(sql, false, "group_seq");
            this.idGroup = Integer.parseInt(key.toString());
        }
        
        dataBase.close();
        dataBase = null;
    }
      
    public Hashtable getFilePrivileges(int idFile) throws Exception{
        DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
        
        String sql = "SELECT * " + 
        				"FROM file_privileges " + 
        				"WHERE id_file = " + idFile + " AND id_group = " + this.idGroup;
        
        dataBase.db_query(sql, false, null);
        Hashtable row = dataBase.db_fetch_array();
        dataBase.close();
        dataBase = null;
        
     	return row; 
    }

    public void setFilePrivileges(int idFile, boolean read, boolean write, boolean hidden, boolean read_nav, boolean hidden_nav) throws Exception{
        DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
        
        String sql = "";
        
        if(getFilePrivileges(idFile) != null){ 
            if(read || write || hidden || read_nav || hidden_nav){
                sql = "UPDATE file_privileges " + 
	    				"SET \"read\"=" + (read? "1" : "NULL") + ", " +
	    				"write=" + (write? "1" : "NULL") + ", " + 
	    				"hidden=" + (hidden? "1" : "NULL") + ", " +
	    				"read_nav=" + (read_nav? "1" : "NULL") + ", " + 
	    				"hidden_nav=" + (hidden_nav? "1" : "NULL") + " " + 
	    				"WHERE id_group = " + this.idGroup + " AND id_file = " + idFile; 
            }else{ 
                sql = "DELETE FROM file_privileges " +
                		"WHERE id_file=" + idFile + " AND id_group = " + this.idGroup; 
            }
        }else{ 
            sql = "INSERT INTO file_privileges " + 
            		"(id_file, id_group, \"read\", write, hidden, read_nav, hidden_nav) " + 
            		"VALUES " + 
            		"( " + idFile + ", " + this.idGroup + ", " + (read? "1" : "NULL") + ", " + (write? "1" : "NULL") + ", " + (hidden? "1" : "NULL") + ", " + (read_nav? "1" : "NULL") + ", " + (hidden_nav? "1" : "NULL") + ")"; 
        }
     
        dataBase.db_query(sql, false, null); 
        dataBase.close();
        dataBase = null;
    }
    
    protected void finalize(){
    }
}

