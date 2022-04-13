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
	<div class="container">
		<div class="row pad-botm">
			<div class="col-md-12">
				<h4 class="header-line">Give Question Answer To Member</h4>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6 col-sm-6 col-xs-6">
				<image src="images/give-answer.JPG"
					style="width:500px;height:290px;">
			</div>
			<div class="col-md-6 col-sm-6 col-xs-6">
				<div class="panel panel-info shadow p-3 mb-5">
					<div class="panel-heading">Give Answer</div>
					<div class="panel-body">
						<form role="form" action="QuestionAnswerToMembers" method="post" name=''>
							<div class="form-row">
								<div class="form-group col-md-12">
									<label for="questionName">Question & Answer</label>
									<%
										String question = null;
										int qid=Integer.parseInt(request.getParameter("qid"));
										ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from askquestions where qid='" + request.getParameter("qid") + "'");
										if (resultset.next()) {
									%>
									<input type="text" class="form-control" id="questionName"
										name="questionName" value="<%=resultset.getString("question")%>">
									<%
										}
									%>
								</div>
							</div>
							<input type="text" name="qid" value="<%=qid%>" hidden>
							<div class="form-row">
								<div class="form-group col-md-12">
									<label for="questionAnswer">Give Answer</label>
									<textarea class="form-control" id="questionAnswer" name="questionAnswer"
										placeholder="Question Answer" required></textarea>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-12">
									<button type="submit" class="btn btn-info" id="btnValidate">Submit Answer</button>
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