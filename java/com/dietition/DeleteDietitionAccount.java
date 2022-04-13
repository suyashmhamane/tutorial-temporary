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
 * Servlet implementation class DeleteDietitionAccount
 */
@WebServlet("/DeleteDietitionAccount")
public class DeleteDietitionAccount extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int did = Integer.parseInt(request.getParameter("did"));
		HttpSession session = request.getSession();
		int deleteDietition = DatabaseConnection.insertUpdateFromSqlQuery("delete from tbldietitian where did='" + did + "'");
		if (deleteDietition > 0) {
			String message = "Dietition deleted successfully.";
			session.setAttribute("delete-action", message);
			response.sendRedirect("admin-view-dietitions.jsp");
		}
	}

}
