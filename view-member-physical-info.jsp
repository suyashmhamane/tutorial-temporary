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
	<jsp:include page="dietition-side-header.jsp"></jsp:include><br>
	<div class="container-fluid">
		<div class="row pad-botm">
			<div class="col-md-12">
				<h4 class="header-line">View Members Physical Information</h4>
			</div>
		</div>
		<div class="panel panel-info shadow p-3 mb-5">
			<div class="panel-heading">View Members Physical Information</div>
			<div class="panel-body">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>Member Id</th>
							<th>Name</th>
							<th>Weight</th>
							<th>Height</th>
							<th>Age</th>
							<th>BMI</th>
							<th>Action</th>
						</tr>
					</thead>
					<%
						ResultSet resultDietPlan = DatabaseConnection.getResultFromSqlQuery("select * from tblmembers where trainer_name='" + session.getAttribute("dname") + "'");
						while (resultDietPlan.next()) {
					%>
					<tbody>
						<tr>
							<td><%=resultDietPlan.getInt("mid")%></td>
							<td><%=resultDietPlan.getString("member_name")%></td>
							<td><%=resultDietPlan.getString("weight")%></td>
							<td><%=resultDietPlan.getString("height")%></td>
							<td><%=resultDietPlan.getString("age")%></td>
							<td><%=resultDietPlan.getString("bmi")%></td>
							<td><a href="trainer-diet-plan.jsp?memberName=<%=resultDietPlan.getString("member_name")%>" class="btn btn-info">Assign Diet Plan</a> || <a href="trainer-workout-plan.jsp?memberName=<%=resultDietPlan.getString("member_name")%>" class="btn btn-danger">Assign Workout Plan</a> || <a href="view-assigned-plans-to-perticular-member.jsp?memberName=<%=resultDietPlan.getString("member_name")%>" class="btn btn-success">Show Assigned Plans</a></td>
						</tr>
					</tbody>
					<%
						}
					%>
				</table>
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