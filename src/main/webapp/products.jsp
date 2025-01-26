<%--
  Created by IntelliJ IDEA.
  User: Vihanga
  Date: 25/01/2025
  Time: 13:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Shop - E-commerce</title>
    <link
            href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css"
            rel="stylesheet"
    />
    <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
            rel="stylesheet"
    />
    <link href="Assets/Styles/product.css" rel="stylesheet">
</head>
<body>
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-light shadow-sm sticky-top">
    <div class="container">
        <img src="Assets/Images/Blue%20Thread%20Co%20Logo.png" alt="Blue Thread Co." width="50"/>
        <a class="navbar-brand fw-bold" href="index.jsp">Blue Thread Co.</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link ${pageContext.request.servletPath == '/index.jsp' ? 'active' : ''}"
                       href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ${pageContext.request.servletPath == '/shop/products.jsp' ? 'active' : ''}"
                       href="##products">Products</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#contacts">Contact Us</a>
                </li>
            </ul>
            <div class="d-flex align-items-center gap-3">
                <c:choose>
                    <c:otherwise>
                        <div class="dropdown">
                            <button class="btn profile-btn text-light dropdown-toggle" type="button"
                                    id="profileDropdown" data-bs-toggle="dropdown">
                                <i class="fas fa-user me-2"></i>${sessionScope.user.first_name}
                            </button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/profile">My Profile</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/orders">My Orders</a></li>
                                <c:if test="${sessionScope.user.role == 'ADMIN'}">
                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/dashboard">Admin Dashboard</a></li>
                                </c:if>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/logout">Logout</a></li>
                            </ul>
                        </div>
                    </c:otherwise>
                </c:choose>
                <a href="profile.jsp" class="btn cart-btn text-light">
                    <i class="fas fa-shopping-cart"></i>
                    <span class="cart-count">${sessionScope.cartCount}</span>
                </a>
            </div>
        </div>
    </div>
</nav>

<!-- Hero Section -->
<section class="hero-section">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-6">
                <h1 class="display-4 fw-bold mb-4">Premium Denim Collection</h1>
                <p class="lead mb-4 text-secondary">
                    Experience the artistry of our handcrafted jeans, meticulously
                    woven from premium Japanese selvedge denim, where tradition meets
                    timeless style.
                </p>
                <button class="btn btn-primary btn-lg">Shop Now</button>
            </div>
            <div class="col-lg-6">
                <img
                        src="Assets/Images/Denim%20Poster.png"
                        alt="Premium Jeans"
                        class="img-fluid rounded"
                />
            </div>
        </div>
    </div>
</section>
<div id="#products"></div>
<!-- Main Content -->
<div class="container-fluid mt-5 p-5">
    <div class="row">
        <!-- Products Grid -->
        <div class="col-lg-9">
            <div class="row g-4">
                <!-- Product Card -->
                <div class="col-md-4">
                    <div class="product-card">
                        <img
                                src="/assets/images/Heren T-shirts Baggy Ronde Hals Drop Schouder Korte Mouw Grafisch T-shirt Casual Zomer Polyester.jpeg"
                                class="product-image w-100"
                                alt="Product"
                        />
                        <div class="card-body p-3">
                            <div
                                    class="d-flex justify-content-between align-items-center mb-2"
                            >
                                <small class="text-muted">Music</small>
                                <div class="rating">
                                    <i class="bi bi-star-fill"></i>
                                    <span>4.5 (120 Reviews)</span>
                                </div>
                            </div>
                            <h5 class="card-title">Headsound</h5>
                            <p class="card-text fw-bold">$29.90</p>
                            <div class="d-flex gap-2">
                                <button class="btn btn-outline-dark flex-grow-1 rounded-5">
                                    Add to Cart
                                </button>
                                <button class="btn btn-dark flex-grow-1 rounded-5">
                                    Buy Now
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Newsletter Section -->
    <section class="py-5" id="contacts">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6 text-center">
                    <h3>Join the Denim Club</h3>
                    <p class="text-secondary">
                        Get 10% off your first order and exclusive access to new releases
                    </p>
                    <div class="input-group mb-3">
                        <input
                                type="email"
                                class="form-control"
                                placeholder="Enter your email"
                        />
                        <button class="btn btn-primary" type="button">Subscribe</button>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

<!-- Footer -->
<footer class="bg-dark text-light section-padding">
    <div class="main-container">
        <div class="row">
            <div class="col-md-4">
                <h5>About Us</h5>
                <p>Premium clothing and accessories for the modern lifestyle.</p>
            </div>
            <div class="col-md-4">
                <h5>Quick Links</h5>
                <ul class="list-unstyled">
                    <li><a href="#products" class="text-light">Categories</a></li>
                    <li><a href="#arrivals" class="text-light">New Arrivals</a></li>
                    <li><a href="#arrivals" class="text-light">Accessories</a></li>
                </ul>
            </div>
            <div class="col-md-4">
                <h5>Contact</h5>
                <ul class="list-unstyled">
                    <li>Email: meduzaclothing@gmail.com</li>
                    <li>Phone: +(94) 76 842 5039</li>
                </ul>
            </div>
        </div>
    </div>
</footer>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>