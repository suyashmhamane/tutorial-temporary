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
 * Servlet implementation class MemberAccount
 */
@WebServlet("/MemberAccount")
public class MemberAccount extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int mid=Integer.parseInt(request.getParameter("mid"));
		String memberName=request.getParameter("memberName");
		String gender=request.getParameter("gender");
		String age=request.getParameter("age");
		String address=request.getParameter("address");
		String email=request.getParameter("email");
		String mobile=request.getParameter("mobile");
		double height=Double.parseDouble(request.getParameter("height"));
		double weight=Double.parseDouble(request.getParameter("weight"));
		String joiningDate=request.getParameter("joiningDate");
		String trainerName=request.getParameter("trainerName");
		String uname=request.getParameter("uname");
		String upass=request.getParameter("upass");
		double h= height/100;
		double bmi=weight/(h*h);
		HttpSession session=request.getSession();
		
		int addMember=DatabaseConnection.insertUpdateFromSqlQuery("insert into tblmembers(mid,member_name,gender,age,address,email,mobile,height,weight,bmi,joining_date,uname,upass,trainer_name)values('"+mid+"','"+memberName+"','"+gender+"','"+age+"','"+address+"','"+email+"','"+mobile+"','"+height+"','"+weight+"','"+bmi+"','"+joiningDate+"','"+uname+"','"+upass+"','"+trainerName+"')");
		if(addMember>0) {
			String message="Member account created successfully.";
			session.setAttribute("success-message", message);
			response.sendRedirect("member-account.jsp");
		}
	}

}
