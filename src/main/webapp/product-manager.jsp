<%--
  Created by IntelliJ IDEA.
  User: Vihanga
  Date: 19/01/2025
  Time: 10:54
  To change this template use File | Settings | File Templates.
--%>
// productManagement.jsp
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Management</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
        }
        th {
            background-color: #f4f4f4;
        }
        .form-group {
            margin: 10px 0;
        }
        .btn {
            padding: 8px 16px;
            margin: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<h2>Product Management</h2>

<!-- Add Product Form -->
<form action="ProductServlet" method="post">
    <input type="hidden" name="action" value="add">
    <div class="form-group">
        <label for="name">Product Name:</label>
        <input type="text" id="name" name="name" required>
    </div>
    <div class="form-group">
        <label for="description">Description:</label>
        <textarea id="description" name="description" required></textarea>
    </div>
    <div class="form-group">
        <label for="price">Price:</label>
        <input type="number" id="price" name="price" step="0.01" required>
    </div>
    <div class="form-group">
        <label for="stock">Stock:</label>
        <input type="number" id="stock" name="stock" required>
    </div>
    <button type="submit" class="btn">Add Product</button>
</form>

<!-- Products Table -->
<h3>Product List</h3>
<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Description</th>
        <th>Price</th>
        <th>Stock</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <forEach var="product" items="${products}">
        <tr>
            <td>${product.id}</td>
            <td>${product.name}</td>
            <td>${product.description}</td>
            <td>${product.price}</td>
            <td>${product.stock}</td>
            <td>
                <form action="ProductServlet" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="id" value="${product.id}">
                    <button type="submit" class="btn">Delete</button>
                </form>
                <button onclick="showEditForm(${product.id})" class="btn">Edit</button>
            </td>
        </tr>
    </forEach>
    </tbody>
</table>

<script>
    function showEditForm(productId) {
        // Implementation for edit functionality
        alert("Edit functionality to be implemented for product ID: " + productId);
    }
</script>
</body>
</html>