import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;


public class signup2 extends HttpServlet
{
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException
	{
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();

		String uname=request.getParameter("username");
		String pword=request.getParameter("password");
		String mob=request.getParameter("MobileNo");
		String mail=request.getParameter("Mailid");
		String dob=request.getParameter("DateOfBirth");
	
		try
		{

		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost/BusReservation","sh udb.sh","");
		Statement stmt=con.createStatement();

	//	stmt.executeUpdate("insert into userTable(username,password,MobileNo,Mailid,DateOfBirth) values('"+uname+"','"+pword+"','"+mob+"','"+mail+"','"+dob+"')");

		stmt.executeUpdate("insert into userTable(username,password,MobileNo,Mailid,DateOfBirth) values('Mukesh','mukesh',893839303,'mks@zoho.com','29/09/1997')");

		ResultSet res=stmt.executeQuery("select * from userTable");
		
		while(res.next())
		{
			System.out.println(res.getString(1)+" "+res.getString(2)+" "+res.getInt(3)+" "+res.getString(4)+" "+res.getString(5));

		}
		response.sendRedirect("user.jsp");
		
		con.close();



		}catch(Exception e)
		{
			out.println(e);
		}
		
	}
	
	}