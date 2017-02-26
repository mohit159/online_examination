<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import = "java.sql.*"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%!
	Connection con;
	Statement stat;
	ResultSet rs;
%>
<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","mohit159");
	stat = con.createStatement();
	rs = stat.executeQuery("select * from QUIZ_REG");
%>
<center>
<%
    while(rs.next())
    {
    	out.println("<table>");
    	out.println("<tr>");
        out.println("<td>");
        out.println(rs.getString("EMAIL"));
        out.println("</td>");
        out.println("</tr>");
        out.println("<tr>");
        out.println("<td>");
        out.print("<input type=\"radio\" name=\"gender\" value=\"male\">");
        out.println(rs.getString("PASSWORD"));
        out.println("</td>");
        out.println("</tr>");
        out.println("<table>");
    }
	
%>
</body>
</html>