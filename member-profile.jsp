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
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<%
					String editProfile = (String) session.getAttribute("success-message");
					if (editProfile != null) {
						session.removeAttribute("success-message");
				%>
				<div class="alert alert-success" id="success">Information
					updated successfully.</div>
				<%
					}
				%>
				<div class="panel panel-warning shadow p-3 mb-5">
					<div class="panel-heading">Edit Profile</div>
					<div class="panel-body">
						<%
							ResultSet rs = DatabaseConnection.getResultFromSqlQuery("select * from tblmembers where mid='"+ session.getAttribute("mid") + "' and uname='" + session.getAttribute("uname") + "'");
							if (rs.next()) {
						%>
						<form role="form" action="EditMemberProfile" method="post" name=''>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="mid">Member Id</label> <input type="text"
										class="form-control" id="mid" name="mid"
										placeholder="Member Id" value="<%=rs.getInt("mid")%>"
										readonly required>
								</div>
								<div class="form-group col-md-6">
									<label for="memberName">Member Name:</label> <input type="text"
										class="form-control" id="memberName" name="memberName"
										placeholder="Member Name"
										value="<%=rs.getString("member_name")%>" readonly>
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
								<div class="form-group col-md-12">
									<label for="address">Member Address</label>
									<textarea class="form-control" id="address" name="address"
										placeholder="Address" required><%=rs.getString("address")%></textarea>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-12">
									<span><font color="red">* Mention Weight is in killogram and Height is in
										centimeters format.</font></span>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-4">
									<label for="age">Age:</label> <input type="text"
										class="form-control" id="age" name="age" placeholder="Age"
										value="<%=rs.getInt("age")%>" required>
								</div>
								<div class="form-group col-md-4">
									<label for="height">Height</label> <input type="text"
										class="form-control" id="height" name="height"
										placeholder="Height" value="<%=rs.getString("height")%>"
										required>
								</div>
								<div class="form-group col-md-4">
									<label for="weight">Weight</label> <input type="text"
										class="form-control" id="weight" name="weight"
										placeholder="Weight" value="<%=rs.getString("weight")%>"
										required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-3">
									<label for="">Joining Date</label> <input
										type="text" class="form-control" id=""
										name="" placeholder="Joining Date"
										value="<%=rs.getString("joining_date")%>" required readonly>
								</div>
								<div class="form-group col-md-3">
									<label for="joiningDate">Select Joining Date</label> <input
										type="date" class="form-control" id="joiningDate"
										name="joiningDate" placeholder="Joining Date"
										value="<%=rs.getString("joining_date")%>" required>
								</div>
								<div class="form-group col-md-3">
									<label for="">Dietitian Name</label> <input
										type="text" class="form-control" id=""
										name="" placeholder=""
										value="<%=rs.getString("trainer_name")%>" readonly>
								</div>
								<div class="form-group col-md-3">
									<label for="trainerName">Select Dietitian Name</label> <select
										class="form-control" id="trainerName" name="trainerName">
										<%
											ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tbldietitian where status=1");
											while (resultset.next()) {
										%>
											<option value="<%=resultset.getString("dname")%>"><%=resultset.getString("dname")%></option>
										<%
											}
										%>

									</select>
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