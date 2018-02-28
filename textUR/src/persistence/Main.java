package persistence;

import model.Collaborator;
import model.File;
import model.Message;
import model.Package;
import model.Project;
import model.User;
import persistence.dao.CollaboratorDao;
import persistence.dao.FileDao;
import persistence.dao.MessageDao;
import persistence.dao.PackageDao;
import persistence.dao.ProjectDao;
import persistence.dao.UserDao;

public class Main {

	public static void main(String[] args)
	{
		DAOFactory factory = DAOFactory.getInstance();
		
		UtilDao util = factory.getUtilDao();

		util.dropDatabase();
		util.createDatabase();
		
		UserDao userDao = factory.getUserDao();
		ProjectDao projectDao = factory.getProjectDao();
		PackageDao packageDao = factory.getPackageDao();
		FileDao fileDao = factory.getFileDao();
		MessageDao messageDao = factory.getMessageDao();
		CollaboratorDao collaboratorDao = factory.getCollaboratorDao();
		
		User user1 = new User("username", "alessandromarrazzo9@gmail.com");
		User user2 = new User("css","css@gmail.com");
		User user3 = new User("nicuola","paletta92@gmail.com");

		userDao.save(user1);
		userDao.save(user2);
		userDao.save(user3);

		Project project1 = new Project("rep1", user1);
		Project project2 = new Project("rep2", user2);
		
		Package package1 = new Package("package1", project1);
		Package package2 = new Package("package2", project1);
		Package package3 = new Package("package3", project2);
		
		File file1 = new File("file1",package1,"package package1; \n\npublic class file1 {\n\n}");
		File file2 = new File("file2",package1,"package package1; \n\npublic class file2 {\n\n}");
		File file3 = new File("file3",package2,"package package2; \n\npublic class file3 {\n\n}");
		File file4 = new File("file4",package3,"package package3; \n\npublic class file4 {\n\n}");		
		
		projectDao.save(project1);
		projectDao.save(project2);
		
		packageDao.save(package1);
		packageDao.save(package2);
		packageDao.save(package3);
		
		fileDao.save(file1);
		fileDao.save(file2);
		fileDao.save(file3);
		fileDao.save(file4);
		
		projectDao.update(project1);
		
		Message message1 = new Message(project1,"ciaoaoao",user1.getUsername());
		messageDao.save(message1);
		
		Message message2 = new Message(project2,"chelovuoi",user3.getUsername());
		messageDao.save(message2);
		
		Collaborator coll1 = new Collaborator(user2, project1);
		Collaborator coll2 = new Collaborator(user1, project2);
		
		collaboratorDao.save(coll1);
		collaboratorDao.updateStatus(user2.getUsername(), project1.getId());
		collaboratorDao.save(coll2);
	}
}
