<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="gray">
<%
   String result;
   String to = "ashishrsmm@gmail.com";

   // Sender's email ID needs to be mentioned
   String from = "ashishrsmm@gmail.com";

   // Assuming you are sending email from localhost
   String host = "localhost";
   String msg=request.getParameter("feed");

   // Get system properties object
  Properties props = new Properties();  
  props.put("mail.smtp.host", "smtp.gmail.com");  
  props.put("mail.smtp.socketFactory.port", "465");  
  props.put("mail.smtp.socketFactory.class",  
            "javax.net.ssl.SSLSocketFactory");  
  props.put("mail.smtp.auth", "true");  
  props.put("mail.smtp.port", "465");  
   // Get the default Session object.
   Session mailSession = Session.getDefaultInstance(props,  
   new javax.mail.Authenticator() {  
   protected PasswordAuthentication getPasswordAuthentication() {  
   return new PasswordAuthentication("ashishrsmm@gmail.com","7898420997");//change accordingly  
   }  
  });  

   try{
      // Create a default MimeMessage object.
      MimeMessage message = new MimeMessage(mailSession);
      // Set From: header field of the header.
      message.setFrom(new InternetAddress(from));
      // Set To: header field of the header.
      message.addRecipient(Message.RecipientType.TO,
                               new InternetAddress(to));
      // Set Subject: header field
      message.setSubject("Feedback");
      // Now set the actual message
      message.setText(msg);
      // Send message
      Transport.send(message);
      result = "Message sent successfully....";
   }catch (MessagingException mex) {
      mex.printStackTrace();
      result = "Error: unable to send message....";
   }
%>
<p><%=result%></p>
</body>
</html>