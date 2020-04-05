import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class busticket1 extends HttpServlet
{
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String uname=request.getParameter("username");
		String pword=request.getParameter("password");
	
		
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost/BusReservation","root","");
			
			Statement stmt=con.createStatement(); 
			
			ResultSet res=stmt.executeQuery("select username,password from userTable where username='"+uname+"' AND password='"+pword+"'");
			
			
			if(res.next())
			{
				
				response.sendRedirect("booking.jsp");
			}
			
		else
			{  

			request.setAttribute("message", "error");
	        request.getRequestDispatcher("user.jsp").forward(request, response);
		
            //response.sendRedirect("user.jsp"); 

        }

			
			
			con.close();
		}catch(Exception e)
		{
			out.println(e);
}}}