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
<script>
	function myFunction() {
		var trainerName = document.getElementById("traiinerName").value;
		document.location.href = "member-account.jsp?trainerName="
				+ trainerName;
	}
</script>
</head>
<body class="host_version">
	<jsp:include page="header.jsp"></jsp:include><br>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<%
					String message = (String) session.getAttribute("success-message");
					if (message != null) {
						session.removeAttribute("success-message");
				%>
				<div class="alert alert-success" id="success">Member account
					created successfully.</div>
				<%
					}
				%>
				<div class="panel panel-warning shadow p-3 mb-5">
					<div class="panel-heading">Create Member Account</div>
					<div class="panel-body">
						<form role="form" action="MemberAccount" method="post" name="memberForm" id="form" role="form">
							<div class="form-row">
								<div class="form-group col-md-12">
									<label for="traiinerName">Select Dietitian Name</label> <select
										class="form-control" id="traiinerName" name="traiinerName"
										onchange="myFunction()">
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

							<%
								String trainerName = request.getParameter("trainerName");
								ResultSet rsTrainerDetails = DatabaseConnection.getResultFromSqlQuery("select * from tbldietitian where dname='" + trainerName + "'");
								if (rsTrainerDetails.next()) {
							%>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="trainerName">Dietitian Name:</label> <input
										type="text" class="form-control" id="trainerName"
										placeholder="Trainer Name" name="trainerName"
										value="<%=rsTrainerDetails.getString("dname")%>" required readonly>
								</div>
								<div class="form-group col-md-6">
									<label for="trainerEmail">Dietitian Email Id:</label> <input
										type="text" class="form-control" id="trainerEmail"
										placeholder="Trainer Email Id" name="trainerEmail"
										value="<%=rsTrainerDetails.getString("email")%>" readonly>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="trainerMobile">Mobile No:</label> <input
										type="text" class="form-control" id="trainerMobile"
										placeholder="Trainer Mobile No" name="trainerMobile"
										value="<%=rsTrainerDetails.getString("mobile")%>" required readonly>
								</div>
								<div class="form-group col-md-6">
									<label for="aboutUsTrainer">About Dietitian:</label>
									<textarea class="form-control" id="aboutUsTrainer"
										placeholder="About Trainer" name="aboutUsTrainer" readonly><%=rsTrainerDetails.getString("about_us")%></textarea>
								</div>
							</div>
							<%
								}
							%>
							<%
								int memberId = DatabaseConnection.generateMemberId();
							%>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="mid">Member Id</label> <input type="text"
										class="form-control" id="mid" name="mid"
										placeholder="Member Id" value="<%=memberId%>" readonly
										required>
								</div>
								<div class="form-group col-md-6">
									<label for="memberName">Member Name:</label> <input type="text"
										class="form-control" id="memberName" name="memberName"
										placeholder="Member Name" required onkeypress="return lettersValidate(event)">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="gender">Gender</label> <select class="form-control"
										id="gender" name="gender">
										<option>Select Gender</option>
										<option>Male</option>
										<option>Female</option>
									</select>
								</div>
								<div class="form-group col-md-6">
									<label for="age">Age:</label> <input type="text"
										class="form-control" id="age" name="age" placeholder="Age"
										required onkeypress="return numberValidate(event)" maxlength="3">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="mobile">Mobile No</label> <input type="text"
										class="form-control" id="mobile" name="mobile"
										placeholder="Mobile No" required onkeypress="return numberValidate(event)" maxlength="10">
								</div>
								<div class="form-group col-md-6">
									<label for="email">Email Id</label> <input type="text"
										class="form-control" id="email" name="email"
										placeholder="Email Id" required title="Email can not be blank and should contain @ character.">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="address">Member Address</label>
									<textarea class="form-control" id="address" name="address"
										placeholder="Address" required></textarea>
								</div>
								<div class="form-group col-md-6">
									<label for="joiningDate">Joining Date</label> <input
										type="date" class="form-control" id="joiningDate"
										name="joiningDate" placeholder="Joining Date" required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-12">
									<span><font color="red">* Mention Weight is in
											killogram and Height is in centimeters format.</font></span>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="height">Height</label> <input type="text"
										class="form-control" id="height" name="height"
										placeholder="Height" required>
								</div>
								<div class="form-group col-md-6">
									<label for="weight">Weight</label> <input type="text"
										class="form-control" id="weight" name="weight"
										placeholder="Weight" required>
								</div>
							</div>
							
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="uname">User Name</label> <input type="text"
										class="form-control" id="uname" name="uname"
										placeholder="User Name" required>
								</div>
								<div class="form-group col-md-6">
									<label for="upass">Password</label> <input type="password"
										class="form-control" id="upass" name="upass"
										placeholder="Password" required oninput="limitChar(this)"
												maxlength="12">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-12">
									<button type="submit" class="btn btn-info" id="buttonValidate">Create
										Account</button>
									<a class="for-pwd" href="member-login.jsp">Already have
										account,Please Login</a>
								</div>
							</div>
						</form>
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
<script type="text/javascript">
		let limitChar = (element) => {
	        const maxChar = 12;
	        
	        let ele = document.getElementById(element.id);
	        let charLen = ele.value.length;
	        
	        let p = document.getElementById('charCounter');
	        p.innerHTML = maxChar - charLen + ' characters remaining';
	        
	        if (charLen > maxChar) 
	        {
	            ele.value = ele.value.substring(0, maxChar);
	            p.innerHTML = 0 + ' characters remaining'; 
	        }
	    }
		let limitNumber = (element) => {
	        const maxNumber = 6;
	        
	        let ele = document.getElementById(element.id);
	        let numberLen = ele.value.length;
	        
	        let p = document.getElementById('numberCounter');
	        p.innerHTML = maxNumber - numberLen + ' number remaining';
	        
	        if (numberLen > maxNumber) 
	        {
	            ele.value = ele.value.substring(0, maxNumber);
	            p.innerHTML = 0 + ' number remaining'; 
	        }
	    }
		function lettersValidate(key) {
	    	var keycode = (key.which) ? key.which : key.keyCode;
	   		if ((keycode > 64 && keycode < 91) || (keycode > 96 && keycode < 123) || keycode == 32)  
	    	{     
	           return true;    
	    	}else{
	           return false;
	    	}    
	    }
		function numberValidate(key) {
	    	var keycode = (key.which) ? key.which : key.keyCode;
	   		if ((keycode > 47 && keycode < 58))  
	    	{     
	           return true;    
	    	}else{
	           return false;
	    	} 
	    }
	</script>
	<script>
	 $(document).ready(function() {
         $("#buttonValidate").click(function() {
             var memberName = $("#memberName").val();
             var email = $("#email").val();
             var mobile = $("#mobile").val();
             var gender = $("#gender").val();
             var age = $("#age").val();
             var address = $("#address").val();
             var joiningDate = $("#joiningDate").val();
             var height = $("#height").val();
             var weight = $("#weight").val();
             var uname = $("#uname").val();
             var upass = $("#upass").val();
             if (memberName === "" || email === "" || mobile === "" || gender === "" || age === "" || address === "" || joiningDate === "" || weight === "" || height === "" || uname === "" || upass === "")
             {
                 $("#memberName").css("border-color", "red");
                 $("#email").css("border-color", "red");
                 $("#mobile").css("border-color", "red");
                 $("#gender").css("border-color", "red");
                 $("#age").css("border-color", "red");
                 $("#address").css("border-color", "red");
                 $("#joiningDate").css("border-color", "red");
                 $("#height").css("border-color", "red");
                 $("#joiningDate").css("border-color", "red");
                 $("#uname").css("border-color", "red");
                 $("#upass").css("border-color", "red");
                 alert("All fields are mendatory.");
                 return false;
             }
         });
     });                                              
	</script>
	<script>
		$(document).ready(function() { 
		    $('#buttonValidate').click(function() {  
		 
		        $(".error").hide();
		        var hasError = false;
		        var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
		 
		        var emailaddressVal = $("#email").val();
		        if(emailaddressVal == '') {
		            $("#email").after('<span class="error">Please enter your email address.</span>');
		            hasError = true;
		        }
		 
		        else if(!emailReg.test(emailaddressVal)) {
		            $("#email").after('<span class="error">Enter a valid email address.</span>');
		            hasError = true;
		        }
		 
		        if(hasError == true) { return false; }
		 
		    });
		});
	</script>
	<script>
	    $(document).ready(function() {
	        $("#form").submit(function(e) {
	            
	        	 var mobile = $('#mobile').val().length;
		         if (mobile !== 10) {
		             alert("Mobile number should be 10 digit only.");
		             e.preventDefault();
		             return false;
		         }
	             else
	                {}
	        });
	    });
	</script>
</html>