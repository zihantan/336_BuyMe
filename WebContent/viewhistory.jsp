<html>
<head>
<style>
table, th, td {
  border: 1px solid black;
}
</style>
<title>View History</title>
</head>
</html>
<%@ page import ="java.sql.*" %>

<%
	if (request.getParameter("viewhistorybyitem") != null) {
		String shoesid = request.getParameter("shoesid");   
		//String Uname = (String)session.getAttribute("userId");
		if(shoesid.equals("")){
			out.print("Please insert a shoesid in order to view history about this auction! <a href='search.html'>try again</a>");
			return;
		}
		String url = "jdbc:mysql://cs336group5.czzknrtounuc.us-east-2.rds.amazonaws.com:3306/cs336";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, "cs336", "cs336project");
		Statement stmt = con.createStatement();
	
		%>
		<table>
	  <tr>
	    <th>Bid ID</th>
	    <th>ShoesID</th>
	    <th>Participants</th>
	    <th>Bid Price</th>
	  </tr>
		<% 
		ResultSet rs = stmt.executeQuery("select * from bid where shoesid='" + shoesid + "'");		
		while(rs.next()){
			%>
			<tr>
    			<td><%=rs.getString("bidid")%></td>
    			<td><%=rs.getString("shoesid")%></td>
    			<td><%=rs.getString("buyer")%></td>
    			<td><%=rs.getString("bid_price") %></td>
			</tr>
			<%
		}
			%></table> <%
			out.print("Go back. <a href='search.html'>Go Back</a>");
			
	}else if(request.getParameter("viewhistorybyuser") != null){
		//String shoesid = request.getParameter("shoesid");   
		String User = request.getParameter("username");
		if(User.equals("")){
			out.print("Please insert an username in order to view history this user has participated in! <a href='search.html'>try again</a>");
			return;
		}
		String url = "jdbc:mysql://cs336group5.czzknrtounuc.us-east-2.rds.amazonaws.com:3306/cs336";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, "cs336", "cs336project");
		Statement stmt = con.createStatement();
		%>
		<table>
	  <tr>
	    <th>Bid ID</th>
	    <th>ShoesID</th>
	    <th>Participants</th>
	    <th>Bid Price</th>
	  </tr>
		<% 
		ResultSet rs = stmt.executeQuery("select * from bid where buyer='" + User + "'");		
		while(rs.next()){
			%>
			<tr>
    			<td><%=rs.getString("bidid")%></td>
    			<td><%=rs.getString("shoesid")%></td>
    			<td><%=rs.getString("buyer")%></td>
    			<td><%=rs.getString("bid_price") %></td>
			</tr>
			<%
		}
			%></table> <%
			out.print("Go back. <a href='search.html'>Go Back</a>");
			
		
	}




%>