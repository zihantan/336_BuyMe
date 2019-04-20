<html>
<head>
<style>
table, th, td {
  border: 1px solid black;
}
</style>
<title>Report</title>
</head>
</html>

<%@ page import ="java.sql.*" %>
<%
	   
	
	//session.setAttribute("userid",username);
//out.println("test");
	if (request.getParameter("totalearn") != null) {
		out.println("test");
		String url = "jdbc:mysql://cs336group5.czzknrtounuc.us-east-2.rds.amazonaws.com:3306/cs336";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, "cs336", "cs336project");
		Statement stmt = con.createStatement();
					
		ResultSet rs = stmt.executeQuery("select sum(trans_price) as total from auction");
		 if (rs.next()) {
			 		//out.println("Welcome " + username + "! <a href='home.jsp'>Logout</a>");
		    
			 		String counteRemember= rs.getString("total");
			 		if(counteRemember != null){
			 			out.println("Total earnings : $" + counteRemember);
			 		%><br><% 

			        out.println("Go back to the generating report page if you want <a href='greport.jsp'>back</a>");
			 		}else {
			     		out.println("Invalid report or no transaction yet <a href='greport.jsp'>try again</a>");
			 		}
		}
	}else if (request.getParameter("userrp") != null) {
		String username = request.getParameter("user"); 
		String url = "jdbc:mysql://cs336group5.czzknrtounuc.us-east-2.rds.amazonaws.com:3306/cs336";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, "cs336", "cs336project");
		Statement stmt = con.createStatement();
					
		ResultSet rs = stmt.executeQuery("select * from auction where seller ='" + username + "'");
%>
<table>
  <tr>
    <th>Auction ID</th>
    <th>Transaction Price</th>
    <th>Date</th>
    <th>Seller</th>
    <th>Buyer</th>
    <th>ShoesID</th>
  </tr>
  <% 
		 	while (rs.next()) {
			 		//out.println("Welcome " + username + "! <a href='home.jsp'>Logout</a>");
				%>
				<tr>
        			<td><%=rs.getString("auctionid")%></td>
        			<td><%=rs.getString("trans_price")%></td>
        			<td><%=rs.getString("date")%></td>
        			<td><%=rs.getString("seller") %></td>
        			<td><%=rs.getString("buyer") %></td>
        			<td><%=rs.getString("shoesid") %></td>
    			</tr>
    			<%
			}
  	%></table> <%
		 	out.println("Go back to the generating report page if you want <a href='greport.jsp'>back</a>");

	}else if (request.getParameter("shoesrp") != null) {
		String shoesID = request.getParameter("shoes");
		String url = "jdbc:mysql://cs336group5.czzknrtounuc.us-east-2.rds.amazonaws.com:3306/cs336";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, "cs336", "cs336project");
		Statement stmt = con.createStatement();
					
		ResultSet rs = stmt.executeQuery("select * from auction where shoesid ='" + shoesID + "'");
		%>
		<table>
		  <tr>
		    <th>Auction ID</th>
		    <th>Transaction Price</th>
		    <th>Date</th>
		    <th>Seller</th>
		    <th>Buyer</th>
		    <th>ShoesID</th>
		  </tr>
		  <% 
				 	while (rs.next()) {
					 		//out.println("Welcome " + username + "! <a href='home.jsp'>Logout</a>");
						%>
						<tr>
		        			<td><%=rs.getString("auctionid")%></td>
		        			<td><%=rs.getString("trans_price")%></td>
		        			<td><%=rs.getString("date")%></td>
		        			<td><%=rs.getString("seller") %></td>
		        			<td><%=rs.getString("buyer") %></td>
		        			<td><%=rs.getString("shoesid") %></td>
		    			</tr>
		    			<%
					}
		  %></table> <%
				 	out.println("Go back to the generating report page if you want <a href='greport.jsp'>back</a>");
	}else if (request.getParameter("typerp") != null) {
		String itype = request.getParameter("itemtype");
		String url = "jdbc:mysql://cs336group5.czzknrtounuc.us-east-2.rds.amazonaws.com:3306/cs336";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, "cs336", "cs336project");
		Statement stmt = con.createStatement();
		  ResultSet rs1 = stmt.executeQuery("select sum(trans_price) as total from auction a, sell s where a.shoesid=s.shoesid and s.type='" + itype + "'");
			if (rs1.next()) {
			 		//out.println("Welcome " + username + "! <a href='home.jsp'>Logout</a>");
		    
			 		String counteRemember= rs1.getString("total");
			 		if(counteRemember != null){
			 			out.println("Total earnings of this type: $" + counteRemember);
			 		%><br><% 

			 		}else {
			     		out.println("Invalid report or no transaction yet for this type<a href='greport.jsp'>try again</a>");
			 		}
		}
		ResultSet rs = stmt.executeQuery("select * from auction a, sell s where a.shoesid=s.shoesid and s.type='" + itype + "'");
		%>
		<table>
		  <tr>
		    <th>Auction ID</th>
		    <th>Transaction Price</th>
		    <th>Date</th>
		    <th>Seller</th>
		    <th>Buyer</th>
		    <th>ShoesID</th>
		  </tr>
		  <% 
				 	while (rs.next()) {
					 		//out.println("Welcome " + username + "! <a href='home.jsp'>Logout</a>");
						%>
						<tr>
		        			<td><%=rs.getString("auctionid")%></td>
		        			<td><%=rs.getString("trans_price")%></td>
		        			<td><%=rs.getString("date")%></td>
		        			<td><%=rs.getString("seller") %></td>
		        			<td><%=rs.getString("buyer") %></td>
		        			<td><%=rs.getString("shoesid") %></td>
		    			</tr>
		    			<%
					}
		  %></table> <%
		  out.println("Go back to the generating report page if you want <a href='greport.jsp'>back</a>");
	}else if (request.getParameter("bestitem") != null) {
		String url = "jdbc:mysql://cs336group5.czzknrtounuc.us-east-2.rds.amazonaws.com:3306/cs336";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, "cs336", "cs336project");
		Statement stmt = con.createStatement();
					
		ResultSet rs = stmt.executeQuery("select t1.name, max(number) as maxnum from (select s.name, count(*)as number from auction a, sell s where a.shoesid=s.shoesid Group BY s.name) t1");
		 if (rs.next()) {
		 		//out.println("Welcome " + username + "! <a href='home.jsp'>Logout</a>");
	   			 String nameRemember= rs.getString("t1.name");
		 		String maxRemember= rs.getString("maxnum");
		 		if(maxRemember != null){
		 			out.println("The best selling item is " + nameRemember + " and " + maxRemember + " were sold.");
		 		%><br><% 

		        out.println("Go back to the generating report page if you want <a href='greport.jsp'>back</a>");
		 		}else {
		     		out.println("Invalid report or no transaction yet <a href='greport.jsp'>try again</a>");
		 		}
		}
	}else if (request.getParameter("bestenduser") != null) {
		String url = "jdbc:mysql://cs336group5.czzknrtounuc.us-east-2.rds.amazonaws.com:3306/cs336";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, "cs336", "cs336project");
		Statement stmt = con.createStatement();
					
		ResultSet rs = stmt.executeQuery("select t1.seller, max(number) as maxnum from (select seller, count(*) as number from auction Group BY seller) t1");
		 if (rs.next()) {
		 		//out.println("Welcome " + username + "! <a href='home.jsp'>Logout</a>");
	    
		 		String counteRemember= rs.getString("t1.seller");
		 		String maxRemember= rs.getString("maxnum");
		 		if(counteRemember != null){
		 			out.println("The end-user who has the best selling is " + counteRemember + ". And he/she sold " + maxRemember + " pairs of shoes.");
		 		%><br><% 

		        out.println("Go back to the generating report page if you want <a href='greport.jsp'>back</a>");
		 		}else {
		     		out.println("Invalid report or no transaction yet <a href='greport.jsp'>try again</a>");
		 		}
		}
	}
%>