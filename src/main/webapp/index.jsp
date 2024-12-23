<%@page import="com.emart.dao.ProductDao"%>
<%@page import="com.emart.entities.Product"%>
<%@page import="com.emart.helper.ConnectionProvider"%>
<%@page errorPage="error_exception.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
ProductDao productDao = new ProductDao(ConnectionProvider.getConnection());
List<Product> productList = productDao.getAllLatestProducts();
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
	
	<section id="hero" class="hero section" style="padding-top: 0px; padding-bottom: 0px; height: 100px"> 
    <div style="position: relative;">
        <video width="100%" height="" autoplay loop muted>
            <source src="iphone.mp4" type="video/mp4">
        </video>
        <div class="container d-flex align-items-center justify-content-center" style="position: absolute; top: 0; left: 0; right: 0; bottom: 0;">
            <div data-aos="fade-up" data-aos-delay="100">
                <div class="row justify-content-center">
                    <div class="col-lg-8 text-center">
                        <h2>Welcome to E-MART</h2>
                        <p>Enhance Your Tech Experience With Our High-Quality Supplies</p>
                        <a href="products.jsp" class="btn-get-started"> Let's Get Started</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
	</section>

	<!-- latest product listed -->
	<div class="container-fluid py-3 px-3" style="background: #f2f2f2;">
		<div class="row row-cols-1 row-cols-md-4 g-3">
			<div class="col">
				<div class="container text-center px-5 py-5">
					<h1>Latest Products</h1>
				</div>
			</div>
			<%
			for (int i = 0; i < Math.min(3, productList.size()); i++) {
			%>
			<div class="col">
				<a href="viewProduct.jsp?pid=<%=productList.get(i).getProductId()%>"
					style="text-decoration: none;">
					<div class="card h-100">
						<div class="container text-center">
							<img
								src="Product_imgs\<%=productList.get(i).getProductImages()%>"
								class="card-img-top m-2"
								style="max-width: 100%; max-height: 200px; width: auto;">
						</div>
						<div class="card-body">
							<h5 class="card-title text-center"><%=productList.get(i).getProductName()%></h5>

							<div class="container text-center">
								<span class="real-price">&#8377;<%=productList.get(i).getProductPriceAfterDiscount()%></span>
								&ensp;<span class="product-price">&#8377;<%=productList.get(i).getProductPrice()%>
								</span>&ensp;<span class="product-discount"><%=productList.get(i).getProductDiscount()%>&#37;
									off</span>
							</div>
						</div>
					</div>
				</a>
			</div>

			<%
			}
			%>
		</div>
	</div>
	<!-- end of list -->
	<!-- end -->
	<section id="contact" class="contact section">

      <!-- Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <span class="">Contact Us</span>
        <h2 class="">Contact Us</h2>
        <p>"Dear valued customer, we'd love to hear your suggestions! Share them with us through our contact form for a better experience."</p>
      </div><!-- End Section Title -->

      <div class="container" data-aos="fade-up" data-aos-delay="100">
        <div class="row gy-4">
          <div class="col-lg-6">
            <div class="info-item d-flex flex-column justify-content-center align-items-center" data-aos="fade-up" data-aos-delay="200">
              <i class="bi bi-geo-alt"></i>
              <h3>Address</h3>
              <p>Lamachaur-19, Pokhara, PK 33200</p>
            </div>
          </div><!-- End Info Item -->

          <div class="col-lg-3 col-md-6">
            <div class="info-item d-flex flex-column justify-content-center align-items-center" data-aos="fade-up" data-aos-delay="300">
              <i class="bi bi-telephone"></i>
              <h3>Call Us</h3>
              <p>+977 9800001111</p>
            </div>
          </div><!-- End Info Item -->

          <div class="col-lg-3 col-md-6">
            <div class="info-item d-flex flex-column justify-content-center align-items-center" data-aos="fade-up" data-aos-delay="400">
              <i class="bi bi-envelope"></i>
              <h3>Email Us</h3>
              <p>emartservice@gmail.com</p>
            </div>
          </div><!-- End Info Item -->

        </div>

        <div class="row gy-4 mt-1">
        <div class="col-lg-6" data-aos="fade-up" data-aos-delay="300">
            <img src="assets/img/contact-us.jpg" class="contact-us-icon" alt="Product 1" frameborder="0" style="border:0; width: 100%; height: 400px;">
          </div><!-- End Google Maps -->
          <div class="col-lg-6">
            <form action="forms/contact.php" method="post" class="php-email-form" data-aos="fade-up" data-aos-delay="400">
              <div class="row gy-4">

                <div class="col-md-6">
                  <input type="text" name="name" class="form-control" placeholder="Your Name" required="">
                </div>

                <div class="col-md-6 ">
                  <input type="email" class="form-control" name="email" placeholder="Your Email" required="">
                </div>

                <div class="col-md-12">
                  <input type="text" class="form-control" name="subject" placeholder="Subject" required="">
                </div>

                <div class="col-md-12">
                  <textarea class="form-control" name="message" rows="6" placeholder="Message" required=""></textarea>
                </div>

                <div class="col-md-12 text-center">
                  <div class="loading">Loading</div>
                  <div class="error-message"></div>
                  <div class="sent-message">Your message has been sent. Thank you!</div>
                  <button type="submit">Send Message</button>
                </div>
              </div>
            </form>
          </div><!-- End Contact Form -->

        </div>

      </div>

    </section><!-- /Contact Section -->
	<%@include file="footer.jsp" %>

	<!-- confirmation message for successful order -->
	<%
	String order = (String) session.getAttribute("order");
	if (order != null) {
	%>
	<script type="text/javascript">
		console.log("testing..4...");
		Swal.fire({
		  icon : 'success',
		  title: 'Order Placed, Thank you!',
		  text: 'Confirmation will be sent to <%=user.getUserEmail()%>',
		  width: 600,
		  padding: '3em',
		  showConfirmButton : false,
		  timer : 3500,
		  backdrop: `
		    rgba(0,0,123,0.4)
		  `
		});
	</script>
	<%
	}
	session.removeAttribute("order");
	%>
	<!-- end of message -->
	<!-- Scroll Top -->
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