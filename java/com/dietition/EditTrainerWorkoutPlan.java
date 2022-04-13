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
 * Servlet implementation class EditTrainerWorkoutPlan
 */
@WebServlet("/EditTrainerWorkoutPlan")
public class EditTrainerWorkoutPlan extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int wid=Integer.parseInt(request.getParameter("wid"));
		String morning=request.getParameter("morning");
		String evening=request.getParameter("evening");
		String notes=request.getParameter("notes");
		HttpSession hs=request.getSession();
		
		try {
			int editDietPlan=DatabaseConnection.insertUpdateFromSqlQuery("update tblworkout set morning='"+morning+"',evening='"+evening+"',notes='"+notes+"' where wid='"+wid+"' and uname='"+hs.getAttribute("uname")+"'");
			if(editDietPlan>0) {
				String message="Workout plan edited";
				hs.setAttribute("workout-edit", message);
				response.sendRedirect("view-assigned-plans-to-members.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
