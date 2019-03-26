package omadiki2;

import java.sql.*;
import java.util.List;
import java.util.ArrayList;

public class TravellerDAO {
	public TravellerDAO() { }


public void saveTraveller(Traveller traveller) throws Exception {
			Connection con = null;
			PreparedStatement stmt = null;
			DB db1 = new DB();
			String sql = "INSERT INTO traveler VALUES (?,?,?,?,?,?,?,?);";
			try{
				db1.open();
				con = db1.getConnection();
				stmt = con.prepareStatement(sql);

				stmt.setInt(1,traveller.getId() );
				stmt.setString(2, traveller.getName());
				stmt.setString(3, traveller.getSurname());

				stmt.setString(4, traveller.getEmail());
				stmt.setString(5,traveller.getPassword());
				stmt.setString(6, traveller.getDescription());
				stmt.setInt(7, traveller.getLocation().getIdLocation());
				stmt.setString(8, traveller.getPhoto());




				stmt.executeUpdate();
				stmt.close();
				db1.close();
			} catch (Exception e) {
				throw new Exception(e.getMessage());
				} finally {
					try {
						db1.close();
					}catch (Exception e) {
					}
				}
		}
	 public  List<Traveller> getTravellers() throws Exception {
		 List<Traveller> travellers = new ArrayList<Traveller>();
		 				Connection con = null;
		 				PreparedStatement stmt = null;
		 				ResultSet rs = null;
		 				DB db1 = new DB();
				Location loc = null;
				String sql = "SELECT * FROM traveler;";
				try {
					db1.open();
					con = db1.getConnection();
					stmt = con.prepareStatement(sql);
					rs = stmt.executeQuery();
					while(rs.next()) {
						loc = new Location(rs.getInt("id"),rs.getString("city"), rs.getString("country"));
						travellers.add(new Traveller( rs.getInt("idTraveler"),rs.getString("name"),rs.getString("surname"), rs.getString("email"), rs.getString("password"),rs.getString("description"),
														loc, rs.getString("photo")));
					}
					rs.close();
					stmt.close();
					db1.close();
					return travellers;
				}catch(Exception e) {
				throw new Exception(e.getMessage());
				} finally {
					try {
						db1.close();
					}catch (Exception e) {
					}
				}
		}

		public Traveller getTravellerByID(int trid) throws Exception {
			Connection con = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			DB db1 = new DB();
			Location loc = null;
			Traveller traveller =null;
			String sql = "SELECT * FROM traveler LEFT JOIN location ON traveler.location_id = location.id WHERE idTraveler = ?;";
				try {
					db1.open();
						con = db1.getConnection();
						stmt = con.prepareStatement(sql);
						stmt.setInt(1, trid);
						rs  = stmt.executeQuery();
						if(rs.next()) {
						loc = new Location(rs.getInt("id"),rs.getString("city"), rs.getString("country"));
						traveller = new Traveller( rs.getInt("idTraveler"), rs.getString("name"),rs.getString("surname"), rs.getString("email"), rs.getString("password"),rs.getString("description"),
											loc, rs.getString("photo"));
									}
						rs.close();
						stmt.close();
						db1.close();
						return traveller;
						} catch (Exception e) {
							throw new Exception( e.getMessage() );
							} finally {
								try {
									db1.close();
								} catch (Exception e) {

								}
							}
						}
	public Traveller findTraveller(String email) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		DB db1 = new DB();
		Location loc = null;
		Traveller traveller = null;
		String sql = "SELECT * FROM traveler LEFT JOIN location ON traveler.location_id = location.id WHERE email = ?;";
		try {
			db1.open();
			con = db1.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setString(1, email);
			rs  = stmt.executeQuery();
			if(rs.next()) {
				loc = new Location(rs.getInt("id"),rs.getString("city"),rs.getString("country"));
				traveller = new Traveller( rs.getInt("idTraveler"),rs.getString("name"),rs.getString("surname"), rs.getString("email"), rs.getString("password"),rs.getString("description"),
									loc, rs.getString("photo"));
			}
			 rs.close();
						 stmt.close();
						 db1.close();
						 return traveller;
					}catch (Exception e) {
						throw new Exception( e.getMessage() );
					}
					finally {
							try {
								db1.close();
						} catch (Exception e) {
						}
					}
				}

				public boolean existTraveller(String email) throws Exception {
						Connection con = null;
						PreparedStatement stmt = null;
						ResultSet rs = null;
						DB db1 = new DB();
						boolean exist=false;
						String sql = "SELECT * FROM traveler WHERE email = ? ;";
						try {
							db1.open();
							con = db1.getConnection();
							stmt = con.prepareStatement(sql);
							stmt.setString(1, email);
							rs  = stmt.executeQuery();
							if(rs.next()) {
								exist = true;
							} else  {
								exist = false;
							} rs.close();
								stmt.close();
								db1.close();
								return exist;
							}catch (Exception e) {
								throw new Exception( e.getMessage() );
							}
							finally {
								try {
									db1.close();

								} catch (Exception e) {}
							}

						}



public void authenticate(String email, String password) throws Exception {

		Connection con = null;

		String sqlquery= "SELECT * FROM traveler WHERE email=? AND password=?;";

		DB db = new DB();

		try {

			db.open();

			con = db.getConnection();

			PreparedStatement stmt = con.prepareStatement(sqlquery);
			stmt.setString( 1, email );
			stmt.setString( 2, password );

			ResultSet rs = stmt.executeQuery();

			if(!rs.next()) {
				rs.close();
				stmt.close();
				db.close();
				throw new Exception("Wrong email or password");
			}

			rs.close();
			stmt.close();
			db.close();

		} catch (Exception e) {

			throw new Exception(e.getMessage());

		} finally {

			try {
				db.close();
			} catch (Exception e) {

			}

		}
	}

	public int getMaxId() throws Exception {

						DB db = new DB();
						Connection con = null;
						int maxId = 0;
						String sql = "SELECT MAX(idTraveler) FROM traveler;";

						try {
							db.open();

							con = db.getConnection();

							PreparedStatement stmt = con.prepareStatement(sql);

							ResultSet rs = stmt.executeQuery();

							while(rs.next()) {
								maxId=rs.getInt("MAX(idTraveler)");
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




			}//end