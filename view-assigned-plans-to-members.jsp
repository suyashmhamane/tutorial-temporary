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
				<h4 class="header-line">View Assigned Diet Plan To Members</h4>
			</div>
		</div>
		<%
				String message = (String) session.getAttribute("diet-edit");
				if (message != null) {
					session.removeAttribute("diet-edit");
		%>
				<div class="alert alert-info" id="info">Diet plan edited successfully.</div>
		<%
					}
		%>
		<div class="panel panel-info shadow p-3 mb-5">
			<div class="panel-heading">View Assigned Diet Plan To Members</div>
			<div class="panel-body">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>#</th>
							<th>Member Name</th>
							<th>Morning</th>
							<th>Afternoon</th>
							<th>Evening</th>
							<th>Night</th>
							<th>Note</th>
							<th>Do</th>
							<th>Dont</th>	
							<th>Diet Plan Type</th>
							<th>Created At</th>
							<th>Updated At</th>
							<th>Action</th>
						</tr>
					</thead>
					<%
						ResultSet resultDietPlan = DatabaseConnection.getResultFromSqlQuery("select * from tbldietplan where uname='" + session.getAttribute("uname") + "'");
						while (resultDietPlan.next()) {
					%>
					<tbody>
						<tr>
							<td><%=resultDietPlan.getInt("dpid")%></td>
							<td><font color="blue"><%=resultDietPlan.getString("member_name")%></font></td>
							<td><%=resultDietPlan.getString("morning")%></td>
							<td><%=resultDietPlan.getString("afternoon")%></td>
							<td><%=resultDietPlan.getString("evening")%></td>
							<td><%=resultDietPlan.getString("night")%></td>
							<td><%=resultDietPlan.getString("notes")%></td>
							<td><%=resultDietPlan.getString("dos")%></td>
							<td><%=resultDietPlan.getString("dont")%></td>
							<td><%=resultDietPlan.getString("diet_plan_type")%></td>
							<td><%=resultDietPlan.getString("created_at")%></td>
							<td><%=resultDietPlan.getString("updated_at")%></td>
							<td><a href="edit-trainer-diet-plan.jsp?dpid=<%=resultDietPlan.getInt("dpid")%>"><i class="glyphicon glyphicon-edit"></i></a></td>
						</tr>
					</tbody>
					<%
						}
					%>
				</table>
			</div>
		</div>
		<div class="row pad-botm">
			<div class="col-md-12">
				<h4 class="header-line">View Assigned Workout Plan To Members</h4>
			</div>
		</div>
		<%
				String messageWorkout = (String) session.getAttribute("workout-edit");
				if (messageWorkout != null) {
					session.removeAttribute("workout-edit");
		%>
				<div class="alert alert-info" id="info">Workout plan edited successfully.</div>
		<%
					}
		%>
		<div class="panel panel-info shadow p-3 mb-5">
			<div class="panel-heading">View Assigned Workout Plan To Members</div>
			<div class="panel-body">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>#</th>
							<th>Member Name</th>
							<th>Morning</th>
							<th>Evening</th>
							<th>Note</th>
							<th>Created At</th>
							<th>Updated At</th>
							<th>Action</th>
						</tr>
					</thead>
					<%
						ResultSet resultWorkOutPlan = DatabaseConnection.getResultFromSqlQuery("select * from tblworkout where uname='" + session.getAttribute("uname") + "'");
						while (resultWorkOutPlan.next()) {
					%>
					<tbody>
						<tr>
							<td><%=resultWorkOutPlan.getInt("wid")%></td>
							<td><font color="orange"><%=resultWorkOutPlan.getString("member_name")%></font></td>
							<td><%=resultWorkOutPlan.getString("morning")%></td>
							<td><%=resultWorkOutPlan.getString("evening")%></td>
							<td><%=resultWorkOutPlan.getString("notes")%></td>
							<td><%=resultWorkOutPlan.getString("created_at")%></td>
							<td><%=resultWorkOutPlan.getString("updated_at")%></td>
							<td><a href="edit-trainer-workout-plan.jsp?wid=<%=resultWorkOutPlan.getInt("wid")%>"><i class="glyphicon glyphicon-edit"></i></a></td>
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