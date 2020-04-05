<%@ page import="java.sql.*"  %>

<%@ page import="java.io.*" %>
<%@ page import="net.sf.json.JSONArray" %>
<%@ page import="net.sf.json.JSONObject" %>

<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>



<html>
<head>
<meta http-equiv="Content-Type" content="text/html">
<style>
#div1
{
	    width:1000px;
		height:500px;
		border:1px solid black;
		padding:30px;
		background-color: lightgrey;
}
</style>
</head>
<body>
<%  
System.out.println("welcome jsp:");
String from=(String)request.getAttribute("from");;
String to=(String)request.getAttribute("to");
String date=(String)request.getAttribute("date");

String available=(String)request.getAttribute("available");


//String result=(String)request.getAttribute("result");

List array=(List)request.getAttribute("array");


//JSONObject inp = (JSONObject) JSONValue.parse(request.getAttribute("array")); 

System.out.println("jsp:"+array);

JSONArray availablebuses  = new JSONArray(array);


//out.println("availablebuses: "+availablebuses+"<br>");

%>
 

<div id="div1">
	<h2><i>AVAILABLE BUSES: </i></h2>
	<br>
	<h4><i>FROM : </i><%=from%></h4>
	<h4><i>TO : </i><%=to%></h4>
	<h4><i>DATE : </i><%=date%></h4>

	<hr>

	<%  if(available.equals("yes"))
 { 
 	String store="<table border='1' width='700' height='300' >";

 		int i;

	 store+="<tr><th>"+"BusId"+"</th><th>"+"BusType"+"</th><th>"+"From"+"</th><th>"+"To"+"</th><th>"+"Dept Time"+"</th><th>"+"Arr Time"+"</th><th>"+"Fare"+"</th><th>"+"Available Seats"+"</th></tr>";
	 for(i=0;i<jsonarray.length();i++)
	 {

	 	store+="<tr><td>"+availablebuses[i].busid+"</td><td>"+jsonarray[i].bustype+"</td><td>"+jsonarray[i].DeptFrom+"</td><td>"+jsonarray[i].ArrTo+"</td><td>"+jsonarray[i].Dept+"</td><td>"+jsonarray[i].arr+"</td><td>"+jsonarray[i].fare+"</td><td>"+jsonarray[i].availableSeats+"</td></tr>";
	 }

	 store+="</table>";


}
else
{%>
	<script>

	document.getElementById("demo").innerHTML="Buses not available for these routes";
</script>
<%
}
%>
  <p ><%=store%></p>

</div>
</body>
</html>


