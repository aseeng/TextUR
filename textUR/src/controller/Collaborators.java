package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;

import com.google.gson.Gson;

import javafx.util.Pair;
import model.Collaborator;
import model.Project;
import model.User;
import persistence.DAOFactory;
import persistence.dao.CollaboratorDao;
import persistence.dao.UserDao;

@SuppressWarnings("serial")
public class Collaborators extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		Gson gson = new Gson();
		String[] usernames = gson.fromJson(req.getParameter("names"), String[].class);
		
		HttpSession session = req.getSession();
		Project project = (Project) session.getAttribute("project");
		UserDao userDao = DAOFactory.getInstance().getUserDao();
		CollaboratorDao collaboratorDao = DAOFactory.getInstance().getCollaboratorDao();

		for (int i = 0; i < usernames.length; i++) {

			String name = usernames[i];
			User user = userDao.findByPrimaryKey(name);

			collaboratorDao.save(new Collaborator(user, project));
		}
	}
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		Project project = (Project) session.getAttribute("project");

		if(project == null)
			return;
		
		CollaboratorDao collaboratorDao = DAOFactory.getInstance().getCollaboratorDao();
		List<Collaborator> list = collaboratorDao.findCollaborator(project.getId());		
		
		List<Pair<User,Boolean>> users = new ArrayList<>();
		
		for (Collaborator collaborator : list)
			users.add(new Pair<User,Boolean>(collaborator.getUser(),collaborator.getStatus()));
		
		String files = (new JSONArray(users).toString());
		resp.getWriter().print(files);
	}
}
