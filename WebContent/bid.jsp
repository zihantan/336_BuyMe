<html>
<head>
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
			out.print("Please choose a pair of shoes and place your bid. <a href='search.html'>try again</a>");
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
	 		String current_bid_user =rs.getString("current_highest_bid_user");
	 		//int auto =
	 				
	 		//Integer current_bid = rs.getInt("current_bid");
	 		boolean inserted = false;
	 		if(current_bid==null && current_bid_user ==null) {
	 			if(bid>=initialPrice) {
	 				//insert
	 				inserted = true;
	 				String insert = "INSERT INTO bid(shoesid, buyer, bid_price)" + "VALUES (?, ?, ?)";
					PreparedStatement ps = con.prepareStatement(insert);
					ps.setInt(1, Integer.parseInt(shoesid));
					ps.setString(2, Uname);
					ps.setInt(3, bid);
					ps.executeUpdate();
			
					String q = "UPDATE sell set current_bid = '" + bid + "', current_highest_bid_user = '" + Uname + "' WHERE (shoesid = '" + shoesid + "')";
					int result = stmt.executeUpdate(q);
		 			out.println("Your bid is successful! <a href='search.html'>Go Back</a>");
	 			}
	 		} else {
	 			if(bid>=Integer.parseInt(current_bid)+priceIncrement &&  !Uname.equals(current_bid_user)) {
	 				//insert
	 				
	 				inserted = true;
	 				String insert = "INSERT INTO bid(shoesid, buyer, bid_price)" + "VALUES (?, ?, ?)";
					PreparedStatement ps = con.prepareStatement(insert);
					ps.setInt(1, Integer.parseInt(shoesid));
					ps.setString(2, Uname);
					ps.setInt(3, bid);
					ps.executeUpdate();
			
					String q = "UPDATE sell set current_bid = '" + bid + "', current_highest_bid_user = '" + Uname + "' WHERE (shoesid = '" + shoesid + "')";
					int result = stmt.executeUpdate(q);
		 			
		 			
		 			//out.print(rs.getString("current_highest_bid_user"));
		 			//System.out.println("test");
		 			
		 			ResultSet ts = stmt.executeQuery("select * from bid where shoesid='" + shoesid + "'");
		 			while(ts.next()){
		 				int auto = ts.getInt("auto");
		 				if(auto == 1){
		 					int upperlimit = ts.getInt("upperlimit");
		 					//int current_bid_int = Integer.parseInt(current_bid);
		 					String autobuyer = ts.getString("buyer");
		 					//System.out.println(current_bid_int);
		 					if(bid+priceIncrement<= upperlimit){
		 						int new_auto_bid = priceIncrement + bid;
		 						//current_bid_int +=priceIncrement;
		 						 insert = "INSERT INTO bid(shoesid, buyer, bid_price,upperlimit,auto)" + "VALUES (?, ?, ?, ?, ?)";
		 						PreparedStatement ps1 = con.prepareStatement(insert);
		 						ps1.setInt(1, Integer.parseInt(shoesid));
		 						ps1.setString(2, autobuyer);
		 						ps1.setInt(3, new_auto_bid);
		 						ps1.setInt(4,upperlimit);
		 						ps1.setInt(5,1);
		 						ps1.executeUpdate();
		 						
		 						//out.print(rs.getString("current_highest_bid_user"));
		 					
		 						String t = "UPDATE sell set current_bid = '" + new_auto_bid + "', current_highest_bid_user = '" + autobuyer + "' WHERE (shoesid = '" + shoesid + "')";
		 						int result1 = stmt.executeUpdate(t);	
		 						break;		
		 					}
		 					
		 				}	 				
		 			}
		 			out.println("Your bid is successful! <a href='search.html'>Go Back</a>");
	 			}
	 		}
	 		if(inserted==false) {
	 			//out.print(rs.getString("current_highest_bid_user"));
	 			out.print("Your bid is unsuccessful, please check your bid price or you have already bidden on this item ! <a href='search.html'>Try Again</a>");
	 		}
	 	} else {
	 		out.print("Your bid is unsuccessful, please check your shoe id! <a href='search.html'>Try Again</a>");
	 	}
	 	
	 	
	}else if(request.getParameter("AutomaticBid") != null){
		String shoesid = request.getParameter("shoesid");   
		String upperlimit = request.getParameter("upperlimit");
		String Uname = (String)session.getAttribute("userId");
		
		if(shoesid.equals("") || upperlimit.equals("")){
			out.print("Please choose a pair of shoes and place your upperlimit price. <a href='search.html'>try again</a>");
			return;
		}
		
		String url = "jdbc:mysql://cs336group5.czzknrtounuc.us-east-2.rds.amazonaws.com:3306/cs336";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, "cs336", "cs336project");
		Statement stmt = con.createStatement();
	
		ResultSet rs = stmt.executeQuery("select * from sell where shoesid='" + shoesid + "'");
		if(rs.next()){
			String initial= rs.getString("ip");
			//String upper= rs.getString("upperlimit");
	 		int upper_limit = Integer.parseInt(upperlimit);
	 		int initialPrice = Integer.parseInt(initial);
	 		int priceIncrement = rs.getInt("pi");
	 		String current_bid = rs.getString("current_bid");
	 		String current_bid_user =rs.getString("current_highest_bid_user");
	 		boolean inserted = false;
	 		if(current_bid==null && current_bid_user ==null) {
	 				//insert
	 				inserted = true;
	 				String insert = "INSERT INTO bid(shoesid, buyer, bid_price,auto,upperlimit)" + "VALUES (?, ?, ?,?,?)";
					PreparedStatement ps = con.prepareStatement(insert);
					ps.setInt(1, Integer.parseInt(shoesid));
					ps.setString(2, Uname);
					ps.setInt(3, initialPrice);
					ps.setInt(4,1);
					ps.setInt(5,upper_limit);
					ps.executeUpdate();
			
					String q = "UPDATE sell set current_bid = '" + initialPrice + "', current_highest_bid_user = '" + Uname + "' WHERE (shoesid = '" + shoesid + "')";
					int result = stmt.executeUpdate(q);
					
		 			out.println("Your bid is successful! Since there is no bid yet, your bid price will be the initial price. <a href='search.html'>Go Back</a>");
	 			
	 		} else {
	 			// Check that upperlimit > current_bid
	 			int bid_price = Integer.parseInt(current_bid)+priceIncrement;
	 			if(!Uname.equals(current_bid_user) && Integer.parseInt(upperlimit)>bid_price) {
	 				//insert
	 				inserted = true;
	 				String insert = "INSERT INTO bid(shoesid, buyer, bid_price,auto,upperlimit)" + "VALUES (?, ?, ?,?,?)";
					PreparedStatement ps = con.prepareStatement(insert);
					ps.setInt(1, Integer.parseInt(shoesid));
					ps.setString(2, Uname);
					ps.setInt(3, bid_price);
					ps.setInt(4,1);
					ps.setInt(5,upper_limit);
					ps.executeUpdate();
			
					String q = "UPDATE sell set current_bid = '" + bid_price + "', current_highest_bid_user = '" + Uname + "' WHERE (shoesid = '" + shoesid + "')";
					int result = stmt.executeUpdate(q);
		 			
		 			
		 			
		 			// select * from bid where shoesid = '#'
					// boolean check = rs.getBoolean("");
					// if check==true
					// auto increment here
		 			// This is where two auto-incremets compete if there are two auto-increments
		 			ResultSet ts = stmt.executeQuery("select * from bid where shoesid='" + shoesid + "'");
		 			while(ts.next()){
		 				int auto = ts.getInt("auto");
		 				String autobuyer = ts.getString("buyer");
		 				if(auto==1) {
		 					int upper_limit2 = ts.getInt("upperlimit");
		 					// bid_price is the first auto's bid price
		 					if(bid_price + priceIncrement <= upper_limit2) {
		 						int bid_of_1 = bid_price;
		 						int bid_of_2 = bid_price;
		 						int upper_limit1 = upper_limit;
		 						//int upper_limit2;
		 						int i = 1;
		 						//while(bid_of_1 <= upper_limit1 && bid_of_2 <= upper_limit2) {
		 						while(true) {
		 							if(i%2==0) { // first person
		 								bid_of_1 += priceIncrement;
		 								bid_of_2 += priceIncrement;
		 								if(bid_of_1 > upper_limit1) break;
		 								insert = "INSERT INTO bid(shoesid, buyer, bid_price,upperlimit,auto)" + "VALUES (?, ?, ?, ?, ?)";
				 						PreparedStatement ps1 = con.prepareStatement(insert);
				 						ps1.setInt(1, Integer.parseInt(shoesid));
				 						ps1.setString(2, Uname);
				 						ps1.setInt(3, bid_of_1);
				 						ps1.setInt(4,upper_limit1);
				 						ps1.setInt(5,1);
				 						ps1.executeUpdate();
		 							} else { // second person
		 								bid_of_2 += priceIncrement;
		 								bid_of_1 += priceIncrement;
		 								if(bid_of_2 > upper_limit2) break;
		 								insert = "INSERT INTO bid(shoesid, buyer, bid_price,upperlimit,auto)" + "VALUES (?, ?, ?, ?, ?)";
				 						PreparedStatement ps1 = con.prepareStatement(insert);
				 						ps1.setInt(1, Integer.parseInt(shoesid));
				 						ps1.setString(2, autobuyer);
				 						ps1.setInt(3, bid_of_2);
				 						ps1.setInt(4,upper_limit2);
				 						ps1.setInt(5,1);
				 						ps1.executeUpdate();
		 							}
				 					i++;
		 						}
		 						if(i%2==0) { // second person
		 							String t = "UPDATE sell set current_bid = '" + (bid_of_2 - priceIncrement) + "', current_highest_bid_user = '" + autobuyer + "' WHERE (shoesid = '" + shoesid + "')";
			 						int result1 = stmt.executeUpdate(t);	
		 						} else { // first person
		 							String t = "UPDATE sell set current_bid = '" + (bid_of_1 - priceIncrement) + "', current_highest_bid_user = '" + Uname + "' WHERE (shoesid = '" + shoesid + "')";
			 						int result1 = stmt.executeUpdate(t);	
		 						}
		 						break;
		 					}
		 				}
		 			}
					
		 			out.println("Your bid is successful! <a href='search.html'>Go Back</a>");
	 			}
	 		}
	 		if(inserted==false) {
	 			out.print("Your bid is unsuccessful, please check your upperlimit or you have already bidden on this item ! <a href='search.html'>Try Again</a>");
	 		}
		} else {
	 		out.print("Your bid is unsuccessful, please check your shoe id! <a href='search.html'>Try Again</a>");
	 	}
	 		
			
	}
	
%>
