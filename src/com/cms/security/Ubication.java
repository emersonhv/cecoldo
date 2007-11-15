package com.cms.security;


import java.util.Hashtable;
import java.util.Vector;

import com.cms.dao.DataBase;
import com.cms.dao.DataBaseFactory;
import com.cms.util.IntranetProperties;

public class Ubication{
    private int id_ubication;
    private String name;
    private String code;
    private String description;
    private String DANEcode;
    private String code1;
    private String code2;
	private int parent;
    private Vector children;

    public Ubication() throws Exception {
        id_ubication     = 0;
        name             = "";
        code             = "";
        description      = "";
		DANEcode         = "";
		code1            = "";
		code2            = "";
        parent           = 0;
        children         = null;
    }
    
    /**
     * @return Returns the id_ubication.
     */
    public int getIdUbication() {
        return id_ubication;
    }
    /**
     * @param id The id_ubication to set.
     */
    public void setIdUbication( int id ) {
        this.id_ubication = id;
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
     * @return Returns the code.
     */
    public String getCode() {
        return code;
    }
    /**
     * @param ln The code to set.
     */
    public void setCode(String c) {
        this.code = c;
    }
    /**
     * @return Returns the description.
     */
    public String getDescription() {
        return description;
    }
    /**
     * @param g The description to set.
     */
    public void setDescription(String d) {
        this.description = d;
    }
	/**
     * @return Returns the DANE code.
     */
    public String getDANECode() {
        return DANEcode;
    }
    /**
     * @param g The DANE code to set.
     */
    public void setDANECode(String DANEcode) {
        this.DANEcode = DANEcode;
    }
	/**
     * @return Returns the code 1.
     */
    public String getCode1() {
        return code1;
    }
    /**
     * @param g The code 1 to set.
     */
    public void setCode1(String code1) {
        this.code1 = code1;
    }
	/**
     * @return Returns the code 2.
     */
    public String getCode2() {
        return code2;
    }
    /**
     * @param g The code 2 to set.
     */
    public void setCode2(String code2) {
        this.code2 = code2;
    }
    /**
     * @return Returns the parent.
     */
    public int getParent() {
        return parent;
    }
    /**
     * @param bd The parent to set.
     */
    public void setParent(int p) {
        this.parent = p;
    }

    /**
     * @return Returns the its children.
     */
    public Vector getChildren() throws Exception {
        if( children == null)
        {
			DataBase database = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
			String sql = "SELECT * " +
				"FROM ubication " +
				"WHERE parent = " + id_ubication;
			
			database.db_query(sql, false, null);
			Hashtable row;
			while( ( row = database.db_fetch_array() ) != null )
         	{
         		Ubication child = new Ubication();
         		child.setIdUbication( Integer.parseInt( row.get("id_ubication").toString() ) );
         		child.load();
         		children.add( child );
         	}
			database.close();
			database=null;      	
        }
        return children;
    }

    public void commit() throws Exception{
         DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
         String sql = "";
         
         if(this.id_ubication != 0){ 
             sql = "UPDATE ubication SET " + 
             				"name = '"              + this.name + "', " + 
             				"code = '"              + this.code + "', " + 
             				"description = '"       + this.description + "', " +
             				"parent '= "            + this.parent + "', " +
							"DANEcode '= "            + this.DANEcode + "', " +
							"code1 '= "            + this.code1 + "', " +
							"code2 '= "            + this.code2 + "' " +
             				"WHERE id_ubication = " + this.id_ubication;

             dataBase.db_query(sql, false, null); 
         }else{        
             sql = "INSERT INTO ubication " + 
             				"( name, code, description, parent, DANEcode, code1, code2 ) " + 
             				"VALUES " + 
             				"('" + 
             				this.name + "', '" + 
             				this.code + "', '" + 
             				this.description + "', '" + 
             				this.parent + "', ' " +
							this.DANEcode + "', '" +
							this.code1 + "', '" +
							this.code2 + "' " + 
             				")";

             Object key        = dataBase.db_query(sql, false, "ubication_seq");
             this.id_ubication = Integer.parseInt(key.toString()); 
         }
         
         dataBase.close();
         dataBase = null;
     }
    
     public void load() throws Exception{
         if(this.id_ubication != 0){
             DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
             
             String sql = "SELECT * FROM ubication WHERE id_ubication = " + this.id_ubication; 
             dataBase.db_query(sql, false, null); 
             Hashtable row = dataBase.db_fetch_array();
             
             this.name             	= (String)row.get("NAME"); 
             this.code             	= (String)row.get("CODE");
             this.description      	= (String)row.get("DESCRIPTION");
			 this.DANEcode   	   	= (String)row.get("DANECODE");
			 this.code1	      		= (String)row.get("CODE1");
			 this.code2      		= (String)row.get("CODE2");
             this.parent          	= Integer.parseInt( row.get("PARENT").toString() );

             dataBase.close();
             dataBase = null;
		 }
     }
     
    public String toString(){
        return "User[Id Ubication: " + 
			this.id_ubication + ", Name: " + 
			this.name + ", Code: " + 
			this.code + ", Descrption: " + 
			this.description+ " " + 
        	"]";
    }
    
    protected void finalize(){
    }

}