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
 * Servlet implementation class MemberFeedback
 */
@WebServlet("/MemberFeedback")
public class MemberFeedback extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int fid = 0;
		int did = 0;
		String trainerName = request.getParameter("trainerName");
		String feedback = request.getParameter("feedback");
		double rating = Double.parseDouble(request.getParameter("rating"));
		System.out.println("Ratings "+rating);
		HttpSession hs = request.getSession();

		try {
			ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tbldietitian where dname='" + trainerName + "'");
			if (resultset.next()) {
				did = resultset.getInt("did");
			}

			int addQuestion = DatabaseConnection.insertUpdateFromSqlQuery("insert into tblfeedback(fid,mid,did,uname,feedback,ratings)values('"
							+ fid + "','" + hs.getAttribute("mid") + "','" + did + "','" + hs.getAttribute("uname")
							+ "','" + feedback + "','" + rating + "')");
			if (addQuestion > 0) {
				String message = "Feedback submitted successfully.";
				hs.setAttribute("feedback", message);
				response.sendRedirect("member-feedback.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
