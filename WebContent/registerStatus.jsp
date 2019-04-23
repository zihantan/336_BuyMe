<html>
<head>
<title>Register Form</title>
</head>
</html>

<%@ page import ="java.sql.*" %>
<%
try {

	String url = "jdbc:mysql://cs336group5.czzknrtounuc.us-east-2.rds.amazonaws.com:3306/cs336";
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(url, "cs336", "cs336project");

	Statement stmt = con.createStatement();
	
	String name = request.getParameter("name");
	String username = request.getParameter("username");
	String pwd = request.getParameter("password");
	String email = request.getParameter("email");
	String favoritebrand =request.getParameter("favoritebrand");
	
	
	if(name.equals("") || username.equals("") || pwd.equals("")||email.equals("")||favoritebrand.equals("")) {
		out.print("Registration Failed! Empty Inputs! <a href='register.jsp'>try again</a>");
		return;
	}

	String insert = "INSERT INTO users(username, password, name, email, favoritebrand)" + "VALUES (?, ?, ?,?,?)";

	PreparedStatement ps = con.prepareStatement(insert);
	ps.setString(1, username);
	ps.setString(2, pwd);
	ps.setString(3, name);
	ps.setString(4,email);
	ps.setString(5,favoritebrand);
	ps.executeUpdate();

	out.print("Registration is complete! <a href='home.jsp'>Return to home page</a>");
} catch (Exception ex) {
	out.print("Registration Failed! Duplicate Username or Username too long <a href='register.jsp'>try again</a>");
}

%>
