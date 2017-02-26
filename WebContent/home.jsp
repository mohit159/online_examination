<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%@ include file="conn.jsp" %>
<%! String msg;%>
<%
	msg = request.getParameter("msg");
	if (msg==null)
		msg="";
	if (request.getSession().getAttribute("user_name")==null)
	{
		response.sendRedirect("/online_exam/login.jsp");
	}
%>
<body>
<div style="background-color:blue; 
			height:150px; 
			width:100%;
			z-index:1;
			position:fixed;
			top:0px;
			left:0px;"
>
<a href="/online_exam/logout.jsp" style="color:white; margin-left:1200px; margin-top:60px; position:fixed;">LOGOUT</a>
<p style="font-style:italic; font-size:70px; color:white; margin-left:450px; margin-top:5px; letter-spacing:10px; ">Online Test</p>
<form action="que" method="post">
</div>
<div style="background-color:gray; 
			height:585px; 
			width:100%;
			z-index:2;
			position:fixed;
			top:85px;
			left:0px;
			bottom:0px;"
>
<p style="margin-left:1050px; margin-top:30px; color:white; font-size:20px;"><b>Hello <%=request.getSession().getAttribute("user_name")%></b></p>
<p style="margin-left:50px; margin-top:30px; color:red; font-size:20px;"><b><%=msg%></p>
<div style="position:fixed;
			margin-left:100px;">
<p style="color:white; font-size:25px; margin-left:50px;"><b>Your previous Tests</p>
<table border=0 width=180% cellpadding=5 cellspacing=5>
<tr bgcolor=#aaaaaa>
<th>S.NO
<%
	String s = "select * from QUIZ_NAME where username='"+request.getSession().getAttribute("user_name")+"'";
	rs = stat.executeQuery(s);
	md = rs.getMetaData();
	int n = md.getColumnCount();
	for (int i=2;i<=n;i++)
	{
		out.println("<th>"+md.getColumnLabel(i));
	}
	int c=0;
	while(rs.next())
	{
		c++;
		out.println("<tr bgcolor=#dddddd>");
		out.println("<td>"+c);
		for(int i=2; i<=n; i++)
		{
			out.println( "<td >" + rs.getString(i) );
		}
	}
%>
</table>
</div>
<div style="margin-left:850px;
			position:fixed;
			margin-top:0px;"
>
<p style="color:white; font-size:25px; margin-left:0px;"><b>Create a new Tests</p>
<p style="margin-left:0px; margin-top:30px; color:white; font-size:20px;"><b>Select a category:</b></p>
<select name="category">
<option value="biology">Biology</option>
<option value="biology">Physics</option>
<option value="biology">Mathematics</option>
</select>
<p style="margin-left:0px; margin-top:30px; color:white; font-size:20px;"><b>Enter Test name:</b></p>
<input type="text" placeholder="Test Name" name="test_name" style="margin-left:0px; top:125px;">
<p style="margin-left:0px; margin-top:30px; color:white; font-size:20px;"><b>Enter Number of qustion:</b></p>
<input type="text" placeholder="" name="no_que" style="margin-left:0px; top:125px;">
<P> <p>
<input type="submit" value="Proceed" style="left:0px; top:0px;color:#3366FF; border-radius:5px; background-color:white;">
</div>
</form>
</body>
</html>