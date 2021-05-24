package com.matwx.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.matwx.dto.UserDTO;
import com.matwx.entity.User;
import com.matwx.service.UserService;


@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserService userService;
	
	@Autowired
	User user;
	
	
	

	@GetMapping("/login")
	public String loginPage(Model model, HttpServletRequest req) {
		
		String returnTo = "";
		
		HttpSession session = req.getSession();
		
		model.addAttribute("user", new User());
		
		boolean isAdmin = false;
		
		if(null != session.getAttribute("isAdmin")) {
			isAdmin = ((Boolean) session.getAttribute("isAdmin"));
		}
		
		if (null == user.getEmailAddress()) {
			returnTo = "user-login";
			
		} else if (isAdmin) {
			retrieveLsOfUsersAndAddToModel(model);
			returnTo = "admin-panel";
			
		} else if (null != session.getAttribute("emailAddress")) {
			System.out.println(session.getAttribute("emailAddress"));
			model.addAttribute("user", userService.getUserWhereEmailAddress((String) session.getAttribute("emailAddress")));

			returnTo = "user-panel";
		}
		
		return returnTo;
	}
	
	
	
	
	@PostMapping("/logOn")
	public String loginValidation(@ModelAttribute("user") UserDTO userDto, Model model, HttpSession session) {
		
		user.userDtoToUser(userDto);
		
		user = userService.validateLogin(user.getEmailAddress(), user.getPassword());
		
		boolean emptyUser = 0 == user.getId();

		String toReturn = "";
		
		if (emptyUser) {
			model.addAttribute("loginStatus", false);
			userDto.setPassword("");
			model.addAttribute("user", userDto);
			toReturn = "user-login";
		} else if (user.isAdmin()) {
			// https://stackoverflow.com/questions/9311940/redirect-to-dynamic-url-in-spring-mvc
			setSessionFromUser(session);
			retrieveLsOfUsersAndAddToModel(model);
			toReturn = "admin-panel";
		} else {
			setSessionFromUser(session);
			model.addAttribute("user", user);
			toReturn = "user-panel";
		}
		
		return toReturn;
	}
	


	@GetMapping("/showFormToAddUser")
	public String formToAddUser(Model model) {
		
		model.addAttribute("user", new User());
		
		
		return "user-form";
	}
	
	
	
	
	@PostMapping("/saveUser")
	public String saveUser(@ModelAttribute("user") UserDTO userDto, Model model) {

		user.userDtoToUser(userDto);

		int errorCode = userService.saveUser(user);
		
		boolean chkDuplicateUser = 1 == errorCode;
		
		model.addAttribute("saveStatus", chkDuplicateUser);

		model.addAttribute("user", userDto);

		return chkDuplicateUser ?  "user-form" : "save-user";
	}
	
	
	
	// Admin Controller
	
	
	
	@PostMapping("/updateUser")
	public String updateUser(@ModelAttribute("user") UserDTO userDto, Model model) {

		
		user.userDtoToUser(userDto);
		
		
		userService.updateUser(user);
		
		
		retrieveLsOfUsersAndAddToModel(model);
		
		
		return "admin-panel";
	}
	


	
	
	@PostMapping("/deleteUser")
	public String deleteUser(@ModelAttribute("user") UserDTO userDto, Model model) {
		
		user.userDtoToUser(userDto);
		
		userService.deleteUserWhereId(user.getId());
		
		retrieveLsOfUsersAndAddToModel(model);
		
		return "admin-panel";
	}
	
	

	
	
	
	// User Controller
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// Functions
	
	// https://learningprogramming.net/java/spring-mvc/login-form-with-session-in-spring-mvc/
	public HttpSession setSessionFromUser(HttpSession session) {
		
		session.setAttribute("emailAddress", user.getEmailAddress());
		
		session.setAttribute("isAdmin", user.isAdmin());
		
		return session;
	}
	
	
	public Model retrieveLsOfUsersAndAddToModel(Model retrieveLsOfUsers) {
		
		return retrieveLsOfUsers.addAttribute("lsOfUsers", userService.retrieveLsOfUsers());
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
