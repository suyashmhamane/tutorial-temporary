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
 * Servlet implementation class EditTrainerDietPlan
 */
@WebServlet("/EditTrainerDietPlan")
public class EditTrainerDietPlan extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int dpid=Integer.parseInt(request.getParameter("dpid"));
		String dietPlanType=request.getParameter("dietPlanType");
		String morning=request.getParameter("morning");
		String afternoon=request.getParameter("afternoon");
		String evening=request.getParameter("evening");
		String night=request.getParameter("night");
		String note=request.getParameter("note");
		String dos=request.getParameter("do");
		String dont=request.getParameter("dont");
		HttpSession hs=request.getSession();
		try {
			int editDietPlan=DatabaseConnection.insertUpdateFromSqlQuery("update tbldietplan set morning='"+morning+"',afternoon='"+afternoon+"',evening='"+evening+"',night='"+night+"',notes='"+note+"',dos='"+dos+"',dont='"+dont+"',diet_plan_type='"+dietPlanType+"' where dpid='"+dpid+"' and uname='"+hs.getAttribute("uname")+"'");
			if(editDietPlan>0) {
				String message="Diet plan edited";
				hs.setAttribute("diet-edit", message);
				response.sendRedirect("view-assigned-plans-to-members.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
