package persistence.dao;

import java.util.List;

import model.Comment;

public interface CommentDao extends Dao {

	public void save(Comment comment);

	public Comment findByPrimaryKey(Long id);
	
	public List<Comment> find(Long fileId);
	
	public List<Comment> findFromLine(Long fileId, Long line);

	public void update(Comment comment);
	
	public void delete(Long id);

	public void deleteFromLine(Long id, Long fileId);

	public void deleteFromFile(Long file);

}
