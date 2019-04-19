<html>
<head>
<title>Register Form</title>
</head>
</html>

<%@ page import ="java.sql.*, java.util.Date, java.text.SimpleDateFormat" %>
<%
//try {

	String url = "jdbc:mysql://cs336group5.czzknrtounuc.us-east-2.rds.amazonaws.com:3306/cs336";
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(url, "cs336", "cs336project");

	Statement stmt = con.createStatement();

	String a = request.getParameter("Initial Price");
	String b = request.getParameter("Size");
	
	if(a.equals("") || b.equals("")){
		out.print("Missing Inputs! <a href='sell.jsp'>try again</a>");
		return;
	}
	//out.print("hello1");
	String name = request.getParameter("Name");
	String brand = request.getParameter("Brand");
	int ip = Integer.parseInt(request.getParameter("Initial Price"));
	int pi = Integer.parseInt(request.getParameter("Price Increment"));
	String color = request.getParameter("color");
	int size = Integer.parseInt(request.getParameter("Size"));
	String date = request.getParameter("Date");
	//String username = request.getParameter("username");	
	String username = (String)session.getAttribute("userId");
	String type = request.getParameter("kind");
	String gender = request.getParameter("gender");		
	
	ResultSet checkUser = stmt.executeQuery("select * from users where user='" + username + "'");
	
	if(!checkUser.next()) {
		out.print("Invalid Username! <a href='sell.jsp'>try again</a>");
		return;
	}
	
	if(name.equals("") || brand.equals("") ||  color.equals("") || date.equals("") || type.equals("")) {
		out.print("Missing Inputs! <a href='sell.jsp'>try again</a>");
		return;
	}

	String insert = "INSERT INTO sell(name, brand, ip, pi, color, size, date, user, type, gender)" +
	"VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

	PreparedStatement ps = con.prepareStatement(insert);
	ps.setString(1, name);
	ps.setString(2, brand);
	ps.setInt(3, ip);
	ps.setInt(4, pi);
	ps.setString(5, color);
	ps.setInt(6, size);
	ps.setString(7, date);
	ps.setString(8, username);
	ps.setString(9, type);
	ps.setString(10, gender);
	ps.executeUpdate();

	out.print(username);
	out.print(" your Shoes is on Stock! <a href='sell.jsp'>Return to Last page</a>");
//} catch (Exception ex) {
	
	//out.print("Information Error <a href='sell.jsp'>try again</a>");

%>
