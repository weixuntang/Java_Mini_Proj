package com.matwx.service;

import java.util.List;

import com.matwx.entity.User;

public interface UserService {
	
	public User validateLogin(String user, String password);

	public int saveUser(User user);
	
	public void updateUser(User user);
	
	public List<User> retrieveLsOfUsers ();
	
	public void deleteUserWhereId(int id);
	
	public User getUserWhereEmailAddress(String emailAddress);
}
