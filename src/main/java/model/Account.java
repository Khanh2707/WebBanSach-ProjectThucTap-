package model;

public class Account {
	private String fullname;
	private String username;
	private String password;
	private int role;
	private int amount;
	
	public Account() {
	}

	public Account(String fullname, String username, String password, int role, int amount) {
		this.fullname = fullname;
		this.username = username;
		this.password = password;
		this.role = role;
		this.amount = amount;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}
}
