import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
//import org.json.*;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import java.util.List;
import java.util.ArrayList;

public class availablebuses extends HttpServlet
{
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException
	{
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String from=request.getParameter("DeptFrom");
		String to=request.getParameter("ArrTo");
		String date=request.getParameter("journeyDate");
		
		String obj;
		
		try
		{
            Class.forName("com.mysql.jdbc.Driver");
			
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost/BusReservation","root","");
			
			Statement stmt=con.createStatement(); 
			
			ResultSet res=stmt.executeQuery("select * from buses where DeptFrom='"+from+"' AND ArrTo='"+to+"'");

			request.setAttribute("from",from);
			request.setAttribute("to",to);
			request.setAttribute("date",date);
						
			JSONArray jArray = new JSONArray();
			
			System.out.println("welcome ");
			
			while(res.next())
			{		        
		        JSONObject arrayObj = new JSONObject();
		        
		        arrayObj.put("availableSeats",res.getInt("availableSeats"));
		        arrayObj.put("fare",res.getString("fare"));
		        arrayObj.put("arr",res.getString("arr"));
		        arrayObj.put("Dept",res.getString("Dept"));
		        arrayObj.put("ArrTo",res.getString("ArrTo"));
		        arrayObj.put("DeptFrom",res.getString("DeptFrom"));
		        arrayObj.put("bustype",res.getString("bustype"));
		        arrayObj.put("busid",res.getInt("busid"));
		       
		        jArray.put(arrayObj);  
			}
			
			//out.println(" Array : "+jArray+"<br>");
			System.out.println("Array "+jArray);
			System.out.println("--------");
			
	        //if(res.next())
			if(jArray.length()>0)
			{
	        	List test = JSONArray.toList(jArray);
	        	System.out.println("list "+test);
	        	  //  obj=JSON.stringify(jArray);
	        	    
	            request.setAttribute("result",res);
	            request.setAttribute("array",test);
	            
				request.setAttribute("available","yes");
				System.out.println("list will be forwar");
		        request.getRequestDispatcher("availablebuses.jsp").forward(request, response);
			}
			else
			{	
				System.out.println("else part");
				request.setAttribute("available","");
		        request.getRequestDispatcher("availablebuses.jsp").forward(request, response);
			}
			
			con.close();
						
		}catch(Exception e)
		{
			out.println(e);
			
		}
}
	}
