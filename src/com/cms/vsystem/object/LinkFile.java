package com.cms.vsystem.object;


import java.util.Hashtable;
import java.util.Properties;

import com.cms.dao.DataBase;
import com.cms.dao.DataBaseFactory;
import com.cms.util.IntranetProperties;
import com.cms.vsystem.File;

public class LinkFile extends File {
    private int idLink;
    private int linkFile;
    
    public LinkFile() throws Exception{
        super();
    }
    
    /**
     * @return Returns the idLink.
     */
    public int getIdLink() {
        return idLink;
    }
    /**
     * @param idLink The idLink to set.
     */
    public void setIdLink(int idLink) {
        this.idLink = idLink;
    }
    /**
     * @return Returns the linkFile.
     */
    public int getLinkFile() {
        return linkFile;
    }
    /**
     * @param linkFile The linkFile to set.
     */
    public void setLinkFile(int linkFile) {
        this.linkFile = linkFile;
    }
    
    public String getLinkFileType() throws Exception{
        File file = new Folder();
        file.setIdFile(linkFile);
        file.load();
        
        return file.getFileType();
    }
    
    public void load() throws Exception {
        loadFile();
		
		DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
		
		if(this.referenceFile != 0){
			this.idLink = this.referenceFile;
			String sql = "SELECT link_file " +
							"FROM file_links " +
							"WHERE id_link = " + this.idLink;
			dataBase.db_query(sql, false, null);
			Hashtable row = dataBase.db_fetch_array();
			
			this.linkFile = (row.get("LINK_FILE") != null)? Integer.parseInt(row.get("LINK_FILE").toString()) : 0;
		}else{
		    String sql = "INSERT INTO " +
							"file_links " +
							"(id_file, link_file) " +
							"VALUES " +
							"( " + idFile + ", NULL)";
				
			Object key = dataBase.db_query(sql, false, "link_seq");
			this.idLink = Integer.parseInt(key.toString());
			
			sql = "UPDATE files SET reference_file=" + this.idLink + " WHERE id_file = " + this.idFile;
			dataBase.db_query(sql, false, null);
		}
		
		dataBase.close();
		dataBase = null;
    }

    public void commit() throws Exception {
        commitFile();
        DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
        
        String sql = "UPDATE file_links " +
        				"SET link_file = " + linkFile + " " +
        				"WHERE id_link = " + idLink;
        dataBase.db_query(sql, false, null);
        
        dataBase.close();
		dataBase = null;
    	storeCache();
	}
	
	protected void storeCache() throws Exception{}

    public String getPreviewHtml(int width, int height) {
        return "";
    }

    public String getHtml(Properties prop) {
        return "";
    }
    
    protected void cleanUp() throws Exception{
	}
}