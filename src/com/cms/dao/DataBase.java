package com.cms.dao;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Hashtable;

public abstract class DataBase {
    protected Connection connection;
    protected Statement statement;
    protected ResultSet resultSet;
    
    protected boolean transaction = false;
    
    public abstract Object db_query(String sql, boolean debug, String sequenceName) throws Exception;
    public abstract Hashtable db_fetch_array() throws Exception;    
    public abstract Object db_insert_id() throws Exception;
    public abstract int db_num_rows() throws Exception;
    public abstract void initTransaction() throws Exception;
    public abstract void endTransaction() throws Exception;
    public abstract void close() throws Exception;
    public abstract void db_commit() throws Exception;
    public abstract void blobStatement ( String SQL, InputStream blob, boolean debug ) throws Exception;
    public abstract InputStream getBlob ( int index ) throws Exception;
    
    /*
     * Para la compatibilidad con otras bases de datos para tipos de datos BLOB
     */
    
    public abstract int createLargeObject() throws Exception;
    public abstract InputStream loadLargeObjectStream(int oid) throws Exception;
    public abstract void deleteLargeObject(int oid) throws Exception;
    public abstract void storeLargeObject(int oid, InputStream source) throws Exception;
    public abstract void closeLargeObject() throws Exception;
}