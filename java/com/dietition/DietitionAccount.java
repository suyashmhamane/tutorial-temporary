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
 * Servlet implementation class DietitionAccount
 */
@WebServlet("/DietitionAccount")
public class DietitionAccount extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int status=0;
		int did=Integer.parseInt(request.getParameter("did"));
		String dName=request.getParameter("dName");
		String email=request.getParameter("email");
		String mobile=request.getParameter("mobile");
		String uname=request.getParameter("uname");
		String upass=request.getParameter("upass");
		String address=request.getParameter("address");
		String joiningDate=request.getParameter("joiningDate");
		String about=request.getParameter("about");
		HttpSession session=request.getSession();
		
		try {
			int addDietition=DatabaseConnection.insertUpdateFromSqlQuery("insert into tbldietitian(did,dname,mobile,email,address,joining_date,uname,upass,status,about_us)values('"+did+"','"+dName+"','"+mobile+"','"+email+"','"+address+"','"+joiningDate+"','"+uname+"','"+upass+"','"+status+"','"+about+"')");
			
			if(addDietition>0) {
				String message="Request send to admin for add account.";
				session.setAttribute("message", message);
				response.sendRedirect("dietitian-account.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
