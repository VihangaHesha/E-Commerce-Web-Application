<%--
  Created by IntelliJ IDEA.
  User: Vihanga
  Date: 25/01/2025
  Time: 15:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Account Pages - Blue Thread Co.</title>
  <link
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css"
          rel="stylesheet"
  />
  <link
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
          rel="stylesheet"
  />
  <link href="Assets/Styles/Profile.css" rel="stylesheet">
  <link href="Assets/Styles/Index.css" rel="stylesheet">
</head>
<body>
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
          <a class="nav-link" href="index.jsp">Best Sellers</a>
        </li>
        <li class="nav-item">
          <a class="nav-link ${pageContext.request.servletPath == '/shop/products.jsp' ? 'active' : ''}"
             href="products.jsp">Products</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="index.jsp">Contact Us</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
<div class="container py-5">
  <!-- Account Navigation -->
  <ul class="nav nav-tabs mb-4">
    <li class="nav-item">
      <a class="nav-link ui-state-disabled" href="#profile" data-bs-toggle="tab">
        <i class="fas fa-user me-2"></i>Profile
      </a>
    </li>
    <li class="nav-item">
      <a class="nav-link active" href="#orders" data-bs-toggle="tab">
        <i class="fas fa-shopping-bag me-2"></i>Orders
      </a>
    </li>
    <li class="nav-item">
      <a class="nav-link ui-state-disabled" href="#cart" data-bs-toggle="tab">
        <i class="fas fa-shopping-cart me-2"></i>Cart
      </a>
    </li>
  </ul>

  <div class="tab-content">
    <!-- Profile Tab -->
    <div class="tab-pane fade" id="profile">
      <div class="row">
        <div class="col-md-4 mb-4">
          <div class="card" style="color: white">
            <div class="card-body text-center">
              <div class="profile-image">
                <i class="fas fa-user fa-3x text-white"></i>
              </div>
              <h4>John Doe</h4>
              <p class="text-secondary">Member since January 2024</p>
              <button class="btn btn-primary mt-3">
                <i class="fas fa-camera me-2"></i>Change Photo
              </button>
            </div>
          </div>
        </div>
        <div class="col-md-8">
          <div class="card">
            <div class="card-body" style="color: white">
              <h4 class="mb-4">Personal Information</h4>
              <form action="" method="" style="color: white">
                <div class="row mb-3">
                  <div class="col-md-6">
                    <label class="form-label">First Name</label>
                    <input type="text" class="form-control" value="John" />
                  </div>
                  <div class="col-md-6">
                    <label class="form-label">Last Name</label>
                    <input type="text" class="form-control" value="Doe" />
                  </div>
                </div>
                <div class="mb-3">
                  <label class="form-label">Email</label>
                  <input
                          type="email"
                          class="form-control"
                          value="john.doe@example.com"
                  />
                </div>
                <div class="mb-3">
                  <label class="form-label">Phone</label>
                  <input
                          type="tel"
                          class="form-control"
                          value="+1234567890"
                  />
                </div>
                <div class="mb-3">
                  <label class="form-label">Address</label>
                  <textarea class="form-control" rows="3">
123 Denim Street, Fashion City, FC 12345</textarea
                  >
                </div>
                <button type="submit" class="btn btn-primary">
                  <i class="fas fa-save me-2"></i>Update Profile
                </button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Orders Tab -->
    <div class="tab-pane fade active show" id="orders">
      <div class="card">
        <div class="card-body">
          <div class="table-responsive">
            <table class="table">
              <thead>
              <tr>
                <th>Order ID</th>
                <th>Date</th>
                <th>Items</th>
                <th>Total</th>
                <th>Status</th>
                <th>Action</th>
              </tr>
              </thead>
              <tbody>
              <tr>
                <td>#12345</td>
                <td>Jan 18, 2024</td>
                <td>2 items</td>
                <td>$359.98</td>
                <td>
                        <span class="order-status status-delivered"
                        >Delivered</span
                        >
                </td>
                <td>
                  <button class="btn btn-sm btn-outline-primary">
                    View Details
                  </button>
                </td>
              </tr>
              <tr>
                <td>#12346</td>
                <td>Jan 15, 2024</td>
                <td>1 item</td>
                <td>$179.99</td>
                <td>
                        <span class="order-status status-delivered"
                        >Delivered</span
                        >
                </td>
                <td>
                  <button class="btn btn-sm btn-outline-primary">
                    View Details
                  </button>
                </td>
              </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>

    <!-- Cart Tab -->
    <div class="tab-pane fade" id="cart">
      <div class="row">
        <div class="col-lg-8">
          <div class="card mb-4">
            <div class="card-body">
              <div class="table-responsive">
                <table class="table">
                  <thead>
                  <tr>
                    <th>Product</th>
                    <th>Size</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                    <th></th>
                  </tr>
                  </thead>
                  <tbody>
                  <tr>
                    <td>
                      <div class="d-flex align-items-center">
                        <img
                                src="/api/placeholder/80/80"
                                class="cart-item-image me-3"
                                alt="Product"
                        />
                        <span>Raw Denim Regular Fit</span>
                      </div>
                    </td>
                    <td>32</td>
                    <td>$179.99</td>
                    <td>
                      <input
                              type="number"
                              class="form-control"
                              style="width: 70px"
                              value="1"
                              min="1"
                      />
                    </td>
                    <td>$179.99</td>
                    <td>
                      <button class="btn btn-outline-danger btn-sm">
                        <i class="fas fa-trash"></i>
                      </button>
                    </td>
                  </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="card cart-summary" style="color: white">
            <div class="card-body">
              <h4 class="mb-3">Order Summary</h4>
              <div class="d-flex justify-content-between mb-2">
                <span>Subtotal</span>
                <span>$179.99</span>
              </div>
              <div class="d-flex justify-content-between mb-2">
                <span>Shipping</span>
                <span class="text-success">Free</span>
              </div>
              <hr />
              <div class="d-flex justify-content-between mb-3">
                <strong>Total</strong>
                <strong>$179.99</strong>
              </div>
              <button class="btn btn-primary w-100">
                <i class="fas fa-lock me-2"></i>Proceed to Checkout
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>
