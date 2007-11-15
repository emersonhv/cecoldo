
package com.cms.vsystem.object;


import java.util.Hashtable;

import com.cms.dao.DataBase;
import com.cms.dao.DataBaseFactory;
import com.cms.util.IntranetProperties;
import com.cms.vsystem.File;

public class Faq extends File {
	private int idFaq;
	private String question;
	private String intro;
	private String answer;
	private String keywords;
		
	public Faq ( ) throws Exception {
		super ( );
	}
	/**
	 * @param an id for the Faq.
	 */
	public void setIdFaq ( int id ) {
		this.idFaq = id;
	}
	/**
	 * @return the id of the Faq.
	 */
	public int getIdFaq ( ) {
		return idFaq;
	}
	/**
	 * @param a question for the Faq.
	 */
	public void setQuestion ( String question ) {
		this.question = question;
	}
	/**
	 * @return the question of the Faq.
	 */
	public String getQuestion ( ) {
		return question;
	}
	/**
	 * @param a intro for the Faq.
	 */
	public void setIntro ( String intro ) {
		this.intro = intro;
	}
	/**
	 * @return the intro of the Faq.
	 */
	public String getIntro ( ) {
		return intro;
	}
	/**
	 * @param a answer for the Faq.
	 */
	public void setAnswer ( String answer ) {
		this.answer = answer;
	}
	/**
	 * @return the answer of the Faq.
	 */
	public String getAnswer ( ) {
		return answer;
	}
	/**
	 * @param a keywords for the Faq.
	 */
	public void setKeywords ( String keywords ) {
		this.keywords = keywords;
	}
	/**
	 * @return the keywords of the Faq.
	 */
	public String getKeywords ( ) {
		return keywords;
	}

	public void load ( ) throws Exception{
		loadFile ( );
        DataBase dataBase = DataBaseFactory.getInstance ( IntranetProperties.DATABASE_TYPE );
        if ( this.referenceFile != 0 ) {
        	this.idFaq = this.referenceFile;
            
            String sql = "SELECT * FROM faqs WHERE id_faq = " + this.idFaq;
			
            dataBase.db_query ( sql, false, null );
            Hashtable row = dataBase.db_fetch_array ();

            this.idFaq = Integer.parseInt ( row.get( "ID_FAQ" ).toString( ) );
            this.question = row.get( "QUESTION" ).toString( );
            this.intro = row.get( "INTRO" ).toString( );
            this.answer = row.get( "ANSWER" ).toString( );
            this.keywords = row.get( "KEYWORDS" ).toString( );
            
        }
        else	{
			String sql = "INSERT INTO faqs ( id_file, question, intro, keywords, answer ) VALUES ( " + this.idFile + ", '', '', '', '' )";
			Object key = dataBase.db_query(sql, false, "faq_seq");
			this.idFaq = Integer.parseInt(key.toString());

			sql = "UPDATE files SET reference_file=" + this.idFaq + " WHERE id_file=" + this.idFile;
			dataBase.db_query(sql, false, null);
		}
        dataBase.close();
	}
		
	public void commit ( ) throws Exception {
		this.commitFile ( );
		
		DataBase dataBase = DataBaseFactory.getInstance ( IntranetProperties.DATABASE_TYPE );
		
		String sql =	"UPDATE faqs SET " +
						"id_file = " + this.idFile + ", " +
						"question = '" + this.question + "', " +
						"intro = '" + this.intro + "', " +
						"answer = '" + this.answer + "', " +
						"keywords = '" + this.keywords + "' " +
						"WHERE id_faq = " + this.idFaq;
		
		dataBase.db_query ( sql, false, null );
		dataBase.close();
		storeCache();
	}
	
	protected void storeCache() throws Exception{}
		
	protected void cleanUp ( ) throws Exception {
		// I don't know what is this .....
	}
}