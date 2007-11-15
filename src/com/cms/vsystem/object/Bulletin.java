/*
 * Created on 14-ene-2005
 * @autor Sandra Romero
 */

package com.cms.vsystem.object;

import javax.mail.*;
import javax.mail.internet.MimeMessage;
import javax.mail.BodyPart;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeBodyPart;
import java.util.Properties;
import java.util.Hashtable;
import javax.mail.Transport;

import com.cms.dao.DataBase;
import com.cms.dao.DataBaseFactory;
import com.cms.util.IntranetProperties;
import com.cms.vsystem.File;

public class Bulletin extends File {
	private int idBulletin;
	private String tittle;
	private String send_date;
	private String send_time;
	private String content;
	private String emails;
	private boolean state;

	public Bulletin() throws Exception {
		super( );
	}
	
	public void setIdBulletin ( int id ) {
		this.idBulletin = id;
		
	}
	
	public int getIdBulletin ( ) {
		return idBulletin;
	}

	public void setTittle ( String tittle ){
		this.tittle = tittle;
	}
	
	public String getTittle ( ){
		return tittle;
	}
	
	public void setSendDate ( String sendDate ){
		this.send_date = sendDate;
	}
	
	public String getSendDate ( ){
		return send_date;
	}
	
	public void setSendTime ( String sendTime ){
		this.send_time = sendTime;
	}
	
	public String getSendTime ( ){
		return send_time;
	}
	public void setContent ( String content ){
		this.content = content;
	}
	
	public String getContent ( ){
		return content;
	}

	public void setEmails ( String emails ){
		this.emails = emails;
	}
	
	public String getEmails ( ){
		return emails;
	}
	public void setState ( boolean state ){
		this.state = state;
	}
	
	public boolean getState ( ){
		return state;
	}
	public void load() throws Exception {
		loadFile ( );
        DataBase dataBase = DataBaseFactory.getInstance ( IntranetProperties.DATABASE_TYPE );
        if( this.referenceFile != 0 ){
        	this.idBulletin = this.referenceFile;
            String sql = "SELECT * FROM bulletin WHERE id_bulletin = " + this.idBulletin;
			dataBase.db_query(sql, false, null);
            
            Hashtable row = dataBase.db_fetch_array();
     
            this.tittle = (row.get("TITTLE") != null)? row.get("TITTLE").toString() : "";
            this.send_date = (row.get("SEND_DATE") != null)? row.get("SEND_DATE").toString() : "";
            this.content = (row.get("CONTENT") != null)? row.get("CONTENT").toString() : "";
            this.emails = (row.get("EMAILS") != null)? row.get("EMAILS").toString() : "";
            this.state = (row.get("STATE").toString().toLowerCase() == "true" || row.get("STATE").toString() == "1");
            this.send_time = (row.get("SEND_TIME") != null)? row.get("SEND_TIME").toString() : "";
        }
        else{
			String sql = "INSERT INTO bulletin ( id_bulletin, tittle, send_date, content, emails, state, send_time, id_file ) VALUES ( ?, '', '', '', '', false, '', " + idFile + ")";
			Object key = dataBase.db_query(sql, false, "bulletin_seq");
			this.idBulletin = Integer.parseInt(key.toString());

			sql = "UPDATE files SET reference_file=" + this.idBulletin + " WHERE id_file=" + this.idFile;
			dataBase.db_query(sql, false, null);
		}
        dataBase.close();
        dataBase = null;
	}

	public void commit() throws Exception {
		this.commitFile ( );
				
		DataBase dataBase = DataBaseFactory.getInstance ( IntranetProperties.DATABASE_TYPE );
		
		String sql =	"UPDATE bulletin SET " +
						"tittle = '" + this.tittle + "', " +
						"send_date = '" + this.send_date + "', " +
						"content = '" + this.content + "', " +
						"emails = '" + this.emails + "', " +
						"state = " + this.state + ", "+
						"send_time = '" + this.send_time + "' " +
						"WHERE id_bulletin = " + this.idBulletin;
		
		dataBase.db_query ( sql, false, null );
		dataBase.close();
		
		storeCache();
	}
	
	public void send_mail(int id, String to, String tittle, String content) throws Exception {
		DataBase dataBase = DataBaseFactory.getInstance ( IntranetProperties.DATABASE_TYPE );
		
		Properties props = new Properties();
		//props.put("mail.smtp.host", "localhost");
		Session session = Session.getDefaultInstance(props, null);
		Message message = new MimeMessage(session);
		message.setSubject(tittle);
		message.setFrom(new InternetAddress("Newsletters_Agrinal"));
		message.addRecipients(Message.RecipientType.TO, InternetAddress.parse(to,false));

//		 Create your new message part
		BodyPart messageBodyPart = new MimeBodyPart();
		String htmlText = content;
			
		messageBodyPart.setContent(htmlText, "text/html");

//		 Create a related multi-part to combine the parts
		MimeMultipart multipart = new MimeMultipart();
		multipart.addBodyPart(messageBodyPart);
		message.setContent(multipart);
		
		Transport.send(message);
		String sql = "UPDATE bulletin SET " +
					 "state = " + true + 
					 " WHERE id_bulletin = " + id;

		dataBase.db_query ( sql, false, null );
		dataBase.close();
	}
	
	protected void storeCache() throws Exception{}

	protected void cleanUp() throws Exception {
	}
}
