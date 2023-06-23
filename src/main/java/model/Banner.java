package model;

public class Banner {
	private String id;
	private String img;
	
	public Banner() {
	}

	public Banner(String id, String img) {
		this.id = id;
		this.img = img;
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

	@Override
	public String toString() {
		return "Banner [id=" + id + ", img=" + img + "]";
	}
	
	
}
