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
	
	if(pricerange.equals("any") || name.equals("") || color.equals("any") || kind.equals("any") || gender.equals("any") || brand.equals("")) {
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
	    <th>Price Increment</th>
	    <th>Color</th>
	    <th>Size</th>
	    <th>Date</th>
	    <th>Owner</th>
	    <th>Type</th>
	    <th>Gender</th>
	  </tr>
		<% 
		rs = stmt.executeQuery("select * from sell where name ='" + name 
				+ "' and color='" + color + "' and brand ='" + brand+ "' and type ='" + kind +"' and gender='" + gender + "' and ip < 50" );
		while(rs.next()){
			%>
			<tr>
    			<td><%=rs.getString("shoesid")%></td>
    			<td><%=rs.getString("name")%></td>
    			<td><%=rs.getString("brand")%></td>
    			<td><%=rs.getString("ip") %></td>
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
	    <th>Price Increment</th>
	    <th>Color</th>
	    <th>Size</th>
	    <th>Date</th>
	    <th>Owner</th>
	    <th>Type</th>
	    <th>Gender</th>
	  </tr>
		<% 
		rs = stmt.executeQuery("select * from sell where name ='" + name 
				+ "' and color='" + color + "' and brand ='" + brand+ "' and type ='" + kind +"' and gender='" + gender + "' and ip >=50 and ip < 100" );
		while(rs.next()){
			%>
			<tr>
    			<td><%=rs.getString("shoesid")%></td>
    			<td><%=rs.getString("name")%></td>
    			<td><%=rs.getString("brand")%></td>
    			<td><%=rs.getString("ip") %></td>
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
	    <th>Price Increment</th>
	    <th>Color</th>
	    <th>Size</th>
	    <th>Date</th>
	    <th>Owner</th>
	    <th>Type</th>
	    <th>Gender</th>
	  </tr>
		<% 
		rs = stmt.executeQuery("select * from sell where name ='" + name 
				+ "' and color='" + color + "' and brand ='" + brand+ "' and type ='" + kind +"' and gender='" + gender + "' and ip >= 100 and ip <200" );
		while(rs.next()){
			%>
			<tr>
    			<td><%=rs.getString("shoesid")%></td>
    			<td><%=rs.getString("name")%></td>
    			<td><%=rs.getString("brand")%></td>
    			<td><%=rs.getString("ip") %></td>
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
		
		rs = stmt.executeQuery("select * from sell where name ='" + name 
				+ "' and color='" + color + "' and brand ='" + brand+ "' and type ='" + kind +"' and gender='" + gender + "' and ip >= 200" );
		while(rs.next()){
			%>
			<tr>
    			<td><%=rs.getString("shoesid")%></td>
    			<td><%=rs.getString("name")%></td>
    			<td><%=rs.getString("brand")%></td>
    			<td><%=rs.getString("ip") %></td>
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
	rs = stmt.executeQuery("select * from sell");
	while(rs.next()){
			%>
			<tr>
    			<td><%=rs.getString("shoesid")%></td>
    			<td><%=rs.getString("name")%></td>
    			<td><%=rs.getString("brand")%></td>
    			<td><%=rs.getString("ip") %></td>
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

<form action="bid.jsp" method="POST">
			Shoes ID: <input type="text" name="shoesid" /> <br />   
			<input type="submit" name="Bid" value="Bid" />
		</form>






