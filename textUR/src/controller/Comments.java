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

import model.File;
import model.User;
import model.Comment;
import persistence.DAOFactory;
import persistence.dao.CommentDao;

@SuppressWarnings("serial")
public class Comments extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		File file = (File) session.getAttribute("file");
		if(file == null)
			return;

		CommentDao commentDao = DAOFactory.getInstance().getCommentDao();
		Boolean firstLoad = (boolean) session.getAttribute("firstLoadComments");
		if(firstLoad) {
			List<Comment> comments = commentDao.find(file.getId());
			String commentList = (new JSONArray(comments).toString());
			resp.getWriter().print(commentList);
			session.setAttribute("firstLoadComments", false);
			return;
		}
		else {
			Long line = Long.parseLong(req.getParameter("line"));
			List<Comment> comments = commentDao.findFromLine(file.getId(), line);
			String commentList = (new JSONArray(comments).toString());
			resp.getWriter().print(commentList);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		File file = (File) session.getAttribute("file");
		
		Long line = Long.parseLong(req.getParameter("line"));
		String text = req.getParameter("text");
		CommentDao commentDao = DAOFactory.getInstance().getCommentDao();
		Comment comment = new Comment(file, line, user, text);
		commentDao.save(comment);
		
		List<Comment> comments = new ArrayList<>();
		comments.add(comment);
		
		String commentList = (new JSONArray(comments).toString());
		resp.getWriter().print(commentList);
	}
}
