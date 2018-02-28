package persistence.dao;

import java.util.List;

import model.Checkpoint;

public interface CheckpointDao extends Dao{
	
	public void save(Checkpoint checkpoint);

	public Checkpoint findByPrimaryKey(Long id);
	
	public List<Checkpoint> find(Long projectId);

	public void delete(Long id);
}
