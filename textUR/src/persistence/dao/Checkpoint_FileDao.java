package persistence.dao;

import java.util.List;

import model.Checkpoint_File;
import model.File;

public interface Checkpoint_FileDao extends Dao{

	public void save(Checkpoint_File checkpointFile);

	public Checkpoint_File findByPrimaryKey(Long id);

	public void delete(Long checkpointId);
	
	public List<File> findString(Long fileId, String text);
	
	public List<File> findByFile(Long fileId);
}
