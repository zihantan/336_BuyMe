<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Register Form</title>
</head>

<body>

	<!-- content -->
	<br>
	<br>
	<br>
	<br>
	<div class="container-fluid">
		<center>
		<h1>Register</h1>
			<form action="registerStatus.jsp" method="POST"> 
				Name: <input type="text" name="name" /> <br /> 
				Username: <input type="text" name="username" /> <br /> 
				Password:  <input type="password" name="password" /> <br /> 
				Email:  <input type="text" name="email" /> <br /> 
				FavoriteBrand:  <input type="text" name="favoritebrand" /> <br /> 
				<input type="submit" value="Register" />
			</form>
		</center>
	</div>
</body>
</html>