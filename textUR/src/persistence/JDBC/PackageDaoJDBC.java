package persistence.JDBC;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Set;

import model.File;
import model.Package;
import model.Project;
import persistence.DAOFactory;
import persistence.DataSource;
import persistence.IdBroker;
import persistence.PersistenceException;
import persistence.dao.FileDao;
import persistence.dao.PackageDao;
import persistence.dao.ProjectDao;

public class PackageDaoJDBC implements PackageDao {
	
	private DataSource dataSource = null;

	public PackageDaoJDBC(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}
	
	public void save(Package pack) {
		Connection connection = dataSource.getConnection();
		try {
			Long id = IdBroker.getID(connection, "packageID");
			pack.setId(id); 
			String insert = "insert into package(id,name, project) values (?,?,?)";
			PreparedStatement statement = connection.prepareStatement(insert);
			statement.setLong(1, pack.getId());
			statement.setString(2, pack.getName());
			statement.setLong(3, pack.getProject().getId());
			
			statement.executeUpdate();
		} catch (SQLException e) {
			if (connection != null) {
				try {
					connection.rollback();
				} catch(SQLException excep) {
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

	public Package findByPrimaryKey(Long id) {
		Connection connection = dataSource.getConnection();
		Package pack = null;
		try {
			PreparedStatement statement;
			String query = "select * from package where id = ?";
			statement = connection.prepareStatement(query);
			statement.setLong(1, id);
			
			ResultSet result = statement.executeQuery();
			if (result.next()) {
				pack = new Package();
				
				pack.setId(result.getLong("id"));
				pack.setName(result.getString("name"));
				
				ProjectDao projectDao = DAOFactory.getInstance().getProjectDao();
				Project project = projectDao.findByPrimaryKey(result.getLong("project"));
				pack.setProject(project);
			}
		}  catch (SQLException e) {
			if (connection != null) {
				try {
					connection.rollback();
				} catch(SQLException excep) {
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
		return pack;
	}

	public HashMap<Long, Package> find(Long projectId)
	{
		Connection connection = dataSource.getConnection();
		HashMap<Long, Package> packages = new HashMap<>();
		try {
			Package pack;
			String query = "select * from package where project = ?";
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setLong(1, projectId);
			ResultSet result = statement.executeQuery();
			
			while (result.next()) {
				pack = new Package();
				pack.setId(result.getLong("id"));
				pack.setName(result.getString("name"));	
				
				ProjectDao projectDao = DAOFactory.getInstance().getProjectDao();
				Project project = projectDao.findByPrimaryKey(result.getLong("project"));
				pack.setProject(project);
				
				packages.put(pack.getId(),pack);
			}
		} catch (SQLException e) {
			if (connection != null) {
				try {
					connection.rollback();
				} catch(SQLException excep) {
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
		return packages;
	}
	
	public Package findByName(String username, String projectName, String packageName)
	{
		Connection connection = dataSource.getConnection();
		Package pack = null;
		try {
			String query = "SELECT * FROM package WHERE name = ? and project = (SELECT id FROM project WHERE name = ? AND creator = ?)";
			
			PreparedStatement statement = connection.prepareStatement(query, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			statement.setString(1, packageName);
			statement.setString(2, projectName);
			statement.setString(3, username);
			ResultSet result = statement.executeQuery();
			
			if(!result.next())
			{
				query = "select * from package where name = ? and project = (select project FROM collaborator where username  = ? "
						+ "and project = (select id from project where name = ?))";
				
				statement = connection.prepareStatement(query, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
				statement.setString(1, packageName);
				statement.setString(2, projectName);
				statement.setString(3, username);
				result = statement.executeQuery();
			}
			result.beforeFirst();
			if (result.next()) {
				pack = new Package();
				pack.setId(result.getLong("id"));
				pack.setName(result.getString("name"));	
				
				ProjectDao projectDao = DAOFactory.getInstance().getProjectDao();
				Project project = projectDao.findByPrimaryKey(result.getLong("project"));
				pack.setProject(project);
			}
		} catch (SQLException e) {
			if (connection != null) {
				try {
					connection.rollback();
				} catch(SQLException excep) {
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
		return pack;
	}

	public HashMap<Long, Package> findByName(String username, String projectName)
	{
		Connection connection = dataSource.getConnection();
		HashMap<Long, Package> packages = new HashMap<>();
		try {
			Package pack = null;
			String query = "SELECT * FROM package WHERE project = (SELECT id FROM project WHERE name = ? AND creator = ?)";
							
			PreparedStatement statement = connection.prepareStatement(query, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			statement.setString(1, projectName);
			statement.setString(2, username);
			ResultSet result = statement.executeQuery();

			if(!result.next())
			{
				query = "select * from package where project = (select project FROM collaborator where username  = ?" + 
												" and project = (select id from project where name = ?))";
				
				statement = connection.prepareStatement(query, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
				statement.setString(1, username);
				statement.setString(2, projectName);
				result = statement.executeQuery();
			}
			
			result.beforeFirst();
			
			while (result.next()) {
				pack = new Package();
				pack.setId(result.getLong("id"));
				pack.setName(result.getString("name"));	
				
				ProjectDao projectDao = DAOFactory.getInstance().getProjectDao();
				Project project = projectDao.findByPrimaryKey(result.getLong("project"));
				pack.setProject(project);
				
				packages.put(pack.getId(), pack);
			}
		} catch (SQLException e) {
			if (connection != null) {
				try {
					connection.rollback();
				} catch(SQLException excep) {
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
		return packages;
	}
	
	@Override
	public boolean exist(String name, Long projectId) {
		Connection connection = dataSource.getConnection();
		try {
			PreparedStatement statement;
			String query = "select * from package where name = ? and project = ?";
			statement = connection.prepareStatement(query);
			statement.setString(1, name);
			statement.setLong(2, projectId);
			
			ResultSet result = statement.executeQuery();
			return result.next();
		}  catch (SQLException e) {
			if (connection != null) {
				try {
					connection.rollback();
				} catch(SQLException excep) {
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

	public void update(Package pack) {
		Connection connection = dataSource.getConnection();
		try {
			String update = "update package SET id = ?, name = ?, project = ? WHERE id=?";
			PreparedStatement statement = connection.prepareStatement(update);
			statement.setLong(1, pack.getId());
			statement.setString(2, pack.getName());
			statement.setLong(3, pack.getProject().getId());
			
			statement.executeUpdate();
		}  catch (SQLException e) {
			if (connection != null) {
				try {
					connection.rollback();
				} catch(SQLException excep) {
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
	public void update(Long projectId, String oldName, String name) {
		Connection connection = dataSource.getConnection();
		try {
			String update = "update package SET name = ? WHERE name = ? and project = ?";
			PreparedStatement statement = connection.prepareStatement(update);
			statement.setString(1, name);
			statement.setString(2, oldName);
			statement.setLong(3, projectId);
			
			statement.executeUpdate();
		}  catch (SQLException e) {
			if (connection != null) {
				try {
					connection.rollback();
				} catch(SQLException excep) {
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
	
	public void restore(Long checkpointId) {
		Connection connection = dataSource.getConnection();
		try {
			String update = "update package as P set project = C.project from (select * from checkpoints where id = ?) as C " +
							"where P.id IN ( select CF.package from checkpointfile as CF where CF.checkpoint = C.id )";

			PreparedStatement statement = connection.prepareStatement(update);
			statement.setLong(1, checkpointId);
			statement.executeUpdate();
			
			update = "update package as P set project = NULL where P.id NOT IN (select package from checkpointfile as CF where CF.checkpoint = ? )";

			statement = connection.prepareStatement(update);
			statement.setLong(1, checkpointId);
			statement.executeUpdate();
			
		}  catch (SQLException e) {
			if (connection != null) {
				try {
					connection.rollback();
				} catch(SQLException excep) {
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
	public void remove(Long id) {
		FileDao fileDao = DAOFactory.getInstance().getFileDao();
		HashMap<Long, File> files = fileDao.find(id);
		Set<Long> filesId = files.keySet();
		
		for (Long fileId : filesId)
			fileDao.remove(fileId);
		
		Connection connection = dataSource.getConnection();
		try {
			String update = "update package SET project = NULL WHERE id = ?";
			PreparedStatement statement = connection.prepareStatement(update);
			statement.setLong(1, id);
			
			statement.executeUpdate();
		} catch (SQLException e) {
			if (connection != null) {
				try {
					connection.rollback();
				} catch(SQLException excep) {
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
		
	public void delete(Long packageId) {
		Connection connection = dataSource.getConnection();
		try {
			String delete = "delete FROM package WHERE id = ? ";
			PreparedStatement statement = connection.prepareStatement(delete);
			statement.setLong(1, packageId);
			statement.executeUpdate();
		} catch (SQLException e) {
			if (connection != null) {
				try {
					connection.rollback();
				} catch(SQLException excep) {
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
	public boolean onlineCollaborators(Long packageId) {
		Connection connection = dataSource.getConnection();
		try {
			String find = "select * from file where package = ?";
			PreparedStatement statement = connection.prepareStatement(find);
			statement.setLong(1, packageId);
			ResultSet result = statement.executeQuery();
			
			while(result.next())
			{
				String name = result.getString("username");
				if(name != null)
					return true;
			}
			
			return false;
		}  catch (SQLException e) {
			if (connection != null) {
				try {
					connection.rollback();
				} catch(SQLException excep) {
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