package model;

import java.util.ArrayList;

public class Cart {
	private ArrayList<Book_in_Cart> books_in_cart;

	public Cart() {
		books_in_cart = new ArrayList<>();
	}

	public ArrayList<Book_in_Cart> getBooks_in_cart() {
		return books_in_cart;
	}

	public void setBooks_in_cart(ArrayList<Book_in_Cart> books_in_cart) {
		this.books_in_cart = books_in_cart;
	}
	
	public int getQuantityById(String id) {
		return getBooksInCartById(id).getQuantity();
	}
	
	private Book_in_Cart getBooksInCartById(String id) {
		for (Book_in_Cart book_in_Cart : books_in_cart) {
			if (book_in_Cart.getBook().getId().equals(id)) {
				return book_in_Cart;
			}
		}
		
		return null;
	}
	
	public void addBookInCart(Book_in_Cart b) {
		if (getBooksInCartById(b.getBook().getId()) != null) {
			Book_in_Cart bic = getBooksInCartById(b.getBook().getId());
			bic.setQuantity(bic.getQuantity() + b.getQuantity());
		}
		else {
			books_in_cart.add(b);
		}
	}
	
	public void removeBookInCart(String id) {
		if (getBooksInCartById(id) != null) {
			books_in_cart.remove(getBooksInCartById(id));
		}
	}
	
	public double getTotalMoney() {
		double t = 0;
		for (Book_in_Cart book_in_Cart : books_in_cart) {
			t += (book_in_Cart.getQuantity() * book_in_Cart.getPrice());
		}
		
		return t;
	}
	
	private Book getBookById(String id, ArrayList<Book> list) {
		for (Book book : list) {
			if (book.getId().equals(id)) {
				return book;
			}
		}
		return null;
	}
	
	public Cart(String txt, ArrayList<Book> list) {
		books_in_cart = new ArrayList<>();
		
		try {
			if (txt != null && txt.length() != 0) {
				String[] s = txt.split("/");
				for (String string : s) {
					String[] n = string.split(":");
					String id = n[0];
					int quantity = Integer.parseInt(n[1]);
					Book book = getBookById(id, list);
					Book_in_Cart bic = new Book_in_Cart(book, quantity, book.getOrigin_price());
					addBookInCart(bic);
				}
			}
		}
		catch (NumberFormatException ex) {
			System.out.println(ex);
		}
	}
}
