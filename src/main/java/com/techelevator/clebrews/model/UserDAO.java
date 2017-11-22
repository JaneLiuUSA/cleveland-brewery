package com.techelevator.clebrews.model;

import java.util.List;

public interface UserDAO {

	public int saveUser(User newUser);

	public boolean searchForUsernameAndPassword(String userName, String password);
	
	public boolean searchForUsername(String userName);

	public void updatePassword(String userName, String password);

	public User getUserByUsername(String userName);
	
	public void UpdatetActiveByUserId(int userId, boolean isActive);
	
	public List<User> getUserByRoleId(int id);

}
