package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class IdBroker {
	private static String[] names = {"checkpointID", "messageID", "fileID", "packageID", "collaboratorID", "checkpointFileID","projectID","commentID"};
	
	public static void init(Connection connection)
	{
		try {
			PreparedStatement statement;
			for(int i = 0; i < names.length; i++)
			{
				String insert = "create SEQUENCE " + names[i] + ";";
				statement = connection.prepareStatement(insert);
				statement.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static Long getID(Connection connection, String name) {
		Long id = null;
		try {
			String query = "SELECT nextval('"+name+"') AS id";
			
			PreparedStatement statement = connection.prepareStatement(query);
			ResultSet result = statement.executeQuery();
			result.next();
			id = result.getLong("id");
		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		}
		return id;
	}

	public static void drop(Connection connection) {
		try {
			String delete = "";
			
			for(int i=0; i<names.length; i++)
				delete += "drop SEQUENCE if EXISTS " + names[i] + ";";

			PreparedStatement statement = connection.prepareStatement(delete);
			statement.executeUpdate();
		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		}
	}

}
