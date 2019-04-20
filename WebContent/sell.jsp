<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Welcome to BuyMe</title>
</head>

<body>

<!-- navigation bar -->
<div class="w3-top">
  <div class="w3-bar w3-white w3-wide w3-padding w3-card">
    <a href="welcome.jsp" class="w3-bar-item w3-button"><b><i>BuyMe</i></b></a>
    <!-- Float links to the right. Hide them on small screens -->
    <div class="w3-right w3-hide-small">
      <a href="ACCOUNT.html" class="w3-bar-item w3-button">Account</a>
      <a href="search.html" class="w3-bar-item w3-button">Buy</a>
      <a href="sell.jsp" class="w3-bar-item w3-button">Sell</a>
        <a href="question.html" class="w3-bar-item w3-button">Questions</a>
    </div>
  </div>
</div>

<!-- content -->
	<br>
	<br>
	<br>
	<br>
	<div class="container-fluid">
		<center>
		<h1>Sell Your Shoes</h1>
			<form action="sellStatus.jsp" method="POST">
				<!--  username:  <input type="text" name="username" /> <br />  -->
				Name: <input type="text" name="Name" /> <br /> 
				Brand: <input type="text" name="Brand" /> <br /> 
				Initial Price:  <input type="text" name="Initial Price" /> <br /> 
				Reserve:  <input type="text" name="reservePrice" placeholder="(your reserve price)"/> <br />
				Price Increment:  <input type="text" name="Price Increment" /> <br /> 
				Size:  <input type="text" name="Size" /> <br /> 
				Last Date of Bidding <input type="text" name="Date" placeholder="(Format: yyyy-MM-dd)"/> <br />
				<div class ="form-group">
				<label for = "kind">Type of the shoes</label>
				<select id = "kind" name="kind" onkeydown="Select.del(this,event)" onkeypress="Select.write(this,event)">
					<option value = "any">any</option>
					<option value = "sneaker">sneaker</option>
					<option value = "sport">sport</option>
					<option value = "boots">boots</option>
					<option value = "slipper">slipper</option>
				</select>
				</div>
				<div class="form-group">
    				  		<label for="gender">Gender/kid</label>
                        <select id="gender" name="gender" onkeydown="Select.del(this,event)" onkeypress="Select.write(this,event)">  
        					<option value="any">any</option>   
      						<option value="women">women</option>  
   						    <option value="men">men</option>  
   						    <option value="kid">kid</option>   
    			</select></div>
    			
    			<div class="form-group">
				  		<label for="color">Color of the shoes</label>
                        <select id="color" name="color" onkeydown="Select.del(this,event)" onkeypress="Select.write(this,event)">  
        					<option value="any">any</option>  
        					<option value="white">white</option>  
      						<option value="black">black</option>  
   						    <option value="grey">grey</option>  
   						    <option value="blue">blue</option>  
      						<option value="yellow">yellow</option>  
   						    <option value="red">red</option>  
   						    <option value="purple">purple</option>  
      						<option value="metalic">metalic</option>  
   						    <option value="orange">orange</option>  
    			</select> </div> 
				<input type="submit" value="Put on Stock" />
			</form>
		</center>
	</div>
</body>
</html>