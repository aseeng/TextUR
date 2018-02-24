package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.File;
import persistence.DAOFactory;
import persistence.dao.FileDao;

@SuppressWarnings("serial")
public class SaveText extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		File file = (File) session.getAttribute("file");
		
		if(file == null)
			return;

		FileDao fileDao = DAOFactory.getInstance().getFileDao();
		String code = req.getParameter("text");

		fileDao.updateText(file.getId(), code);
		file.setCode(code);
		session.setAttribute("file", file);
	}
}
