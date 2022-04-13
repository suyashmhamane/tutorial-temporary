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
				<h4 class="header-line">View Member Questions</h4>
			</div>
		</div>
		<%
			String message = (String) session.getAttribute("success");
			if (message != null) {
					session.removeAttribute("success");
		%>
			<div class="alert alert-info" id="info">Answer submitted and check successfully.</div>
		<%
			}
		%>
		<div class="panel panel-info shadow p-3 mb-5">
			<div class="panel-heading">View Member Questions</div>
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
							<th>Action</th>
							
						</tr>
					</thead>
					<%
						ResultSet resultMemberQuestionAnswer = DatabaseConnection.getResultFromSqlQuery("select * from askquestions where did='" + session.getAttribute("did") + "'");
						while (resultMemberQuestionAnswer.next()) {
					%>
					<tbody>
						<tr>
							<td><%=resultMemberQuestionAnswer.getInt("qid")%></td>
							<td><%=resultMemberQuestionAnswer.getString("question")%></td>
							<td><%=resultMemberQuestionAnswer.getString("answer")%></td>
							<td><%=resultMemberQuestionAnswer.getString("did")%></td>
							<td><%=resultMemberQuestionAnswer.getString("mid")%></td>
							<td><%=resultMemberQuestionAnswer.getString("uname")%></td>
							<td><%=resultMemberQuestionAnswer.getString("created_at")%></td>
							<td><%=resultMemberQuestionAnswer.getString("updated_at")%></td>
							<%
								if (resultMemberQuestionAnswer.getString("status").equals("Pending")) {
							%>
							<td><span class="label label-danger">Pending</span></td>
							<%
								} else if (resultMemberQuestionAnswer.getString("status").equals("Resolved")) {
							%>
							<td><span class="label label-success">Checked</span></td>
							<%
								} else {
							%>
							<td><span class="label label-info">Rejected</span></td>
							<%
								}
							%>	
							<td><a href="give-member-questions-answer.jsp?qid=<%=resultMemberQuestionAnswer.getInt("qid")%>">Give Answer</a></td>
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