<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Generate report</title>
</head>

<body>

<!-- navigation bar -->
<div class="w3-top">
  <div class="w3-bar w3-white w3-wide w3-padding w3-card">
    <a href="admin.html" class="w3-bar-item w3-button"><b><i>BuyMe</i></b> <i></i></a>
    <!-- Float links to the right. Hide them on small screens -->
    <div class="w3-right w3-hide-small">
      <a href="admin.html" class="w3-bar-item w3-button">Home</a>
      <a href="gaccount.html" class="w3-bar-item w3-button">Generate Account</a>
	 <a href="greport.jsp" class="w3-bar-item w3-button">Generate Report</a>
      <a href="communication.jsp" class="w3-bar-item w3-button">Communication</a>
      <a href="logout.jsp" class="w3-bar-item w3-button">Log out</a>
    </div>
  </div>
</div>

	<div class="container-fluid">
        <center>
		<h1>BuyMe</h1>
        </center>
		<br>
		<div class="row">
			<div class="col-md-6">
			<form method="post" action="report.jsp">
				<center>
				<div class="form-group">
				<h2>Generate report</h2>
				</div>
				</center>
				
				<center>
					<h3>Total earning</h3>
				</center>
				<center>
				<div class="form-group">
<<<<<<< HEAD:WebContent/greport.html
				<input type="submit" name="totalearn" value="total earning">
=======
					<input type="submit" name="totalearn" value="Total Earnings">
>>>>>>> b94eb70004ee739a5c03703866100d3a7863967c:WebContent/greport.jsp
				</div>
				</center>
				
				<center>
				<h3>Earning per</h3>
				</center>
				<div class="form-group">
				    	<label for="user">user</label>
				    	<input type="text" class="form-control" id="user" name="user" placeholder="Please type in user name">
				 </div>
				<input type="submit" class="btn btn-default" name="user report" value="user reports">
				
				<div class="form-group">
				    	<label for="shoes">shoes</label>
				    	<input type="text" class="form-control" id="shoes" name="shoes" placeholder="Please type in shoesID">
				 </div>
<<<<<<< HEAD:WebContent/greport.html
				<input type="submit" class="btn btn-default" name="shoes report" value="shoes report">
=======
				<input type="submit" class="btn btn-default" name="shoesrp" value="shoes report">
>>>>>>> b94eb70004ee739a5c03703866100d3a7863967c:WebContent/greport.jsp
				 
			     <div class="form-group">
				    	<label for="itemtype">item type</label>
				    	<input type="text" class="form-control" id="itemtype" name="itemtype" placeholder="Please type in item type">
				 </div>
<<<<<<< HEAD:WebContent/greport.html
				 <input type="submit" class="btn btn-default" name="item report" value="item report">
=======
				 <input type="submit" class="btn btn-default" name="typerp" value="type report">
>>>>>>> b94eb70004ee739a5c03703866100d3a7863967c:WebContent/greport.jsp
				 
				 <center>
				 <h3>Best Selling of</h3>
				 </center>
				 
				 <h4>item</h4>
				 <div class="form-group">
				 </div>
				 <input type="submit" class="btn btn-default" name="bestitem" value="best item(s) report">
				 
				 <h4>user</h4>
				 <div class="form-group">
				 </div>
				 <input type="submit" class="btn btn-default" name="bestenduser" value="best end-user report">
		

				</form>


				  	

			
			
		</div>
	</div>
	
	
</body>
</html>