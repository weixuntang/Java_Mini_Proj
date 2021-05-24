package com.matwx.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.matwx.entity.User;
import com.matwx.utilities.DatabaseCrud;

@Repository
public class UserDaoImpl implements UserDao{

	@Autowired
	DatabaseCrud<?> databaseCrud;
	
	
	@Autowired
	SessionFactory sessionFactory;
	
	
	
	public Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}
	
	
	@Override
	public User validateLogin(String emailAddress, String password) {
		
		User user = new User();
		
		try {
			user = (User) new DatabaseCrud().selectWhere3Column(getCurrentSession(), "User", "emailAddress", "password", "active", emailAddress, password, "1").get(0);
		} catch (Exception e) {}
		
		return user;
	}


	@Override
	public int saveUser(User user) {
		
		int returnVal;

		try {
			user = (User) new DatabaseCrud().selectWhere1Column(getCurrentSession(), "User", "emailAddress", user.getEmailAddress()).get(0);
		} catch(Exception e) {}
		
		if (0 == user.getId()) {
			getCurrentSession().persist(user);
			returnVal = 0;
		} else {
			returnVal = 1;
		}
		

		return returnVal;
	}
	
	
	@Override
	public void updateUser(User user) {
		
		getCurrentSession().update(user);
	}


	@Override
	public List<User> retrieveLsOfUsers() {
		return  new DatabaseCrud().simpleSelectStatement(getCurrentSession(), "User");
	}


	@Override
	public void deleteUserWhereId(int id) {
		
		User user = getCurrentSession().get(User.class, id);
		
		getCurrentSession().delete(user);
		
	}


	@Override
	public User getUserWhereEmailAddress(String emailAddress) {

		User user = null;

		try {
			user = (User) new DatabaseCrud().selectWhere1Column(getCurrentSession(), "User", "emailAddress", emailAddress).get(0);
		} catch (Exception e) {}

		System.out.println(emailAddress);
		
		System.out.println(user);

		return user;
	}


}
