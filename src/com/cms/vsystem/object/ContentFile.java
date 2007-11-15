package com.cms.vsystem.object;


import java.io.InputStream;
import java.text.NumberFormat;
import java.util.Hashtable;

import com.cms.dao.DataBase;
import com.cms.dao.DataBaseFactory;
import com.cms.util.IntranetProperties;

public class ContentFile {
    private int idExternalFile;
    private String name;
    private String newName;
    private InputStream content;
    //private int contentOID;
    private String contentType;
    private boolean newContent;
    private String contentDate;
    private DataBase dataBase;

    public ContentFile() throws Exception{
        this.newContent = true;
        this.name = null;
        this.idExternalFile = 0;
        //this.contentOID = 0;
        
        dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
    }

    /**
     * @return Returns the content.
     */
    public InputStream getContent() {
        return content;
    }

    /**
     * @param content
     *            The content to set.
     */
    public void setContent(InputStream content) {
        this.content = content;
    }

    /**
     * @return Returns the contentDate.
     */
    public String getContentDate() {
        return contentDate;
    }

    /**
     * @param contentDate
     *            The contentDate to set.
     */
    public void setContentDate(String contentDate) {
        this.contentDate = contentDate;
    }

    /**
     * @return Returns the contentType.
     */
    public String getContentType() {
        return contentType;
    }

    /**
     * @param contentType
     *            The contentType to set.
     */
    public void setContentType(String contentType) {
        this.contentType = contentType;
    }

    /**
     * @return Returns the idExternalFile.
     */
    public int getIdExternalFile() {
        return idExternalFile;
    }

    /**
     * @param idExternalFile
     *            The idExternalFile to set.
     */
    public void setIdExternalFile(int idExternalFile) {
        this.idExternalFile = idExternalFile;
    }

    /**
     * @return Returns the name.
     */
    public String getName() {
        return name;
    }

    /**
     * @param name
     *            The name to set.
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return Returns the newContent.
     */
    public boolean isNewContent() {
        return newContent;
    }

    /**
     * @param newContent
     *            The newContent to set.
     */
    public void setNewContent(boolean newContent) {
        this.newContent = newContent;
    }

    /**
     * @return Returns the newName.
     */
    public String getNewName() {
        return newName;
    }

    /**
     * @param newName
     *            The newName to set.
     */
    public void setNewName(String newName) {
        this.newName = newName;
    }
  
    public String getSize() throws Exception{ 
        int size = this.content.available(); 
        int numDiv = 0; 
        int divisor = 1024;
      
        while(size > divisor){ 
            size/=divisor; 
            numDiv++; 
        }
      
        String sizes[] = new String[4];
        sizes[0] = "Bytes"; 
        sizes[1] = "KB"; 
        sizes[2] = "MB"; 
        sizes[3] = "GB";
      
        return NumberFormat.getInstance().format(size) + " " + sizes[numDiv]; 
     }
      
     public void commit() throws Exception{
         String sql = "";
         //dataBase.initTransaction();
         if( this.newContent )	{
             sql = "INSERT INTO file_contents " + 
     				"(name, id_external_file, content_type, content_date ) " + 
     				"VALUES " +
     				"('" + this.name + "', " + this.idExternalFile + ", '" + this.contentType + "', getdate())"; 
         }else{
             sql = "UPDATE file_contents " +
             		"SET name='" + this.newName + "', " + 
             		"content_type='" + this.contentType + "' " + 
             		"WHERE name='" + this.name + "' AND id_external_file=" + this.idExternalFile;
      
             this.name = this.newName; 
         }
         
         dataBase.db_query( sql, false, null );
         sql = "UPDATE file_contents " +
		  		"SET content = ? " + 
		  		"WHERE name='" + this.name + "' AND id_external_file=" + this.idExternalFile;
         dataBase.blobStatement( sql, content, false );
         
     	 //dataBase.db_commit( );
     	 //dataBase.endTransaction();
     }
     
    public void beginReadContent( ) throws Exception{
    	String sql = "SELECT content " + 
		"FROM file_contents " + 
		"WHERE name='" + this.name + "' AND id_external_file=" + this.idExternalFile;

        dataBase.db_query(sql, false, null); 
        content = dataBase.getBlob( 1 );
    }
    
     public void endReadContent() throws Exception{
         try{content.close();}catch(Exception e){}
         try{dataBase.closeLargeObject();}catch(Exception e){}
         try{dataBase.endTransaction();}catch(Exception e){}
     }
     
    public void load() throws Exception{ 
     
        if(this.name != null && this.idExternalFile != 0 ){
            String sql = "SELECT content_type, convert(varchar, content_date, 112) as content_date " +
            			"FROM file_contents " + 
            			"WHERE name='" + this.name + "' AND id_external_file=" + this.idExternalFile;
     
            dataBase.db_query(sql, false, null); 
            Hashtable row = dataBase.db_fetch_array();
            contentType = (row.get("CONTENT_TYPE") != null)? row.get("CONTENT_TYPE").toString() : "";
            contentDate = (row.get("CONTENT_DATE") != null)? row.get("CONTENT_DATE").toString() : "";
            //contentOID = (row.get("CONTENT") != null)? Integer.parseInt(row.get("CONTENT").toString()) : 0;

        } 
    }
    
    public void close(){
        try{
            if(content != null)
                content.close();
                
            content = null;
            dataBase.close();
            dataBase = null;
        }catch(Exception e){
        }
    }
    
    protected void finalize(){
        try{
            dataBase.close();
            dataBase = null;
        }catch(Exception e){
        }
    }
}