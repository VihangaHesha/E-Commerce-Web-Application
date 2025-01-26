<%--
  Created by IntelliJ IDEA.
  User: Vihanga
  Date: 24/01/2025
  Time: 22:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Register</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="Assets/Styles/styles.css" rel="stylesheet">
</head>
<body>
<div class="container">
  <div class="row justify-content-center align-items-center min-vh-100">
    <div class="col-md-6 col-lg-4">
      <div class="card shadow">
        <div class="card-body p-5">
          <h2 class="text-center mb-4">Create Account</h2>
          <form action="user-servlet" method="post">
            <input type="hidden" name="action" value="register">
            <div class="mb-3">
              <label for="firstname" class="form-label">First Name</label>
              <input type="text" class="form-control" id="firstname" name="firstname" required>
            </div>
            <div class="mb-3">
              <label for="lastname" class="form-label">Last Name</label>
              <input type="text" class="form-control" id="lastname" name="lastname" required>
            </div>
            <div class="mb-3">
              <label for="email" class="form-label">Email address</label>
              <input type="email" class="form-control" id="email" name="email" required>
            </div>
            <div class="mb-3">
              <label for="password" class="form-label">Password</label>
              <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <div class="mb-3">
              <label for="confirm-password" class="form-label">Confirm Password</label>
              <input type="password" class="form-control" id="confirm-password" name="confirm-password" required>
            </div>
            <div class="mb-3 form-check">
              <input type="checkbox" class="form-check-input" id="terms" required>
              <label class="form-check-label" for="terms">I agree to the Terms & Conditions</label>
            </div>
            <% if(request.getAttribute("error") != null) { %>
            <div class="alert alert-danger" role="alert">
              <%= request.getAttribute("error") %>
            </div>
            <% } %>
            <button type="submit" class="btn btn-primary w-100">Register</button>
            <div class="text-center mt-3">
              Already have an account? <a href="index.jsp" class="text-decoration-none">Login</a>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
