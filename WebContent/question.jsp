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
	
	//String username = request.getParameter("username");
	String username = (String) session.getAttribute("userId");
	String question = request.getParameter("question");
	
	
	if( username.equals("") || question.equals("")) {
		out.print("Failed! Empty Inputs! <a href='question.html'>try again</a>");
		return;
	}

	String insert = "INSERT INTO customer_question(username, question)" + "VALUES (?, ?)";

	PreparedStatement ps = con.prepareStatement(insert);
	ps.setString(1, username);
	ps.setString(2, question);
	ps.executeUpdate();

	out.print("Your questions are submitted! <a href='welcome.jsp'>Return to home page</a>");
} catch (Exception ex) {
	out.print("Question submition Failed! <a href='question.html'>try again</a>");
}

%>
