package com.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class DeleteMemberAccount
 */
@WebServlet("/DeleteMemberAccount")
public class DeleteMemberAccount extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mid = Integer.parseInt(request.getParameter("mid"));
		HttpSession session = request.getSession();
		int deleteDietition = DatabaseConnection.insertUpdateFromSqlQuery("delete from tblmembers where mid='" + mid + "'");
		if (deleteDietition > 0) {
			String message = "Member deleted successfully.";
			session.setAttribute("delete-action", message);
			response.sendRedirect("admin-view-members.jsp");
		}
	}
}
