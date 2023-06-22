package model;

public class Book {
	private String id;
	private String name;
	private int origin_price;
	private byte ratio_sale;
	private short year_publish;
	private String content;
	private short quantity;
	private String img;
	private Author author;
	private Publish_company publish_company;
	private Category category;
	
	public Book() {
	}

	public Book(String id, String name, int origin_price, byte ratio_sale, short year_publish, String content,
			short quantity, String img, Author author, Publish_company publish_company, Category category) {
		this.id = id;
		this.name = name;
		this.origin_price = origin_price;
		this.ratio_sale = ratio_sale;
		this.year_publish = year_publish;
		this.content = content;
		this.quantity = quantity;
		this.img = img;
		this.author = author;
		this.publish_company = publish_company;
		this.category = category;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getOrigin_price() {
		return origin_price;
	}

	public void setOrigin_price(int origin_price) {
		this.origin_price = origin_price;
	}

	public byte getRatio_sale() {
		return ratio_sale;
	}

	public void setRatio_sale(byte ratio_sale) {
		this.ratio_sale = ratio_sale;
	}

	public short getYear_publish() {
		return year_publish;
	}

	public void setYear_publish(short year_publish) {
		this.year_publish = year_publish;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public short getQuantity() {
		return quantity;
	}

	public void setQuantity(short quantity) {
		this.quantity = quantity;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public Author getAuthor() {
		return author;
	}

	public void setAuthor(Author author) {
		this.author = author;
	}

	public Publish_company getPublish_company() {
		return publish_company;
	}

	public void setPublish_company(Publish_company publish_company) {
		this.publish_company = publish_company;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "Book [id=" + id + ", name=" + name + ", origin_price=" + origin_price + ", ratio_sale=" + ratio_sale
				+ ", year_publish=" + year_publish + ", content=" + content + ", quantity=" + quantity + ", img=" + img
				+ ", author=" + author + ", publish_company=" + publish_company + ", category=" + category + "]";
	}
}
