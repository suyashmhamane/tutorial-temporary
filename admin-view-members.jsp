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
				<h4 class="header-line">All Members</h4>
			</div>
		</div>
		<div class="row">

			<div class="col-md-12">
				<%
					String message = (String) session.getAttribute("delete-action");
					if (message != null) {
						session.removeAttribute("delete-action");
				%>
				<div class="alert alert-danger" id="danger">Members deleted
					successfully.</div>
				<%
					}
				%>
				<div class="panel panel-danger">
					<div class="panel-heading">All Members</div>
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table">
								<thead>
									<tr>
										<th>Id</th>
										<th>Member Name</th>
										<th>Mobile</th>
										<th>Email</th>
										<th>Address</th>
										<th>Height</th>
										<th>Weight</th>
										<th>Joining Date</th>
										<th>Dietitian Name</th>
										<th>Created At</th>
										<th>Updated At</th>
										<th>Action</th>
									</tr>
								</thead>
								<%
								ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblmembers");
								while (resultset.next()) {
								%>
								<tbody>
									<tr class="default">
										<td><%=resultset.getString("mid")%></td>
										<td><%=resultset.getString("member_name")%></td>
										<td><%=resultset.getString("mobile")%></td>
										<td><%=resultset.getString("email")%></td>
										<td><%=resultset.getString("address")%></td>
										<td><%=resultset.getString("height")%></td>
										<td><%=resultset.getString("weight")%></td>
										<td><%=resultset.getString("joining_date")%></td>
										<td><%=resultset.getString("trainer_name")%></td>
										<td><%=resultset.getString("created_at")%></td>
										<td><%=resultset.getString("updated_at")%></td>
										<td><a href="DeleteMemberAccount?mid=<%=resultset.getString("mid")%>"
											class="btn btn-info" onClick="return confirm('Are you sure, you want to delete member account?');">Delete</a></td>
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