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
 * Servlet implementation class EditDietitionProfile
 */
@WebServlet("/EditDietitionProfile")
public class EditDietitionProfile extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int did=Integer.parseInt(request.getParameter("did"));
		String dietitianName=request.getParameter("dietitianName");
		String email=request.getParameter("email");
		String mobile=request.getParameter("mobile");
		String address=request.getParameter("address");
		String joiningDate=request.getParameter("joiningDate");
		String about=request.getParameter("about");
		HttpSession session=request.getSession();
		try {
			int editProfile=DatabaseConnection.insertUpdateFromSqlQuery("update tbldietitian set dname='"+dietitianName+"',email='"+email+"',mobile='"+mobile+"',address='"+address+"',joining_date='"+joiningDate+"',about_us='"+about+"' where did='"+session.getAttribute("did")+"' and uname='"+session.getAttribute("uname")+"'");
			if(editProfile>0) {
				String message="Profile edited successfully.";
				session.setAttribute("success-message", message);
				response.sendRedirect("dietitian-profile.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
