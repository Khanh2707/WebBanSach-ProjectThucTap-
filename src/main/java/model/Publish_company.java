package model;

public class Publish_company {
	private String id;
	private String name;
	
	public Publish_company() {
	}

	public Publish_company(String id, String name) {
		this.id = id;
		this.name = name;
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

	@Override
	public String toString() {
		return "Publish_company [id=" + id + ", name=" + name + "]";
	}
	
	
}
