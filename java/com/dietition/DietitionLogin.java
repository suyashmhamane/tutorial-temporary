package com.dietition;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Random;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class DietitionLogin
 */
@WebServlet("/DietitionLogin")
public class DietitionLogin extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uname = request.getParameter("uname");
		String upass = request.getParameter("upass");
		String vercode = request.getParameter("vercode");
		String captchaDB = null;
		try {
			String tokens = UUID.randomUUID().toString();
			Random random = new Random();
			int newRandomCaptcha = random.nextInt(9000) + 10000;
			HttpSession hs = request.getSession();
			Connection con = DatabaseConnection.getConnection();
			Statement st = con.createStatement();
			ResultSet captchResultSet = DatabaseConnection.getResultFromSqlQuery("select * from tblcaptcha");
			if (captchResultSet.next()) {
				captchaDB = captchResultSet.getString(1);
			}
			if (captchaDB.equals(vercode)) {
				ResultSet resultset = st.executeQuery("select * from tbldietitian where uname='" + uname + "' and upass='" + upass + "'");
				if (resultset.next()) {
					if (resultset.getInt("status") == 1) {
						hs.setAttribute("did", resultset.getString("did"));
						hs.setAttribute("uname", resultset.getString("uname"));
						hs.setAttribute("dname", resultset.getString("dname"));
						int update = DatabaseConnection.insertUpdateFromSqlQuery("update tblcaptcha set captcha='" + newRandomCaptcha + "'");
						response.sendRedirect("dietitian-dashboard.jsp");
					} else {
						String message = "Account not activated please inform admin to activate account.";
						hs.setAttribute("account-activation", message);
						int update = DatabaseConnection.insertUpdateFromSqlQuery("update tblcaptcha set captcha='" + newRandomCaptcha + "'");
						response.sendRedirect("dietitian-login.jsp");
					}

				} else {
					String message = "You have enter wrong credentials";
					hs.setAttribute("credential", message);
					int update = DatabaseConnection.insertUpdateFromSqlQuery("update tblcaptcha set captcha='" + newRandomCaptcha + "'");
					response.sendRedirect("dietitian-login.jsp");
				}
			} else {
				String message = "You have enter invalid verification code";
				hs.setAttribute("verificationCode", message);
				int update = DatabaseConnection
						.insertUpdateFromSqlQuery("update tblcaptcha set captcha='" + newRandomCaptcha + "'");
				response.sendRedirect("dietitian-login.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
