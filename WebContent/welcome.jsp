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
	<div class="container">
        <center>
		<h1>BuyMe</h1>
		<h3>Welcome <% out.print(session.getAttribute("userId")); %> </h3>
		<br>
		<p>Please select one of the following tabs on the navigation bar up top!</p>
        </center>
		<br>
	</div>
	
	
</body>
</html>