package persistence.JDBC;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import model.Comment;
import model.User;
import persistence.DAOFactory;
import persistence.DataSource;
import persistence.IdBroker;
import persistence.PersistenceException;
import persistence.dao.CommentDao;
import persistence.dao.UserDao;

public class CommentDaoJDBC implements CommentDao {

	private DataSource dataSource = null;

	public CommentDaoJDBC(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	@Override
	public void save(Comment comment) {
		Connection connection = dataSource.getConnection();
		try {
			Long id = IdBroker.getID(connection, "commentID");
			comment.setId(id);
			String insert = "insert into comment(id,date,file,line,username,text) values (?,?,?,?,?,?)";
			PreparedStatement statement = connection.prepareStatement(insert);
			statement.setLong(1, comment.getId());
			statement.setTimestamp(2, comment.getDate());
			statement.setLong(3, comment.getFile().getId());
			statement.setLong(4, comment.getLine());
			statement.setString(5, comment.getUser().getUsername());
			statement.setString(6, comment.getText());
			statement.executeUpdate();
		} catch (SQLException e) {
			if (connection != null) {
				try {
					connection.rollback();
				} catch (SQLException excep) {
					throw new PersistenceException(e.getMessage());
				}
			}
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}
	}

	@Override
	public Comment findByPrimaryKey(Long commentId) {

		Connection connection = dataSource.getConnection();
		Comment comment = null;
		try {
			PreparedStatement statement;
			String query = "select * from comment where id = ?";
			statement = connection.prepareStatement(query);
			statement.setLong(1, commentId);
			ResultSet result = statement.executeQuery();
			if (result.next()) {
				comment = new Comment();
				comment.setId(result.getLong("id"));
				comment.setDate(result.getTimestamp("date"));
				comment.setLine(result.getLong("line"));
				comment.setText(result.getString("text"));
				
				UserDao userDao = DAOFactory.getInstance().getUserDao();
				User user = userDao.findByPrimaryKey(result.getString("username"));
				comment.setUser(user);
			}
		} catch (SQLException e) {
			if (connection != null) {
				try {
					connection.rollback();
				} catch (SQLException excep) {
					throw new PersistenceException(e.getMessage());
				}
			}
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}
		return comment;
	}

	@Override
	public List<Comment> find(Long fileId) {
		Connection connection = dataSource.getConnection();
		List<Comment> comments = new LinkedList<>();
		try {
			Comment comment;
			PreparedStatement statement;
			String query = "select * from comment where file = ? order by file";
			statement = connection.prepareStatement(query);
			statement.setLong(1, fileId);
			ResultSet result = statement.executeQuery();
			
			while (result.next()) {
				comment = new Comment();
				comment.setId(result.getLong("id"));
				comment.setDate(result.getTimestamp("date"));
				comment.setLine(result.getLong("line"));
				comment.setText(result.getString("text"));
				
				UserDao userDao = DAOFactory.getInstance().getUserDao();
				User user = userDao.findByPrimaryKey(result.getString("username"));
				comment.setUser(user);
				
				comments.add(comment);
			}
		} catch (SQLException e) {
			if (connection != null) {
				try {
					connection.rollback();
				} catch (SQLException excep) {
					throw new PersistenceException(e.getMessage());
				}
			}
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}
		return comments;
	}

	@Override
	public List<Comment> findFromLine(Long fileId, Long line) {
		Connection connection = dataSource.getConnection();
		List<Comment> comments = new LinkedList<>();
		try {
			Comment comment;
			PreparedStatement statement;
			String query = "select * from comment where file = ? and line = ? order by date";
			statement = connection.prepareStatement(query);
			statement.setLong(1, fileId);
			statement.setLong(2, line);
			ResultSet result = statement.executeQuery();
			
			while (result.next()) {
				comment = new Comment();
				comment.setId(result.getLong("id"));
				comment.setDate(result.getTimestamp("date"));
				comment.setLine(result.getLong("line"));
				comment.setText(result.getString("text"));
				
				UserDao userDao = DAOFactory.getInstance().getUserDao();
				User user = userDao.findByPrimaryKey(result.getString("username"));
				comment.setUser(user);
				
				comments.add(comment);
			}
		} catch (SQLException e) {
			if (connection != null) {
				try {
					connection.rollback();
				} catch (SQLException excep) {
					throw new PersistenceException(e.getMessage());
				}
			}
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}
		return comments;
	}
	
	@Override
	public void update(Comment comment) {
		Connection connection = dataSource.getConnection();
		try {
			String update = "update line SET date = ?, file = ?, line = ?, username = ?, text = ? WHERE id=?";
			PreparedStatement statement = connection.prepareStatement(update);
			statement.setTimestamp(1, comment.getDate());
			statement.setLong(2, comment.getFile().getId());
			statement.setLong(3, comment.getLine());
			statement.setString(4, comment.getUser().getUsername());
			statement.setString(5, comment.getText());
			statement.setLong(6, comment.getId());
			statement.executeUpdate();
		} catch (SQLException e) {
			if (connection != null) {
				try {
					connection.rollback();
				} catch (SQLException excep) {
					throw new PersistenceException(e.getMessage());
				}
			}
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}
	}

	@Override
	public void delete(Long id) {
		Connection connection = dataSource.getConnection();
		try {
			String delete = "delete FROM comment WHERE id = ? ";
			PreparedStatement statement = connection.prepareStatement(delete);
			statement.setLong(1, id);
			statement.executeUpdate();
		} catch (SQLException e) {
			if (connection != null) {
				try {
					connection.rollback();
				} catch (SQLException excep) {
					throw new PersistenceException(e.getMessage());
				}
			}
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}
	}
	
	@Override
	public void deleteFromFile(Long fileId) {
		Connection connection = dataSource.getConnection();
		try {
			String delete = "delete FROM comment WHERE file = ? ";
			PreparedStatement statement = connection.prepareStatement(delete);
			statement.setLong(1, fileId);
			statement.executeUpdate();
		} catch (SQLException e) {
			if (connection != null) {
				try {
					connection.rollback();
				} catch (SQLException excep) {
					throw new PersistenceException(e.getMessage());
				}
			}
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}
	}

	@Override
	public void deleteFromLine(Long line, Long fileId) {
		Connection connection = dataSource.getConnection();
		try {
			String delete = "delete FROM comment WHERE line = ? and file = ?";
			PreparedStatement statement = connection.prepareStatement(delete);
			statement.setLong(1, line);
			statement.setLong(2, fileId);
			statement.executeUpdate();
		} catch (SQLException e) {
			if (connection != null) {
				try {
					connection.rollback();
				} catch (SQLException excep) {
					throw new PersistenceException(e.getMessage());
				}
			}
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}		
	}
}