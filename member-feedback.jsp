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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>

</head>
<body class="host_version">
	<%
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
	%>
	<jsp:include page="member-side-header.jsp"></jsp:include><br>
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-sm-6 col-xs-6">
				<image src="images/feedback.jpg" style="width:500px;height:290px;">
			</div>
			<div class="col-md-6 col-sm-6 col-xs-6">
				<%
					String feedbackMessage = (String) session.getAttribute("feedback");
					if (feedbackMessage != null) {
						session.removeAttribute("feedback");
				%>
				<div class="alert alert-success" id="success">Feedback submitted successfully.</div>
				<%
					}
				%>
				<div class="panel panel-warning shadow p-3 mb-5">
					<div class="panel-heading">Member Feedback</div>
					<div class="panel-body">
						<form role="form" action="MemberFeedback" method="post" name=''>
							<div class="form-row">
								<div class="form-group col-md-12">
									<label for="trainerName">Dietitian Name</label> <select
										class="form-control" id="trainerName" name="trainerName">
										<option>Select Dietitian</option>
										<%
											ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tbldietitian where status=1");
											while (resultset.next()) {
										%>
										<option><%=resultset.getString("dname")%></option>
										<%
											}
										%>
									</select>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-12">
									<label for="feedback">Feedback</label>
									<textarea class="form-control" id="feedback" name="feedback"
										placeholder="Feedback" required></textarea>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-12">
									<div class="rateyo" id="rating" data-rateyo-rating="0.5"
										data-rateyo-num-stars="5" data-rateyo-score="3">
									</div>
									<input type="hidden" name="rating">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-12">
									<button type="submit" class="btn btn-info" id="btnValidate">Submit
										Feedback</button>
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
<script>
	$(function() {
		$(".rateyo").rateYo().on(
				"rateyo.change",
				function(e, data) {
					var rating = data.rating;
					$(this).parent().find('.score').text(
							'score :' + $(this).attr('data-rateyo-score'));
					$(this).parent().find('.result').text('rating :' + rating);
					$(this).parent().find('input[name=rating]').val(rating); //add rating value to input field
				});
	});
</script>
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