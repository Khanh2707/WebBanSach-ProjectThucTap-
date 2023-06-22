package model;

public class Order {
	private int id;
	private String date;
	private int id_customer;
	private double totalMoney;
	
	public Order() {
	}

	public Order(int id, String date, int id_customer, double totalMoney) {
		this.id = id;
		this.date = date;
		this.id_customer = id_customer;
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

	public int getId_customer() {
		return id_customer;
	}

	public void setId_customer(int id_customer) {
		this.id_customer = id_customer;
	}

	public double getTotalMoney() {
		return totalMoney;
	}

	public void setTotalMoney(double totalMoney) {
		this.totalMoney = totalMoney;
	}

	@Override
	public String toString() {
		return "Order [id=" + id + ", date=" + date + ", id_customer=" + id_customer + ", totalMoney=" + totalMoney
				+ "]";
	}
	
	
}
