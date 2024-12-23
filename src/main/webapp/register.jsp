<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
<%@include file="Components/common_css_js.jsp"%>
<style>
label {
	font-weight: bold;
}
</style>
</head>
<body>
	<!--navbar -->
	<%@include file="Components/navbar.jsp"%>
	<section id="starter-section" class="starter-section section">
	<div class="container-fluid mt-4">
		<div class="row g-0">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body px-5">
						<h3 class="text-center">Create Account</h3>
						<%@include file="Components/alert_message.jsp"%>

						<!--registration-form-->
						<form id="register-form" action="RegisterServlet" method="post">
							<div class="row">
								<div class="col-md-6 mt-2">
									<label class="form-label">Your name</label> <input type="text"
										name="user_name" class="form-control"
										placeholder="First and last name" required>
								</div>
								<div class="col-md-6 mt-2">
									<label class="form-label">Email</label> <input type="email"
										name="user_email" placeholder="Email address"
										class="form-control" required>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6 mt-2">
									<label class="form-label">Mobile number</label> <input
										type="number" name="user_mobile_no"
										placeholder="Mobile number" class="form-control">
								</div>
								<div class="col-md-6 mt-5">
									<label class="form-label pe-3">Gender</label> <input
										class="form-check-input" type="radio" name="gender"
										value="Male"> <span class="form-check-label pe-3 ps-1">
										Male </span> <input class="form-check-input" type="radio"
										name="gender" value="Female"> <span
										class="form-check-label ps-1"> Female </span>
								</div>
							</div>
							<div class="mt-2">
								<label class="form-label">Address</label> <input type="text"
									name="user_address"
									placeholder="Enter Address(Area and Street))"
									class="form-control" required>
							</div>  
							<div class="row">
								<div class="col-md-6 mt-2">
									<label class="form-label">City</label> <input
										class="form-control" type="text" name="city"
										placeholder="City/District/Town" required>
								</div>
								<div class="col-md-6 mt-2">
									<label class="form-label">Pincode</label> <input
										class="form-control" type="number" name="pincode"
										placeholder="Pincode" maxlength="6" required>
								</div>  
							</div>
							<div class="row">
								<div class="col-md-6 mt-2">
									<label class="form-label">State</label> <select name="state"
										class="form-select">
										<option selected>--Select Province--</option>
                                        <option value="Province No. 1">Koshi Province</option>
                                        <option value="Province No. 2">Madhesh Province</option>
                                        <option value="Bagmati Province">Bagmati Province</option>
                                        <option value="Gandaki Province">Gandaki Province</option>
                                        <option value="Lumbini Province">Lumbini Province</option>
                                        <option value="Karnali Province">Karnali Province</option>
                                        <option value="Sudurpashchim Province">Sudurpaschim Province</option>
									</select>
								</div>
								<div class="col-md-6 mt-2">
									<label class="form-label">Password</label> <input
										type="password" name="user_password"
										placeholder="Enter Password" class="form-control" required>
								</div>
							</div>

							<div id="submit-btn" class="container text-center mt-4">
								<button type="submit" class="btn btn-outline-danger me-3">Submit</button>
								<button type="reset" class="btn btn-outline-danger">Reset</button>
							</div>
							<div class="mt-3 text-center">
								<h6>
									Already have an account?<a href="login.jsp"
										style="text-decoration: none"> Sign in</a>
								</h6>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>

<%@include file="footer.jsp" %>
</body>
</html>