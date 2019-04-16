<html>
<head>
<title>Login Form</title>
</head>
</html>

<%@ page import ="java.sql.*" %>
<%
	   
	String pwd = request.getParameter("password");
	if(username.equals("") || pwd.equals("")) {
		out.print("Login Failed! Empty Inputs! <a href='login.jsp'>try again</a>");
		return;
	}
	
	//session.setAttribute("userid",username);

	if (request.getParameter("totalearn") != null) {
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
	}else if (request.getParameter("user") != null) {
		String username = request.getParameter("user");
		String url = "jdbc:mysql://cs336group5.czzknrtounuc.us-east-2.rds.amazonaws.com:3306/cs336";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, "cs336", "cs336project");
		Statement stmt = con.createStatement();
					
		ResultSet rs = stmt.executeQuery("select * from customerrepresentative where ID='" + username + "' and pwd='" + pwd + "'");
		 if (rs.next()) {
			 		//out.println("Welcome " + username + "! <a href='home.jsp'>Logout</a>");
			 		session.setAttribute("ID", username);
			 		response.sendRedirect("customerrepresentative.jsp");
		} else {
			        out.println("Invalid report <a href='greport.html'>try again</a>");
		}
	}else if (request.getParameter("shoes") != null) {
		String url = "jdbc:mysql://cs336group5.czzknrtounuc.us-east-2.rds.amazonaws.com:3306/cs336";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, "cs336", "cs336project");
		Statement stmt = con.createStatement();
					
		ResultSet rs = stmt.executeQuery("select * from admin where ID='" + username + "' and pwd='" + pwd + "'");
		 if (rs.next()) {
			 		//out.println("Welcome " + username + "! <a href='home.jsp'>Logout</a>");
			 		session.setAttribute("ID", username);
			 		response.sendRedirect("admin.html");
		} else {
			        out.println("Invalid report <a href='greport.html'>try again</a>");
		}
	}
%>