package model;

public class Book_in_Cart {
	private Book book;
	private int quantity;
	private double price;
	
	public Book_in_Cart() {
	}

	public Book_in_Cart(Book book, int quantity, double price) {
		this.book = book;
		this.quantity = quantity;
		this.price = price;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
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
		return "Book_in_Cart [book=" + book + ", quantity=" + quantity + ", price=" + price + "]";
	}
	
	
}
