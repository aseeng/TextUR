package persistence.dao;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;

import model.File;

public interface FileDao extends Dao{
	
	public void save(File file);

	public File findByPrimaryKey(Connection connection, Long id);
	
	public HashMap<Long, File> find(Long packageId);

	public HashMap<Long, File> findByProject(Long projectId);
	
	public File findByName(String username, String projectName, String packageName, String fileName);
	
	public HashMap<Long, File> findByName(String username, String projectName, String packageName);
	
	public List<File> findString(Long projectId, String text);
	
	public boolean exist(String name, Long packageId);
	
	public void update(File file);

	public void updateText(Long id, String text);
	
	public void restore(Long checkpointId);
	
	public void remove(Long id);
	
	public void delete(Long id);
	
	public void enableWrite(String username,Long fileId);
	
	public void disableWrite(String username);
	
	public void rename(String name, Long fileId);

	public boolean check(Long fileId, String reader);

	public File findCode(Long id);
}
