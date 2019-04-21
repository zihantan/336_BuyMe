<html>
<head>
<title>add alert</title>
</head>
</html>

<%@ page import ="java.sql.*" %>
<%
try {

	String url = "jdbc:mysql://cs336group5.czzknrtounuc.us-east-2.rds.amazonaws.com:3306/cs336";
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(url, "cs336", "cs336project");

	Statement stmt = con.createStatement();
	String size = request.getParameter("size");
	String brand = request.getParameter("brand");
	//String Username = request.getParameter("Username");
	String username = (String)session.getAttribute("userId");
Statement stmt10 = con.createStatement();

	ResultSet rs10 = stmt10.executeQuery("select * from users where username='" + username + "'");
	
	 if (!rs10.next()) {
		 out.println("Invalid username <a href='ACCOUNT.html'>try again</a>");
				 return;
	 }
	String kind = request.getParameter("kind");
	String color = request.getParameter("color");
	
	if(size.equals("") || brand.equals("") || kind.equals("")||color.equals("")) {
		out.print("ADD Failed! Empty Inputs! <a href='ACCOUNT.html'>try again</a>");
		return;
	}
	

	String insert = "INSERT INTO addalert( username,brand, size,color,kind)" + "VALUES (?, ?, ?, ?, ?)";

	PreparedStatement ps = con.prepareStatement(insert);
	ps.setString(1, username);
	ps.setString(2, brand);
	ps.setString(3, size);
	ps.setString(4, color);
	ps.setString(5, kind);			
	ps.executeUpdate();

	out.print("Add alert information succuesful! <a href='ACCOUNT.html'>Return to home page</a>");
} catch (Exception ex) {
	out.print("ADD FAILed! <a href='ACCOUNT.html'>try again</a>");

}
%>
