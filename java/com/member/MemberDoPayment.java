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
 * Servlet implementation class MemberDoPayment
 */
@WebServlet("/MemberDoPayment")
public class MemberDoPayment extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int paymentId=0;
		String memberName=request.getParameter("mname");
		String card_holder_name = request.getParameter("dholderName");
		String cardNumber = request.getParameter("cardNumber");
		String emonth = request.getParameter("emonth");
		String eyear = request.getParameter("eyear");
		String expiration_month_year = emonth + " " + eyear;
		String payment = request.getParameter("charges");
		int cvv = Integer.parseInt(request.getParameter("cvv"));
		String status="Payment Done";
		HttpSession hs=request.getSession();
		
		int doPayment=DatabaseConnection.insertUpdateFromSqlQuery("insert into tblpayment(pid,payment,card_holder_name,debit_card_number,expiration_month_year,cvv,member_name,status)values('"+paymentId+"','"+payment+"','"+card_holder_name+"','"+cardNumber+"','"+expiration_month_year+"','"+cvv+"','"+memberName+"','"+status+"')");
		if(doPayment>0) {
			String message="Payment done successfully.";
			hs.setAttribute("payment", message);
			response.sendRedirect("member-do-payment.jsp");	
		}
	}

}
