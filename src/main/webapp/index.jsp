<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Blue Thread Co. - Premium Jeans Collection</title>
    <link
            href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css"
            rel="stylesheet"
    />
    <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
            rel="stylesheet"
    />
    <link rel="stylesheet" href="Assets/Styles/Index.css" >
</head>
<body>
<!-- Navigation Bar -->
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
                    <a class="nav-link" href="#featured-products">Best Sellers</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ${pageContext.request.servletPath == '/shop/products.jsp' ? 'active' : ''}"
                       href="products.jsp">Products</a>
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
                                <li><a class="dropdown-item" href="profile.jsp">My Profile</a></li>
                                <li><a class="dropdown-item" href="orders.jsp">My Orders</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="login.jsp?action=login">Login/Sign In</a></li>
                                <li><a class="dropdown-item" href="index.jsp?action=logout">Logout</a></li>
                            </ul>
                        </div>
                    </c:otherwise>
                </c:choose>
                <a href="cart.jsp" class="btn cart-btn text-light">
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

<!-- Featured Categories -->
<section class="py-5" id="categories">
    <br />
    <div class="container">
        <h2 class="text-center mb-5">Shop By Fit</h2>
        <div class="row g-4">
            <div class="col-md-3">
                <div class="card featured-card text-center h-100">
                    <div class="card-body">
                        <div class="category-icon">
                            <i class="fas fa-male"></i>
                        </div>
                        <h5 class="card-title">Slim Fit</h5>
                        <p class="card-text text-secondary">
                            Modern slim cut for a sleek look
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card featured-card text-center h-100">
                    <div class="category-icon">
                        <i class="fas fa-arrows-alt-h"></i>
                    </div>
                    <h5 class="card-title">Regular Fit</h5>
                    <p class="card-text text-secondary">Classic comfortable fit</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card featured-card text-center h-100">
                    <div class="category-icon">
                        <i class="fas fa-expand-arrows-alt"></i>
                    </div>
                    <h5 class="card-title">Relaxed Fit</h5>
                    <p class="card-text text-secondary">
                        Loose fit for maximum comfort
                    </p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card featured-card text-center h-100">
                    <div class="category-icon">
                        <i class="fas fa-compress-arrows-alt"></i>
                    </div>
                    <h5 class="card-title">Skinny Fit</h5>
                    <p class="card-text text-secondary">Ultra-slim modern cut</p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Featured Products -->
<section class="py-5" id="featured-products">
    <br />
    <br />
    <div class="container">
        <h2 class="text-center mb-5">Best Sellers</h2>
        <div class="row g-4">
            <div class="col-md-4">
                <div
                        class="card featured-card h-100"
                        style="transform: translate(0)"
                >
                    <img
                            src="Assets/Products/Dark%20Wash%20Jean.jpg"
                            class="card-img-top hover-image2"
                            alt="Dark Wash Jeans"
                    />
                    <div class="card-body">
                        <h5 class="card-title">Raw Denim Regular Fit</h5>
                        <p class="card-text text-secondary">16oz Heavyweight Denim</p>
                        <p class="text-primary fw-bold">$179.99</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div
                        class="card featured-card h-100"
                        style="transform: translate(0)"
                >
                    <img
                            src="Assets/Products/Classic%20Blue%20Jean%203.jpg"
                            class="card-img-top"
                            alt="Classic Blue Jeans"
                    />
                    <div class="card-body">
                        <h5 class="card-title">Vintage Wash Slim Fit</h5>
                        <p class="card-text text-secondary">
                            14oz Japanese Selvedge Denim
                        </p>
                        <p class="text-primary fw-bold">$149.99</p>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div
                        class="card featured-card h-100"
                        style="transform: translate(0)"
                >
                    <img
                            src="Assets/Products/Light%20Wash%20Image.jpg"
                            class="card-img-top"
                            alt="Light Wash Jeans"
                    />
                    <div class="card-body">
                        <h5 class="card-title">Light Wash Skinny</h5>
                        <p class="card-text text-secondary">12oz Stretch Denim</p>
                        <p class="text-primary fw-bold">$129.99</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Features Section -->
<section class="py-5">
    <div class="container">
        <div class="row g-4">
            <div class="col-md-4">
                <div class="text-center">
                    <i
                            class="fas fa-tape mb-3"
                            style="font-size: 2rem; color: var(--primary-blue)"
                    ></i>
                    <h4>Perfect Fit Guarantee</h4>
                    <p style="color: rgba(255, 255, 255, 0.683)">
                        Free alterations within 30 days
                    </p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="text-center">
                    <i
                            class="fas fa-shipping-fast mb-3"
                            style="font-size: 2rem; color: var(--primary-blue)"
                    ></i>
                    <h4>Free Shipping</h4>
                    <p style="color: rgba(255, 255, 255, 0.683)">
                        On orders over $100
                    </p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="text-center">
                    <i
                            class="fas fa-medal mb-3"
                            style="font-size: 2rem; color: var(--primary-blue)"
                    ></i>
                    <h4>Premium Quality</h4>
                    <p style="color: rgba(255, 255, 255, 0.683)">
                        Handcrafted premium denim
                    </p>
                </div>
            </div>
        </div>
    </div>
</section>

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
<!-- Footer -->
<footer class="py-4">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <h5>Blue Thread Co.</h5>
                <p class="text-secondary">Crafting premium denim since 1985</p>
            </div>
            <div class="col-md-4">
                <h5>Quick Links</h5>
                <ul class="list-unstyled">
                    <li><a href="#" class="text-secondary">Size Guide</a></li>
                    <li><a href="#" class="text-secondary">Care Instructions</a></li>
                    <li><a href="#" class="text-secondary">Privacy Policy</a></li>
                </ul>
            </div>
            <div class="col-md-4">
                <h5>Contact Us</h5>
                <p class="text-secondary">
                    Email: support@bluethreadco.com<br />Phone: (+94) 76 555 0478
                </p>
            </div>
        </div>
    </div>
</footer>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
<script>
    let cartCount = 0;
    const cartCountElement = document.querySelector(".cart-count");

    document.querySelectorAll(".btn-outline-primary").forEach((button) => {
        button.addEventListener("click", function () {
            this.innerHTML = "✓ Added";
            this.classList.remove("btn-outline-primary");
            this.classList.add("btn-success");

            // Update cart count
            cartCount++;
            cartCountElement.textContent = cartCount;

            setTimeout(() => {
                this.innerHTML = "Add to Cart";
                this.classList.remove("btn-success");
                this.classList.add("btn-outline-primary");
            }, 2000);
        });
    });
</script>
</body>
</html>