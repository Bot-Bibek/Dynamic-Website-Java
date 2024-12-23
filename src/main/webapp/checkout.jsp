<%@page import="com.emart.entities.Message"%>
<%@page import="com.emart.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.emart.dao.CartDao"%>
<%@page errorPage="error_exception.jsp"%>
<%
User activeUser = (User) session.getAttribute("activeUser");
if (activeUser == null) {
	Message message = new Message("You are not logged in! Login first!!", "error", "alert-danger");
	session.setAttribute("message", message);
	response.sendRedirect("login.jsp");
	return;  
}
String from = (String)session.getAttribute("from");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>E-Mart</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Fonts -->
  <link href="https://fonts.googleapis.com" rel="preconnect">
  <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">

  <!-- Main CSS File -->
  <link href="assets/css/main.css" rel="stylesheet">
</head>
<body>
	<!--navbar -->
	<%@include file="Components/navbar.jsp"%>

	<section id="starter-section" class="starter-section section">
	<div class="container mt-5" style="font-size: 17px;">
		<div class="row">

			<!-- left column -->
			<div class="col-md-8">
				<div class="card">
					<div class="container px-3 py-3">
						<div class="card">
							<div class="container-fluid text-white"
								style="background-color: #FF0000;">
								<h4>Delivery Address</h4>
							</div>
						</div>
						<div class="mt-3 mb-3">
							<h5><%=user.getUserName()%>
								&nbsp;
								<%=user.getUserPhone()%></h5>
							<%
							StringBuilder str = new StringBuilder();
							str.append(user.getUserAddress() + ", ");
							str.append(user.getUserCity() + ", ");
							str.append(user.getUserCity() + ", ");
							str.append(user.getUserPincode());
							out.println(str);
							%>
							<br>
							<div class="text-end">
								<button type="button" class="btn btn-outline-danger"
									data-bs-toggle="modal" data-bs-target="#exampleModal">
									Change Address</button>
							</div>
						</div>
						<hr>
						<div class="card">
							<div class="container-fluid text-white"
								style="background-color: #FF0000;">
								<h4>Payment Options</h4>
							</div>
						</div>
						<form action="OrderOperationServlet" method="post">
							<div class="form-check mt-2">
								<input class="form-check-input" type="radio" name="payementMode"
									value="Cash on Delivery"><label
									class="form-check-label">Cash on Delivery</label>
							</div>
							<div class="text-end">
								<button type="submit"
									class="btn btn-lg btn-outline-danger mt-3">Place
									Order</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- end of column -->

			<!-- right column -->
			<div class="col-md-4">
				<div class="card">
					<div class="container px-3 py-3">
						<h4>Price Details</h4>
						<hr>
						<%
						if (from.trim().equals("cart")) {
							CartDao cartDao = new CartDao(ConnectionProvider.getConnection());
							int totalProduct = cartDao.getCartCountByUserId(user.getUserId());
							float totalPrice = (float) session.getAttribute("totalPrice");
						%>
						<table class="table table-borderless">
							<tr>
								<td>Total Item</td>
								<td><%=totalProduct%></td>
							</tr>
							<tr>
								<td>Total Price</td>
								<td>&#8377; <%=totalPrice%></td>
							</tr>
							<tr>
								<td>Delivery Charges</td>
								<td>&#8377; 40</td>
							</tr>
							<tr>
								<td>Packaging Charges</td>
								<td>&#8377; 29</td>
							</tr>
							<tr>
								<td><h5>Amount Payable :</h5></td>
								<td><h5>
										&#8377;
										<%=totalPrice + 69%></h5></td>
							</tr>
						</table>
						<%
						} else {
							ProductDao productDao = new ProductDao(ConnectionProvider.getConnection());
							int pid = (int) session.getAttribute("pid");
							float price = productDao.getProductPriceById(pid);
						%>
						<table class="table table-borderless">
							<tr>
								<td>Total Item</td>
								<td>1</td>
							</tr>
							<tr>
								<td>Total Price</td>
								<td>&#8377; <%=price%></td>
							</tr>
							<tr>
								<td>Delivery Charges</td>
								<td>&#8377; 40</td>
							</tr>
							<tr>
								<td>Packaging Charges</td>
								<td>&#8377; 29</td>
							</tr>
							<tr>
								<td><h5>Amount Payable :</h5></td>
								<td><h5>
										&#8377;
										<%=price + 69%></h5></td>
							</tr>
						</table>
						<%
						}
						%>
					</div>
				</div>
			</div>
			<!-- end of column -->
		</div>
	</div>


	<!--Change Address Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">Change
						Address</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form action="UpdateUserServlet" method="post">
					<input type="hidden" name="operation" value="changeAddress">
					<div class="modal-body mx-3">
						<div class="mt-2">
							<label class="form-label fw-bold">Address</label>
							<textarea name="user_address" rows="3"
								placeholder="Enter Address(Area and Street))"
								class="form-control" required></textarea>
						</div>
						<div class="mt-2">
							<label class="form-label fw-bold">City</label> <input
								class="form-control" type="text" name="city"
								placeholder="City/District/Town" required>
						</div>
						<div class="mt-2">
							<label class="form-label fw-bold">Pincode</label> <input
								class="form-control" type="number" name="pincode"
								placeholder="Pincode" maxlength="6" required>
						</div>
						<div class="mt-2">
							<label class="form-label fw-bold">State</label> <select
								name="state" class="form-select">
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
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-primary">Save</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- end modal -->
</section>

<%@include file="footer.jsp" %>
</body>
</html>