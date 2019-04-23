<html>
<head>
<title>Ask Question</title>
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
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String from = request.getParameter("myemail");
	String to = request.getParameter("youremail");
	String type = request.getParameter("type");
   
	if( username.equals("") || subject.equals("")||type.equals("")||from.equals("")||to.equals("")||content.equals("")) {
		out.print("Failed! Empty Inputs! <a href='question.html'>try again</a>");
		return;
	}
	String insert = "INSERT INTO customer_question(username, subject, content, from, to, type)" + "VALUES (?, ?, ?, ?, ?, ?)";
	PreparedStatement ps = con.prepareStatement(insert);
	ps.setString(1, username);
	ps.setString(2, subject);
	ps.setString(3, content);
	ps.setString(4, from);
	ps.setString(5, to);
	ps.setString(6, type);
	ps.executeUpdate();
	out.print("Your questions are submitted! <a href='welcome.jsp'>Return to home page</a>");
} catch (Exception ex) {
	//System.out.println(request.getParameter("question"));
	//System.out.println(request.getParameter("type"));
	out.print("Question submition Failed11! <a href='question.html'>try again</a>");
}
%>