<%-- Created by IntelliJ IDEA. User: Vihanga Date: 19/01/2025 Time: 12:19 To
change this template use File | Settings | File Templates. --%> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Blue Thread Co. - Register</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link href="Assets/Styles/Register.css" rel="stylesheet" />
  </head>
  <body>
    <div
      class="login-container d-flex align-items-center justify-content-center"
    >
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-10">
            <div class="login-box">
              <div class="row g-0">
                <div
                  class="col-lg-6 d-flex align-items-center justify-content-center p-5"
                  style="background-color: #19388c"
                >
                  <img
                    src="Assets/Images/Blue%20Thread%20Co%20Logo%20Bg-Removed.png"
                    alt="Blue Thread Co. Logo"
                    class="img-fluid"
                  />
                </div>
                <div class="col-lg-6">
                  <div class="p-5">
                    <div class="text-center mb-4">
                      <h1 class="brand-name">BLUE THREAD CO.</h1>
                      <p class="text-muted">EST. 2024</p>
                    </div>

                    <form action="register-servlet" method="POST">
                      <div class="row">
                        <div class="col-md-6">
                          <input
                            type="text"
                            class="form-control"
                            name="firstName"
                            placeholder="First Name"
                            required
                          />
                        </div>
                        <div class="col-md-6">
                          <input
                            type="text"
                            class="form-control"
                            name="lastName"
                            placeholder="Last Name"
                            required
                          />
                        </div>
                      </div>

                      <input
                        type="email"
                        class="form-control"
                        name="email"
                        placeholder="Email address"
                        required
                      />

                      <input
                        type="password"
                        class="form-control"
                        name="password"
                        placeholder="Password"
                        required
                      />

                      <input
                        type="password"
                        class="form-control"
                        name="confirmPassword"
                        placeholder="Confirm Password"
                        required
                      />

                      <div class="password-requirements">
                        Password must contain:
                        <ul>
                          <li>At least 8 characters</li>
                          <li>One uppercase letter</li>
                          <li>One lowercase letter</li>
                          <li>One number</li>
                          <li>One special character</li>
                        </ul>
                      </div>

                      <div class="mb-4">
                        <div class="form-check">
                          <input
                            type="checkbox"
                            class="form-check-input"
                            id="terms"
                            required
                          />
                          <label class="form-check-label" for="terms"
                            >I agree to the Terms and Conditions</label
                          >
                        </div>
                      </div>

                      <button type="submit" class="btn btn-vintage w-100 mb-4">
                        Create Account
                      </button>

                      <div class="text-center">
                        <span class="text-muted">Already have an account?</span>
                        <a href="login.jsp" class="vintage-link ms-2"
                          >Sign in</a
                        >
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
