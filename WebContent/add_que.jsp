<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.lang.*"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%
	if (request.getSession().getAttribute("user_name")==null)
	{
		response.sendRedirect("/online_exam/login.jsp");
	}
	String s = (String)request.getSession().getAttribute("i");
	int i = Integer.parseInt(s);
	int no = Integer.parseInt(request.getSession().getAttribute("qno").toString());
	if (i>no)
	{
		String s1="/online_exam/home.jsp?msg=Test has been successfully uploaded";
		response.sendRedirect(s1);
	}
%>
<body>
<div style="background-color:blue; 
			height:85px; 
			width:100%;
			z-index:1;
			position:fixed;
			top:0px;
			left:0px;"
>
<center>
<p style="font-style:italic; font-size:70px; color:white; margin-top:5px; letter-spacing:10px; ">Online Test</p>
</center>
</div>
<form action="next" method="post">
<div style="background-color:gray; 
			height:585px; 
			width:100%;
			z-index:2;
			position:fixed;
			top:85px;
			left:0px;
			bottom:0px;"
>
<p style="margin-left:1050px; margin-top:10px; color:white; font-size:20px;"><b>Hello <%=request.getSession().getAttribute("user_name")%></b></p>
<p style="margin-left:100px; margin-top:0px; color:white; font-size:20px;"><b>Question No- <%=i %></b></p>
<textarea rows="5" cols="100" name="ques" style="margin-left:100px;"></textarea>
<br><br>
<input type="text" placeholder="Option A" name="opta" style="margin-left:100px;">
<br><br>
<input type="text" placeholder="Option B" name="optb" style="margin-left:100px;">
<br><br>
<input type="text" placeholder="Option C" name="optc" style="margin-left:100px;">
<br><br>
<input type="text" placeholder="Option D" name="optd" style="margin-left:100px;">
<br>
<p style="margin-left:100px; color:white; font-size:20px;">Correct Answer:</p>
<input type="text" placeholder="Correct Answer" name="ca" style="margin-left:100px;">
<p style="left:320px; top:270px; position:fixed; color:white; font-size:20px;"><b>Explanation:</b></p>
<textarea rows="9" cols="68" name="exp" style="left:320px; top:330px; position:fixed;"></textarea>
<input type="submit" value="   Next   " style="left:520px; top:480px; position:fixed; color:#3366FF; border-radius:7px; background-color:white;">
</div>
</form>
</body>
</html>