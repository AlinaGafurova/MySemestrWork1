package servlet;

import dao.PostDao;
import dao.UserDao;
import model.Post;
import model.User;
import util.DbConnector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

public class ProfileServlet extends HttpServlet {
    private PostDao postDao;

    @Override
    public void init() throws ServletException {
        Connection connection = DbConnector.getConnection();
        UserDao userDao = new UserDao(connection);
        postDao = new PostDao(connection, userDao);
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        List<Post> posts = null;
        try {
            posts = postDao.getByUserId(user.getId());
        } catch (SQLException e) {
            e.printStackTrace();
        }

        req.setAttribute("user", user);
        req.setAttribute("posts", posts);
        req.getRequestDispatcher("/WEB-INF/views/profile.jsp").forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String text = req.getParameter("text");

        if (text == null || text.isEmpty()) {
            req.setAttribute("error", "Post can't be empty");
            req.getRequestDispatcher("/WEB-INF/views/profile.jsp").forward(req, resp);
        }

        User user = (User) req.getSession().getAttribute("user");
        LocalDate date = LocalDate.now(); //текущее время

        Post post = new Post(text, user, date);
        try {
            postDao.save(post);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        resp.sendRedirect("/profile");
    }
}
