package lk.ijse.ecommercewebapplication;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommercewebapplication.DTO.Product;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class ProductManagerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // This would typically be replaced with a database connection
    private List<Product> products = new ArrayList<>();


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("products", products);
        request.getRequestDispatcher("/productManagement.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {
            case "add":
                addProduct(request);
                break;
            case "delete":
                deleteProduct(request);
                break;
            case "update":
                updateProduct(request);
                break;
        }

        response.sendRedirect(request.getContextPath() + "/ProductServlet");
    }

    private void addProduct(HttpServletRequest request) {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        int stock = Integer.parseInt(request.getParameter("stock"));


        Product product = new Product();
        product.setName(name);
        product.setDescription(description);
        product.setPrice(price);
        product.setStock_quantity(stock);

        products.add(product);
    }

    private void deleteProduct(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        products.removeIf(p -> p.getProduct_id() == id);
    }

    private void updateProduct(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        int stock = Integer.parseInt(request.getParameter("stock"));

        for (Product product : products) {
            if (product.getProduct_id() == id) {
                product.setName(name);
                product.setDescription(description);
                product.setPrice(price);
                product.setStock_quantity(stock);
                break;
            }
        }
    }
}
