package org.mohit.proj;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;

/**
 * Servlet implementation class login_servlet
 */
@WebServlet("/login")
public class login_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection con;
		Statement stat;
		String qry;
		ResultSet rs,rs2;
		ResultSetMetaData md;
		String username = request.getParameter("username");
		String pass = request.getParameter("pass");
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","mohit159");
			stat= con.createStatement();
			qry = "select * from QUIZ_REG where USERNAME='"+username+"' and PASS='"+pass+"'";
			rs =stat.executeQuery(qry);
			if (rs.next())
			{
				HttpSession s = request.getSession();
				s.setAttribute("user_name", username);
				String s1 = rs.getString(1);
				if (s1.equals("teacher"))
				response.sendRedirect("/online_exam/home.jsp");
				else
					response.sendRedirect("/online_exam/shome.jsp");
					
			}
			else
			{
				RequestDispatcher rd = request.getRequestDispatcher("/login.jsp?msg=Invalid username or password");
				rd.forward(request, response);
			}
			
		}
		catch(Exception e)
		{
			System.err.println(e);
		}
	}

}
