<%@ page import="java.sql.*"  %>

<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html">
</head>

<%

String uname=request.getParameter("username");
String pword=request.getParameter("password");



try
{

Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost/BusReservation","root","");
Statement stmt=con.createStatement();


ResultSet res=stmt.executeQuery("select username,password from userTable where username='"+uname+"' AND password='"+pword+"'");


if(res.next())
			{
				
				response.sendRedirect("booking.jsp");
			}
			
		else
			{


				//<jsp:include page="alertmessage.jsp" flush="true"/>


				//out.alert("Please enter valid username & password");
		
            response.sendRedirect("user.jsp"); 

        }



}catch(Exception e)
{
	out.println(e);
}
%>
</html>