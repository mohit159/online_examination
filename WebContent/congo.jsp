<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Congratulation</title>
<style>
div {
    background-color: lightgrey;
    width: 700px;
    border: 8px solid white;
    border-radius: 20px;
    padding: 15px;
    margin: 100px;
}
a:link {
    color: green;
    background-color: transparent;
    text-decoration: none;
}
</style>
</head>
<body bgcolor= lightblue>
<%
	String cat = request.getParameter("cat");
%>
<center>
 <div>
 <h1 style="color: darkblue;"> Congratulations! <br>Now you are a member of our family</h1>
  <a style="font-size:25px;" href="/online_exam/login.jsp">Login with your username and password</a>
 </div>
</body>
</html>