package model;

public class OrderLine {
	private int id_order;
	private String id_book;
	private int quantity;
	private double price;
	
	public OrderLine() {
	}

	public OrderLine(int id_order, String id_book, int quantity, double price) {
		this.id_order = id_order;
		this.id_book = id_book;
		this.quantity = quantity;
		this.price = price;
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

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "OrderLine [id_order=" + id_order + ", id_book=" + id_book + ", quantity=" + quantity + ", price="
				+ price + "]";
	}
	
	
}
