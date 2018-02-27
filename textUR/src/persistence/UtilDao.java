package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import persistence.dao.Dao;

public class UtilDao implements Dao {

	private DataSource dataSource;

	public UtilDao(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public void dropDatabase() {

		Connection connection = dataSource.getConnection();
		try {
			String delete = "drop table if EXISTS checkpointFile;"
					+ "drop table if EXISTS checkpoints;" 
					+ "drop table if EXISTS message;"
					+ "drop table if EXISTS collaborator;" 
					+ "drop table if EXISTS comment;"
					+ "drop table if EXISTS file;"
					+ "drop table if EXISTS package;"
					+ "drop table if EXISTS project;"
					+ "drop table if EXISTS users;";

			PreparedStatement statement = connection.prepareStatement(delete);
			statement.executeUpdate();
			
			IdBroker.drop(connection);
			System.out.println("Executed drop database");

		} catch (SQLException e) {

			throw new PersistenceException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {

				throw new PersistenceException(e.getMessage());
			}
		}
	}

	public void createDatabase() {
		Connection connection = dataSource.getConnection();
		try {
			String create = "create table users(\"username\" VARCHAR(20) primary key, mail VARCHAR(50), password VARCHAR(16));"
					+ "create table project(\"id\" BIGINT primary key, name VARCHAR(50), creator VARCHAR(20) REFERENCES users(\"username\") ON UPDATE CASCADE);"
					+ "create table package(\"id\" BIGINT primary key, name VARCHAR(50), project BIGINT REFERENCES project(\"id\") ON DELETE CASCADE);"
					+ "create table message(\"id\" BIGINT primary key, project BIGINT REFERENCES project(\"id\") ON DELETE CASCADE, text VARCHAR(400), username VARCHAR(20) REFERENCES users(\"username\") ON UPDATE CASCADE, date TIMESTAMP);"
					+ "create table checkpoints (\"id\" BIGINT primary key,description VARCHAR(100), project BIGINT REFERENCES project(\"id\") ON DELETE CASCADE,username VARCHAR(20) REFERENCES users(\"username\") ON UPDATE CASCADE, date TIMESTAMP);"
					+ "create table collaborator (\"id\" BIGINT primary key, username VARCHAR(20) REFERENCES users(\"username\") ON UPDATE CASCADE, project BIGINT REFERENCES project(\"id\") ON DELETE CASCADE, status BOOLEAN);"
					+ "create table file (\"id\" BIGINT primary key, name VARCHAR(50), package BIGINT REFERENCES package(\"id\") ON DELETE CASCADE, code TEXT,username VARCHAR(20) REFERENCES users(\"username\") ON UPDATE CASCADE);"
					+ "create table checkpointFile (\"id\" BIGINT primary key, text TEXT, checkpoint BIGINT REFERENCES checkpoints(\"id\") ON DELETE CASCADE, file BIGINT REFERENCES file(\"id\") ON DELETE CASCADE, package BIGINT REFERENCES package(\"id\") ON DELETE CASCADE, date TIMESTAMP, creator VARCHAR(20) REFERENCES users(\"username\") ON UPDATE CASCADE,description VARCHAR(100));"
					+ "create table comment(\"id\" BIGINT primary key, date TIMESTAMP, file BIGINT REFERENCES file(\"id\") ON DELETE CASCADE, line BIGINT, username VARCHAR(20) REFERENCES users(\"username\") ON UPDATE CASCADE, text TEXT);";
			PreparedStatement statement = connection.prepareStatement(create);

			statement.executeUpdate();

			IdBroker.init(connection);
			System.out.println("Executed create database");

		} catch (SQLException e) {

			throw new PersistenceException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {

				throw new PersistenceException(e.getMessage());
			}
		}
	}

	public void resetDatabase() {
		Connection connection = dataSource.getConnection();
		try {
			String reset = "delete FROM checkpointFile";
			PreparedStatement statement = connection.prepareStatement(reset);
			statement.executeUpdate();

			reset = "delete FROM checkpoints";
			statement = connection.prepareStatement(reset);
			statement.executeUpdate();

			reset = "delete FROM message";
			statement = connection.prepareStatement(reset);
			statement.executeUpdate();

			reset = "delete FROM comment";
			statement = connection.prepareStatement(reset);
			statement.executeUpdate();

			reset = "delete FROM file";
			statement = connection.prepareStatement(reset);
			statement.executeUpdate();

			reset = "delete FROM collaborator";
			statement = connection.prepareStatement(reset);
			statement.executeUpdate();

			reset = "delete FROM package";
			statement = connection.prepareStatement(reset);
			statement.executeUpdate();

			reset = "delete FROM project";
			statement = connection.prepareStatement(reset);
			statement.executeUpdate();

			reset = "delete FROM users;";
			statement = connection.prepareStatement(reset);
			statement.executeUpdate();

			IdBroker.drop(connection);
			IdBroker.init(connection);
			System.out.println("Executed reset database");

		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}
	}
}