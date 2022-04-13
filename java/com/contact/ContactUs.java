package com.contact;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class ContactUs
 */
@WebServlet("/ContactUs")
public class ContactUs extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=0;
		HttpSession hs=request.getSession();
		String fullName=request.getParameter("fullname");
		String email=request.getParameter("email");
		String mobile=request.getParameter("mobile");
		String message=request.getParameter("message");
		try {
			int help=DatabaseConnection.insertUpdateFromSqlQuery("insert into tblcontact(contact_id,name,email,mobile,message)values('"+id+"','"+fullName+"','"+email+"','"+mobile+"','"+message+"')");
			if(help>0) {
				String messages="Thanks for contacting us! We will get in touch with you.";
				hs.setAttribute("messages", messages);
				response.sendRedirect("index.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
