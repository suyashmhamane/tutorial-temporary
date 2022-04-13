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
 * Servlet implementation class EditMemberProfile
 */
@WebServlet("/EditMemberProfile")
public class EditMemberProfile extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mid=Integer.parseInt(request.getParameter("mid"));
		String mname=request.getParameter("memberName");
		String email=request.getParameter("email");
		String mobile=request.getParameter("mobile");
		String address=request.getParameter("address");
		int age=Integer.parseInt(request.getParameter("age"));
		double height=Double.parseDouble(request.getParameter("height"));
		double weight=Double.parseDouble(request.getParameter("weight"));
		String joiningDate=request.getParameter("joiningDate");
		String trainerName=request.getParameter("trainerName");
		double h= height/100;
		double bmi=weight/(h*h); //weight in killogram and height is in centimeters.
		HttpSession session=request.getSession();
		try {
			int editProfile=DatabaseConnection.insertUpdateFromSqlQuery("update tblmembers set email='"+email+"',mobile='"+mobile+"',address='"+address+"',age='"+age+"',height='"+height+"',weight='"+weight+"',bmi='"+bmi+"',joining_date='"+joiningDate+"',trainer_name='"+trainerName+"' where mid='"+session.getAttribute("mid")+"' and uname='"+session.getAttribute("uname")+"'");
			if(editProfile>0) {
				String message="Profile edited successfully.";
				session.setAttribute("success-message", message);
				response.sendRedirect("member-profile.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
