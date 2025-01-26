package lk.ijse.ecommercewebapplication;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "/ProfileServlet" , value = "/profile-servlet")
public class ProfileServlet extends HttpServlet {

    @Resource(name = "jdbc/pool")
    private DataSource dataSource;

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        String action = request.getParameter("action");
        if ("updateProfile".equals(action)) {
            updateProfile(request, response);
        }
     try {

         Connection connection = dataSource.getConnection();

         // Fetch user details based on logged-in user
        String userId = (String) request.getSession().getAttribute("userId");

        PreparedStatement pstmt = connection.prepareStatement(
                "SELECT first_name, last_name, email,join_date FROM users WHERE user_id = ?"
        );
        pstmt.setString(1, userId);

        ResultSet rs = pstmt.executeQuery();
        if (rs.next()) {
            request.setAttribute("firstName", rs.getString("first_name"));
            request.setAttribute("lastName", rs.getString("last_name"));
            request.setAttribute("email", rs.getString("email"));
            request.setAttribute("joinDate", rs.getDate("join_date"));
        }

        request.getRequestDispatcher("profile.jsp").forward(request, response);
    } catch  (SQLException e) {
        e.printStackTrace();
    }
     }

    private void updateProfile(HttpServletRequest request, HttpServletResponse response) {

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");

        // Update database
        try {
            Connection connection = dataSource.getConnection();
            PreparedStatement pstmt = connection.prepareStatement(
                    "UPDATE users SET first_name=?, last_name=?, email=? WHERE user_id=?"
            );
            pstmt.setString(1, firstName);
            pstmt.setString(2, lastName);
            pstmt.setString(3, email);
            pstmt.setString(4, (String) request.getSession().getAttribute("userId"));
            pstmt.executeUpdate();

            // Redirect back to profile page
            response.sendRedirect("ProfileServlet");
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
