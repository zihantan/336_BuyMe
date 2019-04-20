<html>
<head>
<style>
table, th, td {
  border: 1px solid black;
}
</style>
<title>Search Result</title>
</head>
</html>

<%@ page import ="java.sql.*" %>

	
	<table>
	  <tr>
	    <th>Question</th>
	    <th>Type</th>
	    <th>Username</th>
	    <th>Answer</th>
	    
	  </tr>
	 <% 
	
	String url = "jdbc:mysql://cs336group5.czzknrtounuc.us-east-2.rds.amazonaws.com:3306/cs336";
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(url, "cs336", "cs336project");

	Statement stmt = con.createStatement();
	ResultSet rs;
	rs = stmt.executeQuery("select * from customer_question");
	while(rs.next()){
			%>
			<tr>
    			<td><%=rs.getString("question")%></td>
    			<td><%=rs.getString("type")%></td>
    			<td><%=rs.getString("username")%></td>
    			<td><%=rs.getString("Answer") %></td>
			</tr>
			<%
		}
		
		%></table> <%
		out.print("Back to ask question. <a href='question.html'>Go Back.</a>");
		%>
	