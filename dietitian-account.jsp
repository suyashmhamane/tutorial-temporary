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
	<jsp:include page="header.jsp"></jsp:include><br>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<%
					String dietition = (String) session.getAttribute("message");
					if (dietition != null) {
						session.removeAttribute("message");
				%>
				<div class="alert alert-success" id="success">Request send to admin for add account.</div>
				<%
					}
				%>
				<div class="panel panel-info shadow p-3 mb-5">
					<div class="panel-heading">Create Dietitian Account</div>
					<div class="panel-body">
						<form role="form" action="DietitionAccount" method="post" name='dietitionForm' id="form">
							<%
								int dietitianId = DatabaseConnection.generateDietitianId();
							%>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="did">Dietitian Id</label> <input type="text"
										class="form-control" id="did" name="did"
										placeholder="Dietitian Id" value="<%=dietitianId %>" required readonly>
								</div>
								<div class="form-group col-md-6">
									<label for="dName">Dietitian Name:</label> <input type="text"
										class="form-control" id="dName" name="dName"
										placeholder="Dietitian Name" required onkeypress="return lettersValidate(event)">
								</div>
							</div>
							
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="email">Email Id</label> <input type="text"
										class="form-control" id="email" name="email"
										placeholder="Email Id" required>
								</div>
								<div class="form-group col-md-6">
									<label for="mobile">Mobile No</label> <input type="text"
										class="form-control" id="mobile" name="mobile"
										placeholder="Mobile No" required onkeypress="return numberValidate(event)" maxlength="10">
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
										placeholder="Password" required required oninput="limitChar(this)"
												maxlength="12">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="address">Dietitian Address</label>
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
									<label for="about">About Me</label>
									<textarea class="form-control" id="about" name="about"
										placeholder="About Me" required></textarea>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-12">
									<button type="submit" class="btn btn-info" id="buttonValidate">Create
										Account</button>
									<a class="for-pwd" href="dietitian-login.jsp">Already have
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
             var dName = $("#dName").val();
             var email = $("#email").val();
             var mobile = $("#mobile").val();
             var address = $("#address").val();
             var joiningDate = $("#joiningDate").val();
             var about = $("#about").val();
             var uname = $("#uname").val();
             var upass = $("#upass").val();
             if (dName === "" || email === "" || mobile === "" || address === "" || joiningDate === "" || about === "" || uname === "" || upass === "")
             {
                 $("#dName").css("border-color", "red");
                 $("#email").css("border-color", "red");
                 $("#mobile").css("border-color", "red");
                 $("#address").css("border-color", "red");
                 $("#about").css("border-color", "red");
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