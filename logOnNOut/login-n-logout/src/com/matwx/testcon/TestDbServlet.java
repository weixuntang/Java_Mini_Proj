package com.matwx.testcon;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TestDbServlet
 */
@WebServlet("/TestDbServlet")
public class TestDbServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	public TestDbServlet() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// Set Up Connection Variables.

		String user = "matwx";
		String pass = "******";

		String jdbcUrl = "jdbc:mysql://localhost:3306/login-n-logout?useSSL=false";
		String driver = "com.mysql.cj.jdbc.Driver";

		// get connection to database
		try {
			PrintWriter out = response.getWriter();
			
			out.println("Connecting to database " + jdbcUrl);
			
			Class.forName(driver);
			
			Connection myConn = DriverManager.getConnection(jdbcUrl, user, pass);
			
			out.println("Success?");
			
			myConn.close();
		} catch (Exception exc) {
			exc.printStackTrace();
			throw new ServletException(exc);
		}
	}

}
