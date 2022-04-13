package com.connection;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class DatabaseConnection {

	public static Connection connection;

	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/dws?useSSL=false", "root", "root123");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (connection);
	}

	public static void CloseConnection() {
		if (connection != null) {
			try {
				connection.close();
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		}
	}

	public static ResultSet getResultFromSqlQuery(String SqlQueryString) {
		ResultSet rs = null;
		try {
			if (connection == null) {
				getConnection();
			}
			rs = connection.createStatement().executeQuery(SqlQueryString);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return rs;
	}

	public static int insertUpdateFromSqlQuery(String SqlQueryString) {
		int i = 2;
		try {
			if (connection == null) {
				getConnection();
			}
			i = connection.createStatement().executeUpdate(SqlQueryString);

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return i;
	}
	
	public static int generateMemberId() {
		int mid = 0;
		Random random=new Random();
		mid = random.nextInt((9999 - 100) + 1) + 10;
		System.out.println("Member Id " + mid);
		return mid;
	}
	
	public static int generateDietitianId() {
		int did = 0;
		Random random=new Random();
		did = random.nextInt((9999 - 100) + 1) + 10;
		System.out.println("Dietation Id " + did);
		return did;
	}
	
	public static int generateQuestionId() {
		int qid = 0;
		Random random=new Random();
		qid = random.nextInt((9999 - 100) + 1) + 10;
		System.out.println("Question Id " + qid);
		return qid;
	}
	
}
