<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body >
<%@ include file="conn.jsp" %>
<%
if (request.getSession().getAttribute("user_name")==null)
{
	response.sendRedirect("/online_exam/login.jsp");
}
String msg = request.getParameter("msg");
String qry = "select * from QUIZ_QUES where name='"+msg+"'";
rs = stat.executeQuery(qry);
md = rs.getMetaData();
int qno=md.getColumnCount();
request.getSession().setAttribute("name", msg);
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
</div>
<form method="post" action="result.jsp">
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
<div style="color:white;
			font-size:20px;
			margin-left:150px;
			margin-right:150px;
			float:left;
			width:1150px;
			overflow-y: auto;
			height:450px;">
<%
int c=1;
while (rs.next())
{
	out.println(""+c+"- "+rs.getString(3));
	out.println("<br>");out.println("<br>");
	out.println("<input type=\"radio\" name=\""+rs.getString(8)+rs.getString(2)+"\" value=\""+rs.getString(4)+"\"> "+rs.getString(4));
	out.println("<br>");
	out.println("<input type=\"radio\" name=\""+rs.getString(8)+rs.getString(2)+"\" value=\""+rs.getString(5)+"\"> "+rs.getString(5));
	out.println("<br>");
	out.println("<input type=\"radio\" name=\""+rs.getString(8)+rs.getString(2)+"\" value=\""+rs.getString(6)+"\"> "+rs.getString(6));
	out.println("<br>");
	out.println("<input type=\"radio\" name=\""+rs.getString(8)+rs.getString(2)+"\" value=\""+rs.getString(7)+"\"> "+rs.getString(7));
	out.println("<br>");out.println("<br>");out.println("<br>");
	c++;
}
%>
<center>
</div>
<input type="submit"  style="margin-left:150px;"value="Submit">
</div>
</form>
</body>
</html>