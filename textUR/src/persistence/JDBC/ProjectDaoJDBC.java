package persistence.JDBC;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import model.Checkpoint;
import model.Message;
import model.Package;
import model.Project;
import model.User;
import persistence.DataSource;
import persistence.IdBroker;
import persistence.PersistenceException;
import persistence.DAOFactory;
import persistence.dao.CheckpointDao;
import persistence.dao.CollaboratorDao;
import persistence.dao.MessageDao;
import persistence.dao.PackageDao;
import persistence.dao.ProjectDao;
import persistence.dao.UserDao;

public class ProjectDaoJDBC implements ProjectDao {

	private DataSource dataSource = null;

	public ProjectDaoJDBC(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public void save(Project project) {
		Connection connection = dataSource.getConnection();
		try {
			Long id = IdBroker.getID(connection, "projectID");
			project.setId(id);
			String insert = "insert into project(id,name,creator) values (?,?,?)";
			PreparedStatement statement = connection.prepareStatement(insert);
			statement.setLong(1, id);
			statement.setString(2, project.getName());
			statement.setString(3, project.getCreator().getUsername());
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

	public Project findByPrimaryKey(Long id) {
		Connection connection = dataSource.getConnection();
		Project project = null;
		try {
			PreparedStatement statement;
			String query = "select * from project where id = ?";
			statement = connection.prepareStatement(query);
			statement.setLong(1, id);

			ResultSet result = statement.executeQuery();
			if (result.next()) {
				project = new Project();
				project.setId(result.getLong("id"));
				project.setName(result.getString("name"));

				UserDao userDao = DAOFactory.getInstance().getUserDao();
				User user = userDao.findByPrimaryKey(result.getString("creator"));
				project.setCreator(user);
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
		return project;
	}

	public Project findByName(String creator, String projectName) {
		Connection connection = dataSource.getConnection();
		Project project = null;
		try {
			PreparedStatement statement;
			String query = "select * from project where name = ? and creator = ?";
			statement = connection.prepareStatement(query);
			statement.setString(1, projectName);
			statement.setString(2, creator);

			ResultSet result = statement.executeQuery();
			if (result.next()) {
				project = new Project();
				project.setId(result.getLong("id"));
				project.setName(result.getString("name"));

				UserDao userDao = DAOFactory.getInstance().getUserDao();
				User user = userDao.findByPrimaryKey(result.getString("creator"));
				project.setCreator(user);
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
		return project;
	}

	public HashMap<Long, Project> find(String username) {
		Connection connection = dataSource.getConnection();
		HashMap<Long, Project> projects = new HashMap<>();
		try {
			Project project;
			String query = "select * from project where creator = ?";
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setString(1, username);
			ResultSet result = statement.executeQuery();

			while (result.next()) {
				project = new Project();
				project.setId(result.getLong("id"));
				project.setName(result.getString("name"));

				UserDao userDao = DAOFactory.getInstance().getUserDao();
				User user = userDao.findByPrimaryKey(result.getString("creator"));
				project.setCreator(user);

				projects.put(project.getId(), project);
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
		return projects;
	}

	public void update(Project project) {
		Connection connection = dataSource.getConnection();
		try {
			String update = "update project SET name = ?, creator = ? WHERE id=?";
			PreparedStatement statement = connection.prepareStatement(update);
			statement.setString(1, project.getName());
			statement.setString(2, project.getCreator().getUsername());
			statement.setLong(3, project.getId());
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

	public void update(Long id, String name) {
		Connection connection = dataSource.getConnection();
		try {
			String update = "update project SET name = ? WHERE id=?";
			PreparedStatement statement = connection.prepareStatement(update);
			statement.setString(1, name);
			statement.setLong(2, id);
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

	public void delete(Long id) {
		Connection connection = dataSource.getConnection();
		try {

			CheckpointDao checkpointDao = DAOFactory.getInstance().getCheckpointDao();
			List<Checkpoint> checkpoints = checkpointDao.find(id);

			for (Checkpoint checkpoint : checkpoints)
				checkpointDao.delete(checkpoint.getId());

			PackageDao packageDao = DAOFactory.getInstance().getPackageDao();
			HashMap<Long, Package> packages = packageDao.find(id);

			for (Long packageId : packages.keySet())
				packageDao.delete(packageId);

			MessageDao messageDao = DAOFactory.getInstance().getMessageDao();
			List<Message> messages = messageDao.find(id);

			for (Message message : messages)
				messageDao.delete(message);

			CollaboratorDao collaboratorDao = DAOFactory.getInstance().getCollaboratorDao();
			List<User> collaborators = collaboratorDao.find(id);
			for (User collaborator : collaborators)
				collaboratorDao.delete(collaborator.getUsername(), id);

			String delete = "delete FROM project WHERE id = ? ";
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
	public boolean exist(String name, String username) {
		Connection connection = dataSource.getConnection();
		try {
			String find = "select * FROM project WHERE name = ? AND creator = ?";
			PreparedStatement statement = connection.prepareStatement(find);
			statement.setString(1, name);
			statement.setString(2, username);
			ResultSet result = statement.executeQuery();

			return result.next();
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
		return false;
	}

	@Override
	public boolean onlineCollaborators(Long projectId) {
		Connection connection = dataSource.getConnection();
		try {
			String find = "select * from file as F where F.package in (select p.id from package as p where p.project = ?)";
			PreparedStatement statement = connection.prepareStatement(find);
			statement.setLong(1, projectId);
			ResultSet result = statement.executeQuery();

			while (result.next()) {
				String name = result.getString("username");
				if (name != null)
					return true;
			}

			return false;
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
		return false;
	}
}