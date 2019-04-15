<html>
<head>
<title>Account Information</title>
</head>
</html>
<%@ page import ="java.sql.*" %>

<%
	
	String Uname = (String)session.getAttribute("userId");
	
	if(Uname.equals("")) {
		out.print("You need to type your Username <a href='ACCOUNT.html'>try again</a>");
		return;
	}
	
	
	String url = "jdbc:mysql://cs336group5.czzknrtounuc.us-east-2.rds.amazonaws.com:3306/cs336";
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(url, "cs336", "cs336project");
	
	Statement stmt10 = con.createStatement();
	
	ResultSet rs10 = stmt10.executeQuery("select * from users where username='" + Uname + "'");
	
	 if (!rs10.next()) {
		 out.println("Invalid username <a href='ACCOUNT.html'>try again</a>");
	 }
	 else{
	Statement stmt = con.createStatement();
				
	ResultSet rs = stmt.executeQuery("select * from users where username='" + Uname + "'");
	 if (rs.next()) {
		 String q = "DELETE FROM users WHERE (Username = '" + Uname + "')";
		 int result = stmt.executeUpdate(q);
		 out.println("Successfully deleted! <a href='ACCOUNT.html'>Go back to account</a>");
		    } else {
		        out.println("Invalid Username` <a href='ACCOUNT.html'>try again</a>");
		    }}

%>
