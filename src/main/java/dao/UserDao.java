package dao;

import model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {
    private Connection connection;

    public UserDao(Connection connection) {
        this.connection = connection;
    }

    public User getByLogin(String login) throws SQLException {
        PreparedStatement stmt = connection.prepareStatement("SELECT * FROM users WHERE login = ?");
        stmt.setString(1, login);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            Long id = rs.getLong("id");
            String password = rs.getString("password");
            String name = rs.getString("name");

            User user = new User(id, name, login, password);
            return user;
        }
        return null;
    }

    public User getById(Long id) throws SQLException {
        PreparedStatement stmt = connection.prepareStatement("SELECT * FROM users WHERE id = ?");
        stmt.setLong(1, id);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            String name = rs.getString("name");
            String login = rs.getString("login");
            String password = rs.getString("password");

            User user = new User(id, name, login, password);
            return user;
        }
        return null;
    }

    public void save(User user) throws SQLException {
        PreparedStatement stmt = connection.prepareStatement("INSERT INTO users (name, login, password) VALUES (?, ?, ?)");
        stmt.setString(1, user.getName());
        stmt.setString(2, user.getLogin());
        stmt.setString(3, user.getPassword());
        stmt.execute();
    }
}
