<html>
<head>
<title>Answer</title>
</head>
</html>

<%@ page import ="java.sql.*" %>
<%
try {

	String url = "jdbc:mysql://cs336group5.czzknrtounuc.us-east-2.rds.amazonaws.com:3306/cs336";
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(url, "cs336", "cs336project");

	Statement stmt = con.createStatement();
	
	String questionID = request.getParameter("questionID");
	//String ID = request.getParameter("ID");
	String ID = (String)session.getAttribute("ID");
	String Answer = request.getParameter("Answer");
	
	if( questionID.equals("") || ID.equals("")||Answer.equals("")) {
		out.print("Failed! Empty Inputs! <a href='cr_questions.jsp'>try again</a>");
		return;
	}

	ResultSet rs = stmt.executeQuery("select * from customer_question where idquestion='" + questionID + "'");
	if(rs.next()) {		
		String update = "UPDATE customer_question SET ID = '" + ID + "', Answer = '" + Answer + "' WHERE idquestion = '" + questionID + "'";
		int result = stmt.executeUpdate(update);
		out.print("Your answers are submitted! <a href='cr_questions.jsp'>Return to Recent Question Page</a>");
	} else {
		out.print("Did not find that question! <a href='cr_questions.jsp'>Return to Recent Question Page</a>");
	}

	
} catch (Exception ex) {
	out.print("Answer submition Failed! <a href='cr_questions.jsp'>try again</a>");
}

%>
