/*
 * Created on 24-feb-2005
 * @autor Sandra Romero
 */
package com.cms.vsystem.object;


import java.util.Hashtable;

import com.cms.dao.DataBase;
import com.cms.dao.DataBaseFactory;
import com.cms.util.IntranetProperties;
import com.webage.scheduler.Task;



public class automatic_sending implements Task {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public automatic_sending() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void execute() throws Exception {
		if ( IntranetProperties.DATABASE_USER_NAME != null )	{
			DataBase dataBase = DataBaseFactory.getInstance ( IntranetProperties.DATABASE_TYPE );
			
			String sql = "SELECT * FROM bulletin where state = false and current_timestamp >= send_date and current_time >= send_time";
			Bulletin bull = new Bulletin();
			dataBase.db_query ( sql, false, null );
			Hashtable row = new Hashtable();
			
			while((row = dataBase.db_fetch_array()) != null){
				bull.send_mail(Integer.parseInt(row.get("ID_BULLETIN").toString()),row.get("EMAILS").toString(),row.get("TITTLE").toString(),row.get("CONTENT").toString());
			}
	
			dataBase.close();
			dataBase = null;
		}
	}

}
