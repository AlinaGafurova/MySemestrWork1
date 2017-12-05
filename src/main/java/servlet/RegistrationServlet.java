package servlet;

import dao.UserDao;
import model.User;
import util.DbConnector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class RegistrationServlet extends HttpServlet {
    private UserDao userDao;

    @Override
    public void init() throws ServletException {
        userDao = new UserDao(DbConnector.getConnection());
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/registration.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String login = req.getParameter("login");
        String password = req.getParameter("password");

        User user = new User(name, login, password);

        try {
            userDao.save(user);
            user = userDao.getByLogin(login);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if (user.getId() != null) {
            req.getSession().setAttribute("user", user);
            resp.sendRedirect( "/profile");
        } else {
            req.setAttribute("regError", "Wrong login or password.");
            req.getRequestDispatcher("/WEB-INF/views/registration.jsp").forward(req, resp);
        }
    }
}