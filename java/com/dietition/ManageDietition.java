package com.dietition;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.connection.DatabaseConnection;
import java.sql.*;

/**
 * Servlet implementation class ManageDietition
 */
@WebServlet("/ManageDietition")
public class ManageDietition extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int statusMode = 0;
			ResultSet rs = DatabaseConnection.getResultFromSqlQuery("select status from tblDietitian where did='" + request.getParameter("did") + "'");
			while (rs.next()) {
				if (rs.getInt(1) == 1) {
					statusMode = DatabaseConnection.insertUpdateFromSqlQuery("update tblDietitian set status=0 where did='" + request.getParameter("did") + "'");
				} else {
					statusMode = DatabaseConnection.insertUpdateFromSqlQuery("update tblDietitian set status=1 where did='" + request.getParameter("did") + "'");
				}
			}
			if (statusMode > 0) {
				response.sendRedirect("admin-view-dietitions.jsp");
			} else {
				response.sendRedirect("admin-view-dietitions.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
