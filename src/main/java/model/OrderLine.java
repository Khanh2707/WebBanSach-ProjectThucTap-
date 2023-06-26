package model;

public class OrderLine {
	private int id_order;
	private String id_book;
	private int quantity;
	private int price;
	private int phone;
	private String address;
	private String method_pay;
	
	public OrderLine() {
	}

	public OrderLine(int id_order, String id_book, int quantity, int price, int phone, String address,
			String method_pay) {
		this.id_order = id_order;
		this.id_book = id_book;
		this.quantity = quantity;
		this.price = price;
		this.phone = phone;
		this.address = address;
		this.method_pay = method_pay;
	}

	public int getId_order() {
		return id_order;
	}

	public void setId_order(int id_order) {
		this.id_order = id_order;
	}

	public String getId_book() {
		return id_book;
	}

	public void setId_book(String id_book) {
		this.id_book = id_book;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getPhone() {
		return phone;
	}

	public void setPhone(int phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getMethod_pay() {
		return method_pay;
	}

	public void setMethod_pay(String method_pay) {
		this.method_pay = method_pay;
	}
	
	
}
