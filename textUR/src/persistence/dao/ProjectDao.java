package persistence.dao;

import java.sql.Connection;
import java.util.HashMap;

import model.Project;

public interface ProjectDao extends Dao{

	public void save(Project project);
	
	public Project findByPrimaryKey(Connection connection, Long id);
	
	public HashMap<Long, Project> find(String username);
	
	public Project findByName(String creator, String projectName);
	
	public void update(Project project);

	public void update(Long projectId, String name);
	
	public void delete(Long projectId);

	public boolean exist(String name, String username);
	
	public boolean onlineCollaborators(Long projectId);
}
