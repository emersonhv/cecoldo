/**
 * 
 */
package com.cms.dao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Vector;

import com.cms.util.IntranetProperties;

/**
 * @author Nelson Daza
 *
 */
public final class ConnectionPool implements Runnable {
	/**
	 * serialVersionUID makes ConnectionPool serilalizable and is used for version
	 * 00.00.00.00 major.minor[.revision[.build]] ( Without dots )
	 */
	public static final long serialVersionUID = -01000000;
	
	private String dbClassName;
	private int maxConnections, minConnections;
	private boolean waitIfBusy = true;
	private Vector availableConnections, busyConnections;
	private boolean connectionPending = false;
	private static ConnectionPool instance = null;

	/**
	 * Exists only to defeat instantiation.
	 */
	public ConnectionPool ( ) {
		super( );
		// TODO Auto-generated constructor stub
	}
	
	/**
	 * Creates a static instance of ConnectionPool ( only if it does not exist )
	 * @return The static intance of ConnectionPool
	 * @throws Exception
	 * @throws SQLException
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws ClassNotFoundException
	 */
	public static ConnectionPool getInstance ( ) throws Exception {
		if ( instance == null )	{
			try	{
				instance = new ConnectionPool( );
				instance.createPool( );
			}
			catch ( Exception e )	{
				instance = null;
				throw e;
			}
		}
		return instance;
	}
	
	/**
	 * Creates de pool
	 * @throws Exception
	 * @throws SQLException
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws ClassNotFoundException
	 */
	public void createPool ( ) throws Exception {
		minConnections = IntranetProperties.DATABASE_MIN_CONNECTIONS;
		maxConnections = IntranetProperties.DATABASE_MAX_CONNECTIONS;

		waitIfBusy = true;
		
		
		if ( minConnections > maxConnections )
			minConnections = maxConnections;
		
		availableConnections = new Vector( );
		busyConnections = new Vector( );
		
		for ( int c = 0; c < minConnections; c ++ )	{
			Connection connection = createConnection( );
			availableConnections.addElement( connection );
		}
	}

	/**
	 * Creates a brand new connection
	 * @return The brand new connection
	 * @throws ClassNotFoundException 
	 * @throws IllegalAccessException 
	 * @throws InstantiationException 
	 * @throws SQLException 
	 */
	private Connection createConnection ( ) throws Exception {
		Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver");
		return DriverManager.getConnection("jdbc:microsoft:sqlserver://" + IntranetProperties.DATABASE_HOST + ":" + IntranetProperties.DATABASE_PORT + ";DatabaseName=" + IntranetProperties.DATABASE_NAME + ";User=" + IntranetProperties.DATABASE_USER_NAME + ";Password=" + IntranetProperties.DATABASE_USER_PASSWD );
		//return Database.getInstance( ).createPoolConnection( );
	}
	
	/**
	 * For creation of Connection in the background
	 */
	private void createBackgroundConnection ( ) {
		connectionPending = true;
		try {
			Thread thread = new Thread ( this );
			thread.start ( );
		}
		catch ( OutOfMemoryError e ) {
			// TODO: handle exception
		}
	}

	/**
	 * Returns a connection from the availableConnections
	 * @return A connection from the availableConnections
	 * @throws SQLException
	 */
	public synchronized Connection getConnection ( ) throws SQLException {
		if ( !availableConnections.isEmpty( ) )	{
			Connection connection = (Connection)availableConnections.lastElement( );
			int lastIndex = availableConnections.size( ) - 1;
			availableConnections.removeElementAt( lastIndex );
			if ( connection.isClosed( ) )	{
				notifyAll( );	// Freed up a spot for anybody waiting
				return getConnection( );
			}
			else	{
				busyConnections.addElement( connection );
				return connection;
			}
		}
		else	{
			if ( actualConnections( ) < maxConnections && !connectionPending )	{
				createBackgroundConnection( );
			}
			else if ( !waitIfBusy )
				throw new SQLException( "Máximo de conecciones alcanzado!" );

			try {
				wait( );
			}
			catch ( InterruptedException e ) {
				// TODO Auto-generated catch block
			}
			
			return getConnection( );
		}
	}

	/**
	 * Returns the number of actual connections no matter if they're busy or available
	 * @return The number of actual connections no matter if they're busy or available
	 */
	public synchronized int actualConnections ( ) {
		return availableConnections.size( ) + busyConnections.size( );
	}

	/* (non-Javadoc)
	 * @see java.lang.Runnable#run()
	 */
	public void run ( ) {
		Connection connection;
		try {
			connection = createConnection ( );
			synchronized ( this ) {
				availableConnections.addElement ( connection );
				connectionPending = false;
				notifyAll ( );
			}
		}
		catch ( Exception e ) {
			// TODO Auto-generated catch block
		}
	}
	
	/**
	 * Sets free the connection passed as parameter 
	 * @param connection
	 */
	public synchronized void free ( Connection connection ) {
		busyConnections.removeElement( connection );
		availableConnections.addElement( connection );
		notifyAll( );
	}
	
	/**
	 * Sets free all connections
	 */
	public synchronized void close ( ) {
		closeConnections( availableConnections );
		availableConnections = new Vector( );
		closeConnections( busyConnections );
		busyConnections = new Vector( );
	}
	
	/**
	 * Closes a vector of connections
	 * @param connections
	 */
	private synchronized void closeConnections ( Vector connections ) {
		for ( int c = 0; c < connections.size( ); c ++ )	{
			Connection connection = (Connection)connections.elementAt( c );
			try {
				if ( !connection.isClosed ( ) )
					connection.close ( );
			}
			catch ( SQLException e ) {
				// TODO: handle exception
			}
		}
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	public String toString ( ) {
		return "ConnectionPool ( " + dbClassName + " ) " +
			", Disponibles: " + availableConnections.size( ) + " " + availableConnections.toString( ) + 
			", Activas: " + busyConnections.size( ) + " " + busyConnections.toString( ) +
			", Máximas: " + maxConnections + 
			", Mínimas: " + minConnections + 
			", Esperar: " + waitIfBusy; 
	}
	
	/* (non-Javadoc)
	 * @see java.lang.Object#finalize()
	 */
	protected void finalize ( ) throws Throwable {
		this.close( );
		super.finalize( );
	}

}
