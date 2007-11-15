/*
 * Created on 10/02/2005
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.cms.dao.sqlserver;


import java.io.InputStream;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Hashtable;

import com.cms.dao.DataBase;
import com.cms.util.IntranetProperties;
import com.cms.util.Log;

/**
 * @author Erlington Salcedo
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class SQLServerDataBase extends DataBase {
	private PreparedStatement preparedStatement = null;

	public SQLServerDataBase(){
		try	{
			Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver");
			connection = DriverManager.getConnection("jdbc:microsoft:sqlserver://" + IntranetProperties.DATABASE_HOST + ":" + IntranetProperties.DATABASE_PORT + ";DatabaseName=" + IntranetProperties.DATABASE_NAME + ";User=" + IntranetProperties.DATABASE_USER_NAME + ";Password=" + IntranetProperties.DATABASE_USER_PASSWD );
			statement = connection.createStatement( ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_UPDATABLE );
		}
		catch( Exception e )	{
			e.printStackTrace( );
		}
    }
    public SQLServerDataBase ( String user, String passwd, String database ) throws Exception	{
    	new SQLServerDataBase();
    }
    public static DataBase getInstance() throws Exception{
        return new SQLServerDataBase(IntranetProperties.DATABASE_USER_NAME, IntranetProperties.DATABASE_USER_PASSWD, IntranetProperties.DATABASE_NAME);
    }
    
    public static DataBase getInstance( String user, String passwd, String database ) throws Exception{
        return new SQLServerDataBase( user, passwd, database );
    }
    
    /* (non-Javadoc)
     * @see intranet.dao.DataBase#db_query(java.lang.String, boolean, java.lang.String)
     */
	 public Object db_query( String SQL, boolean debug, String sequenceName ) throws Exception	{
		 boolean added = false;
		 
		try	{
			if ( connection == null )	{
				Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver");
				connection = DriverManager.getConnection("jdbc:microsoft:sqlserver://" + IntranetProperties.DATABASE_HOST + ":" + IntranetProperties.DATABASE_PORT + ";DatabaseName=" + IntranetProperties.DATABASE_NAME + ";User=" + IntranetProperties.DATABASE_USER_NAME + ";Password=" + IntranetProperties.DATABASE_USER_PASSWD );
				statement = connection.createStatement( ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_UPDATABLE );
				added = true;
			}
	
			//if ( debug )
				Log.print( "Ejecutando: " + SQL );
			
			if ( sequenceName != null )	{
				Object key = null;
				statement.execute( SQL );
				statement.execute( "SELECT @@IDENTITY AS NewID" );
				resultSet = statement.getResultSet( );
			    if ( resultSet.next ( ) ) {
			    	key = resultSet.getObject( 1 );
			    }
			    
			    if ( added )	{
					//ConnectionPool.getInstance( ).free( connection );
					//connection = null;
				}
			    
			    return key;
			}
			else if( statement.execute( SQL ) )	{
				resultSet = statement.getResultSet( );
			}
			if ( added )	{
				//ConnectionPool.getInstance( ).free( connection );
				//connection = null;
			}
			return null;
		}
		catch ( Exception e )	{
			e.printStackTrace ();
			throw ( new Exception ( "\n\nQuery Error: " + SQL + "\n\n" + e.getLocalizedMessage( ) ) );
		}
	}
	 
	public void blobStatement ( String SQL, InputStream blob, boolean debug ) throws Exception	{
		try	{
			/*int size = 0, ln;
			byte buffer[] = new byte[12*1024];
			while( ( ln = blob.read( buffer ) ) != -1 )
				size += ln;
			///blob.reset( );*/

			preparedStatement = connection.prepareStatement( SQL );
			preparedStatement.setBinaryStream( 1, blob, blob.available( ) );
			preparedStatement.executeUpdate( );

			if ( debug )
				Log.print( "Ejecutando: " + SQL );
		}
		catch ( Exception e )	{
				throw ( new Exception ( "\n\nQuery Error: " + SQL + "\n\n" + e.getLocalizedMessage( ) ) );
		}
	}
	public InputStream getBlob(int index) throws Exception {
		if( resultSet.next( ) )
			return resultSet.getBinaryStream( index );
		return null;
	}
	public void db_commit( ) throws Exception	{
		connection.commit();
	}
    /* (non-Javadoc)
     * @see intranet.dao.DataBase#db_insert_id()
     */
 	public Object db_insert_id( ) throws Exception	{
		int newID = -1;
		resultSet = statement.executeQuery( "SELECT LAST_INSERT_ID( ) ");
		
		if ( resultSet.next( ) )	{
			newID = resultSet.getInt( 1 );
		} else {
			throw ( new Exception ( "" ) );
		}
		return new Integer ( newID );
	}
     /* (non-Javadoc)
     * @see intranet.dao.DataBase#close()
     */
    public void close( ) throws Exception	{

    	try{
            resultSet.close();
            statement.close();
            connection.close();
            
            resultSet = null;
            statement = null;
            connection = null;
        }catch(Exception e){
            try{resultSet.close();}catch(Exception e1){}
            try{statement.close();}catch(Exception e1){}
            try{connection.close();}catch(Exception e1){}
            
            resultSet = null;
            statement = null;
            connection = null;
        }finally{
            try{resultSet.close();}catch(Exception e1){}
            try{statement.close();}catch(Exception e1){}
            try{connection.close();}catch(Exception e1){}
            
            resultSet = null;
            statement = null;
            connection = null;
        }
	}
 	/* (non-Javadoc)
     * @see intranet.dao.DataBase#initTransaction()
     */
    public void initTransaction() throws Exception {
    	String sql = "SET IMPLICIT_TRANSACTIONS OFF; BEGIN TRAN datos";
    	try	{
			statement.execute( sql );
		}
		catch ( Exception e )	{
			throw ( new Exception ( "\n\nQuery Error: " + sql + "\n\n" + e.getLocalizedMessage( ) ) );
		}
	}

    /* (non-Javadoc)
     * @see intranet.dao.DataBase#endTransaction()
     */
    public void endTransaction() throws Exception {
		String sql = "COMMIT TRAN datos; SET IMPLICIT_TRANSACTIONS ON";
    	try	{
			statement.execute( sql );
		}
		catch ( Exception e )	{
			throw ( new Exception ( "\n\nQuery Error: " + sql + "\n\n" + e.getLocalizedMessage( ) ) );
		}
    }
	/* (non-Javadoc)
     * @see intranet.dao.DataBase#db_fetch_array()
     */
	public Hashtable db_fetch_array( ) throws Exception	{
		if ( resultSet != null && resultSet.next( ) )	{
			Hashtable row = new Hashtable( );
			int numeroCols = resultSet.getMetaData( ).getColumnCount( );
			
			for ( int c = 1; c <= numeroCols; c ++ )	{
				Object field = resultSet.getObject( c );
				if ( field != null )
				row.put( resultSet.getMetaData( ).getColumnName( c ).toUpperCase( ), field );
			}
			return row;
		}
		else	{
			if ( resultSet != null )	{
				resultSet.close( );
				resultSet = null;
			}
			return null;
		}
	}    /* (non-Javadoc)
     * @see intranet.dao.DataBase#db_num_rows()
     */
    public int db_num_rows( ) throws Exception	{
		if ( resultSet != null )	{
			resultSet.last( );
			int numRows = resultSet.getRow( );
			resultSet.beforeFirst( );			
			return numRows;
		}
		return 0;
	}

    /* (non-Javadoc)
     * @see intranet.dao.DataBase#createLargeObject()
     */
    public int createLargeObject( ) throws Exception	{
		return 0;
	}

    /* (non-Javadoc)
     * @see intranet.dao.DataBase#loadLargeObjectStream(int)
     */
    public InputStream loadLargeObjectStream( int oid ) throws Exception	{
		return null;
	}

    /* (non-Javadoc)
     * @see intranet.dao.DataBase#deleteLargeObject(int)
     */
    public void deleteLargeObject(int oid) throws Exception {
    }

    /* (non-Javadoc)
     * @see intranet.dao.DataBase#storeLargeObject(int, java.io.InputStream)
     */
    public void storeLargeObject(int oid, InputStream source) throws Exception {
    }

    /* (non-Javadoc)
     * @see intranet.dao.DataBase#closeLargeObject()
     */
    public void closeLargeObject() throws Exception {
    }
	
	protected void finalize( )	{
		try	{
			close( );
		}
		catch ( Exception e )	{
		}
    }
	public static void main( String args[] ){
		try	{
			Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver");
			
			java.sql.Connection connection = DriverManager.getConnection("jdbc:microsoft:sqlserver://localhost:1433;DatabaseName=day;User=sa;Password=admin2007" );
			java.sql.Statement statement = connection.createStatement( ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_UPDATABLE );
			System.out.println("OPK");
		}
		catch( Exception e )	{
			e.printStackTrace( );
		}
		
	}
}
