<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ include file="conn.jsp" %>
<%
rs = stat.executeQuery("select * from QUIZ_NAME");
md=rs.getMetaData();
int c=md.getColumnCount();
if (request.getSession().getAttribute("user_name")==null)
{
	response.sendRedirect("/online_exam/login.jsp");
}
%>
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
			bottom:0px;
			overflow-y:auto;
			height:575px;"
>
<p style="margin-left:1050px; margin-top:30px; color:white; font-size:20px;"><b>Hello <%=request.getSession().getAttribute("user_name")%></b></p>
<center>
<p style="color:white; font-size:30px;"><b>Select a test to start</p>
</center>
<table border=0 align=center width=80% cellpadding=5 cellspacing=5">
<tr bgcolor=#aaaaaa>
<th>S.NO
<%
for(int i=1; i<=c; i++)
{
	out.println( "<th >" + md.getColumnLabel(i) );
}
out.println( "<th > LINK");
int n=0;
while(rs.next())
{
	n++;
	out.println("<tr bgcolor=#dddddd>");
	out.println("<td>"+n);
	for(int i=1; i<=c; i++)
	{
		out.println( "<td >" + rs.getString(i) );
	}
	out.println( "<td ><a href=\"/online_exam/exam.jsp?msg="+rs.getString(3)+"\">Start</a>");
}
%>
</table>
</div>
</body>
</html>