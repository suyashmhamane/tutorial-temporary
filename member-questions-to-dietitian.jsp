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
		<div class="row pad-botm">
			<div class="col-md-12">
				<h3 class="header-line">Ask Question To Dietitian</h3>
			</div>
		</div> 
		<div class="row">
			<div class="col-md-6 col-sm-6 col-xs-6">
				<image src="images/ask-question-to-trainer.jpg"
					style="width:500px;height:290px;">
			</div>
			<div class="col-md-6 col-sm-6 col-xs-6">
				<%
					String message = (String) session.getAttribute("question");
					if (message != null) {
						session.removeAttribute("question");
				%>
				<div class="alert alert-success" id="success">Question submitted successfully.</div>
				<%
					}
				%>
				<div class="panel panel-warning shadow p-3 mb-5">
					<div class="panel-heading">Ask Question To Dietitian</div>
					<div class="panel-body">
						<form role="form" action="AskQuestionToTrainer" method="post" name=''>
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
									<label for="question">Questions</label> <textarea
										class="form-control" id="question" name="question"
										placeholder="Question" required></textarea>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-12">
									<button type="submit" class="btn btn-info" id="btnValidate">Ask Question</button>
									<button type="reset" class="btn btn-danger" id="btnValidate">Cancel</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="panel panel-warning shadow p-3 mb-5">
			<div class="panel-heading">View Questions & Answers</div>
			<div class="panel-body">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>#</th>
							<th>Questions</th>
							<th>Answer</th>
							<th>Dietitian Id</th>
							<th>Member Id</th>
							<th>User Name</th>
							<th>Created At</th>
							<th>Updated At</th>	
							<th>Status</th>
							
						</tr>
					</thead>
					<%
						ResultSet resultQuestion = DatabaseConnection.getResultFromSqlQuery("select * from askquestions where mid='" + session.getAttribute("mid") + "'");
						while (resultQuestion.next()) {
					%>
					<tbody>
						<tr>
							<td><%=resultQuestion.getInt("qid")%></td>
							<td><%=resultQuestion.getString("question")%></td>
							<td><%=resultQuestion.getString("answer")%></td>
							<td><%=resultQuestion.getString("did")%></td>
							<td><%=resultQuestion.getString("mid")%></td>
							<td><%=resultQuestion.getString("uname")%></td>
							<td><%=resultQuestion.getString("created_at")%></td>
							<td><%=resultQuestion.getString("updated_at")%></td>
							<%
								if (resultQuestion.getString("status").equals("Pending")) {
							%>
							<td><span class="label label-danger">Pending</span></td>
							<%
								} else if (resultQuestion.getString("status").equals("Resolved")) {
							%>
							<td><span class="label label-success">Got It</span></td>
							<%
								} else {
							%>
							<td><span class="label label-info">Rejected</span></td>
							<%
								}
							%>	
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