package com.member;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class MemberChangePassword
 */
@WebServlet("/MemberChangePassword")
public class MemberChangePassword extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cpassword = request.getParameter("cpassword");
		String password = request.getParameter("password");
		String confpass = request.getParameter("confpass");
		String pass = "";
		HttpSession session = request.getSession();
		try {
			Connection con = DatabaseConnection.getConnection();
			Statement statement = con.createStatement();
			ResultSet resultset = statement.executeQuery("select upass from tblmembers where upass='" + cpassword+ "' and uname='" + session.getAttribute("uname") + "'");
			if (resultset.next()) {
				pass = resultset.getString(1);
			}
			if (password.equals(confpass)) {
				if (pass.equals(cpassword)) {
					int i = statement.executeUpdate("update tblmembers set upass='" + password + "' where uname='" + session.getAttribute("uname") + "' ");
					String message = "Password change successfully.";
					session.setAttribute("password-change-success", message);
					response.sendRedirect("member-change-password.jsp");
				} else {
					String message = "Old password does not match.";
					session.setAttribute("password-change-fail", message);
					response.sendRedirect("member-change-password.jsp");
				}
			} else {
				String message = "New password and confirm password does not match.";
				session.setAttribute("password-not-match", message);
				response.sendRedirect("member-change-password.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
