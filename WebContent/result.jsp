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
if (request.getSession().getAttribute("user_name")==null)
{
	response.sendRedirect("/online_exam/login.jsp");
}
ResultSet rs2;
String total="";
String nm = request.getSession().getAttribute("name").toString();
String username = request.getParameter("username");
String qry = "select * from QUIZ_QUES where name='"+nm+"'";
String qry2 ="select * from QUIZ_NAME where name='"+nm+"'";
rs2=stat.executeQuery(qry2);
rs2.next();
total = rs2.getString(4);
rs = stat.executeQuery(qry);
int marks=0;
while (rs.next())
{
	if (rs.getString(8).equals(request.getParameter(rs.getString(8)+rs.getString(2))))
	{
		marks+=1;
	}
}
%>
<div style="background-color:blue; 
			height:85px; 
			width:100%;
			z-index:1;
			position:fixed;
			top:0px;
			left:0px;"
>
<a href="/online_exam/logout.jsp" style="color:white; margin-left:1200px; margin-top:60px; position:fixed;">LOGOUT</a>
<p style="font-style:italic; font-size:70px; color:white; margin-left:450px; margin-top:5px; letter-spacing:10px; ">Online Test</p>
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
<a href='#' onclick='javascript:window.open("/online_exam/feedback.jsp",null,"height=200,width=400,status=yes,toolbar=no,menubar=no,location=no");'
style="position:fixed; margin-left:100px; margin-top:30px; color:red; font-size:20px;"><B><U>FEEDBACK</U></B></a>
<p style="margin-left:1050px; margin-top:30px; color:white; font-size:20px;"><b>Hello <%=request.getSession().getAttribute("user_name")%></b></p>
<center>
<P style="color:white; font-size:30px;">Your score is: <%=marks%>/<%=total %>
</center>
<div style="color:white;
			font-size:20px;
			margin-left:100px;
			float:left;
			width:1200px;
			overflow-y: auto;
			height:450px;">
<%
int c=1;
rs=stat.executeQuery(qry);
while (rs.next())
{
	out.println("Question -"+c+": "+rs.getString(3));
	out.println("<br>");out.println("<br>");
	out.println("Your Answer: "+request.getParameter(rs.getString(8)+rs.getString(2)));
	out.println("<br>");
	out.println("Correct Answer: "+rs.getString(8));
	out.println("<br>");
	//out.println("Explanation: "+rs.getString(9));
	//out.println("<br>");
	out.println("<br>");out.println("<br>");
	c++;
}
%>
</div>
</div>
</body>
</html>