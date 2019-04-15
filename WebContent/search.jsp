<html>
<head>
<title>Login Form</title>
</head>
</html>

<%@ page import ="java.sql.*" %>
<%
	String name = request.getParameter("name");   
	String color = request.getParameter("color");
	String kind = request.getParameter("kind");
	String gender = request.getParameter("gender");
	String brand = request.getParameter("brand");
	String pricerange = request.getParameter("pricerange");
	
	
	String url = "jdbc:mysql://cs336group5.czzknrtounuc.us-east-2.rds.amazonaws.com:3306/cs336";
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(url, "cs336", "cs336project");

	Statement stmt = con.createStatement();
	ResultSet rs; 
	if(pricerange.equals("0~50")){
		rs = stmt.executeQuery("select * from sell where name='" + color 
				+ "' and password='" + color + "'");
	}else if(pricerange.equals("50~100")){
		rs = stmt.executeQuery("select * from sell where name='" + color 
				+ "' and password='" + color + "'");
	}else if(pricerange.equals("100~200")){
		rs = stmt.executeQuery("select * from sell where name='" + color 
				+ "' and password='" + color + "'");
	}else if(pricerange.equals("200~")){
		rs = stmt.executeQuery("select * from sell where name='" + color 
				+ "' and password='" + color + "'");
	}else{
		rs = stmt.executeQuery("select * from sell where name='" + color 
				+ "' and password='" + color + "'");
	}
	
	 if (rs.next()) {
		 		//out.println("Welcome " + username + "! <a href='home.jsp'>Logout</a>");
		 		//session.setAttribute("userId", username);
		 		response.sendRedirect("welcome.jsp");
		    } else {
		        out.println("Invalid password <a href='login.jsp'>try again</a>");
		    }
%>
