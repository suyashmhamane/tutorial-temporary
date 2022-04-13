package com.member;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class AskQuestionToTrainer
 */
@WebServlet("/AskQuestionToTrainer")
public class AskQuestionToTrainer extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int questionId = DatabaseConnection.generateQuestionId();
		int did = 0;
		String status="Pending";
		String answer=" ";
		String trainerName = request.getParameter("trainerName");
		String question = request.getParameter("question");
		HttpSession hs=request.getSession();
		try {
			ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tbldietitian where dname='" + trainerName + "'");
			if (resultset.next()) {
				did = resultset.getInt("did");
			}
			
			int addQuestion=DatabaseConnection.insertUpdateFromSqlQuery("insert into askquestions(qid,question,answer,did,mid,uname,status)values('"+questionId+"','"+question+"','"+answer+"','"+did+"','"+hs.getAttribute("mid")+"','"+hs.getAttribute("uname")+"','"+status+"')");
			if(addQuestion>0) {
				String message="Question submitted successfully.";
				hs.setAttribute("question", message);
				response.sendRedirect("member-questions-to-dietitian.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
