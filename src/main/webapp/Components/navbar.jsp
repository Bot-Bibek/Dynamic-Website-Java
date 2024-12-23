<%@page import="com.emart.entities.Admin"%>
<%@page import="com.emart.entities.Cart"%>
<%@page import="com.emart.dao.CartDao"%>
<%@page import="com.emart.entities.User"%>
<%@page import="java.util.List"%>
<%@page import="com.emart.entities.Category"%>
<%@page import="com.emart.helper.ConnectionProvider"%>
<%@page import="com.emart.dao.CategoryDao"%>
<%
User user = (User) session.getAttribute("activeUser");
Admin admin = (Admin) session.getAttribute("activeAdmin");

CategoryDao catDao = new CategoryDao(ConnectionProvider.getConnection());
List<Category> categoryList = catDao.getAllCategories();
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<header id="header" class="header sticky-top">
    	<%
		if (admin != null) {
		%>
		<div class="branding d-flex align-items-center">
	        <div class="container position-relative d-flex align-items-center justify-content-between">
		        <a href="admin.jsp" class="logo d-flex align-items-center">
		          <h1 class="sitename">E-MART</h1>
		        </a>
			        <nav id="navmenu" class="navmenu">
			          <ul>
			            <li><a href="" class="btn nav-link" data-bs-toggle="modal"
								data-bs-target="#add-category"><i class="fa-solid fa-plus fa-xs"></i>Add Category</a></li>
			            <li><a href="" class="btn nav-link" data-bs-toggle="modal"
								data-bs-target="#add-product"><i class="fa-solid fa-plus fa-xs"></i>Add Product</a></li>
			            <li><a href="adminlogin.jsp"><%=admin.getName()%></a><li>
			            <li><a href="LogoutServlet?user=admin">LogOut</a><li>
			          </ul>
			          <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
			       </nav>
	        </div>
    	</div>
    	
    	<%
		} else {
		%>
		<div class="branding d-flex align-items-center">
	        <div class="container position-relative d-flex align-items-center justify-content-between">
		        <a href="index.jsp">
		          <h1 class="sitename">E-MART</h1>
		        </a>
			        <nav id="navmenu" class="navmenu">
			          <ul>
			            <li><a href="products.jsp" >Product</a></li>
			            <li class="dropdown"><a href="#"><span>Category</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
			              <ul>
			                <li><a href="products.jsp?category=0">All Products</a></li>
			                <%
							for (Category c : categoryList) {
							%>
			                <li><a href="products.jsp?category=<%=c.getCategoryId()%>"><%=c.getCategoryName()%></a></li>
			                <%
							}
							%>
			              </ul>
			            </li>
			            <form class="d-flex pe-5" role="search" action="products.jsp" method="get">
			            <input name="search" class="form-control me-2" size="50" type="search" placeholder="Search for products" aria-label="Search" style="background-color: white !important;">
			            <button class="btn btn-outline-light" type="submit">Search</button>
			            </form>
						<%
						if (user != null) {
						CartDao cartDao = new CartDao(ConnectionProvider.getConnection());
						int cartCount = cartDao.getCartCountByUserId(user.getUserId());
						%>
						<li><a class="nav-link position-relative" href="cart.jsp"><i class="fa-solid fa-cart-shopping"></i> &nbsp;Cart<span

						class="position-absolute top-1 start-0 translate-middle badge rounded-pill bg-danger"><%=cartCount%></span></a></li>
			            <li><a href="profile.jsp"><%=user.getUserName()%></a><li>
				        <li><a href="LogoutServlet?user=user">LogOut</a><li>
			            
			         </ul>
			          	<%
						} else {
						%>
						<ul>
						<li><a href="register.jsp">Register</a><li>
						<li><a href="login.jsp">Login</a><li>
						<li><a href="admin.jsp">Admin</a><li>
						</ul>
			          <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
			       </nav>
	        </div>
    	</div>
    	<%
		}
		}
		%>
  </header>
  
  
  
  <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
  <!-- Vendor JS Files -->
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/imagesloaded/imagesloaded.pkgd.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>


  <!-- Main JS File -->
  <script src="assets/js/main.js"></script>
</body>
</html>

	
	
	






