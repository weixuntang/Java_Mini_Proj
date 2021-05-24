package com.matwx.dto;



public class UserDTO {

	private int id;

	private String preferredName;

	private String emailAddress;

	private String password;

	private boolean active;

	private boolean admin;

	
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPreferredName() {
		return preferredName;
	}

	public void setPreferredName(String preferredName) {
		this.preferredName = preferredName;
	}

	

	public String getEmailAddress() {
		return emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public boolean isAdmin() {
		return admin;
	}

	public void setAdmin(boolean admin) {
		this.admin = admin;
	}

	@Override
	public String toString() {
		return "UserDTO [id=" + id + ", preferredName=" + preferredName + ", emailAddress=" + emailAddress
				+ ", password=" + password + ", active=" + active + ", admin=" + admin + "]";
	}
	
	
	
}
