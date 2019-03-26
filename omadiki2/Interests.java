package omadiki2;
import java.sql.*;
import java.util.List;
import java.util.ArrayList;

public class Interests {
	protected int id;
	protected String category;
	protected String name;

	public Interests(int id, String name, String category) {
		this.id=id;
		this.name=name;
		this.category=category;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		return;
	}

	public String getCategory() {
			return category;
	}

	public void setCategory(String category) {
			return;
	}

	public int getId() {
			return id;
		}

		public void setId(int id) {
			return;
	}


}