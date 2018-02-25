package controller;

import java.io.IOException;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;

import model.Checkpoint;
import model.File;
import model.Project;
import model.User;
import persistence.DAOFactory;
import persistence.dao.CheckpointDao;
import persistence.dao.CollaboratorDao;
import persistence.dao.FileDao;
import persistence.dao.PackageDao;
import persistence.dao.ProjectDao;

@SuppressWarnings("serial")
public class ChangePage extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		Project project = (Project) session.getAttribute("project");
		String action = req.getParameter("action");
		
		ProjectDao projectDao = DAOFactory.getInstance().getProjectDao();
		PackageDao packageDao = DAOFactory.getInstance().getPackageDao();
		FileDao fileDao = DAOFactory.getInstance().getFileDao();
		CollaboratorDao collaboratorDao = DAOFactory.getInstance().getCollaboratorDao();
		CheckpointDao checkpointDao = DAOFactory.getInstance().getCheckpointDao();
		if(action.equals("open"))
		{
			String split = req.getParameter("hash");
			String[] hash = split.split("/");
			hash[0] = hash[0].substring(1);

			switch (hash.length) {
				case 2:								// open project
					Project project1 = projectDao.findByName(hash[0], hash[1]);

					if(project1 == null)
						project1 = collaboratorDao.findProject(hash[0], hash[1]);
					
					project1.setPackages(packageDao.findByName(hash[0], hash[1]));
					
					session.setAttribute("project", project1);
					session.setAttribute("firstMessage", 0);
					break;
		
				case 3:								// open package 
					Collection<File> fileList = fileDao.findByName(hash[0], hash[1], hash[2]).values();
					String files = (new JSONArray(fileList).toString());
					resp.getWriter().print(files);
					
					break;
				case 4:								// open file
					File file = fileDao.findByName(hash[0], hash[1], hash[2], hash[3]);
					if(file.getUser() == null) {
						file.setUser(user);
						fileDao.enableWrite(user.getUsername(), file.getId());
						resp.getWriter().print("write");
					}
					else 
						resp.getWriter().print("read");

					session.setAttribute("file", file);
					break;
				default:
					break;
			}
			
			return;
		}
		
		switch (action) {
			case "index":
				session.setAttribute("firstLoad", true);
				if(user != null)
					fileDao.disableWrite(user.getUsername());

				req.getRequestDispatcher("index.jsp").forward(req, resp);
				break;
			case "homepage":
				if(user != null)
					fileDao.disableWrite(user.getUsername());
				req.getRequestDispatcher("homepage.jsp").forward(req, resp);
				break;
			case "login":
				req.getRequestDispatcher("login.jsp").forward(req, resp);
				break;
			case "logout":
				session.invalidate();
				req.getRequestDispatcher("index.jsp").forward(req, resp);
				break;
			case "openFile":
				session.setAttribute("firstLoadComments", true);
				req.getRequestDispatcher("text.jsp").forward(req, resp);
				break;
			case "register":
				req.getRequestDispatcher("register.html").forward(req, resp);
				break;
			case "settings":
				List<Checkpoint> checkpoints = checkpointDao.find(project.getId());
				project.setCheckpoints(checkpoints);
	
				List<User> collaborators = collaboratorDao.find(project.getId());
				project.setCollaborators(collaborators);
				
				session.setAttribute("project", project);
				
				if (user != null)
					fileDao.disableWrite(user.getUsername());

				req.getRequestDispatcher("settings.jsp").forward(req, resp);
				break;
			default:
				resp.sendError(500);
				break;
		}
	}
}
