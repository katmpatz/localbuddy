package omadiki2;

import java.util.List;
import java.util.ArrayList;

public class LocalBuddy extends Traveller {
	protected int idlocal;
	protected boolean student;
	protected boolean find_a_home;
	protected String city_description;
	protected String my_description;
	protected int countLocalBuddy;



	public LocalBuddy(int id, String name, String surname, String email, String password, String description,Location location,String photo, int idlocal, boolean student, boolean find_a_home, String city_description,  String my_description) {
		super(id,name,surname,email,password,description, location,photo);
		this.idlocal = idlocal;
		this.student = student;
		this.find_a_home = find_a_home;
		this.city_description = city_description;

		this.my_description = my_description;

	}

	public LocalBuddy(int id,String name, String surname, String email, String password, String description,Location location,String photo, boolean student, boolean find_a_home, String city_description,  String my_description) {
	super(id,name,surname,email,password,description,location,photo);
	this.student = student;
	this.find_a_home = find_a_home;
	this.city_description = city_description;
	this.my_description = my_description;
	try{
		countLocalBuddy = getCount();
	} catch(Exception e){}
	countLocalBuddy++;
	this.idlocal = countLocalBuddy;
	}

	public int getCount() throws Exception{
		LocalBuddyDAO cd = new LocalBuddyDAO();
		countLocalBuddy = cd.getMaxId();
		return countLocalBuddy;
	}


	public int getIdLocal() {
			return idlocal;
		}

		public void setIdLocal(int idlocal) {
			this.idlocal = idlocal;
	}

	public void setStudent(boolean student) {
		this.student = student;
	}

	public boolean getStudent() {
		return student;
	}

	public void setFindAHome(boolean find_a_home) {
		this.find_a_home = find_a_home;
	}

	public boolean getFindAHome() {
		return find_a_home;
	}

	public void setCityDescription(String city_description) {
		this.city_description = city_description;
	}

	public String getCityDescription() {
		return city_description;
	}



		public void setMyDescription(String my_description) {
			this.my_description = my_description;
		}

		public String getMyDescription() {
			return my_description;
		}



	}//end




