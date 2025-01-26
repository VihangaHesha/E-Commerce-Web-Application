package lk.ijse.ecommercewebapplication.DAO;

import jakarta.annotation.Resource;
import lk.ijse.ecommercewebapplication.DTO.User;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
    @Resource(name = "jdbc/pool")
    private DataSource dataSource;

    public ResultSet getUser(String email,Connection connection) throws SQLException {


        String sql = "SELECT * FROM users WHERE email = ?";
        PreparedStatement pstm = connection.prepareStatement(sql);
        pstm.setString(1, email);
        ResultSet rs = pstm.executeQuery();

        connection.close();
        return rs;
    }

    public Boolean saveUser(User user,Connection connection) throws SQLException {

        String sql = "INSERT INTO users (email, password, first_name, last_name) VALUES (?, ?, ?, ?)";
        PreparedStatement pstm = connection.prepareStatement(sql);
        pstm.setString(1, user.getEmail());
        pstm.setString(2, user.getPassword());
        pstm.setString(3, user.getFirst_name());
        pstm.setString(4, user.getLast_name());

        return pstm.executeUpdate()>0;
    }
}
