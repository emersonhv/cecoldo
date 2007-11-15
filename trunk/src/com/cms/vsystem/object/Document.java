package com.cms.vsystem.object;


import java.util.Hashtable;

import com.cms.dao.DataBase;
import com.cms.dao.DataBaseFactory;
import com.cms.util.IntranetProperties;
import com.cms.vsystem.File;

public class Document extends File{
		private int idDocument;
		private String author;
		private boolean showTitle;
		private int titleType;
		private boolean showAuthor;
		private String shortContent;
		private String fullContent;
		
		public static final int TEXT_TITLE = 0;
		public static final int IMAGE_TITLE = 1;
		
		public Document() throws Exception{
		    super();
		}
        /**
         * @return Returns the showAuthor.
         */
        public boolean isShowAuthor() {
            return showAuthor;
        }
        /**
         * @param showAuthor The showAuthor to set.
         */
        public void setShowAuthor(boolean showAuthor) {
            this.showAuthor = showAuthor;
        }
        /**
         * @return Returns the showTitle.
         */
        public boolean isShowTitle() {
            return showTitle;
        }
        /**
         * @param showTitle The showTitle to set.
         */
        public void setShowTitle(boolean showTitle) {
            this.showTitle = showTitle;
        }
        /**
         * @return Returns the titleType.
         */
        public int getTitleType() {
            return titleType;
        }
        /**
         * @param titleType The titleType to set.
         */
        public void setTitleType(int titleType) {
            this.titleType = titleType;
        }
		/**
         * @return Returns the author.
         */
        public String getAuthor() {
            return author;
        }
        /**
         * @param author The author to set.
         */
        public void setAuthor(String author) {
            this.author = author;
        }
        /**
         * @return Returns the fullContent.
         */
        public String getFullContent() {
            return fullContent;
        }
        /**
         * @param fullContent The fullContent to set.
         */
        public void setFullContent(String fullContent) {
            this.fullContent = fullContent;
        }
        /**
         * @return Returns the idDocument.
         */
        public int getIdDocument() {
            return idDocument;
        }
        /**
         * @param idDocument The idDocument to set.
         */
        public void setIdDocument(int idDocument) {
            this.idDocument = idDocument;
        }
        /**
         * @return Returns the shortContent.
         */
        public String getShortContent() {
            return shortContent;
        }
        /**
         * @param shortContent The shortContent to set.
         */
        public void setShortContent(String shortContent) {
            this.shortContent = shortContent;
        }
        
		public void load() throws Exception{
			loadFile();
			
			DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
			
			if(this.referenceFile != 0){
				this.idDocument = this.referenceFile;
				String sql = "SELECT * FROM documents WHERE id_document = " + this.idDocument;
				dataBase.db_query(sql, false, null);
				Hashtable row = dataBase.db_fetch_array();
				
				this.author = (row.get("AUTHOR") != null)? row.get("AUTHOR").toString() : "";
				this.shortContent = (row.get("SHORT_CONTENT") != null)? row.get("SHORT_CONTENT").toString() : "";
				this.fullContent = (row.get("FULL_CONTENT") != null )? row.get("FULL_CONTENT").toString() : "";
				this.showTitle = (row.get("SHOW_TITLE") != null && Integer.parseInt(row.get("SHOW_TITLE").toString()) == 1)? true : false;
				this.showAuthor = (row.get("SHOW_AUTHOR") != null && Integer.parseInt(row.get("SHOW_AUTHOR").toString()) == 1)? true : false;
				this.titleType = (row.get("TITLE_TYPE") != null)? Integer.parseInt(row.get("TITLE_TYPE").toString()) : TEXT_TITLE;
				
			}else{
				String sql = "INSERT INTO " +
								"documents " +
								"( author, short_content, full_content, show_title, title_type, show_author, id_file) " +
								"VALUES " +
								"( '', '', '', 0, 0, 0, " + idFile + ")";
				
				Object key = dataBase.db_query(sql, false, "doc_seq");
				this.idDocument = Integer.parseInt(key.toString());
				
				/*@TODO file_reference */
				sql = " INSERT INTO file_reference ( id_file, reference_file, idiom ) values ( " + idFile + ", " + this.idDocument + ", '" + idiom + "' )";
				dataBase.db_query(sql, false, null);
			}
			
			dataBase.close();
			dataBase = null;
		}
		
		public void commit() throws Exception{
			this.commitFile();
			
			DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
			
			String sql = "UPDATE documents SET " +
							"author='" + this.author + "', " +
							"short_content='" + this.shortContent + "', " +
							"full_content = '" + this.fullContent.replaceAll( "'", "\\\\'" ) + "', " +
							"show_title = " + (this.showTitle? 1 : 0) + ", " +
							"show_author = " + (this.showAuthor? 1 : 0) + ", " +
							"title_type = " + this.titleType + " " +
							"WHERE id_document = " + this.idDocument;
			
			dataBase.db_query(sql, false, null);
			
			this.storeCache();
		}
		
		protected void storeCache() throws Exception{
			DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
			String sql = "SELECT id_file FROM search_cache WHERE id_file = " + this.idFile;
			dataBase.db_query(sql, false, null);
			Hashtable row = dataBase.db_fetch_array();
			
			if( row != null ){
				sql = "UPDATE search_cache " +
						"SET name = '" + this.name + "', " +
						"content = '" + this.shortContent + " " + this.fullContent.replaceAll( "'", "\\\\'" ) + "' " +
						"WHERE id_file = " + this.idFile;
			}else{
				sql = "INSERT INTO search_cache " +
						"( id_file, name, content ) " + 
						"VALUES " +
						"( " + this.idFile + ",  '" + this.name + "', '" + this.shortContent + " " + this.fullContent.replaceAll( "'", "\\\\'" ) + "' )";
			}
			
			dataBase.db_query(sql, false, null);
			dataBase.close();
		}
		
		protected void cleanUp() throws Exception{
		}
	}