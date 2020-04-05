<html>
<head>
	<style>
	#div1
	{
		width:300px;
		height:270px;
		border:1px solid black;
        padding:10px;
        background-color: lightpink;


	}
	#div2
	{
		width:800px;
		height:400px;
		border:1px solid black;
		padding:100px;;
	}
</style>
	</head>
	<body>
			
				<div id="div2" style='background-image: url("/busticket/images/image11.jpg")'>
					<h4 align="center">

						<center>
				<div id="div1" >

					

				<form action="/busticket/busticket1" method="post">

					<p id="demo" style="color:red"></p>

				<p align="center"><b><i>Username :</i></b>
					<input type="text" name="username" required="required" >
				</p><br><br>
				<p align="center"><b><i>Password :</i></b>
					<input type="password" name="password" required="required">
				</p><br>
			
				
					<input type="submit" value="login">
				<br>
				
				<%
				String hello=(String)request.getAttribute("message");
				
				if((hello!=null) && (hello.equals("error"))){
				%><script>
					document.getElementById("demo").innerHTML="please enter valid username & password";
				</script>
				<%}
				
				%>

                <br> 

			</form>


				<form action="/busticket/signup1.jsp" >

					<input type="submit" value="sign up"><br><i>(Register)</i>
				</form>
			</div>
		</center>
			</h4>
		</div>

		</div>
	</body>
	</html>

