<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="/online_exam/validtn.js">
</script>
<script type="text/javascript" src="/online_exam/login_validtn.js">
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<%! String msg,ms;%>
<%
	msg = request.getParameter("msg");
	ms= request.getParameter("ms");
	if (msg==null)
		msg="";
	if (ms==null)
		ms="";
%>
<body>
<form action="login" method="post" name="lg" onsubmit="return(log())">
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
<p style="margin-left:75px; margin-top:10px; color:white; font-size:20px;"><b>Username</b></p>
<input type="text" placeholder="username" name="username" style="margin-left:75px; top:125px;  position:fixed">
<p style="margin-left:275px; top:77px; color:white; font-size:20px; position:fixed;"><b>Password</b></p>
<input type="password"  placeholder="password" name="pass" style="margin-left:275px; top:125px;  position:fixed">
<input type="submit" value="Log in" style="left:475px; top:125px; position:fixed; color:#3366FF; border-radius:5px; background-color:white;">
<p style="margin-left:75px; margin-top:35px; color:red; font-size:20px;"><b><%=msg%></b></p>

</form>
<p style="left:850px; top:80px; position:fixed; color:white; font-size:40px;">It's free and always will be</p>


<form action="signup" method="post" onsubmit="return(up());" name="my">

<p style="left:850px; top:145px; position:fixed; color:red; font-size:20px;"><%=ms%></p>

<!-- category-->

<select name="cat" style="left:850px; top:200px; position:fixed; height:25px; border-radius:5px;">
<option value="cat">Category</option>
<option value="teacher">Teacher</option>
<option value="student">Student</option>
</select>

<img src="images/images.jpg" style="margin-top:100px; margin-left:100px; width:30%; height:20%;">

<input type="text" placeholder="Username" name="user_name" style="left:850px; top:250px; position:fixed; height:25px; border-radius:5px; width:375px;">
<input type="password" placeholder="Password" name="pass" style="left:850px; top:300px; position:fixed; height:25px; border-radius:5px; width:375px;">
<input type="password" placeholder="Re-enter Password" name="pass2" style="left:850px; top:350px; position:fixed; height:25px; border-radius:5px; width:375px;">

<input type="text" placeholder="Email" name="email" style="left:850px; top:400px; position:fixed; height:25px; border-radius:5px; width:375px;">

<p style="left:850px; top:420px; position:fixed; color:black; font-size:20px;">Gender</p>
<input type="radio" name="gender" value="female" style="left:850px; top:465px; position:fixed;">
<p style="left:875px; top:450px; position:fixed; color:white;"><b>Female</b></p>
<input type="radio" name="gender" value="male" style="left:950px; top:465px; position:fixed;">
<p style="left:975px; top:450px; position:fixed; color:white;"><b>Male</b></p>
<input type="radio" name="gender" value="others" style="left:1050px; top:465px; position:fixed;">
<p style="left:1075px; top:450px; position:fixed; color:white;"><b>Others</b></p>


<input type="submit" value="Sign up" style="left:860px; top:500px; position:fixed; color:#3366FF; border-radius:5px; background-color:white;">

</div>
</form>
</body>
</html>