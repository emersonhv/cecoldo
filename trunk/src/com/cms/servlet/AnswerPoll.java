/*
 * Created on 13/02/2005
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.cms.servlet;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cms.security.Session;
import com.cms.util.IntranetProperties;
import com.cms.vsystem.object.Poll;
import com.cms.vsystem.object.PollAnswer;

/**
 * @author jun
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class AnswerPoll extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
	    if(request.getParameter("idFile") != null){
	        try{
	            if(request.getParameter("answerSelected") != null){
	                Poll poll = new Poll();
	                poll.setIdFile(Integer.parseInt(request.getParameter("idFile")));
	                poll.load();
	                PollAnswer pAnswer = new PollAnswer();
	                pAnswer.setIdPoll(poll.getIdPoll());
	                pAnswer.setIdAnswer(Integer.parseInt(request.getParameter("answerSelected")));
	                pAnswer.load();
	                pAnswer.setValue(pAnswer.getValue() + 1);
	                pAnswer.commit();
	                
	                ((Session)request.getSession().getAttribute("sessionApp")).registerUserSurvey(Integer.parseInt(request.getParameter("idFile")));
	                response.sendRedirect(IntranetProperties.INTRA_BASE_URL + "index.jsp");
	            }
	        }catch(Exception e){
	            e.printStackTrace();
	        }
	    }
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		doGet(request, response);
	}
}
