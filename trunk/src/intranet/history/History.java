package intranet.history;


import java.util.Calendar;
import java.util.Hashtable;
import java.util.Vector;

import com.cms.dao.DataBase;
import com.cms.dao.DataBaseFactory;
import com.cms.util.IntranetProperties;
import com.cms.vsystem.object.basic.Download;

public class History{
    
		public static int getHistoryCount(int idFile, int idUser, String action) throws Exception{
		    DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
		   
			String sql = "SELECT count(*) AS total_views " +
						"FROM file_histories " +
						"WHERE id_file=" + idFile + " AND id_user=" + idUser + " AND action='" + action + "'";
					
			dataBase.db_query(sql, false, null);
			Hashtable row = dataBase.db_fetch_array();
			
			dataBase.close();
			dataBase = null;
			
			return (row.get("TOTAL_VIEWS") != null)? Integer.parseInt(row.get("TOTAL_VIEWS").toString()) : 0;
		}
		
		public static Vector viewFilesHistory(int idUser, int historyType) throws Exception{
		    DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
			
		    Calendar date = Calendar.getInstance();
			
			switch(historyType){
				case 1:
				    date.set(Calendar.DATE, date.get(Calendar.DATE) - 3);
					break;
				case 2:
				    date.set(Calendar.DATE, date.get(Calendar.DATE) - 7);
					break;
				case 3:
				    date.set(Calendar.DATE, date.get(Calendar.DATE) - 14);
					break;
				case 4:
				    date.set(Calendar.DATE, date.get(Calendar.DATE) - 21);
					break;
			}
			
			String sql = "SELECT DISTINCT f.id_file, f.name, f.reference_file, fP.value, TO_CHAR(f.modifieddate,'YYYY/MM/DD HH24:MI:SS') AS modifieddate, " +
							"(SELECT CASE WHEN AVG(fR.rate) IS NULL THEN 0 ELSE AVG(fR.rate) END FROM file_rates fR WHERE f.id_file = fR.id_file ) AS rate, " +
							"(SELECT count(*) FROM file_histories fH WHERE fH.id_file = f.id_file AND fH.action='download' ) AS total_views " +
							"FROM files f, file_histories fH, external_files eF, file_properties fP " +
							"WHERE f.id_file = fH.id_file AND fH.history_date >= TO_DATE('" + date.get(Calendar.YEAR) + "-" + (date.get(Calendar.MONTH) + 1) + "-" + date.get(Calendar.DATE) + "', 'YYYY-MM-DD') AND fH.id_user = " + idUser + " AND f.reference_file = eF.id_external_file AND ef.id_external_file = fP.id_external_file AND fP.name = 'description' ";					//"ORDER BY fH.history_date DESC";
					
			dataBase.db_query(sql, false, null);
			Vector files = new Vector();
			Hashtable row;
			
			while((row = dataBase.db_fetch_array()) != null){
				Download download = new Download();
				download.setIdFile(Integer.parseInt(row.get("ID_FILE").toString()));
				download.setName(row.get("NAME").toString());
				download.setIdExternalFile((row.get("REFERENCE_FILE") != null)? Integer.parseInt(row.get("REFERENCE_FILE").toString()) : 0);
				download.setModifiedDate(row.get("MODIFIEDDATE").toString());
				download.setProperty("description", row.get("VALUE").toString());
				//download.loadContent();
				
				Hashtable pack = new Hashtable();
				pack.put("file", download);
				pack.put("rate", (row.get("RATE") != null)? row.get("RATE") : "0");
				pack.put("total_views", row.get("TOTAL_VIEWS"));
				files.addElement(pack);
			}
			
			dataBase.close();
			dataBase = null;
			
			for(int i=0; i < files.size(); i++)
			    ((Download)((Hashtable)files.get(i)).get("file")).loadContent();
			
			return files;
		}
		
		public static void addHistoryFile(int idFile, int idUser, String action) throws Exception{
		    DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
			
			String sql = "INSERT INTO file_histories " +
							"(id_user, id_file, action, history_date) " +
							"VALUES " +
							"( "  + idUser + ", " + idFile + ", '" + action + "', NOW() )";
					
			dataBase.db_query(sql, false, null);
			
			dataBase.close();
			dataBase = null;
		}
}