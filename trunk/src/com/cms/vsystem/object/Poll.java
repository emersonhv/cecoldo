package com.cms.vsystem.object;


import java.util.Hashtable;
import java.util.Vector;

import com.cms.dao.DataBase;
import com.cms.dao.DataBaseFactory;
import com.cms.util.IntranetProperties;
import com.cms.vsystem.File;

public class Poll extends File{
		private int idPoll;
		private String text;
		private String question;
		private Vector answers;
		private int totalAnswer;
		
		public Poll() throws Exception{
		    super();
		    
			this.totalAnswer = 0;
			this.answers = new Vector();
		}

		 /**
         * @return Returns the answers.
         */
        public Vector getAnswers() {
            return answers;
        }
        /**
         * @param answers The answers to set.
         */
        public void setAnswers(Vector answers) {
            this.answers = answers;
        }
        /**
         * @return Returns the idPoll.
         */
        public int getIdPoll() {
            return idPoll;
        }
        /**
         * @param idPoll The idPoll to set.
         */
        public void setIdPoll(int idPoll) {
            this.idPoll = idPoll;
        }
        /**
         * @return Returns the question.
         */
        public String getQuestion() {
            return question;
        }
        /**
         * @param question The question to set.
         */
        public void setQuestion(String question) {
            this.question = question;
        }
        /**
         * @return Returns the text.
         */
        public String getText() {
            return text;
        }
        /**
         * @param text The text to set.
         */
        public void setText(String text) {
            this.text = text;
        }
        /**
         * @return Returns the totalAnswer.
         */
        public int getTotalAnswer() {
            return totalAnswer;
        }
        /**
         * @param totalAnswer The totalAnswer to set.
         */
        public void setTotalAnswer(int totalAnswer) {
            this.totalAnswer = totalAnswer;
        }
        
        public int getCountAnswers(){
			return this.answers.size();
		}
		
		public PollAnswer getAnswerAt(int index){
			return (PollAnswer)answers.get(index);
		}
		
		public void addAnswer(String answer){
			PollAnswer ans = new PollAnswer();
			ans.setIdPoll(this.idPoll);
			ans.setAnswer(answer);
			
			this.answers.addElement(ans);
		}
		
		public void delAnswer(int idAnswer) throws Exception{
			Vector tmp = new Vector();
			for(int i = 0; i < this.answers.size(); i++ ){
				if(((PollAnswer)this.answers.get(i)).getIdAnswer() != idAnswer)
					tmp.addElement(this.answers.get(i));
			}
			
			this.answers = tmp;
			
			DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
			String sql = "DELETE FROM poll_answer WHERE id_poll_answer = " + idAnswer;
			dataBase.db_query(sql, false, null);
			dataBase.close();
			dataBase = null;
		}
		
		public void replaceAnswer(PollAnswer ans){
			for(int i = 0; i < this.answers.size(); i++){
				if(((PollAnswer)this.answers.get(i)).getIdAnswer() == ans.getIdAnswer())
					this.answers.set(i, ans);
			}
		}
		
		public void load() throws Exception{
			this.loadFile();
			
			DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
			if(this.referenceFile != 0){
				this.idPoll = this.referenceFile;
				String sql = "SELECT * FROM poll WHERE id_poll = " + this.idPoll;
				dataBase.db_query(sql, false, null);
				Hashtable row = dataBase.db_fetch_array();
				
				this.text = (row.get("TEXT") != null)? (String)row.get("TEXT") : "";
				this.question = (row.get("QUESTION") != null)? (String)row.get("QUESTION") : "";
				this.loadAnswers();
			}else{
				String sql = "INSERT INTO " +
								"poll " +
								"( id_poll, text, question, id_file) " +
								"VALUES " +
								"( ?, '', '', " + idFile + ")";
				
				Object key = dataBase.db_query(sql, false, "poll_seq");
				this.idPoll = Integer.parseInt(key.toString());
				
				sql = "UPDATE files SET reference_file=" + this.idPoll + " WHERE id_file = " + this.idFile;
				dataBase.db_query(sql, false, null);
			}
			dataBase.close();
			dataBase = null;
		}
		
		
		public void loadAnswers() throws Exception{
		    DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
		    
			String sql = "SELECT id_poll_answer, answer, value " +
							"FROM poll_answer " +
							"WHERE id_poll = " + this.idPoll;
							
			dataBase.db_query(sql, false, null);
			this.totalAnswer = 0;
			Hashtable row;
			
			while((row = dataBase.db_fetch_array()) != null){
				PollAnswer ans = new PollAnswer();
				ans.setIdAnswer(Integer.parseInt(row.get("ID_POLL_ANSWER").toString()));
				ans.setIdPoll(this.idPoll);
				ans.setAnswer((String)row.get("ANSWER"));
				ans.setValue(Integer.parseInt(row.get("VALUE").toString()));
				this.totalAnswer += ans.getValue();
				
				this.answers.addElement(ans);
			}
			
			dataBase.close();
			dataBase = null;
		}
		
		public void commit() throws Exception{
			this.commitFile();
			
			DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
			
			String sql = "UPDATE poll SET " +
									"text='" + this.text + "', " +
									"question='" + this.question + "' " +
									"WHERE id_poll = " + this.idPoll;
					
			dataBase.db_query(sql, false, null);
			dataBase.close();
			dataBase = null;
			
			for(int i = 0; i < this.answers.size(); i++){
				this.getAnswerAt(i).commit();
			}
			storeCache();
		}
	
		protected void storeCache() throws Exception{}
		
		protected void cleanUp() throws Exception{
		}
		
		public boolean isUserSurveyAnswered(int idUser){
		    if(idUser != 0){
		        try{
			        DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
			        
			        String sql = "SELECT id_user " +
								"FROM poll_answered " +
								"WHERE id_user = " + idUser + " AND id_poll = " + idFile;
			        
			        dataBase.db_query(sql, false, null);
			        Hashtable row = dataBase.db_fetch_array();
			        
			        dataBase.close();
			        dataBase = null;
			        
			        return (row != null)? true : false;
		    	}catch(Exception e){
		    	    return false;
		    	}
		    }else
		        return false;
	    }
}