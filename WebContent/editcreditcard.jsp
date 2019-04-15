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
	String expDate = request.getParameter("expDate");
	String CNumber = request.getParameter("CNumber");
	//String Username = request.getParameter("Username");
	String Username = (String)session.getAttribute("userId");
Statement stmt10 = con.createStatement();
	
	ResultSet rs10 = stmt10.executeQuery("select * from users where username='" + Username + "'");
	
	 if (!rs10.next()) {
		 out.println("Invalid username <a href='ACCOUNT.html'>try again</a>");
				 return;
	 }
	String Name = request.getParameter("Name");
	String BillingAddr = request.getParameter("BillingAddr");
	String CType = request.getParameter("CType");
	String SecCode = request.getParameter("SecCode");

	if(Name.equals("") || Username.equals("") || CNumber.equals("")||CType.equals("")||SecCode.equals("")) {
		out.print("ADD Failed! Empty Inputs! <a href='ACCOUNT.html'>try again</a>");
		return;
	}

	String insert = "INSERT INTO creditcard( CNumber,Username, CType,Name,expDate,SecCode,BillingAddr)" + "VALUES (?, ?, ?, ?, ?, ?, ?)";

	PreparedStatement ps = con.prepareStatement(insert);
	ps.setString(1, CNumber);
	ps.setString(2, Username);
	ps.setString(3, CType);
	ps.setString(4, Name);
	ps.setString(5, expDate);
	ps.setString(6, SecCode);
	ps.setString(7, BillingAddr);			
	ps.executeUpdate();

	out.print("Add payment information succuesful! <a href='ACCOUNT.html'>Return to home page</a>");
} catch (Exception ex) {
	out.print("ADD FAIL1 <a href='ACCOUNT.html'>try again</a>");

}
%>
