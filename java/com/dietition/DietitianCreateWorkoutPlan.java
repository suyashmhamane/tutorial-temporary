package com.dietition;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class DietitianCreateWorkoutPlan
 */
@WebServlet("/DietitianCreateWorkoutPlan")
public class DietitianCreateWorkoutPlan extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int workoutPlanId=0;
		String trainerName=null;
		String morning=request.getParameter("morning");
		String evening=request.getParameter("evening");
		String note=request.getParameter("notes");
		String memberName=request.getParameter("memberName");
		HttpSession hs=request.getSession();
		
		try {
			ResultSet rs=DatabaseConnection.getResultFromSqlQuery("select * from tbldietitian where uname='"+hs.getAttribute("uname")+"'");
			if(rs.next()) {
				trainerName=rs.getString("dname");
			}
	
			int createDietitianPlan=DatabaseConnection.insertUpdateFromSqlQuery("insert into tblworkout(wid,morning,evening,notes,trainer_name,uname,member_name)values('"+workoutPlanId+"','"+morning+"','"+evening+"','"+note+"','"+trainerName+"','"+hs.getAttribute("uname")+"','"+memberName+"')");
			if(createDietitianPlan>0) {
				String message="Workout plan assigned.";
				hs.setAttribute("workout-plan", message);
				response.sendRedirect("trainer-workout-plan.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
