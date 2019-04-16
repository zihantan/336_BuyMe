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
		} else {
			     out.println("Invalid report <a href='greport.html'>try again</a>");
		}
	}else if (request.getParameter("user") != null) {
		String username = request.getParameter("user");
		String url = "jdbc:mysql://cs336group5.czzknrtounuc.us-east-2.rds.amazonaws.com:3306/cs336";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, "cs336", "cs336project");
		Statement stmt = con.createStatement();
					
		ResultSet rs = stmt.executeQuery("select sum(trans_price) from auction");
		 if (rs.next()) {
			 		//out.println("Welcome " + username + "! <a href='home.jsp'>Logout</a>");
		        String counteRemember= rs.getString("sum");
		        out.println(counteRemember);
		} else {
			        out.println("Invalid report <a href='greport.html'>try again</a>");
		}
	}else if (request.getParameter("shoes") != null) {
		String url = "jdbc:mysql://cs336group5.czzknrtounuc.us-east-2.rds.amazonaws.com:3306/cs336";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, "cs336", "cs336project");
		Statement stmt = con.createStatement();
					
		ResultSet rs = stmt.executeQuery("select sum(trans_price) from auction");
		 if (rs.next()) {
			 		//out.println("Welcome " + username + "! <a href='home.jsp'>Logout</a>");
		        String counteRemember= rs.getString("sum");
		        out.println(counteRemember);
		} else {
			        out.println("Invalid report <a href='greport.html'>try again</a>");
		}
	}
%>