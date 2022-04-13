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
				<h4 class="header-line">Diet Plan</h4>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<%
					String message = (String) session.getAttribute("diet-plan");
					if (message != null) {
						session.removeAttribute("diet-plan");
				%>
				<div class="alert alert-info" id="info">Diet plan assigned to member.</div>
				<%
					}
				%>
				<div class="panel panel-info shadow p-3 mb-5">
					<div class="panel-heading">Diet Plan</div>
					<div class="panel-body">
						<%
							String memberName=request.getParameter("memberName");
						%>
						<form role="form" action="DietitianCreateDietPlan" method="post" name=''>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="dietPlanType">Diet Plan Type</label>
									<input type="text"
										name="dietPlanType" class="form-control" placeholder="Diet Plan Type" value="" required>
								</div>
								<div class="form-group col-md-6">
									<label for="morning">Morning Session</label>
									<input type="text" class="form-control" id="morning" name="morning"
										placeholder="Morning Diet" required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="afternoon">Afternoon Session</label>
									<input type="text" class="form-control" id="afternoon" name="afternoon"
										placeholder="Afternoon Diet" required>
								</div>
								<div class="form-group col-md-6">
									<label for="evening">Evening Session</label>
									<input type="text" class="form-control" id="evening" name="evening"
										placeholder="Evening Diet" required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="night">Night Session</label>
									<input type="text" class="form-control" id="night" name="night"
										placeholder="Night Diet" required>
								</div>
								<div class="form-group col-md-6">
									<label for="note">Note</label>
									<textarea class="form-control" id="note" name="note"
										placeholder="Note" required></textarea>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-4">
									<label for="do">Do</label>
									<textarea class="form-control" id="do" name="do"
										placeholder="Do" required></textarea>
								</div>
								<div class="form-group col-md-4">
									<label for="dont">Do Not</label>
									<textarea class="form-control" id="dont" name="dont"
										placeholder="Do Not" required></textarea>
								</div>
								<div class="form-group col-md-4">
									<label for="memberName">Member Name</label>
									<input type="text" class="form-control" id="memberName" name="memberName"
										placeholder="Member Name" value="<%=memberName%>" readonly>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-12">
									<button type="submit" class="btn btn-info" id="btnValidate">Assign Diet Plan</button>
									<button type="reset" class="btn btn-danger" id="btnValidate">Cancel</button>
								</div>
							</div>
						</form>
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