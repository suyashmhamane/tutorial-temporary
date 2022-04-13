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
	<jsp:include page="member-side-header.jsp"></jsp:include><br>
	<div class="container">
		
		<div class="row">
			<div class="col-md-6 col-sm-6 col-xs-6">
				<image src="images/physical-info.jpg" style="width:500px;height:400px;">
			</div>
			<div class="col-md-6 col-sm-6 col-xs-6">
				<div class="panel panel-warning shadow p-3 mb-5">
					<div class="panel-heading">Physical Information</div>
					<div class="panel-body">
						<%
							ResultSet rs = DatabaseConnection.getResultFromSqlQuery("select * from tblmembers where mid='"+ session.getAttribute("mid") + "' and uname='" + session.getAttribute("uname") + "'");
							if (rs.next()) {
						%>
						<form role="form" action="" method="post" name=''>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="mid">Id</label> <input type="text"
										class="form-control" id="mid" name="mid"
										placeholder="Member Id" value="<%=rs.getInt("mid")%>" readonly
										required>
								</div>
								<div class="form-group col-md-6">
									<label for="memberName">Name</label> <input type="text"
										class="form-control" id="memberName" name="memberName"
										placeholder="Member Name"
										value="<%=rs.getString("member_name")%>" required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="weight">Weight</label> <input type="text"
										class="form-control" id="weight" name="weight"
										placeholder="Weight" value="<%=rs.getString("weight")%>"
										required>
								</div>
								<div class="form-group col-md-6">
									<label for="height">Height</label> <input type="text"
										class="form-control" id="height" name="height"
										placeholder="Height" value="<%=rs.getString("height")%>"
										required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="age">Age:</label> <input type="text"
										class="form-control" id="age" name="age" placeholder="Age"
										value="<%=rs.getInt("age")%>" required>
								</div>
								<div class="form-group col-md-6">
									<label for="bmi">BMI</label> <input type="text"
										class="form-control" id="bmi" name="bmi" placeholder="bmi"
										value="<%=rs.getDouble("bmi")%>" required>
								</div>
							</div>
						</form>
						<%
							}
						%>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<jsp:include page="footer.jsp"></jsp:include>
	<%
		} else {
			response.sendRedirect("index.jsp");
		}
	%>
</body>
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
</html>