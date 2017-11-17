package com.techelevator.clebrews.model;

public interface UserDAO {

	public void saveUser(String userName, String password);

	public boolean searchForUsernameAndPassword(String userName, String password);
	
	public boolean searchForUsername(String userName);

	public void updatePassword(String userName, String password);

}
