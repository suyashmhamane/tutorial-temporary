package com.dietition;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class QuestionAnswerToMembers
 */
@WebServlet("/QuestionAnswerToMembers")
public class QuestionAnswerToMembers extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession hs = request.getSession();
		int qid = Integer.parseInt(request.getParameter("qid"));
		String questionStatus = "Resolved";
		String questionAnswer = request.getParameter("questionAnswer");
		int i = DatabaseConnection.insertUpdateFromSqlQuery("update askquestions set answer='" + questionAnswer + "',status='"+questionStatus+"' where qid='" + qid + "'");
		if (i > 0) {
			String message = "Answer submitted successfully.";
			hs.setAttribute("success", message);
			response.sendRedirect("view-member-questions.jsp");
		}

	}

}
