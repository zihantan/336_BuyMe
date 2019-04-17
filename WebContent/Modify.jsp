<html>
<head>
<title>Account Information</title>
</head>
</html>
<%@ page import ="java.sql.*" %>

<%
if (request.getParameter("modifyinfo") != null) {
	String ema = request.getParameter("Email");   
	String pwd = request.getParameter("Password");
	String ming = request.getParameter("Name");
	String Uname = request.getParameter("Username");
	
	if(ema.equals("") && pwd.equals("")  && ming.equals("")) {
		out.print("no change occured <a href='Modify.html'>try again</a>");
		return;
	}
	
	if((!ema.equals("") && !pwd.equals("") &&  !ming.equals(""))){
		out.print("you could only change one account information per time in <a href='Modify.html'>try again</a>");
		return;
	}
	if(!ema.equals("") && !pwd.equals("") ){
		out.print("you could only change one account information per time <a href='Modify.html'>try again</a>");
		return;
	}
	if(!pwd.equals("")  && !ming.equals("")){
		out.print("you could only change one account information per time <a href='Modify.html'>try again</a>");
		return;
	}
	if(!pwd.equals("") && !ema.equals("") && !ming.equals("")){
		out.print("you could only change one account information per time <a href='Modify.html'>try again</a>");
		return;
	}
	if(!ema.equals("") && !ming.equals("")){
		out.print("you could only change one account information per time <a href='Modify.html'>try again</a>");
		return;
	}
	if(Uname.equals("")) {
		out.print("you must type your Username <a href='Modify.html'>try again</a>");
		return;
	}
	
	String url = "jdbc:mysql://cs336group5.czzknrtounuc.us-east-2.rds.amazonaws.com:3306/cs336";
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(url, "cs336", "cs336project");
	if(!pwd.equals("")){
		Statement stmt = con.createStatement();
				
		ResultSet rs = stmt.executeQuery("select * from users where username='" + Uname + "'");
	 	if (rs.next()) {
		 	String q = "UPDATE users set password = '" + pwd + "' WHERE (Username = '" + Uname + "')";
		 	int result = stmt.executeUpdate(q);
		 	out.println("Successfully Changed! <a href='Modify.html'>Go back </a>");
		} else {
		  	out.println("Invalid password <a href='Modify.html'>try again</a>");
		}
	}
	if(!ema.equals("")){
	 	Statement stmt1 = con.createStatement();
	 	ResultSet rs1 = stmt1.executeQuery("select * from users where username='" + Uname+ "'");
	 	if (rs1.next()) {
		 	String q1 = "UPDATE users set email = '" + ema + "' WHERE (Username = '" + Uname + "')";
		 	int result1 = stmt1.executeUpdate(q1);
		 	out.println("Successfully Changed! <a href='Modify.html'>Go back</a>");
		} else {
		    out.println("Invalid email <a href='Modify.jsp'>try again</a>");
		}
	 }
	
	 if(!ming.equals("")){
	 	Statement stmt4 = con.createStatement();
	 	ResultSet rs4 = stmt4.executeQuery("select * from users where username='" + Uname + "'");
	 	if (rs4.next()) {
		 	String q3 ="UPDATE users set name = '" + ming + "' WHERE (Username = '" + Uname + "')";
		 	int result1 = stmt4.executeUpdate(q3);
		 	out.println("Successfully Changed! <a href='Modify.html'>Go back to account</a>");
		} else {
		    out.println("Invalid name <a href='Modify.jsp'>try again</a>");
		}
	 }
}else if(request.getParameter("removebid") != null){
	String bidid = request.getParameter("bidid");
	if(bidid.equals("")){
		out.print("Please insert a bidid in order to remove this bid! <a href='Modify.html'>try again</a>");
		return;
	}
	String url = "jdbc:mysql://cs336group5.czzknrtounuc.us-east-2.rds.amazonaws.com:3306/cs336";
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(url, "cs336", "cs336project");
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("select * from bid where bidid='" + bidid + "'");
	
	if (rs.next()) {
		 String q = "DELETE FROM bid WHERE (bidid = '" + bidid + "')";
		 int result = stmt.executeUpdate(q);
		 out.println("Successfully deleted! <a href='Modify.html'>Go back to Modify</a>");
	}else{
		out.print("Invalid deletion. <a href='Modify.html'>Try again.</a> ");
	}
}else if(request.getParameter("removeauction") !=null){
	String auctionid = request.getParameter("auctionid");
	if(auctionid.equals("")){
		out.print("Please insert an auctionid in order to remove this auction! <a href='Modify.html'>try again</a>");
		return;
	}
	String url = "jdbc:mysql://cs336group5.czzknrtounuc.us-east-2.rds.amazonaws.com:3306/cs336";
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(url, "cs336", "cs336project");
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("select * from auction where auctionid='" + auctionid + "'");
	
	if (rs.next()) {
		 String q = "DELETE FROM auction WHERE (auctionid = '" + auctionid + "')";
		 int result = stmt.executeUpdate(q);
		 out.println("Successfully deleted! <a href='Modify.html'>Go back to Modify</a>");
	}else{
		out.print("Invalid deletion. <a href='Modify.html'>Try again.</a> ");
	}
}
%>

