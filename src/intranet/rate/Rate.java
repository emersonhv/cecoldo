package intranet.rate;


import java.util.Hashtable;

import com.cms.dao.DataBase;
import com.cms.dao.DataBaseFactory;
import com.cms.util.IntranetProperties;

public class Rate{
			
		public static float getFileRate(int idFile) throws Exception{
		    DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);

			String sql = "SELECT AVG(rate) AS rate " +
							"FROM file_rates " +
							"WHERE id_file=" + idFile;
					
			dataBase.db_query(sql, false, null);
			Hashtable row = dataBase.db_fetch_array();
			
			dataBase.close();
			dataBase = null;
			
			return (row.get("RATE") != null)? Float.parseFloat(row.get("RATE").toString()) : 0;
		}
		
		public static void addFileRate(int idFile, int rate, String comment) throws Exception{
		    DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
			
			String sql = "INSERT INTO file_rates " +
						"(id_file, rate, rate_comment) " +
						"VALUES " +
						"( " + idFile + ", '" + rate + "', '" + comment + "' )";
					
			dataBase.db_query(sql, false, null);
			
			dataBase.close();
			dataBase = null;
		}
}