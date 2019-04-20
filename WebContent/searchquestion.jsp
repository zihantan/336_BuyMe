<html>
<head>
<style>
table, th, td {
  border: 1px solid black;
}
</style>
<title>Search Result</title>
</head>
</html>

<%@ page import ="java.sql.*" %>
<%

	
	String type = request.getParameter("type1");   
	String username = request.getParameter("username");
	//String question = request.getParameter("question");
	
	//System.out.println(type);
	
	if(type.equals("any") ||type.equals("") ) {
		out.print("There is/are empty Input(s)! Please choose a question type! <a href='question.html'>try again</a>");
		return;
	}
 	
	String url = "jdbc:mysql://cs336group5.czzknrtounuc.us-east-2.rds.amazonaws.com:3306/cs336";
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(url, "cs336", "cs336project");

	Statement stmt = con.createStatement();
	ResultSet rs; 
	if(type.equals("paymentmethod")){
		%>
		<table>
	  <tr>
	    <th>Question</th>
	    <th>Type</th>
	    <th>username</th>
	    <th>Answer</th>
	  </tr>
		<% 
		rs = stmt.executeQuery("select * from customer_question where type='"+ type +"'" );
		while(rs.next()){
			%>
			<tr>
    			<td><%=rs.getString("Question")%></td>
    			<td><%=rs.getString("Type")%></td>
    			<td><%=rs.getString("username")%></td>
    			<td><%=rs.getString("Answer") %></td>
			</tr>
			<%
		}
		
		%></table> <%
	
	}else if(type.equals("accountrelation")){
		%>
		<table>
	  <tr>
	    <th>Question</th>
	    <th>Type</th>
	    <th>username</th>
	    <th>Answer</th>
	  </tr>
		<% 
		rs = stmt.executeQuery("select * from customer_question where type='"+ type +"'"  );
		while(rs.next()){
			%>
			<tr>
    			<td><%=rs.getString("Question")%></td>
    			<td><%=rs.getString("Type")%></td>
    			<td><%=rs.getString("username")%></td>
    			<td><%=rs.getString("Answer") %></td>
			</tr>
			<%
		}
		
		%></table> <%
	
	}else if(type.equals("buyrelation")){
		%>
		<table>
	  <tr>
	    <th>Question</th>
	    <th>Type</th>
	    <th>username</th>
	    <th>Answer</th>
	  </tr>
		<% 
		rs = stmt.executeQuery("select * from customer_question where type='"+ type +"'"  );
		while(rs.next()){
			%>
			<tr>
    			<td><%=rs.getString("Question")%></td>
    			<td><%=rs.getString("Type")%></td>
    			<td><%=rs.getString("username")%></td>
    			<td><%=rs.getString("Answer") %></td>
			</tr>
			<%
		}
		
		%></table> <%
	
	}else if (type.equals("sellrelation")){
		%>
		<table>
	  <tr>
	    <th>Question</th>
	    <th>Type</th>
	    <th>username</th>
	    <th>Answer</th>
	  </tr>
		<% 
		rs = stmt.executeQuery("select * from customer_question where type='"+ type +"'"  );
		while(rs.next()){
			%>
			<tr>
    			<td><%=rs.getString("Question")%></td>
    			<td><%=rs.getString("Type")%></td>
    			<td><%=rs.getString("username")%></td>
    			<td><%=rs.getString("Answer") %></td>
			</tr>
			<%
		}
		
		%></table> <%
	
	}
	else if (type.equals("other")){
		%>
		<table>
	  <tr>
	    <th>Question</th>
	    <th>Type</th>
	    <th>username</th>
	    <th>Answer</th>
	  </tr>
		<% 
		rs = stmt.executeQuery("select * from customer_question where type='"+ type +"'"  );
		while(rs.next()){
			%>
			<tr>
    			<td><%=rs.getString("Question")%></td>
    			<td><%=rs.getString("Type")%></td>
    			<td><%=rs.getString("username")%></td>
    			<td><%=rs.getString("Answer") %></td>
			</tr>
			<%
		}
		
		%></table> <%
	
	} 
	out.print("If no such result, there is no question that meets your requirements. You can go back and ask this question yourself.<a href='question.html'>Go Back</a>");
%>
	






