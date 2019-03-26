package omadiki2;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Communication {
	protected int communication_id;
	protected Traveller traveler;
	protected LocalBuddy local;
	protected String date;
	protected boolean answer;
	protected String message;
	protected int countCommunication;

	public Communication(int communication_id, Traveller traveler, LocalBuddy local, String date, boolean answer, String message) {
		this.communication_id = communication_id;
		this.traveler = traveler;
		this.local = local;
		this.date = date;
		this.answer = answer;
		this.message = message;
	}

	public Communication(Traveller traveler , LocalBuddy local, String date , boolean answer, String message) {
		try{
			countCommunication = getCount();
		} catch(Exception e){}
		countCommunication ++;
		this.communication_id = countCommunication;
		this.traveler =traveler;
		this.local = local;
		this.date = date;
		this.answer = answer;
		this.message = message;

	}

	public int getCount() throws Exception{
		CommunicationDAO cd = new CommunicationDAO();
		countCommunication = cd.getMaxId();
		return countCommunication;
	}



	public int getId() {
		return communication_id;
	}

	public void setId(int communication_id) {
		this.communication_id=communication_id;
	}

	public Traveller getTraveller() {
			return traveler;
		}

	public void setTraveller(Traveller traveler) {
		this.traveler=traveler;
	}

	public LocalBuddy getLocalBuddy() {
		return local;
	}

	public void setLocalBuddy(LocalBuddy local) {
		this.local= local;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date= date;
	}

	public boolean getAnswer() {
		return answer;
	}

	public void setAnswer(boolean answer) {
		this.answer= answer;
	}

	public String getMessage() {
			return message;
		}

	public void setMessage(String message) {
			this.message= message;
	}

}
