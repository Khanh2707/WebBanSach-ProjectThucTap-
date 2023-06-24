package model;

public class Order {
	private int id;
	private String date;
	private String id_account;
	private int totalMoney;
	
	public Order() {
	}

	public Order(int id, String date, String id_account, int totalMoney) {
		this.id = id;
		this.date = date;
		this.id_account = id_account;
		this.totalMoney = totalMoney;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getId_account() {
		return id_account;
	}

	public void setId_account(String id_account) {
		this.id_account = id_account;
	}

	public int getTotalMoney() {
		return totalMoney;
	}

	public void setTotalMoney(int totalMoney) {
		this.totalMoney = totalMoney;
	}
	
}
