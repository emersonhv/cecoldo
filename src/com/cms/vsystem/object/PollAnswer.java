package com.cms.vsystem.object;


import java.util.Hashtable;

import com.cms.dao.DataBase;
import com.cms.dao.DataBaseFactory;
import com.cms.util.IntranetProperties;

public class PollAnswer {
    private int idPollAnswer;
    private int idPoll;
    private String answer;
    private int value;

    /**
     * @return Returns the answer.
     */
    public String getAnswer() {
        return answer;
    }

    /**
     * @param answer
     *            The answer to set.
     */
    public void setAnswer(String answer) {
        this.answer = answer;
    }

    /**
     * @return Returns the idPollAnswer.
     */
    public int getIdAnswer() {
        return idPollAnswer;
    }

    /**
     * @param idPollAnswer
     *            The idPollAnswer to set.
     */
    public void setIdAnswer(int idPollAnswer) {
        this.idPollAnswer = idPollAnswer;
    }

    /**
     * @return Returns the idSurvey.
     */
    public int getIdPoll() {
        return idPoll;
    }

    /**
     * @param idSurvey
     *            The idSurvey to set.
     */
    public void setIdPoll(int idPoll) {
        this.idPoll = idPoll;
    }

    /**
     * @return Returns the value.
     */
    public int getValue() {
        return value;
    }

    /**
     * @param value
     *            The value to set.
     */
    public void setValue(int value) {
        this.value = value;
    }

    public void load() throws Exception {
        if (this.idPollAnswer != 0) {
            DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);
            
            String sql = "SELECT id_poll, answer, value " +
            				"FROM poll_answer " +
            				"WHERE id_poll_answer = " + this.idPollAnswer;
            
            dataBase.db_query(sql, false, null);
            Hashtable row = dataBase.db_fetch_array();

            this.idPoll = Integer.parseInt(row.get("ID_POLL").toString());
            this.answer = row.get("ANSWER").toString();
            this.value = Integer.parseInt(row.get("VALUE").toString());
            
            dataBase.close();
            dataBase = null;
        }
    }

    public void commit() throws Exception {
        DataBase dataBase = DataBaseFactory.getInstance(IntranetProperties.DATABASE_TYPE);

        String sql = "";

        if (this.idPollAnswer != 0) {
            sql = "UPDATE poll_answer SET " + "answer='" + this.answer + "', "
                    + "value= " + this.value + " " + " WHERE id_poll_answer = "
                    + this.idPollAnswer;

            dataBase.db_query(sql, true, null);
        } else {
            sql = "INSERT INTO poll_answer " + 
            		"( id_poll_answer, id_poll, answer, value) " + 
            		"VALUES " + 
            		"( ?, " + this.idPoll + ", '" + this.answer
                    + "', 0)";

            Object key = dataBase.db_query(sql, false, "poll_seq");
            this.idPollAnswer = Integer.parseInt(key.toString());
        }
        
        dataBase.close();
        dataBase = null;
    }
}