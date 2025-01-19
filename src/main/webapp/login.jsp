<%--
  Created by IntelliJ IDEA.
  User: Vihanga
  Date: 19/01/2025
  Time: 12:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blue Vintage Thread Co. - Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="Assets/Styles/Login.css" rel="stylesheet">
</head>
<body>
<div class="login-container d-flex align-items-center justify-content-center">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-10">
                <div class="login-box">
                    <div class="row g-0">
                        <div class="col-lg-6 d-flex align-items-center justify-content-center p-5" style="background-color: #19388c;">
                            <img src="Assets/Images/Blue%20Thread%20Co%20Logo%20Bg-Removed.png" alt="Blue Thread Co. Logo" class="img-fluid">
                        </div>
                        <div class="col-lg-6">
                            <div class="p-5">
                                <div class="text-center mb-5">
                                    <h1 class="brand-name">BLUE THREAD CO.</h1>
                                    <p class="text-muted">EST. 2024</p>
                                </div>

                                <form action="login-servlet" method="POST">
                                    <div class="mb-4">
                                        <input type="email" class="form-control" name="email" placeholder="Email address" required>
                                    </div>
                                    <div class="mb-4">
                                        <input type="password" class="form-control" name="password" placeholder="Password" required>
                                    </div>
                                    <div class="mb-4 d-flex justify-content-between">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="remember">
                                            <label class="form-check-label" for="remember">Remember me</label>
                                        </div>
                                        <a href="#" class="vintage-link">Forgot password?</a>
                                    </div>
                                    <button type="submit" class="btn btn-vintage w-100 mb-4">Sign In</button>
                                    <div class="text-center">
                                        <span class="text-muted">Don't have an account?</span>
                                        <a href="register.jsp" class="vintage-link ms-2">Register here</a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>