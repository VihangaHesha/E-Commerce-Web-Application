package lk.ijse.ecommercewebapplication;

import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import lk.ijse.ecommercewebapplication.DAO.UserDAO;
import lk.ijse.ecommercewebapplication.DTO.User;


import javax.sql.DataSource;

import static lk.ijse.ecommercewebapplication.Util.PasswordUtil.checkPassword;
import static lk.ijse.ecommercewebapplication.Util.PasswordUtil.hashPassword;

@WebServlet(name = "userServlet", value = "/user-servlet")
public class UserServlet extends HttpServlet {

    @Resource(name = "jdbc/pool")
    private DataSource dataSource;

    User user = new User();

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String action = request.getParameter("action");
        if ("login".equals(action)) {
            login(request, response);
        } else if ("logout".equals(action)) {
            logout(request, response);
        }else{
            response.sendRedirect("login.jsp");
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        String action = request.getParameter("action");
        if ("register".equals(action)) {
            saveUser(request, response);
        } else if ("userDelete".equals(action)) {
            deleteUser(request, response);
        } else if ("updateUser".equals(action)) {
            updateUser(request, response);
        }
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) {

    }

    private void deleteUser(HttpServletRequest req, HttpServletResponse resp) {

    }

    private void saveUser(HttpServletRequest req, HttpServletResponse resp) {
        String firstName = req.getParameter("firstname");
        String lastName = req.getParameter("lastname");
        String email = req.getParameter("email");
        String password = req.getParameter("confirm-password");

        if (!firstName.isEmpty() || !lastName.isEmpty() || !email.isEmpty() || !password.isEmpty()) {
            String hashedPassword = hashPassword(password);
            try {
                User user = new User(email, hashedPassword, firstName, lastName,"CUSTOMER");

                Connection connection = dataSource.getConnection();
                String sql = "INSERT INTO users (email, password, first_name, last_name) VALUES (?, ?, ?, ?)";
                PreparedStatement pstm = connection.prepareStatement(sql);
                pstm.setString(1, user.getEmail());
                pstm.setString(2, user.getPassword());
                pstm.setString(3, user.getFirst_name());
                pstm.setString(4, user.getLast_name());

                boolean isRegistered = pstm.executeUpdate()>0;

                if(isRegistered) {
                    req.setAttribute("success", "User registered successfully");
                    req.getRequestDispatcher("index.jsp").forward(req, resp);
                    connection.close();
                } else {
                    req.setAttribute("error", "User registration failed");
                    req.getRequestDispatcher("register.jsp").forward(req, resp);
                }
            } catch (ServletException | IOException e) {
                throw new RuntimeException(e);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

    private void login(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (!email.isEmpty() || !password.isEmpty()) {
            try {
                Connection connection = dataSource.getConnection();
                String sql = "SELECT * FROM users WHERE email = ?";
                PreparedStatement pstm = connection.prepareStatement(sql);
                pstm.setString(1, email);
                ResultSet rs = pstm.executeQuery();

                if (rs.next()) {
                    String pw = rs.getString("password");
                    // Verify password
                    boolean checkedPassword = checkPassword(password, pw);

                    if (checkedPassword) {

                        user.setEmail(rs.getString("email"));
                        user.setFirst_name(rs.getString("first_name"));
                        user.setLast_name(rs.getString("last_name"));
                        user.setRole(rs.getString("role"));

                        HttpSession session = request.getSession();
                        session.setAttribute("user", user);
                        session.setAttribute("cartCount", 0);

                        // Redirect based on role
                        if ("ADMIN".equals(user.getRole())) {
                            response.sendRedirect("adminDashboard.jsp");
                        } else {

                            response.sendRedirect("index.jsp");
                        }
                    } else {
                        // Login failed
                        request.setAttribute("error", "Invalid email or password");
                        request.getRequestDispatcher("index.jsp").forward(request, response);
                        return;
                    }
                } else {
                    // Login failed
                    request.setAttribute("error", "Invalid email or password");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }

            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("error", "Database error occurred");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        }
    }

    private void logout(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(false);

        if (session != null) {
            session.removeAttribute("user");
            session.invalidate();
        }

        try {
            response.sendRedirect("index.jsp");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}