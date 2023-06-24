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
			if (items2.getBook().getId() == id) {
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
}
