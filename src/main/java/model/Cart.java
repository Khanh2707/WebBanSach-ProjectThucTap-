package model;

import java.util.ArrayList;

public class Cart {
	private ArrayList<Items> items;
	
	public Cart() {
		items = new ArrayList<>();
	}

	public ArrayList<Items> getItems() {
		return items;
	}

	public void setItems(ArrayList<Items> items) {
		this.items = items;
	}
	
	public int getQuantityById(String id) {
		return getItemsById(id).getQuantity();
	}
	
	private Items getItemsById(String id) {
		for (Items items2 : items) {
			if (items2.getBook().getId().equals(id)) {
				return items2;
			}
		}
		return null;
	}
	
	public void addItems(Items i) {
		if (getItemsById(i.getBook().getId()) != null) {
			Items m = getItemsById(i.getBook().getId());
			m.setQuantity(m.getQuantity() + i.getQuantity());
		}
		else {
			items.add(i);
		}
	}
	
	public void removeItems(String id) {
		if (getItemsById(id) != null) {
			items.remove(getItemsById(id));
		}
	}
	
	public int getTotalMoney() {
		int t = 0;
		
		for (Items items2 : items) {
			t += (items2.getQuantity() * items2.getPrice());
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
		items = new ArrayList<>();
		try {
			if (txt != null && txt.length() != 0) {
				String[] s = txt.split("/");
				for (String string : s) {
					String[] n = string.split(":");
					String id = n[0];
					int quantity = Integer.parseInt(n[1]);
					Book b = getBookById(id, list);
					Items i = new Items(b, quantity, (b.getOrigin_price() * (100 - b.getRatio_sale())) / 100 );
					addItems(i);
				}
			}
		}
		catch (NumberFormatException e) {
			System.out.println(e);
		}
	}
}
