package org.mohit.proj;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class next_que
 */
@WebServlet("/next")
public class next_que extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection con;
		Statement stat;
		String qry;
		String ques = request.getParameter("ques");
		String opta = request.getParameter("opta");
		String optb = request.getParameter("optb");
		String optc = request.getParameter("optc");
		String optd = request.getParameter("optd");
		String ca = request.getParameter("ca");
		String exp = request.getParameter("exp");
		String name = (String)request.getSession().getAttribute("name");
		String s = (String)request.getSession().getAttribute("i");
		int i = (int)Integer.parseInt(s);
		int no = Integer.parseInt(request.getSession().getAttribute("qno").toString());
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","mohit159");
				stat= con.createStatement();
				qry = "insert into QUIZ_QUES values ('"+name+"',"+i+",'"+ques+"','"+opta+"','"+optb+"','"+optc+"','"+optd+"','"+ca+"','"+exp+"')";
				stat.executeUpdate(qry);
				i++;
				String si = Integer.toString(i);
				request.getSession().setAttribute("i", si);
				RequestDispatcher rd = request.getRequestDispatcher("/add_que.jsp");
				rd.forward(request, response);
			}
			catch(Exception e)
			{
				System.err.println(e);
			}
	}

}
