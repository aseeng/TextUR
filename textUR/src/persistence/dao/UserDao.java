package persistence.dao;

import java.util.List;

import model.Project;
import model.User;
import persistence.UserCredential;

public interface UserDao extends Dao {

	public void save(User user);

	public User findByPrimaryKey(String username);

	public User findByMail(String mail);
	
	public List<String> findAll(Project project);

	public void updateImage(String username, String url);
	
	public boolean updateMail(String username, String mail);
	
	public boolean updateUsername(String username, String newUsername);

	public void delete(User user);
	
	public boolean setPassword(User user, String oldPassword, String password);
	
	public UserCredential findByPrimaryKeyCredential(String username);
	
}
