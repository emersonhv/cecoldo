package com.cms.security;


import java.util.Calendar;
import java.util.Hashtable;
import java.util.Vector;

import com.cms.dao.DataBase;
import com.cms.dao.DataBaseFactory;
import com.cms.util.IntranetProperties;

public class User {
    private int idUser;
    private String login;
    private String passwd;
    private String position;
    private String firstName;
    private String lastName;
    private String email;
    private String lastLogin;
    private int userState;
    private String passwdExpires;
    private int userFile;
    private int idSite;

    private String gender;
    private String phone;
    private String fax;
    private String ubication;
    private String company;
    private String companyUbication;
    private String companyWeb;
    private String companyEmail;
    private String birthDate;
    private int idCountry;
    private boolean newsletters;
	private boolean supervisor;
    
	
    public User() throws Exception {
        idSite = this.idUser = 0;
        login = "";
        passwd = "";
        position = "";
        firstName = "";
        lastName = "";
        email = "";
        passwdExpires = null;
        userState = 0;
        lastLogin = null;
        userFile = 0;
        
		birthDate = null;
		idCountry = 0;
		newsletters = true;
		gender = "";
		phone = "";
		fax = "";
		ubication = "";
		company = "";
		companyUbication = "";
		companyWeb = "";
		companyEmail = "";
		supervisor = false;
		
    }
    
  
	public void setIdSite(int idSite){
        this.idSite = idSite;
    }
    
    public int getIdSite(){
        return idSite;
    }
	
    /**
     * @return Returns the lastLogin.
     */
    public String getLastLogin() {
        return lastLogin;
    }
    /**
     * @param lastLogin The lastLogin to set.
     */
    public void setLastLogin(String lastLogin) {
        this.lastLogin = lastLogin;
    }
    /**
     * @return Returns the passwdExpires.
     */
    public String getPasswdExpires() {
        return passwdExpires;
    }
    /**
     * @param passwdExpires The passwdExpires to set.
     */
    public void setPasswdExpires(String passwdExpires) {
        this.passwdExpires = passwdExpires;
    }
    /**
     * @return Returns the userFile.
     */
    public int getUserFile() {
        return userFile;
    }
    /**
     * @param userFile The userFile to set.
     */
    public void setUserFile(int userFile) {
        this.userFile = userFile;
    }
    /**
     * @return Returns the userState.
     */
    public int getUserState() {
        return userState;
    }
    /**
     * @param userState The userState to set.
     */
    public void setUserState(int userState) {
        this.userState = userState;
    }
    /**
     * @return Returns the email.
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email
     *            The email to set.
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return Returns the firstName.
     */
    public String getFirstName() {
        return firstName;
    }

    /**
     * @param firstName
     *            The firstName to set.
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    /**
     * @return Returns the idUser.
     */
    public int getIdUser() {
        return idUser;
    }

    /**
     * @param idUser
     *            The idUser to set.
     */
    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    /**
     * @return Returns the lastName.
     */
    public String getLastName() {
        return lastName;
    }

    /**
     * @param lastName
     *            The lastName to set.
     */
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    /**
     * @return Returns the login.
     */
    public String getLogin() {
        return login;
    }

    /**
     * @param login
     *            The login to set.
     */
    public void setLogin(String login) {
        this.login = login;
    }

    /**
     * @return Returns the passwd.
     */
    public String getPasswd() {
        return passwd;
    }

    /**
     * @param passwd
     *            The passwd to set.
     */
    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    /**
     * @return Returns the position.
     */
    public String getPosition() {
        return position;
    }

    /**
     * @param position
     *            The position to set.
     */
    public void setPosition(String position) {
        this.position = position;
    }

    /**
     * @return Returns the phone.
     */
    public String getPhone() {
        return phone;
    }

    /**
     * @param phone
     *            The phone to set.
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     * @return Returns the gender.
     */
    public String getGender() {
        return gender;
    }

    /**
     * @param gender
     *            The gender to set.
     */
    public void setGender(String gender) {
        this.gender = gender;
    }

    /**
     * @return Returns the fax.
     */
    public String getFax() {
        return fax;
    }

    /**
     * @param fax
     *            The fax to set.
     */
    public void setFax(String fax) {
        this.fax = fax;
    }

    /**
     * @return Returns the ubication.
     */
    public String getUbication() {
        return ubication;
    }

    /**
     * @param ubication
     *            The ubication to set.
     */
    public void setUbication(String ubication) {
        this.ubication = ubication;
    }

    /**
     * @return Returns the company.
     */
    public String getCompany() {
        return company;
    }

    /**
     * @param company
     *            The company to set.
     */
    public void setCompany(String company) {
        this.company = company;
    }

    /**
     * @return Returns the companyUbication.
     */
    public String getCompanyUbication() {
        return companyUbication;
    }

    /**
     * @param companyUbication
     *            The companyUbication to set.
     */
    public void setCompanyUbication(String companyUbication) {
        this.companyUbication = companyUbication;
    }

    /**
     * @return Returns the companyWeb.
     */
    public String getCompanyWeb() {
        return companyWeb;
    }

    /**
     * @param companyWeb
     *            The companyWeb to set.
     */
    public void setCompanyWeb(String companyWeb) {
        this.companyWeb = companyWeb;
    }

    /**
     * @return Returns the companyEmail.
     */
    public String getCompanyEmail() {
        return companyEmail;
    }

    /**
     * @param companyEmail
     *            The companyEmail to set.
     */
    public void setCompanyEmail(String companyEmail) {
        this.companyEmail = companyEmail;
    }

    /**
     * @return Returns the birthDate.
     */
    public String getBirthDate() {
        return birthDate;
    }

    /**
     * @param birthDate
     *            The birthDate to set.
     */
    public void setBirthDate(String birthDate) {
        this.birthDate = birthDate;
    }

    /**
     * @return Returns the idCountry.
     */
    public int getIdCountry() {
        return idCountry;
    }

    /**
     * @param idCountry
     *            The idCountry to set.
     */
    public void setIdCountry(int idCountry) {
        this.idCountry = idCountry;
    }

    /**
     * @return Returns the newsletters.
     */
    public boolean isNewsletters() {
        return newsletters;
    }

    /**
     * @param newsletters
     *            The newsletters to set.
     */

    public void setNewsletters(boolean newsletters) {
        this.newsletters = newsletters;
    }
	
/**
     * @return Returns the supervisor is true o false.
     */
    public boolean getSupervisor() {
        return supervisor;
    }

    /**
     * @param supervisor
     *            The supervisor to set.
     */
    public void setSupervisor(boolean supervisor) {
        this.supervisor = supervisor;
    }


    public void setGroups(Vector groups) throws Exception{
        DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
        
        try{
	        String sql = "DELETE FROM user_groups WHERE id_user = " + this.idUser;
	        dataBase.db_query(sql, false, null);
	     
	        for(int i = 0; i < groups.size(); i++){
	            sql = "INSERT INTO user_groups " + 
	            		"(id_user, id_group) " + 
	            		"VALUES " +
	            		"(" + this.idUser + ", " + groups.get(i) + ")";
	            
	            dataBase.db_query(sql, false, null); 
	        }
	
	        dataBase.db_commit(); 
	        dataBase.close();
	        dataBase = null;
	        
        }catch(Exception exc){ 
            dataBase.close();
            dataBase = null;
            
            throw new Exception(exc.toString());
        }
    }
    
    /*public void assingCompanyGroups (int idTCompany, Object[] groups) throws Exception{
        DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
        
        try{
        	String strIds = "";
        	for (int i = 0; i < groups.length; i++)
        		strIds += groups[i] + (i < groups.length - 1? "," : "");
        	
	        Hashtable row;
	        
	        String sql =	"SELECT ID_USER " +
	        				"FROM TUSER_TCOMPANY " +
	        				"WHERE ID_USER = " + this.idUser + " " +
	        				"AND ID_TCOMPANY = " + idTCompany;
	        dataBase.db_query(sql, false, null);
	        row = dataBase.db_fetch_array ();
        	
        	if (row == null) {
        		sql =	"INSERT INTO TUSER_TCOMPANY " +
						"(ID_USER, ID_TCOMPANY) " +
						"VALUES " +
						"(" + this.idUser + ", " + idTCompany + ")";
        		dataBase.db_query(sql, false, null);
        	}
	        
	        sql = 	"DELETE " +
    				"FROM user_groups " +
    				"WHERE id_user = " + this.idUser + " " +
    				"AND id_tcompany = " + idTCompany + " ";
	        dataBase.db_query(sql, false, null);
	        
	        for(int i = 0; i < groups.length; i++){
	        	sql = 	"INSERT INTO user_groups " + 
	            		"(id_group, id_user, id_tcompany) " + 
	            		"VALUES " +
	            		"(" + groups[i] + ", " + this.idUser + ", " + idTCompany + ")";
		            
		            dataBase.db_query(sql, false, null);
	        }
	
	        dataBase.db_commit(); 
	        dataBase.close();
	        dataBase = null;
	        
        }catch(Exception exc){ 
            dataBase.close();
            dataBase = null;
            
            throw new Exception(exc.toString());
        } finally {
        	try{dataBase.close();}catch(Exception e1){}
            dataBase = null;
        }
    }*/
    
    
    public void setGroups(Object[] groups) throws Exception{
        DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
        
        try{
	        String sql = "DELETE FROM user_groups WHERE id_user = " + this.idUser;
	        dataBase.db_query(sql, false, null);
	     
	        for(int i = 0; i < groups.length; i++){
	            sql = "INSERT INTO user_groups " + 
	            		"(id_user, id_group) " + 
	            		"VALUES " +
	            		"(" + this.idUser + ", " + groups[i] + ")";
	            
	            dataBase.db_query(sql, false, null); 
	        }
	
	        dataBase.db_commit(); 
	        dataBase.close();
	        dataBase = null;
	        
        }catch(Exception exc){ 
            dataBase.close();
            dataBase = null;
            
            throw new Exception(exc.toString());
        }
    }
    
    private void verifyPasswd() throws Exception{
        DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
        String sql = "SELECT count(*) AS total_passwd " +
        				"FROM user_passwds " +
        				"WHERE passwd = '" + this.passwd + "' AND id_user = " + idUser;
        
        dataBase.db_query(sql, false, null); 
        Hashtable row = dataBase.db_fetch_array();
        
        if(Integer.parseInt(row.get("TOTAL_PASSWD").toString()) > 0)
        	throw new Exception("Esta contraseña ya ha sido utilizada, por favor ingrese otra contraseña diferente.");
        
        sql = "SELECT count(*) AS total_passwd " +
        		"FROM users " +
        		"WHERE passwd = '" + this.passwd + "' AND id_user = " + this.idUser;
        
        dataBase.db_query(sql, false, null);
        row = dataBase.db_fetch_array();
        
        if(Integer.parseInt(row.get("TOTAL_PASSWD").toString()) > 0)
        	throw new Exception("El usuario actualmente usa esta contraseña, por favor ingrese otra contraseña diferente.");
    }
    
     public void updatePasswd() throws Exception{
         verifyPasswd();
         
         DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
         String sql = "SELECT passwd " +
         				"FROM users " +
         				"WHERE id_user = " + idUser;
         
         dataBase.db_query(sql, false, null); 
         Hashtable row = dataBase.db_fetch_array();
         String oldPasswd = row.get("PASSWD").toString();
         
         sql = "SELECT count(*) AS total_passwd " +
         		"FROM user_passwds " +
         		"WHERE id_user = " + idUser;
         
         dataBase.db_query(sql, false, null);
         row = dataBase.db_fetch_array();
         if(row.get("TOTAL_PASSWD") != null && Integer.parseInt(row.get("TOTAL_PASSWD").toString()) == 5){
             sql = "UPDATE user_passwds " +
             		"SET passwd = '" + oldPasswd + "', " +
             		"passwd_date = convert(datetime,'" + passwdExpires + "', 21) " +
             		"WHERE id_user = " + idUser + " AND passwd = " + 
             												"(" +
             													"select top 1 passwd  FROM user_passwds "+
																"WHERE id_user=" + idUser + " ORDER BY passwd_date ASC"+
             												")";
         }else{
             sql = "INSERT " +
             		"INTO user_passwds " +
             		"(id_user, passwd, passwd_date) " +
             		"VALUES " +
             		"(" + idUser + ", '" + oldPasswd + "', convert(datetime,'" + passwdExpires + "', 21) )";
         }
         
         dataBase.db_query(sql, false, null);
         
         Calendar expirationDate = Calendar.getInstance();
         expirationDate.set(Calendar.DATE, expirationDate.get(Calendar.DATE) + 90);
         passwdExpires = expirationDate.get(Calendar.YEAR) + "-" + (expirationDate.get(Calendar.MONTH) + 1) + "-" + expirationDate.get(Calendar.DATE);
         
	     sql = "UPDATE users SET " + 
 				"passwd = '" + this.passwd + "', " +
 				"passwd_expires = convert(datetime,'" + passwdExpires + "', 21) " +
 				"WHERE id_user = " + this.idUser;

	     dataBase.db_query(sql, false, null);
	     
	     dataBase.close();
	     dataBase = null;
     }

     public void commit() throws Exception{
         DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
         String sql = "";
         
         sql = "SELECT count(*) AS total_users " +
         		"FROM users " +
         		"WHERE login = '" + login + "' ";
         
         if(idUser != 0)
             sql += "AND id_user != " + idUser + " "; 
         
         if(idSite != 0)
             sql += "AND id_site = " + idSite;
         
         dataBase.db_query(sql, false, null);
         Hashtable row = dataBase.db_fetch_array();
         if(Integer.parseInt(row.get("TOTAL_USERS").toString()) > 0)
             throw new Exception("Existe otro usuario que utiliza este login, por favor cambielo.");
         
         if(this.idUser != 0){ 
             sql = "UPDATE users SET " + 
             				"login = '" + this.login + "', " + 
             				"id_position = NULL, " +
             				"first_name = '" + this.firstName + "', " + 
             				"last_name = '" + this.lastName + "', " +
             				"email = '" + this.email + "', " + 
             				"last_login = " + (this.lastLogin != null? "convert(datetime,'" + this.lastLogin + "', 21)" : "NULL") + ", " +
             				"user_state = " + this.userState + ", " +
             				"user_file = " + (userFile != 0? String.valueOf(userFile) : "NULL") + ", " +
             				"gender = '" + gender + "', " +
             				"phone = '" + phone + "', " +
             				"fax = '" + fax + "', " +
             				"ubication = '" + ubication + "', " +
             				"company = '" + company + "', " +
             				"company_ubication = '" + companyUbication + "', " +
             				"company_web = '" + companyWeb + "', " +
             				"company_email = '" + companyEmail + "', " +
             				"birth_date = " + ( birthDate != null ? "convert(datetime,'" + birthDate + "', 21)" : "NULL" ) + ", " +
             				"id_ubication = " + ( idCountry != 0 ? String.valueOf( idCountry ) : "NULL" )  + ", " +
             				"newsletters = " + (newsletters? 1 : 0) + ", " +
							"supervisor = " + (supervisor? 1 : 0) + ", " +
             				"id_site = " + ( idSite != 0 ? String.valueOf( idSite ) : "NULL" )  + " " +
             				"WHERE id_user = " + this.idUser;

             dataBase.db_query(sql, false, null); 
         }else{
             Calendar expirationDate = Calendar.getInstance();
             expirationDate.set(Calendar.DATE, expirationDate.get(Calendar.DATE) + 90);
             passwdExpires = expirationDate.get(Calendar.YEAR) + "-" + (expirationDate.get(Calendar.MONTH) + 1) + "-" + expirationDate.get(Calendar.DATE);
             
             sql = "INSERT INTO users " + 
             				"( login, passwd, id_position, first_name, last_name, email, last_login, passwd_expires, user_state, user_file, gender, phone, fax, ubication, company, company_ubication, company_web, company_email, birth_date, id_ubication, newsletters, supervisor, id_site) " + 
             				"VALUES " + 
             				"( '" + this.login + "', '" + this.passwd + "', NULL, '" + this.firstName + "', '" + this.lastName + "', '" + this.email + "', NULL, convert(datetime,'" + passwdExpires + "', 20), " + userState + ", " + (userFile != 0? String.valueOf(userFile) : "NULL") + ", '" + gender + "', '" + phone + "', '" + fax + "', '" + ubication + "', '" + company + "', '" + companyUbication + "', '" + companyWeb + "', '" + companyEmail + "', " + ( birthDate != null ? "convert(datetime,'" + birthDate + "', 21) " : "NULL" ) + ", " + ( idCountry != 0 ? String.valueOf( idCountry ) : "NULL" ) + ", " + (newsletters? 1 : 0) + ", " + (supervisor? 1 : 0) + ", " + ( idSite != 0 ? String.valueOf( idSite ) : "NULL" ) + ")";

             Object key = dataBase.db_query(sql, false, "user_seq");
             this.idUser = Integer.parseInt(key.toString());
         }
         
         dataBase.close();
         dataBase = null;
     }
    
     public void load() throws Exception{
         if(this.idUser != 0){ 
             DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
             
             String sql = "SELECT * FROM users WHERE id_user = " + this.idUser; 
             dataBase.db_query(sql, false, null); 
             Hashtable row = dataBase.db_fetch_array();
             
             this.login = (String)row.get("LOGIN"); 
             this.position = (row.get("ID_POSITION") != null)? (String)row.get("ID_POSITION") : "";
             this.firstName = (row.get("FIRST_NAME") != null)? (String)row.get("FIRST_NAME") : ""; 
             this.lastName = (row.get("LAST_NAME") != null)? (String)row.get("LAST_NAME") : ""; 
             this.email = (row.get("EMAIL") != null)? (String)row.get("EMAIL") : "";
             this.lastLogin = (row.get("LAST_LOGIN") != null)? row.get("LAST_LOGIN").toString() : null;
             this.passwdExpires = (row.get("PASSWD_EXPIRES") != null)? row.get("PASSWD_EXPIRES").toString() : null;
             this.userState = (row.get("USER_STATE") != null)? Integer.parseInt(row.get("USER_STATE").toString()) : 0;
             this.userFile = (row.get("USER_FILE") != null)? Integer.parseInt(row.get("USER_FILE").toString()) : 0;
			 
             this.gender = (row.get("GENDER") != null)? row.get("GENDER").toString() : "";
             this.phone = (row.get("PHONE") != null)? row.get("PHONE").toString() : null;
             this.fax = (row.get("FAX") != null)? row.get("FAX").toString() : null;
             this.ubication = (row.get("UBICATION") != null)? row.get("UBICATION").toString() : null;
             this.company = (row.get("COMPANY") != null)? row.get("COMPANY").toString() : null;
             this.companyUbication = (row.get("COMPANY_UBICATION") != null)? row.get("COMPANY_UBICATION").toString() : null;
             this.companyEmail = (row.get("COMPANY_EMAIL") != null)? row.get("COMPANY_EMAIL").toString() : null;
             this.companyWeb = (row.get("COMPANY_WEB") != null)? row.get("COMPANY_WEB").toString() : null;
             
             this.birthDate = (row.get("BIRTH_DATE") != null)? row.get("BIRTH_DATE").toString() : null;
             this.idCountry = (row.get("ID_UBICATION") != null)? Integer.parseInt( row.get("ID_UBICATION").toString() ) : 0;
             this.newsletters = ( row.get("NEWSLETTERS").toString().toLowerCase() == "true" || row.get("NEWSLETTERS").toString().toLowerCase() == "1" );
             this.supervisor = ( row.get("SUPERVISOR").toString().toLowerCase() == "true" || row.get("SUPERVISOR").toString().toLowerCase() == "1" );
             this.idSite = (row.get("ID_SITE") != null)? Integer.parseInt( row.get("ID_SITE").toString() ) : 0;
             
             dataBase.close();
             dataBase = null;
		 }
     }
     
	
     public Vector getGroupsId() throws Exception{
         DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
         Vector userGroups = new Vector();
         
             String sql = 	"SELECT id_group " +
             				"FROM \"user_groups\" " +
             				"WHERE id_user = " + this.idUser + " " +
             				"GROUP BY id_group"; 
             dataBase.db_query(sql, false, null);
             Hashtable row;
             
             while((row = dataBase.db_fetch_array()) != null){
             	userGroups.addElement(row.get("ID_GROUP")); 
             }

         dataBase.close();
         dataBase = null;
         
         return userGroups; 
     }
    

    public boolean userCanWrite(int idFile) throws Exception {
        DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
        String sql = 	"SELECT fP.write " + 
        				"FROM user_groups uG, file_privileges fP " + 
        				"WHERE uG.id_user = " + this.idUser + " " +
        				"AND uG.id_group = fP.id_group " +
        				"AND fp.id_file = " + idFile;

        dataBase.db_query(sql, false, null);
        boolean canWrite = false;
        Hashtable row;

        while ((row = dataBase.db_fetch_array()) != null){
            canWrite = (canWrite || (row.get("WRITE") != null));

            if (canWrite)
                break;
        }
        dataBase.close();
        dataBase = null;
        
        return canWrite;
    }
    
    public boolean userInGroup(String groupName) throws Exception{
        DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
        String sql = 	"SELECT g.id_group " + 
        				"FROM user_groups uG, groups g " + 
        				"WHERE uG.id_user = " + this.idUser + " " +
        				"AND uG.id_group = g.id_group " +
        				"AND LOWER(g.name) = '" + groupName.toLowerCase() + "'";
        
        dataBase.db_query(sql, false, null);
        
        if( dataBase.db_fetch_array( ) != null){
            dataBase.close();
            dataBase = null;
            
            return true;
        }else{
            dataBase.close();
            dataBase = null;
            
            return false;
        }
    }
    
    public boolean userInGroup(int groupId) throws Exception{
        DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
        String sql = 	"SELECT id_group " + 
        				"FROM user_groups " + 
        				"WHERE id_user = " + this.idUser + " " +
        				"AND id_group = " + groupId + " ";
        
        dataBase.db_query(sql, false, null);

        if( dataBase.db_fetch_array( ) != null){
            dataBase.close();
            dataBase = null;
            
            return true;
        }else{
            dataBase.close();
            dataBase = null;
            
            return false;
        }
    }
    
    public String toString(){
        return "User[Id User: " + this.idUser + ", First Name: " + this.firstName + ", Last Name: " + this.lastName + ",login:" + this.getLogin() + ", passwd:" + this.getPasswd() + "]";
    }
    
    protected void finalize(){
    }
//borrado de usuario verificando si hay mas registros hacia otras compañias.
	public void delUser(int idUser, int idCompany) throws Exception{
         DataBase dataBase = DataBaseFactory.getInstance( IntranetProperties.DATABASE_TYPE );
         String sql = "select count(*)as conteo from user_groups where id_user = " + idUser;
         dataBase.db_query(sql, false, null);
         Hashtable row;
		 row = dataBase.db_fetch_array ( );
		 if (row.get("conteo").toString().equals("1")) {
		 	sql = "DELETE " + 
		 			"FROM user_groups " + 
         			"WHERE id_user = " + idUser + "id_tcompany = " + idCompany;
			dataBase.db_query(sql, false, null);
			sql = "DELETE " + 
		 			"FROM users " + 
         			"WHERE id_user = " + idUser;
			dataBase.db_query(sql, false, null);			
		 }
		 else {
 		 	sql = "DELETE " + 
		 			"FROM user_groups " + 
         			"WHERE id_user = " + idUser + "id_tcompany = " + idCompany;
			dataBase.db_query(sql, false, null);
		 }
     
         dataBase.close( );
         dataBase = null;
     }     
}