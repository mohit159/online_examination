package org.mohit.proj;

import java.io.IOException;
import java.sql.DriverManager;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;

/**
 * Servlet implementation class que_servlet
 */
@WebServlet("/que")
public class que_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Connection con;
		Statement stat;
		ResultSet rs;
		String username = (String)request.getSession().getAttribute("user_name");
		String category = request.getParameter("category");
		String name = request.getParameter("test_name");
		String no = request.getParameter("no_que");
		int qno = Integer.parseInt(no);
		String i="1";
		request.getSession().setAttribute("qno", qno);
		request.getSession().setAttribute("i", i);
		request.getSession().setAttribute("name", name);
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","mohit159");
			stat= con.createStatement();
			String qry = "select * from QUIZ_NAME where name='"+name+"'";
			rs = stat.executeQuery(qry);
			if (rs.next())
			{
				RequestDispatcher rd = request.getRequestDispatcher("/home.jsp?msg=QUIZ NAME NOT AVAILABLE");
				rd.forward(request, response);
			}
			else
			{
				String qry2 = "insert into QUIZ_NAME values ('"+username+"','"+category+"','"+name+"','"+no+"')";
				stat.executeUpdate(qry2);
				response.sendRedirect("/online_exam/add_que.jsp");
			}
		}
		catch(Exception e)
		{
			System.err.println(e);
		}
	}

}
