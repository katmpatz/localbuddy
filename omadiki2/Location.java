package omadiki2;

import java.sql.*;
import java.util.List;
import java.util.ArrayList;

public class Location {

	protected int idlocation;
	protected String city;
	protected String country;
	protected int countLocations;


	public Location(int idlocation, String city, String country) {
		this.idlocation =  idlocation;
		this.city = city;
		this.country = country;
	}

	public Location(String city, String country) {
		this.city = city;
		this.country = country;
		try{
			countLocations = getCount();
		} catch(Exception e){}
		countLocations ++;
		this.idlocation = countLocations;
	}

	public int getCount() throws Exception{
			LocationDAO cd = new LocationDAO();
			countLocations = cd.getMaxId();
			return countLocations;
	}

	public void setIdLocation(int idlocation) {
		this.idlocation = idlocation;
	}

	public int getIdLocation() {
		return idlocation;
	}
	public void setCity(String city) {
		this.city = city;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getCity() {
		return city;
	}

	public String getCountry() {
		return country;
	}


}
