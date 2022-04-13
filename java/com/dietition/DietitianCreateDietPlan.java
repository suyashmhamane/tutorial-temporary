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
 * Servlet implementation class DietitianCreateDietPlan
 */
@WebServlet("/DietitianCreateDietPlan")
public class DietitianCreateDietPlan extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int dietPlanId=0;
		String trainerName=null;
		String dietPlanType=request.getParameter("dietPlanType");
		String morning=request.getParameter("morning");
		String afternoon=request.getParameter("afternoon");
		String evening=request.getParameter("evening");
		String night=request.getParameter("night");
		String note=request.getParameter("note");
		String doo=request.getParameter("do");
		String dont=request.getParameter("dont");
		String memberName=request.getParameter("memberName");
		HttpSession hs=request.getSession();
		try {
			ResultSet rs=DatabaseConnection.getResultFromSqlQuery("select * from tbldietitian where uname='"+hs.getAttribute("uname")+"'");
			if(rs.next()) {
				trainerName=rs.getString("dname");
			}
			
			int createDietitianPlan=DatabaseConnection.insertUpdateFromSqlQuery("insert into tbldietplan(dpid,morning,afternoon,evening,night,notes,dos,dont,diet_plan_type,trainer_name,uname,member_name)values('"+dietPlanId+"','"+morning+"','"+afternoon+"','"+evening+"','"+night+"','"+note+"','"+doo+"','"+dont+"','"+dietPlanType+"','"+trainerName+"','"+hs.getAttribute("uname")+"','"+memberName+"')");
			if(createDietitianPlan>0) {
				String message="Diet plan assigned";
				hs.setAttribute("diet-plan", message);
				response.sendRedirect("trainer-diet-plan.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
