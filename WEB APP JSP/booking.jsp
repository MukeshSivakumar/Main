<html>
<head>
	<style>
	#div1
	{
		width:300px;
		height:270px;
		border:1px solid black;
        padding:10px;
        background-color: lightgrey;


	}
	#div2
	{
		width:800px;
		height:400px;
		border:1px solid black;
		padding:100px;
		background-image: url("/busticket/images/image17.jpg"); 
	}
</style>
	</head>
	<body>
			
				<div id="div2" >
					<center>
				<div id="div1" >
					<form action="/busticket/availablebuses" method="post">
					<h3 ><i>JOURNEY DETAILS</i></h3>

				    <i>FROM : </i><input type="text" name="DeptFrom"><br><br>
				    <i>TO : </i><input type="text" name="ArrTo"><br><br>
				    <i>DATE : </i><input type="text" name="journeyDate"><br><br>

				    <input type="submit" value="Search Buses">

				</form>

				</div>
			</center>

	</body>
	</html>