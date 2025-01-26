<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Blue Thread Co. - Admin Dashboard</title>
    <link
            href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css"
            rel="stylesheet"
    />
    <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
            rel="stylesheet"
    />
    <link rel="stylesheet" href="Assets/Styles/Index.css" >
    <style>
        .admin-card {
            background-color: var(--dark-card);
            border: 1px solid rgba(255, 255, 255, 0.1);
            color: var(--white);
            transition: transform 0.3s ease;
        }

        .admin-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            border: 1px solid var(--primary-blue);
        }

        .table-dark {
            color: var(--white);
        }

        .modal-content {
            background-color: var(--dark-card);
        }
    </style>
</head>
<body>
<!-- Navigation Bar (Identical to Index Page) -->
<nav class="navbar navbar-expand-lg navbar-light shadow-sm sticky-top">
    <div class="container">
        <img src="Assets/Images/Blue%20Thread%20Co%20Logo.png" alt="Blue Thread Co." width="50"/>
        <a class="navbar-brand fw-bold" href="index.jsp">Blue Thread Co. Admin</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="admin-dashboard.jsp">Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#products">Products</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#users">Users</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#orders">Orders</a>
                </li>
            </ul>
            <div class="d-flex align-items-center gap-3">
                <a href="index.jsp?action=logout" class="btn btn-primary">Logout</a>
            </div>
        </div>
    </div>
</nav>

<!-- Main Dashboard Content -->
<section class="py-5">
    <div class="container">
        <div class="row g-4">
            <!-- Products Card -->
            <div class="col-md-4">
                <div class="card admin-card text-center h-100">
                    <div class="card-body">
                        <div class="category-icon">
                            <i class="fas fa-box"></i>
                        </div>
                        <h5 class="card-title">Product Management</h5>
                        <p class="card-text text-secondary">
                            Add, Edit, Delete Products
                        </p>
                        <a href="#products" class="btn btn-primary">Manage Products</a>
                    </div>
                </div>
            </div>

            <!-- Users Card -->
            <div class="col-md-4">
                <div class="card admin-card text-center h-100">
                    <div class="card-body">
                        <div class="category-icon">
                            <i class="fas fa-users"></i>
                        </div>
                        <h5 class="card-title">User Management</h5>
                        <p class="card-text text-secondary">
                            Manage User Accounts
                        </p>
                        <a href="#users" class="btn btn-primary">Manage Users</a>
                    </div>
                </div>
            </div>

            <!-- Orders Card -->
            <div class="col-md-4">
                <div class="card admin-card text-center h-100">
                    <div class="card-body">
                        <div class="category-icon">
                            <i class="fas fa-shopping-cart"></i>
                        </div>
                        <h5 class="card-title">Order Management</h5>
                        <p class="card-text text-secondary">
                            Track and Manage Orders
                        </p>
                        <a href="#orders" class="btn btn-primary">Manage Orders</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Detailed Management Sections -->
<section class="py-5">
    <div class="container">
        <!-- Products Table -->
        <div id="products" class="mb-5">
            <h2 class="text-center mb-4">Product Management</h2>
            <div class="card admin-card p-4">
                <div class="d-flex justify-content-end mb-3">
                    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#productModal">
                        <i class="fas fa-plus me-2"></i>Add Product
                    </button>
                </div>
                <table class="table table-dark">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Category</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="product" items="${products}">
                        <tr>
                            <td>${product.id}</td>
                            <td>${product.name}</td>
                            <td>$${product.price}</td>
                            <td>${product.category}</td>
                            <td>
                                <div class="btn-group">
                                    <button class="btn btn-sm btn-outline-primary"
                                            onclick="editProduct(${product.id})">
                                        <i class="fas fa-edit"></i>
                                    </button>
                                    <button class="btn btn-sm btn-outline-danger"
                                            onclick="deleteProduct(${product.id})">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Users Table -->
        <div id="users" class="mb-5">
            <h2 class="text-center mb-4">User Management</h2>
            <div class="card admin-card p-4">
                <table class="table table-dark">
                    <thead>
                    <tr>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Role</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="user" items="${users}">
                        <tr>
                            <td>${user.first_name} ${user.last_name}</td>
                            <td>${user.email}</td>
                            <td>${user.role}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Orders Table -->
        <div id="orders">
            <h2 class="text-center mb-4">Order Management</h2>
            <div class="card admin-card p-4">
                <table class="table table-dark">
                    <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Customer</th>
                        <th>Total</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="order" items="${orders}">
                        <tr>
                            <td>${order.id}</td>
                            <td>${order.customerName}</td>
                            <td>$${order.total}</td>
                            <td>${order.status}</td>
                            <td>
                                <div class="btn-group">
                                    <button class="btn btn-sm btn-outline-primary"
                                            onclick="updateOrderStatus(${order.id})">
                                        <i class="fas fa-edit"></i>
                                    </button>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>

<!-- Product Modal -->
<div class="modal fade" id="productModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-white">Add/Edit Product</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <form id="productForm" action="ProductController" method="post">
                    <input type="hidden" name="id" id="productId">
                    <div class="mb-3">
                        <label class="form-label text-white">Product Name</label>
                        <input type="text" class="form-control" name="name" id="productName" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label text-white">Price</label>
                        <input type="number" step="0.01" class="form-control" name="price" id="productPrice" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label text-white">Category</label>
                        <select class="form-select" name="category" id="productCategory">
                            <option>Slim Fit</option>
                            <option>Regular Fit</option>
                            <option>Relaxed Fit</option>
                            <option>Skinny Fit</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary">Save Product</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Footer (Identical to Index Page) -->
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
                    <li><a href="#" class="text-secondary">Dashboard</a></li>
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
    function editProduct(id) {
        // AJAX call to fetch product details
        fetch(`ProductController?action=edit&id=${id}`)
            .then(response => response.json())
            .then(product => {
                document.getElementById('productId').value = product.id;
                document.getElementById('productName').value = product.name;
                document.getElementById('productPrice').value = product.price;
                document.getElementById('productCategory').value = product.category;

                var productModal = new bootstrap.Modal(document.getElementById('productModal'));
                productModal.show();
            });
    }

    function deleteProduct(id) {
        if(confirm('Are you sure you want to delete this product?')) {
            fetch(`ProductController?action=delete&id=${id}`, { method: 'POST' })
                .then(response => {
                    if(response.ok) {
                        location.reload();
                    }
                });
        }
    }

    function updateOrderStatus(id) {
        const newStatus = prompt('Enter new order status:');
        if(newStatus) {
            fetch(`OrderController?action=updateStatus&id=${id}&status=${newStatus}`, { method: 'POST' })
                .then(response => {
                    if(response.ok) {
                        location.reload();
                    }
                });
        }
    }
</script>
</body>
</html>