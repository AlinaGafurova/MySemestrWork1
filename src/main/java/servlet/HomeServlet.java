package servlet;

import dao.PostDao;
import dao.UserDao;
import model.Post;
import util.DbConnector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class HomeServlet extends HttpServlet {
    private PostDao postDao;

    @Override
    public void init() throws ServletException {
        Connection connection = DbConnector.getConnection();
        UserDao userDao = new UserDao(connection);
        postDao = new PostDao(connection, userDao);
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Post> lastPosts = null;
        try {
            lastPosts = postDao.getAll();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        req.setAttribute("posts", lastPosts);
        req.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(req, resp);
    }
}
