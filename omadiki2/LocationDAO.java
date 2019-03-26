package omadiki2;

import java.sql.*;
import java.util.List;
import java.util.ArrayList;


public class LocationDAO {

	public LocationDAO() {  }



public List<Location> getLocation() throws Exception {

	Connection con = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	DB db = new DB();
	String sql = "SELECT * FROM location;";
	List<Location> location = new ArrayList<Location>();

	try{
		db.open();
		con = db.getConnection();
		stmt = con.prepareStatement(sql);
		rs = stmt.executeQuery();
		while ( rs.next() ) {
			location.add(new Location(rs.getInt("id"), rs.getString("city"),rs.getString("country")));
		}
		rs.close();
		stmt.close();
		db.close();

		return location;
	} catch (Exception e) {
		throw new Exception( e.getMessage() );
	} finally {
		try {
			db.close();
		} catch (Exception e) {
		}
	}
}
	public void saveLocation(Location location) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		DB db = new DB();
		String sql = "INSERT INTO location VALUES(?,?,?);";

		try{
			db.open();
			con = db.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, location.getIdLocation());
			stmt.setString(2,location.getCity());
			stmt.setString(3,location.getCountry());
			stmt.executeUpdate();
			stmt.close();
			db.close();
		}catch (Exception e) {
			throw new Exception(e.getMessage());
		} finally {
			try {
				db.close();
			} catch (Exception e ) {
			}
		}
	}

	public Location getLocationByID(int id) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Location loc = null;
		DB db = new DB();
		String sql = "SELECT * FROM location WHERE id = ?;";
		try {
			db.open();
			con = db.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			if(rs.next()) {
				loc = new Location(rs.getInt("id"), rs.getString("city"),rs.getString("country"));
			}
			rs.close();
			stmt.close();
			db.close();
			return loc;
		}catch (Exception e) {
			throw new Exception(e.getMessage());
		} finally {
			try {
				db.close();
			}
			catch (Exception e ) {
			}
		}
	}
	public List<Location> getLocationsWithLocal() throws Exception {
		List<Location> location = new ArrayList<Location>();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		DB db1 = new DB();
		Location loc = null;
		LocationDAO ld=new LocationDAO();
		String sql = "SELECT distinct traveler.location_id  FROM traveler,localbuddy  WHERE traveler.idTraveler=localbuddy.idTraveler;";
		try {
				db1.open();
				con = db1.getConnection();
				stmt = con.prepareStatement(sql);
				rs  = stmt.executeQuery();
				while(rs.next()) {
					int lid=rs.getInt("location_id");

					loc = ld.getLocationByID(lid);
					location.add(loc);
				}
				rs.close();
												stmt.close();
												db1.close();
												return location;
												} catch (Exception e) {
													throw new Exception( e.getMessage() );
													} finally {
														try {
														db1.close();
													} catch (Exception e) {
														}
												}
											}
					public int getMaxId() throws Exception {

											DB db = new DB();
											Connection con = null;
											int maxId = 0;
											String sql = "SELECT MAX(id) FROM location;";

											try {
												db.open();

												con = db.getConnection();

												PreparedStatement stmt = con.prepareStatement(sql);

												ResultSet rs = stmt.executeQuery();

												while(rs.next()) {
													maxId=rs.getInt("MAX(id)");
												}

													rs.close(); //κλείσιμο του ResultSet
													stmt.close(); //κλείσιμο του Statement (ή PreparedStatement)
													con.close(); //κλείσιμο συνεδρίας σύνδεσης με την βάση
													} catch (SQLException e) {
													  	throw new Exception( e.getMessage() );
													} finally {
														try {
															db.close();
														} catch(Exception e) {}
													}

													return maxId;


								}

				}




