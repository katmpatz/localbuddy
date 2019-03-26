 package omadiki2;

import java.sql.*;
import java.util.List;
import java.util.ArrayList;


public class Traveller {
	protected int id;
	protected String name;
	protected String surname;
	protected String email;
	protected String password;
	protected String description;
	protected Location location;
	protected String photo;
	protected int travellers;



	public Traveller(int id, String name, String surname,  String email, String password, String description, Location location, String photo ) {
			this.id=id;
			this.name=name;
			this.surname=surname;
			this.email=email;
			this.password = password;
			this.description=description;
			this.location = location;
			this.photo = photo;

	}

	public Traveller(String name, String surname,  String email, String password, String description, Location location, String photo ) {
		this.name=name;
		this.surname=surname;
		this.email=email;
		this.password = password;
		this.description=description;
		this.location = location;
		this.photo = photo;
		try{
			travellers = getCount();
		} catch(Exception e){}
		travellers ++;
		this.id = travellers;
	}

	public int getCount() throws Exception{
			TravellerDAO cd = new TravellerDAO();
			travellers = cd.getMaxId();
			return travellers;
	}



	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id=id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name=name;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname=surname;
	}



	public String getEmail() {
			return email;
	}

	public void setEmail(String email) {
			this.email=email;
	}

	public String getPassword() {
			return password;
	}

	public void setPassword(String password) {
			this.password=password;
	}



	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description=description;
	}

	public void setLocation(Location location) {
				this.location = location;
			}

			public Location getLocation() {
				return location;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getPhoto() {
		return photo;
	}
}
