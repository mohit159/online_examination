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
 * Servlet implementation class signup_servlet
 */
@WebServlet("/signup")
public class signup_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection con;
		Statement stat;
		ResultSet rs;
		String cat = request.getParameter("cat");
		String username = request.getParameter("user_name");
		String pass = request.getParameter("pass");
		String pass2 = request.getParameter("pass2");
		String sex = request.getParameter("gender");
		String email = request.getParameter("email");
		try
		{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","mohit159");
				stat = con.createStatement();
				String qr = "select * from QUIZ_REG where USERNAME='"+username+"'";
				rs = stat.executeQuery(qr);
				if(rs.next())
				{
					RequestDispatcher rd = request.getRequestDispatcher("/login.jsp?ms=Username is not available");
					rd.forward(request, response);
				}
				else
				{
					String qry = "insert into QUIZ_REG values ('"+cat+"','"+username+"','"+pass+"','"+email+"','"+sex+"')";
					stat.executeUpdate(qry);
					String s="/online_exam/congo.jsp?cat="+cat;
					response.sendRedirect(s);
				}
		}
		catch(Exception e)
		{
			System.err.println(e);
		}
		
	}

}
