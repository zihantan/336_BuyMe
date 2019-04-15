<html>
<head>
<title>Login Form</title>
</head>
</html>

<%@ page import ="java.sql.*" %>
<%
	String username = request.getParameter("username");   
	String pwd = request.getParameter("password");
	if(username.equals("") || pwd.equals("")) {
		out.print("Login Failed! Empty Inputs! <a href='login.jsp'>try again</a>");
		return;
	}
	
	//session.setAttribute("userid",username);

	if (request.getParameter("user") != null) {
		String url = "jdbc:mysql://cs336group5.czzknrtounuc.us-east-2.rds.amazonaws.com:3306/cs336";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, "cs336", "cs336project");
		Statement stmt = con.createStatement();
					
		ResultSet rs = stmt.executeQuery("select * from users where username='" + username + "' and password='" + pwd + "'");
		 if (rs.next()) {
			 		//out.println("Welcome " + username + "! <a href='home.jsp'>Logout</a>");
			 	session.setAttribute("userId", username);
			 	response.sendRedirect("welcome.jsp");
		} else {
			     out.println("Invalid password <a href='login.jsp'>try again</a>");
		}
	}else if (request.getParameter("CR") != null) {
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
			        out.println("Invalid password <a href='login.jsp'>try again</a>");
		}
	}else if (request.getParameter("Admin") != null) {
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
			        out.println("Invalid password <a href='login.jsp'>try again</a>");
		}
	}
%>
