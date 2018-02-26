package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.User;
import persistence.DAOFactory;
import persistence.dao.UserDao;

@SuppressWarnings("serial")
public class Change extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		
		UserDao userDao = DAOFactory.getInstance().getUserDao();
		
		String type = req.getParameter("type");
		String parameter = req.getParameter("name");

		switch (type) {
			case "username":
				if(!userDao.updateUsername(user.getUsername(), parameter))
					resp.getWriter().print("exist");
				else
					user.setUsername(parameter);
				
				break;
			case "email":
				if(!userDao.updateMail(user.getUsername(), parameter))
					resp.getWriter().print("exist");
				else
					user.setMail(parameter);
				break;
			case "password":
				userDao.setPassword(user, parameter);
				break;
			default:
				break;
		}
		
		session.setAttribute("user", user);
	}
}
