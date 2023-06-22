package model;

public class Hnb {
	private String id;
	private String img;
	private Book book;
	
	public Hnb() {
	}

	public Hnb(String id, String img, Book book) {
		this.id = id;
		this.img = img;
		this.book = book;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	@Override
	public String toString() {
		return "Hnb [id=" + id + ", img=" + img + ", book=" + book + "]";
	}
	
}
