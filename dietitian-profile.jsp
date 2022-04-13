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
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<%
				String editProfile = (String) session.getAttribute("success-message");
				if (editProfile != null) {
					session.removeAttribute("success-message");
				%>
				<div class="alert alert-info" id="info">Information updated
					successfully.</div>
				<%
				}
				%>
				<div class="panel panel-info shadow p-3 mb-5">
					<div class="panel-heading">Edit Dietitian Profile</div>
					<div class="panel-body">
						<%
						ResultSet rs = DatabaseConnection.getResultFromSqlQuery("select * from tbldietitian where did='"
								+ session.getAttribute("did") + "' and uname='" + session.getAttribute("uname") + "'");
						if (rs.next()) {
						%>
						<form role="form" action="EditDietitionProfile" method="post"
							name=''>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="did">Dietitian Id</label> <input type="text"
										class="form-control" id="did" name="did"
										placeholder="Dietitian Id" value="<%=rs.getInt("did")%>"
										readonly required>
								</div>
								<div class="form-group col-md-6">
									<label for="dietitianName">Dietitian Name</label> <input
										type="text" class="form-control" id="dietitianName"
										name="dietitianName" placeholder="Dietitian Name"
										value="<%=rs.getString("dname")%>" required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="email">Email Id</label> <input type="text"
										class="form-control" id="email" name="email"
										placeholder="Email Id" value="<%=rs.getString("email")%>"
										required>
								</div>
								<div class="form-group col-md-6">
									<label for="mobile">Mobile No</label> <input type="text"
										class="form-control" id="mobile" name="mobile"
										placeholder="Mobile No" value="<%=rs.getString("mobile")%>"
										required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="address">Dietitian Address</label>
									<textarea class="form-control" id="address" name="address"
										placeholder="Address" required><%=rs.getString("address")%></textarea>
								</div>

								<div class="form-group col-md-6">
									<label for="joiningDate">Joining Date</label> <input
										type="date" class="form-control" id="joiningDate"
										name="joiningDate" placeholder="Joining Date"
										value="<%=rs.getString("joining_date")%>" required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-12">
									<label for="about">About Me</label>
									<textarea class="form-control" id="address" name="about"
										required><%=rs.getString("about_us")%></textarea>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-12">
									<button type="submit" class="btn btn-info" id="btnValidate">Update
										Profile</button>
									<button type="reset" class="btn btn-danger" id="btnValidate">Cancel</button>
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