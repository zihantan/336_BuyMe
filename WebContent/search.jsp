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

if (request.getParameter("search") != null) {
	
	String name = request.getParameter("name");   
	String color = request.getParameter("color");
	String kind = request.getParameter("kind");
	String gender = request.getParameter("gender");
	String brand = request.getParameter("brand");
	String pricerange = request.getParameter("pricerange");
	String size = request.getParameter("size");
	
	if(pricerange.equals("any") || name.equals("") || color.equals("any") || kind.equals("any") || gender.equals("any") || brand.equals("")|| size.equals("any")) {
		out.print("There is/are empty Input(s)! Please type something for name and brand and avoid selecting 'any' for options. <a href='search.html'>try again</a>");
		return;
	}
 	
	String url = "jdbc:mysql://cs336group5.czzknrtounuc.us-east-2.rds.amazonaws.com:3306/cs336";
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(url, "cs336", "cs336project");

	Statement stmt = con.createStatement();
	ResultSet rs; 
	if(pricerange.equals("~50")){
		%>
		<table>
	  <tr>
	    <th>shoes-ID</th>
	    <th>Name</th>
	    <th>Brand</th>
	    <th>Initial Price</th>
	    <th>Current Bid</th>
	    <th>Current Bid User</th>
	    <th>Price Increment</th>
	    <th>Color</th>
	    <th>Size</th>
	    <th>Date</th>
	    <th>Owner</th>
	    <th>Type</th>
	    <th>Gender</th>
	  </tr>
		<% 
		rs = stmt.executeQuery("select * from sell where name like '%" + name 
				+ "%' and color='" + color + "' and brand ='" + brand+ "' and type ='" + kind +"' and gender='" + gender + "' and size ='" + size +"' and ip < 50 and date >= curdate()");
		while(rs.next()){
			%>
			<tr>
    			<td><%=rs.getString("shoesid")%></td>
    			<td><%=rs.getString("name")%></td>
    			<td><%=rs.getString("brand")%></td>
    			<td><%=rs.getString("ip") %></td>
    			<td><%=rs.getString("current_bid") %></td>
    			<td><%=rs.getString("current_highest_bid_user") %></td>
    			<td><%=rs.getString("pi") %></td>
    			<td><%=rs.getString("color") %></td>
    			<td><%=rs.getString("size") %></td>
    			<td><%=rs.getString("date") %></td>
    			<td><%=rs.getString("owner") %></td>
    			<td><%=rs.getString("type") %></td>
    			<td><%=rs.getString("gender") %></td>
			</tr>
			<%
		}
		
		%></table> <%
	
	}else if(pricerange.equals("50~100")){
		%>
		<table>
	  <tr>
	    <th>shoes-ID</th>
	    <th>Name</th>
	    <th>Brand</th>
	    <th>Initial Price</th>
	    <th>Current Bid</th>
	    <th>Current Bid User</th>
	    <th>Price Increment</th>
	    <th>Color</th>
	    <th>Size</th>
	    <th>Date</th>
	    <th>Owner</th>
	    <th>Type</th>
	    <th>Gender</th>
	  </tr>
		<% 
		rs = stmt.executeQuery("select * from sell where name like '%" + name 
				+ "%' and color='" + color + "' and brand ='" + brand+ "' and type ='" + kind +"' and gender='" + gender + "' and size='" + size + "' and ip >= 50 and ip < 100 and date >= curdate()");
		while(rs.next()){
			%>
			<tr>
    			<td><%=rs.getString("shoesid")%></td>
    			<td><%=rs.getString("name")%></td>
    			<td><%=rs.getString("brand")%></td>
    			<td><%=rs.getString("ip") %></td>
    			<td><%=rs.getString("current_bid") %></td>
    			<td><%=rs.getString("current_highest_bid_user") %></td>
    			<td><%=rs.getString("pi") %></td>
    			<td><%=rs.getString("color") %></td>
    			<td><%=rs.getString("size") %></td>
    			<td><%=rs.getString("date") %></td>
    			<td><%=rs.getString("owner") %></td>
    			<td><%=rs.getString("type") %></td>
    			<td><%=rs.getString("gender") %></td>
			</tr>
			<%
		}
		
		%></table> <%
	
	}else if(pricerange.equals("100~200")){
		%>
		<table>
	  <tr>
	    <th>shoes-ID</th>
	    <th>Name</th>
	    <th>Brand</th>
	    <th>Initial Price</th>
	    <th>Current Bid</th>
	    <th>Current Bid User</th>
	    <th>Price Increment</th>
	    <th>Color</th>
	    <th>Size</th>
	    <th>Date</th>
	    <th>Owner</th>
	    <th>Type</th>
	    <th>Gender</th>
	  </tr>
		<% 
		rs = stmt.executeQuery("select * from sell where name like '%" + name 
				+ "%' and color='" + color + "' and brand ='" + brand+ "' and type ='" + kind +"' and gender='" + gender + "' and size='" + size + "' and ip >= 100 and ip <200 and date >= curdate()" );
		while(rs.next()){
			%>
			<tr>
    			<td><%=rs.getString("shoesid")%></td>
    			<td><%=rs.getString("name")%></td>
    			<td><%=rs.getString("brand")%></td>
    			<td><%=rs.getString("ip") %></td>
    			<td><%=rs.getString("current_bid") %></td>
    			<td><%=rs.getString("current_highest_bid_user") %></td>
    			<td><%=rs.getString("pi") %></td>
    			<td><%=rs.getString("color") %></td>
    			<td><%=rs.getString("size") %></td>
    			<td><%=rs.getString("date") %></td>
    			<td><%=rs.getString("owner") %></td>
    			<td><%=rs.getString("type") %></td>
    			<td><%=rs.getString("gender") %></td>
			</tr>
			<%
		}
		
		%></table> <%
	
	}else if(pricerange.equals("200~")){
		%>
		<table>
	  <tr>
	    <th>shoes-ID</th>
	    <th>Name</th>
	    <th>Brand</th>
	    <th>Initial Price</th>
	    <th>Current Bid</th>
	    <th>Current Bid User</th>
	    <th>Price Increment</th>
	    <th>Color</th>
	    <th>Size</th>
	    <th>Date</th>
	    <th>Owner</th>
	    <th>Type</th>
	    <th>Gender</th>
	  </tr>
		<% 
		//String mysqltest = "select * from sell where name ='" + name 
				//+ "' and color='" + color + "' and brand ='" + brand+ "' and type ='" + kind +"' and gender='" + gender + "' and price >= 200";
		//out.print(mysqltest);
		
		rs = stmt.executeQuery("select * from sell where name like '%" + name 
				+ "%' and color='" + color + "' and brand ='" + brand+ "' and type ='" + kind +"' and gender='" + gender + "' and size='" + size + "' and ip >= 200 and date >= curdate()" );
		while(rs.next()){
			%>
			<tr>
    			<td><%=rs.getString("shoesid")%></td>
    			<td><%=rs.getString("name")%></td>
    			<td><%=rs.getString("brand")%></td>
    			<td><%=rs.getString("ip") %></td>
    			<td><%=rs.getString("current_bid") %></td>
    			<td><%=rs.getString("current_highest_bid_user") %></td>
    			<td><%=rs.getString("pi") %></td>
    			<td><%=rs.getString("color") %></td>
    			<td><%=rs.getString("size") %></td>
    			<td><%=rs.getString("date") %></td>
    			<td><%=rs.getString("owner") %></td>
    			<td><%=rs.getString("type") %></td>
    			<td><%=rs.getString("gender") %></td>
			</tr>
			<%
		}
		
		%></table> <%
	
	}
	%>
	<% 
	out.print("If no such result, there is no item that meets your requirements. You can go back and search again.<a href='search.html'>Go Back</a>");
%><br><%
	out.print("If you found the shoes that you are interested in, please enter the shoesid here:");
	%>
	

<%
}else if(request.getParameter("browse") != null){
	%>
	<table>
	  <tr>
	    <th>shoes-ID</th>
	    <th>Name</th>
	    <th>Brand</th>
	    <th>Initial Price</th>
	    <th>Current Bid</th>
	    <th>Current Bid User</th>
	    <th>Price Increment</th>
	    <th>Color</th>
	    <th>Size</th>
	    <th>Date</th>
	    <th>Owner</th>
	    <th>Type</th>
	    <th>Gender</th>
	  </tr>
	  <% 
	
	String url = "jdbc:mysql://cs336group5.czzknrtounuc.us-east-2.rds.amazonaws.com:3306/cs336";
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(url, "cs336", "cs336project");

	Statement stmt = con.createStatement();
	ResultSet rs;
	rs = stmt.executeQuery("select * from sell where date >= curdate()");
	while(rs.next()){
			%>
			<tr>
    			<td><%=rs.getString("shoesid")%></td>
    			<td><%=rs.getString("name")%></td>
    			<td><%=rs.getString("brand")%></td>
    			<td><%=rs.getString("ip") %></td>
    			<td><%=rs.getString("current_bid") %></td>
    			<td><%=rs.getString("current_highest_bid_user") %></td>
    			<td><%=rs.getString("pi") %></td>
    			<td><%=rs.getString("color") %></td>
    			<td><%=rs.getString("size") %></td>
    			<td><%=rs.getString("date") %></td>
    			<td><%=rs.getString("owner") %></td>
    			<td><%=rs.getString("type") %></td>
    			<td><%=rs.getString("gender") %></td>
			</tr>
			<%
		}
		
		%></table> <%
	}
%>
				<center>
				<h3>Manually Bid</h3>
				</center>
		<form action="bid.jsp" method="POST">
			Shoes ID: <input type="text" name="shoesid" /> <br />  
			Place Bid:<input type="text" name="placebid" /> <br /> 
			<input type="submit" name="ManuallyBid" value="ManuallyBid" />
			
		</form>
		
				<center>
				<h3>Automatic Bid</h3>
				</center>
		<form action="bid.jsp" method="POST">
				Shoes ID: <input type="text" name="shoesid" /> <br />  
				Upper Limit: <input type="text" name="upperlimit" /> <br />
		<input type="submit" name="AutomaticBid" value="AutomaticBid">
		</form>
		
				<center>
				<h3>View History By Item</h3>
				</center>
		<form action="viewhistory.jsp" method="POST">
				Shoes ID: <input type="text" name="shoesid" /> <br />  
		<input type="submit" name="viewhistorybyitem" value="View History">
		</form>
		
		
		<center>
				<h3>View History By User</h3>
				</center>
		<form action="viewhistory.jsp" method="POST">
				UserID: <input type="text" name="username" /> <br />  		
		<input type="submit" name="viewhistorybyuser" value="View History">
		</form>
				
		
<%
	out.print("Click here to go back to search items that you are interested in.  <a href='search.html'>Go back</a>");
%>




