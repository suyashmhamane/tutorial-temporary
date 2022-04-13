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
	<jsp:include page="admin-header.jsp"></jsp:include><br>
	<div class="container-fluid">
		<div class="row pad-botm">
			<div class="col-md-12">
				<h4 class="header-line">All Dietitians</h4>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<%
					String deleteAccount = (String) session.getAttribute("delete-action");
					if (deleteAccount != null) {
						session.removeAttribute("delete-action");
				%>
				<div class="alert alert-danger" id="danger">Dietition deleted
					successfully.</div>
				<%
					}
				%>
				<div class="panel panel-danger">
					<div class="panel-heading">All Dietitians</div>
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table">
								<thead>
									<tr>
										<th>Id</th>
										<th>Dietitian Name</th>
										<th>Mobile</th>
										<th>Email</th>
										<th>Address</th>
										<th>Joining Date</th>
										<th>Created At</th>
										<th>Updated At</th>
										<th>Status</th>
										<th>Action</th>
										<th>Remove</th>
									</tr>
								</thead>
								<%
									ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tbldietitian");
									while (resultset.next()) {
								%>
								<tbody>
									<tr class="default">
										<td><%=resultset.getString("did")%></td>
										<td><%=resultset.getString("dname")%></td>
										<td><%=resultset.getString("mobile")%></td>
										<td><%=resultset.getString("email")%></td>
										<td><%=resultset.getString("address")%></td>
										<td><%=resultset.getString("joining_date")%></td>
										<td><%=resultset.getString("created_at")%></td>
										<td><%=resultset.getString("updated_at")%></td>
										<%
											if (resultset.getInt(9) == 1) {
										%>
										<td><span class="label label-success">Active</span></td>
										<%
											} else {
										%>
										<td><span class="label label-danger">Blocked</span></td>
										<%
											}
										%>
										<%
											if (resultset.getInt(9) == 1) {
										%>
										<td><a
											href="ManageDietition?did=<%=resultset.getInt(1)%>"><button
													class="btn btn-danger"
													onClick="return confirm('Are you sure, you want to Block Account?');">Inactive</button></a></td>
										<%
											} else {
										%>
										<td><a
											href="ManageDietition?did=<%=resultset.getInt(1)%>"><button
													class="btn btn-primary"
													onClick="return confirm('Are you sure, you want to Active Account?');">Activate
													Dietition</button></a></td>
										<%
											}
										%>
										<td><a
											href="DeleteDietitionAccount?did=<%=resultset.getString("did")%>"
											class="btn btn-info" onClick="return confirm('Are you sure, you want to delete dietitian account?');">Delete</a></td>
									</tr>
								</tbody>
								<%
									}
								%>
							</table>
						</div>
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