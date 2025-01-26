<%--
  Created by IntelliJ IDEA.
  User: Vihanga
  Date: 24/01/2025
  Time: 22:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="Assets/Styles/styles.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row justify-content-center align-items-center min-vh-100">
        <div class="col-md-6 col-lg-4">
            <div class="card shadow">
                <div class="card-body p-5">
                    <h2 class="text-center mb-4">Reset Password</h2>
                    <p class="text-center text-muted mb-4">Enter your email address and we'll send you a link to reset your password.</p>
                    <form action="#" method="post">
                        <div class="mb-3">
                            <label for="email" class="form-label">Email address</label>
                            <input type="email" class="form-control" id="email" name="email" required>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Send Reset Link</button>
                        <div class="text-center mt-3">
                            <a href="index.jsp" class="text-decoration-none">Back to Login</a>
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
