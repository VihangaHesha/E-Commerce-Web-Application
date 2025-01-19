<%--
  Created by IntelliJ IDEA.
  User: Vihanga
  Date: 19/01/2025
  Time: 12:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Dashboard</title>
    <link href="../Assets/Styles/Admin.css" rel="stylesheet">
</head>
<body>
<div class="wrapper">
    <nav class="navbar navbar-expand-lg navbar-light shadow-sm sticky-top">
        <div class="container">
            <img src="${pageContext.request.contextPath}/Assets/Images/Blue%20Thread%20Co%20Logo.png" alt="Blue Thread Co." width="50"/>
            <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/index.jsp">Blue Thread Co.</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link ${pageContext.request.servletPath == '/index.jsp' ? 'active' : ''}"
                           href="${pageContext.request.contextPath}/index.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#featured-products">Best Sellers</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link ${pageContext.request.servletPath == '/shop/products.jsp' ? 'active' : ''}"
                           href="${pageContext.request.contextPath}/products">Products</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Size Guide</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#contacts">Contact Us</a>
                    </li>
                </ul>
                <div class="d-flex align-items-center gap-3">
                    <c:choose>
                        <c:when test="${empty sessionScope.user}">
                            <a href="${pageContext.request.contextPath}/login" class="btn profile-btn text-light">
                                <i class="fas fa-user me-2"></i>Login
                            </a>
                        </c:when>
                        <c:otherwise>
                            <div class="dropdown">
                                <button class="btn profile-btn text-light dropdown-toggle" type="button"
                                        id="profileDropdown" data-bs-toggle="dropdown">
                                    <i class="fas fa-user me-2"></i>${sessionScope.user.username}
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
                    <a href="${pageContext.request.contextPath}/cart" class="btn cart-btn text-light">
                        <i class="fas fa-shopping-cart"></i>
                        <span class="cart-count">${sessionScope.cartCount}</span>
                    </a>
                </div>
            </div>
        </div>
    </nav>
    <!-- Sidebar -->
    <nav class="sidebar">
        <div class="p-3">
            <h4 class="text-white mb-4">Admin Dashboard</h4>
            <ul class="nav nav-pills flex-column">
                <li class="nav-item">
                    <a class="nav-link active" href="#products" data-bs-toggle="pill">
                        <i class="fas fa-box me-2"></i>Products
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#Categories" data-bs-toggle="pill">
                        <i class="fas fa-shopping-cart me-2"></i>Categories
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#orders" data-bs-toggle="pill">
                        <i class="fas fa-shopping-cart me-2"></i>Orders
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#Users" data-bs-toggle="pill">
                        <i class="fas fa-shopping-cart me-2"></i>Users
                    </a>
                </li>
            </ul>
        </div>
    </nav>
</div>
</body>
</html>
