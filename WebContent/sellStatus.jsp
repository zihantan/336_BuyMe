<html>
<head>
<title>Sell</title>
</head>
</html>

<%@ page import ="java.sql.*, java.util.Date, java.text.SimpleDateFormat" %>
<%
try {

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
	String reserve_price = request.getParameter("reservePrice");
	String color = request.getParameter("color");
	int size = Integer.parseInt(request.getParameter("Size"));
	String date1 = request.getParameter("Date");
	//SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	//df.setLenient(false);
	//SimpleDateFormat simpleDateFormat = new SimpleDateFormat(date1); "yyyy-MM-dd HH:mm"
	//Date date = df.parse(date1);	
			//out.print(date);
	//Date date = SimpleDateFormat.parse(date1);
	//String username = request.getParameter("username");	
	String username = (String)session.getAttribute("userId");
	String type = request.getParameter("kind");
	String gender = request.getParameter("gender");
	//out.print("hello1");
	
	//ResultSet checkUser = stmt.executeQuery("select * from users where user='" + username + "'");
	int reserve_money; 
	if(reserve_price.equals("")){
		reserve_money = 0;
	} else {
		reserve_money = Integer.parseInt(reserve_price);
	}
	//ResultSet checkUser = stmt.executeQuery("select * from user where user='" + username + "'");
	
	//out.print("hello1");
	if(name.equals("") || brand.equals("") ||  color.equals("") || date1.equals("") || type.equals("")) {
		out.print("Missing Inputs! <a href='sell.jsp'>try again</a>");
		return;
	}

	String insert = "INSERT INTO sell(name, brand, ip, pi, color, size, date, owner, type, gender,reserve)" +
	"VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)";

	PreparedStatement ps = con.prepareStatement(insert);
	ps.setString(1, name);
	ps.setString(2, brand);
	ps.setInt(3, ip);
	ps.setInt(4, pi);
	ps.setString(5, color);
	ps.setInt(6, size);
				
	//java.sql.Date sqlDate = new java.sql.Date(date.getTime());
	//PreparedStatement pst = connection.prepareStatement(sql);
	//pst.setDate(4, sqlDate);	
	//out.print(sqlDate);			
	ps.setString(7,date1);			
	//ps.setDate(7, sqlDate);
	ps.setString(8, username);
	ps.setString(9, type);
	ps.setString(10, gender);
	ps.setInt(11, reserve_money);
				//System.out.print(ps);
	ps.executeUpdate();

	out.print(username);
	out.print(" your Shoes is on Stock! <a href='sell.jsp'>Return to Last page</a>");
} catch (Exception ex) {	
	out.print("Information Error <a href='sell.jsp'>try again</a>");
}

%>
