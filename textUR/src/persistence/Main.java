package persistence;

public class Main {

	public static void main(String[] args)
	{
		DAOFactory factory = DAOFactory.getInstance();
		
		UtilDao util = factory.getUtilDao();

		util.dropDatabase();
		util.createDatabase();
	}
}
