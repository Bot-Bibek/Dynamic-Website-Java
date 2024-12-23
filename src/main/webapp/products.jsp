<%@page import="com.emart.entities.User"%>
<%@page import="com.emart.dao.CategoryDao"%>
<%@page import="com.emart.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.emart.helper.ConnectionProvider"%>
<%@page import="com.emart.dao.ProductDao"%>
<%
User u = (User) session.getAttribute("activeUser");

String searchKey = request.getParameter("search");
String catId = request.getParameter("category");
CategoryDao categoryDao = new CategoryDao(ConnectionProvider.getConnection());
String message = "";

ProductDao productDao = new ProductDao(ConnectionProvider.getConnection());
List<Product> prodList = null;
if (searchKey != null) {
	if (!searchKey.isEmpty()) {
		message = "Showing results for \"" + searchKey + "\"";
	}else{
		message = "No product found!";
	}
	prodList = productDao.getAllProductsBySearchKey(searchKey);

} else if (catId != null && !(catId.trim().equals("0"))) {
	prodList = productDao.getAllProductsByCategoryId(Integer.parseInt(catId.trim()));
	message = "Showing results for \"" + categoryDao.getCategoryName(Integer.parseInt(catId.trim())) + "\"";
} else {
	prodList = productDao.getAllProducts();
	message = "All Products";
}

if (prodList != null && prodList.size() == 0) {

	message = "No items are available for \""
	+ (searchKey != null ? searchKey : categoryDao.getCategoryName(Integer.parseInt(catId.trim()))) + "\"";

	prodList = productDao.getAllProducts();
}
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
<body style="background-color: #f0f0f0;">
	<!--navbar -->
	<%@include file="Components/navbar.jsp"%>
	<section id="starter-section" class="starter-section section">
	<!--show products-->
	<h4 class="text-center mt-2"><%=message%></h4>
	<div class="container-fluid my-3 px-5">

		<div class="row row-cols-1 row-cols-md-4 g-3">
			<%
			for (Product p : prodList) {
			%>
			<div class="col">

				<div class="card h-100 px-2 py-2">
					<div class="container text-center">
						<img src="Product_imgs\<%=p.getProductImages()%>"
							class="card-img-top m-2"
							style="max-width: 100%; max-height: 200px; width: auto;">
						<h5 class="card-title text-center"><%=p.getProductName()%></h5>

						<div class="container text-center">
							<span class="real-price">&#8377;<%=p.getProductPriceAfterDiscount()%></span>&ensp;
							<span class="product-price">&#8377;<%=p.getProductPrice()%></span>&ensp;
							<span class="product-discount"><%=p.getProductDiscount()%>&#37;off</span>
						</div>
						<div class="container text-center mb-2 mt-2">
							<button type="button"
								onclick="window.open('viewProduct.jsp?pid=<%=p.getProductId()%>', '_self')"
								class="btn btn-primary text-white">View Details</button>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>

