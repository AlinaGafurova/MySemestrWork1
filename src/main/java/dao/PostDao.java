package dao;

import model.Post;
import model.User;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

//DAO - Data Access Object - Объект доступа к данным
//Выполняет запросы к БД и работает с сущностями: удаляет, обновляет, получает, добавляет
public class PostDao {
    //Соединение с БД
    private Connection connection;
    private UserDao userDao;

    public PostDao(Connection connection, UserDao userDao) {
        this.connection = connection;
        this.userDao = userDao;
    }

    public void save(Post post) throws SQLException {
        PreparedStatement stmt = connection.prepareStatement("INSERT INTO posts (text, user_id, date) VALUES (?, ?, ?)");
        stmt.setString(1, post.getText());
        stmt.setLong(2, post.getUser().getId());
        stmt.setDate(3, Date.valueOf(post.getDate()));
        //Выполняет запрос и возвращает булеан
        stmt.execute();
    }

    public List<Post> getByUserId(Long userId) throws SQLException {
        PreparedStatement stmt = connection.prepareStatement("SELECT * FROM posts WHERE user_id = ?");
        stmt.setLong(1, userId);
        //Выполняет запрос и возвращает ResultSet из которого мы можем достать данные
        ResultSet rs = stmt.executeQuery();

        List<Post> posts = new ArrayList<>();
        while (rs.next()) {
            Long id = rs.getLong("id");
            String text = rs.getString("text");
            LocalDate date = rs.getDate("date").toLocalDate();
            User user = userDao.getById(userId);

            Post post = new Post(id, text, user, date);
            posts.add(post);
        }

        return posts;
    }

    public List<Post> getAll() throws SQLException {
        Statement stmt = connection.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM posts ORDER BY date DESC, id DESC LIMIT 10");

        List<Post> posts = new ArrayList<>();
        while (rs.next()) {
            Long id = rs.getLong("id");
            String text = rs.getString("text");
            Long userId = rs.getLong("user_id");
            LocalDate date = rs.getDate("date").toLocalDate();
            User user = userDao.getById(userId);

            Post post = new Post(id, text, user, date);
            posts.add(post);
        }

        return posts;
    }

    public void update(Post post) throws SQLException {
        PreparedStatement stmt = connection.prepareStatement("UPDATE posts SET (text, user_id, date) = (?, ?, ?) WHERE id = ?");
        stmt.setString(1, post.getText());
        stmt.setLong(2, post.getUser().getId());
        stmt.setDate(3, Date.valueOf(post.getDate()));
        stmt.setLong(4, post.getId());
        stmt.execute();
    }

    public void delete(Long id) throws SQLException {
        PreparedStatement stmt = connection.prepareStatement("DELETE FROM posts WHERE id = ?");
        stmt.setLong(1, id);
        stmt.execute();
    }

}
