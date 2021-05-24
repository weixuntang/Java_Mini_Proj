package com.matwx.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.matwx.dao.UserDao;
import com.matwx.entity.User;

@Service
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao userDao;

	@Override
	public User validateLogin(String emailAddress, String password) {

		return userDao.validateLogin(emailAddress, password);
	}

	@Override
	public int saveUser(User user) {

		return userDao.saveUser(user);
	}
	
	@Override
	public void updateUser(User user) {
	
		userDao.updateUser(user);
		
	}
	

	@Override
	public List<User> retrieveLsOfUsers() {

		return userDao.retrieveLsOfUsers();
	}

	@Override
	public void deleteUserWhereId(int id) {
		
		userDao.deleteUserWhereId(id);
		
	}
	

	@Override
	public User getUserWhereEmailAddress(String emailAddress) {

		return userDao.getUserWhereEmailAddress(emailAddress);
	}



}
