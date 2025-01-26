package lk.ijse.ecommercewebapplication;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommercewebapplication.DTO.Product;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/product-servlet")
public class ProductServlet extends HttpServlet {

    @Resource(name = "jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            Connection connection = dataSource.getConnection();
            if ("edit".equals(action)) {
                // Fetch specific product for editing
                int productId = Integer.parseInt(request.getParameter("id"));
                Product product = getProductById(connection, productId);

                response.setContentType("application/json");
//                response.getWriter().write(new Gson().toJson(product));
            } else {
                // List all products
                List<Product> products = getAllProducts(connection);
                request.setAttribute("products", products);
                request.getRequestDispatcher("/adminDashboard.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            throw new ServletException("Database error", e);
        }
    }

    // POST: Create or Update Product
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            Connection connection = dataSource.getConnection();

            Product product = new Product();
            product.setCategory_id(Integer.parseInt(request.getParameter("category_id")));
            product.setName(request.getParameter("name"));
            product.setPrice(Double.parseDouble(request.getParameter("price")));

            if ("edit".equals(action)) {
                product.setProduct_id(Integer.parseInt(request.getParameter("id")));
                updateProduct(connection, product);
            } else {
                createProduct(connection, product);
            }

            response.sendRedirect("adminDashboard.jsp");
        } catch (SQLException e) {
            throw new ServletException("Database error", e);
        }
    }

    // DELETE: Remove Product
    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("id"));

        try {
            Connection connection = dataSource.getConnection();

            deleteProduct(connection, productId);
            response.setStatus(HttpServletResponse.SC_OK);
        } catch (SQLException e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    // Database Operations
    private List<Product> getAllProducts(Connection conn) throws SQLException {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM products";

        try (PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Product product = new Product();
                product.setProduct_id(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getDouble("price"));
                product.setCategory_id(Integer.parseInt(rs.getString("category")));
                products.add(product);
            }
        }
        return products;
    }

    private Product getProductById(Connection conn, int id) throws SQLException {
        String sql = "SELECT * FROM products WHERE id = ?";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Product product = new Product();
                    product.setProduct_id(rs.getInt("id"));
                    product.setName(rs.getString("name"));
                    product.setPrice(rs.getDouble("price"));
                    product.setCategory_id(Integer.parseInt(rs.getString("category")));
                    return product;
                }
            }
        }
        return null;
    }

    private void createProduct(Connection conn, Product product) throws SQLException {
        String sql = "INSERT INTO products (name, price, category) VALUES (?, ?, ?)";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, product.getName());
            stmt.setDouble(2, product.getPrice());
            stmt.setString(3, String.valueOf(product.getCategory_id()));
            stmt.executeUpdate();
        }
    }

    private void updateProduct(Connection conn, Product product) throws SQLException {
        String sql = "UPDATE products SET name = ?, price = ?, category = ? WHERE id = ?";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, product.getName());
            stmt.setDouble(2, product.getPrice());
            stmt.setString(3, String.valueOf(product.getCategory_id()));
            stmt.setInt(4, product.getProduct_id());
            stmt.executeUpdate();
        }
    }

    private void deleteProduct(Connection conn, int productId) throws SQLException {
        String sql = "DELETE FROM products WHERE id = ?";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, productId);
            stmt.executeUpdate();
        }
    }
}
