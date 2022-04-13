<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.connection.*"%>
<!DOCTYPE html>
<html lang="en">

<!-- Basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Metas -->
<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<!-- Site Metas -->
<title>Diet Workout System</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">

<!-- Site Icons -->
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
<link rel="apple-touch-icon" href="images/apple-touch-icon.png">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- Site CSS -->
<link rel="stylesheet" href="style.css">
<!-- Colors CSS -->
<link rel="stylesheet" href="css/colors.css">
<!-- ALL VERSION CSS -->
<link rel="stylesheet" href="css/versions.css">
<!-- Responsive CSS -->
<link rel="stylesheet" href="css/responsive.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Modernizer for Portfolio -->
<script src="js/modernizer.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body class="host_version">
	<%
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
	%>
	<jsp:include page="member-side-header.jsp"></jsp:include>
	<div class="container">
		<div class="row pad-botm">
			<div class="col-md-12">
				<h4 class="header-line">Member Payment</h4>
			</div>
		</div>
		<div class="row">
			<div class="col-md-5 col-sm-5 col-xs-12">
				<img src="images/payment.jpg"
					style="width: 400px; height: 400px;">
			</div>
			<div class="col-md-7 col-sm-7 col-xs-12">
				<%
					String paymentMessage = (String) session.getAttribute("payment");
					if (paymentMessage != null) {
						session.removeAttribute("payment");
				%>
				<div class="alert alert-success" id="success">Payment done successfully.</div>
				<%
					}
				%>
				<div class="panel panel-warning">
					<div class="panel-heading">Member Payment</div>
					<div class="panel-body">
						<%
							String memberName= null;
							ResultSet resultset=DatabaseConnection.getResultFromSqlQuery("select member_name from tblmembers where uname='"+session.getAttribute("uname")+"'");
							if(resultset.next()){
								memberName=resultset.getString("member_name");
							}
						%>
						<form role="form" action="MemberDoPayment" method="post">
							<div class="form-group">
								<label>Member Name</label> <input type="text" name="mname"
									class="form-control" placeholder="Member Name" value="<%=memberName%>" readonly>
							</div>
							<div class="form-group">
								<label>Package Charges</label> <select class="form-control"
									name="charges">
									<option>Monthly 1000 Rs</option>
									<option>Quarterly 2000 Rs</option>
									<option>Yearly 5000 Rs</option>
								</select>
							</div>
							<div class="form-group">
								<label>Payment Details</label> <img src="images/mastercard.jpg"
									style="color: red; width: 50px;"></i>
							</div>
							<div class="form-group">
								<label>Debit Card Holder Name</label> <input
									class="form-control" type="text" name="dholderName" placeholder="Debit Card Holder Name"/>
							</div>
							<div class="form-group">
								<label>Debit Card Number</label> <input class="form-control"
									type="text" name="cardNumber" id="cardNumber" onblur="checkDebitCardNumber(); return false;" placeholder="Debit Card Number"/>
									<span id="noMessage"></span>
							</div>
							<div class="row">
								<div class="col-md-4 col-xs-12" id="expiration-date">
									<label>Expiration Month</label> <select class="form-control"
										name="emonth">
										<option value="January">January</option>
										<option value="February">February</option>
										<option value="March">March</option>
										<option value="April">April</option>
										<option value="May">May</option>
										<option value="June">June</option>
										<option value="July">July</option>
										<option value="August">August</option>
										<option value="September">September</option>
										<option value="October">October</option>
										<option value="November">November</option>
										<option value="December">December</option>
									</select>
								</div>
								<div class="col-md-4 col-xs-12">
									<label>Expiration Year</label> <select class="form-control"
										name="eyear">
										<option value="2020">2020</option>
										<option value="2021">2021</option>
										<option value="2022">2022</option>
										<option value="2023">2023</option>
										<option value="2024">2024</option>
										<option value="2025">2025</option>
									</select>
								</div>
								<div class="col-md-4 col-xs-12">
									<label>CVV</label> <input class="form-control" type="text"
										name="cvv" id="cvv" required onblur="check(); return false;"><span
										id="message" placeholder="CVV"></span>
								</div>
							</div>
							<br>
							<button type="submit" class="btn btn-info">Do Payment</button>
						</form>
					</div>
				</div>
			</div>

		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	<%
		} else {
	response.sendRedirect("index.jsp");
	}
	%>
	<script>
		function check() {
			var cvv = document.getElementById('cvv');
			var message = document.getElementById('message');
			var goodColor = "#0C6";
			var badColor = "#FF9B37";

			if (cvv.value.length != 3) {
				message.style.color = badColor;
				message.innerHTML = "Wrong cvv number, please enter 3 digits cvv number."
			} else if (cvv.value.length == 3) {
				message.style.color = goodColor;
				message.innerHTML = "CVV number is right, please proceed."
			}
		}
	</script>
	<script>
		function checkDebitCardNumber() {
			var cvv = document.getElementById('cardNumber');
			var message = document.getElementById('noMessage');
			var goodColor = "#0C6";
			var badColor = "#FF9B37";

			if (cvv.value.length != 16) {
				message.style.color = badColor;
				message.innerHTML = "Wrong account number, please enter 16 digits card number."
			} else if (cvv.value.length == 16) {
				message.style.color = goodColor;
				message.innerHTML = "Card number is right."
			}
		}
	</script>
	<script src="assets/js/jquery.payform.min.js" charset="utf-8"></script>
	<script src="assets/js/script.js"></script>
	<script type="text/javascript">
		$(function() {
			$('#danger').delay(3000).show().fadeOut('slow');
		});
	
		$(function() {
			$('#success').delay(3000).show().fadeOut('slow');
		});
	
		$(function() {
			$('#info').delay(3000).show().fadeOut('slow');
		});
	</script>
</body>
</html>