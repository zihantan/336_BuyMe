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
	    <th>Alert ID</th>
	    <th>Brand</th>
	    <th>Bid ID</th>
	    <th>Information</th>
	  </tr>
	 <% 
	
	String url = "jdbc:mysql://cs336group5.czzknrtounuc.us-east-2.rds.amazonaws.com:3306/cs336";
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(url, "cs336", "cs336project");
	String username = (String)session.getAttribute("userId");
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("select * from addalert where username='" + username + "'");
	
	
	if(rs.next()){
			%>
			<tr>
    			<td><%=rs.getString("alertid")%></td>
    			<td><%=rs.getString("brand")%></td>
    			<td><%=rs.getString("bid")%></td>
    			<td><%=rs.getString("info") %></td>
			</tr>
			<%
	}
		
	%></table> <%
	out.print("Back to Your Account. <a href='ACCOUNT.html'>Go back to account</a>");
	
	%>