package persistence.JDBC;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import model.Project;
import model.User;
import persistence.DataSource;
import persistence.PersistenceException;
import persistence.UserCredential;
import persistence.dao.UserDao;

public class UserDaoJDBC implements UserDao{

	private DataSource dataSource = null;

	public UserDaoJDBC(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}

	public void save(User user) {
		Connection connection = dataSource.getConnection();
		try {
			String insert = "insert into users(username, mail, image) values (?,?,?)";
			PreparedStatement statement = connection.prepareStatement(insert);
			statement.setString(1, user.getUsername());
			statement.setString(2, user.getMail());
			statement.setString(3, "../dist/img/avatar5.png");
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

	public User findByPrimaryKey(String username) {
		Connection connection = dataSource.getConnection();
		User user = null;
		try {
			PreparedStatement statement;
			String query = "select * from users where username = ?";
			statement = connection.prepareStatement(query);
			statement.setString(1, username);
			ResultSet result = statement.executeQuery();
			if (result.next()) {
				user = new User();
				user.setUsername(result.getString("username"));				
				user.setMail(result.getString("mail"));
				user.setImage(result.getString("image"));
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
		return user;
	}
	
	@Override
	public User findByMail(String mail) {
		
		Connection connection = dataSource.getConnection();
		User user = null;
		try {
			PreparedStatement statement;
			String query = "select * from users where mail = ?";
			statement = connection.prepareStatement(query);
			statement.setString(1, mail);
			ResultSet result = statement.executeQuery();
			if (result.next()) {
				user = new User();
				user.setUsername(result.getString("username"));				
				user.setMail(result.getString("mail"));
				user.setImage(result.getString("image"));
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
		return user;
	}

	public List<String> findAll(Project project) {
		Connection connection = dataSource.getConnection();
		List<String> users = new LinkedList<>();
		try {
			String user;
			PreparedStatement statement;
			String query = "select * from users as u where u.username NOT IN "
					+ "(select c.username from collaborator as c where c.project = ?)";
			statement = connection.prepareStatement(query);
			statement.setLong(1, project.getId());

			ResultSet result = statement.executeQuery();
			while (result.next()) {
				user = result.getString("username");				
				if( !user.equals(project.getCreator().getUsername()) )
					users.add(user);
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
		return users;
	}

	public boolean updateMail(String username, String mail) {
		if(findByMail(mail)!= null)
			return false;
		Connection connection = dataSource.getConnection();
		try {
			String update = "update users SET mail = ? WHERE username=?";
			PreparedStatement statement = connection.prepareStatement(update);
			statement.setString(1, mail);
			statement.setString(2, username);
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
		return true;
	}
	
	@Override
	public void updateImage(String username, String url) {
		Connection connection = dataSource.getConnection();
		try {
			String update = "update users SET image = ? WHERE username=?";
			PreparedStatement statement = connection.prepareStatement(update);
			statement.setString(1, url);
			statement.setString(2, username);
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
	
	public boolean updateUsername(String username, String newUsername)
	{
		if(findByPrimaryKey(newUsername) != null)
			return false;
		
		Connection connection = dataSource.getConnection();
		try {
			String update = "update users SET username = ? WHERE username=?";
			PreparedStatement statement = connection.prepareStatement(update);
			statement.setString(1, newUsername);
			statement.setString(2, username);
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
		return true;
	}

	public void delete(User user) {
		Connection connection = dataSource.getConnection();
		try {
			String delete = "delete FROM user WHERE username = ? ";
			PreparedStatement statement = connection.prepareStatement(delete);
			statement.setString(1, user.getUsername());
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
	public boolean setPassword(User user, String oldPassword, String password) {
		Connection connection = dataSource.getConnection();
		try {
			String query = "select password from users where id = ?";
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setString(1, user.getUsername());
			
			ResultSet result = statement.executeQuery();
			String old = result.getString("password");
			if(old != null && !old.equals(oldPassword))
				return false;
			
			String update = "update users SET password = ? WHERE username=?";
			statement = connection.prepareStatement(update);
			statement.setString(1, password);
			statement.setString(2, user.getUsername());
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
		return true;
	}

	@Override
	public UserCredential findByPrimaryKeyCredential(String username) {
		User user = findByPrimaryKey(username);
		UserCredential userCredential = null;
		if (user != null){
			userCredential = new UserCredential(dataSource);
			userCredential.setUsername(user.getUsername());
			userCredential.setMail(user.getMail());
			userCredential.setImage(user.getImage());
		}
		return userCredential;
	}
}
