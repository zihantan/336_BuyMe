<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
table, th, td {
  border: 1px solid black;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Questions Asked From Users</title>
</head>

<body>

<!-- navigation bar -->
<div class="w3-top">
  <div class="w3-bar w3-white w3-wide w3-padding w3-card">
    <a href="#home" class="w3-bar-item w3-button"><b></b></a>
    <!-- Float links to the right. Hide them on small screens -->
    <div class="w3-right w3-hide-small">
      <a href="cr_questions.jsp" class="w3-bar-item w3-button">Question</a>
      <a href="Modify.html" class="w3-bar-item w3-button">Modify</a>
      <a href="logout.jsp" class="w3-bar-item w3-button">Log out</a>
    </div>
  </div>
</div>

	<div class="container-fluid">
        <center>
		<h1>BuyMe</h1>
        </center>
		<br>
		<div class="row">
			<div class="col-md-6">
				<center>
				<h3>Recent Questions</h3>
<table>
  <tr>
    <th>Question ID</th>
    <th>Username</th>
    <th>Question</th>
    <th>Answer</th>
  </tr>

				<%@ page import ="java.sql.*" %>
				<% 
					String url = "jdbc:mysql://cs336group5.czzknrtounuc.us-east-2.rds.amazonaws.com:3306/cs336";
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection(url, "cs336", "cs336project");

					Statement stmt = con.createStatement();
				
					ResultSet rs = stmt.executeQuery("select * from customer_question");
					while(rs.next()) {
						%>
						<tr>
                			<td><%=rs.getString("idquestion")%></td>
                			<td><%=rs.getString("username")%></td>
                			<td><%=rs.getString("question")%></td>
                			<td><%=rs.getString("Answer") %></td>
            			</tr>
            			<%
					}
				
				
				
				%>
				</table>
			
			<form action="answer.jsp" method="POST">
				Question ID: <input type="text" name="questionID" /> <br />  
				Answer: <input type="text"  name="Answer" /> <br /> 
				<input type="submit" value="Reply" />
			</form>
				
				</center>
				
				
			
				
				
				
	<!--  
	$connection = mysql_connect('cs336group5.czzknrtounuc.us-east-2.rds.amazonaws.comt', 'cs336', 'cs336project'); //The Blank string is the password
	mysql_select_db('hrmwaitrose');

$query = "SELECT * FROM employee"; //You don't need a ; like you do in SQL
$result = mysql_query($query);

echo "<table>"; // start a table tag in the HTML

while($row = mysql_fetch_array($result)){   //Creates a loop to loop through results
echo "<tr><td>" . $row['name'] . "</td><td>" . $row['age'] . "</td></tr>";  //$row['index'] the index here is a field name
}

echo "</table>"; //Close the table in HTML

mysql_close(); //Make sure to close out the database connection
		-->

			
			
		</div>
	</div>
	
	
</body>
</html>