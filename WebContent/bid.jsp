<html>
<head>
<title>Bid</title>
</head>
</html>
<%@ page import ="java.sql.*" %>

<%
	if (request.getParameter("ManuallyBid") != null) {
		
		//out.print("test");
		
		String shoesid = request.getParameter("shoesid");   
		String placebid = request.getParameter("placebid");
		String Uname = (String)session.getAttribute("userId");
		if(shoesid.equals("") || placebid.equals("")){
			out.print("Please choose a pair of shoes and place your bid. <a href='search.jsp'>try again</a>");
			return;
		}
	
		String url = "jdbc:mysql://cs336group5.czzknrtounuc.us-east-2.rds.amazonaws.com:3306/cs336";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, "cs336", "cs336project");
		Statement stmt = con.createStatement();
	
		//ResultSet rs = stmt.executeQuery("select s.ip as initial from bid b, sell s where b.shoesid = s.shoesid and b.shoesid='" + shoesid + "'");
		ResultSet rs = stmt.executeQuery("select * from sell where shoesid='" + shoesid + "'");
		
	 	if(rs.next()){
	 		String initial= rs.getString("ip");
	 		int bid = Integer.parseInt(placebid);
	 		int initialPrice = Integer.parseInt(initial);
	 		int priceIncrement = rs.getInt("pi");
	 		String current_bid = rs.getString("current_bid");
	 		//Integer current_bid = rs.getInt("current_bid");
	 		boolean inserted = false;
	 		if(current_bid==null) {
	 			if(bid>=initialPrice) {
	 				//insert
	 				inserted = true;
	 				String insert = "INSERT INTO bid(shoesid, buyer, bid_price)" + "VALUES (?, ?, ?)";
					PreparedStatement ps = con.prepareStatement(insert);
					ps.setInt(1, Integer.parseInt(shoesid));
					ps.setString(2, Uname);
					ps.setInt(3, bid);
					ps.executeUpdate();
			
					String q = "UPDATE sell set current_bid = '" + bid + "' WHERE (shoesid = '" + shoesid + "')";
					int result = stmt.executeUpdate(q);
		 			out.println("Your bid is successful! <a href='search.html'>Go Back</a>");
	 			}
	 		} else {
	 			if(bid>=Integer.parseInt(current_bid)+priceIncrement) {
	 				//insert
	 				inserted = true;
	 				String insert = "INSERT INTO bid(shoesid, buyer, bid_price)" + "VALUES (?, ?, ?)";
					PreparedStatement ps = con.prepareStatement(insert);
					ps.setInt(1, Integer.parseInt(shoesid));
					ps.setString(2, Uname);
					ps.setInt(3, bid);
					ps.executeUpdate();
			
					String q = "UPDATE sell set current_bid = '" + bid + "' WHERE (shoesid = '" + shoesid + "')";
					int result = stmt.executeUpdate(q);
		 			out.println("Your bid is successful! <a href='search.html'>Go Back</a>");
	 			}
	 		}
	 		if(inserted==false) {
	 			out.print("Your bid is unsuccessful, please check your bid price! <a href='search.jsp'>Try Again</a>");
	 		}
	 		/*
	 		if((bid>=initialPrice && current_bid==null) || (bid>=Integer.parseInt(current_bid)+priceIncrement)){
	 			// insert
	 		 	String insert = "INSERT INTO bid(shoesid, buyer, bid_price)" + "VALUES (?, ?, ?)";
				PreparedStatement ps = con.prepareStatement(insert);
				ps.setInt(1, Integer.parseInt(shoesid));
				ps.setString(2, Uname);
				ps.setInt(3, bid);
				ps.executeUpdate();
		
				String q = "UPDATE sell set current_bid = '" + bid + "' WHERE (shoesid = '" + shoesid + "')";
				int result = stmt.executeUpdate(q);
	 			out.println("Your bid is successful! <a href='search.html'>Go Back</a>");
	 			
	 		} else {
	 			// outprint error here
	 			out.print("Your bid is unsuccessful, please check your bid price! <a href='search.jsp'>Try Again</a>");
	 		}
	 		*/
	 	} else {
	 		out.print("Your bid is unsuccessful, please check your shoe id! <a href='search.jsp'>Try Again</a>");
	 	}
	}else if(request.getParameter("AutomaticBid") != null){
		String shoesid = request.getParameter("shoesid");   
		String upperlimit = request.getParameter("upperlimit");
		
		if(shoesid.equals("") || upperlimit.equals("")){
			out.print("Please choose a pair of shoes and place your bid. <a href='search.jsp'>try again</a>");
			return;
		}
		
		String url = "jdbc:mysql://cs336group5.czzknrtounuc.us-east-2.rds.amazonaws.com:3306/cs336";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, "cs336", "cs336project");
		Statement stmt = con.createStatement();
	
		ResultSet rs = stmt.executeQuery("select * from bid where shoesid='" + shoesid + "'");
	
	
 	}
%>
