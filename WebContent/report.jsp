<html>
<head>
<title>Login Form</title>
</head>
</html>

<%@ page import ="java.sql.*" %>
<%
	   
	
	//session.setAttribute("userid",username);

	if (request.getParameter("totalearn") != null) {
		String url = "jdbc:mysql://cs336group5.czzknrtounuc.us-east-2.rds.amazonaws.com:3306/cs336";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, "cs336", "cs336project");
		Statement stmt = con.createStatement();
					
		ResultSet rs = stmt.executeQuery("select sum(trans_price) as total from auction");
		 if (rs.next()) {
			 		//out.println("Welcome " + username + "! <a href='home.jsp'>Logout</a>");
		        String counteRemember= rs.getString("total");
		        out.println(counteRemember);
		        out.println("Go back to the generating report page if you want<a href='greport.html'>back</a>");
		} else {
			     out.println("Invalid report or no transaction yet <a href='greport.html'>try again</a>");
		}
	}else if (request.getParameter("userrp") != null) {
		String username = request.getParameter("user"); 
		String url = "jdbc:mysql://cs336group5.czzknrtounuc.us-east-2.rds.amazonaws.com:3306/cs336";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, "cs336", "cs336project");
		Statement stmt = con.createStatement();
					
		ResultSet rs = stmt.executeQuery("select * from auction where seller ='" + username + "'");
		if(!rs.next()){
			     out.println("Invalid username or no report for this user yet <a href='greport.html'>try again</a>");
		}else{
		 	while (rs.next()) {
			 		//out.println("Welcome " + username + "! <a href='home.jsp'>Logout</a>");
				%>
				<tr>
        			<td><%=rs.getString("actionid")%></td>
        			<td><%=rs.getString("trans_price")%></td>
        			<td><%=rs.getString("date")%></td>
        			<td><%=rs.getString("seller") %></td>
        			<td><%=rs.getString("buyer") %></td>
        			<td><%=rs.getString("shoesid") %></td>
    			</tr>
    			<%
			}
		 	"Go back to the generating report page if you want<a href='greport.html'>back</a>"
		}
	}else if (request.getParameter("shoesrp") != null) {
		String shoesID = request.getParameter("shoes");
		String url = "jdbc:mysql://cs336group5.czzknrtounuc.us-east-2.rds.amazonaws.com:3306/cs336";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, "cs336", "cs336project");
		Statement stmt = con.createStatement();
					
		ResultSet rs = stmt.executeQuery("select * from auction where shoesid ='" + shoesID + "'");
		if(!rs.next()){
		     out.println("Invalid shoesID or no report for this pair of shoes yet <a href='greport.html'>try again</a>");
		}else{
	 		while (rs.next()) {
		 		//out.println("Welcome " + username + "! <a href='home.jsp'>Logout</a>");
			%>
				<tr>
   				<td><%=rs.getString("actionid")%></td>
   				<td><%=rs.getString("trans_price")%></td>
   				<td><%=rs.getString("date")%></td>
   				<td><%=rs.getString("seller") %></td>
   				<td><%=rs.getString("buyer") %></td>
   				<td><%=rs.getString("shoesid") %></td>
				</tr>
			<%
			}
	 		"Go back to the generating report page if you want<a href='greport.html'>back</a>"
		}
	}
%>