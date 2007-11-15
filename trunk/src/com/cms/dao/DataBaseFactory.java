package com.cms.dao;


import com.cms.dao.sqlserver.SQLServerDataBase;

public class DataBaseFactory{

    public static DataBase getInstance(int dataBaseType) throws Exception{
        switch (dataBaseType) {
	       
	        case 3:
	            return SQLServerDataBase.getInstance();
        }

        throw new Exception("Data Base Type Not Found");
    }
    public static DataBase getInstance( int dataBaseType, String user, String passwd, String database ) throws Exception	{
		switch ( dataBaseType )	{
		  
		    case 3:
		        return SQLServerDataBase.getInstance( user, passwd, database );
		}
		
		throw new Exception("Data Base Type Not Found");
    }
}