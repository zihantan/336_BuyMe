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
<% 
	String url = "jdbc:mysql://cs336group5.czzknrtounuc.us-east-2.rds.amazonaws.com:3306/cs336";
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(url, "cs336", "cs336project");
	String username = (String)session.getAttribute("userId");
	Statement stmt1 = con.createStatement();
	ResultSet rs1 = stmt1.executeQuery("select * from users where Username='" + username + "'");
	if(rs1.next()){
		String brand = rs1.getString("favoritebrand");
		ResultSet r1 = stmt1.executeQuery("select * from sell where brand='" + brand + "'");
		if(r1.next()){
			while(!r1.next()){
				int shoesid = r1.getInt("shoesid");
				ResultSet r = stmt1.executeQuery("select * from bid where shoesid='" + shoesid + "'");
				if(r.next()){
					int bidid = r.getInt("bidid");
					String insert = "INSERT INTO addalert(username, brand, bid, info)" + "VALUES (?, ?, ?, ?)";
					PreparedStatement psss = con.prepareStatement(insert);
					psss.setString(1, username);
					psss.setString(2, brand);
					psss.setInt(3, bidid);
					psss.setString(4, "on bidding");
					psss.executeUpdate();
				}else{
					String insert = "INSERT INTO addalert(username, brand, info)" + "VALUES (?, ?, ?)";
					PreparedStatement psss = con.prepareStatement(insert);
					psss.setString(1, username);
					psss.setString(2, brand);
					psss.setString(3, "not on bidding");
					psss.executeUpdate();
				}
			}
		}
	}
%>	
	
	<table>
	  <tr>
	    <th>Alert</th>
	    <th>Brand</th>
	    <th>Bid ID</th>
	    <th>Information</th>
	  </tr>
	 <% 
	//String url = "jdbc:mysql://cs336group5.czzknrtounuc.us-east-2.rds.amazonaws.com:3306/cs336";
	//Class.forName("com.mysql.jdbc.Driver");
	//Connection con = DriverManager.getConnection(url, "cs336", "cs336project");
	//String username = (String)session.getAttribute("userId");
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("select * from addalert where username='" + username + "'");
	
	if(!rs.next()){
		out.print("You don't have any alert. <a href='ACCOUNT.html'>Go back to account</a>");
	}else{
		while(rs.next()){
			%>
			<tr>
    			<td><%=rs.getString("alertid")%></td>
    			<td><%=rs.getString("brand")%></td>
    			<td><%=rs.getInt("bid")%></td>
    			<td><%=rs.getString("info")%></td>
			</tr>
			<%
	}
		
	%></table> <%
	out.print("Back to Your Account. <a href='ACCOUNT.html'>Go back to account</a>");
	}
	%>