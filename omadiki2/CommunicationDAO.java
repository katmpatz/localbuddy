package omadiki2;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class CommunicationDAO {

public CommunicationDAO() { }


public List<Communication> showNewRequests(int local_id) throws Exception{

		List<Communication> communication = new ArrayList<Communication>();

		DB db = new DB();

		Connection con = null;

		TravellerDAO tr = new TravellerDAO();
		LocalBuddyDAO lb = new LocalBuddyDAO();
		Traveller trav = null;
		LocalBuddy local = null;

		String sql = "SELECT * FROM communication WHERE localbuddy_id=? and accept=?;";

			try {
					db.open();

					con = db.getConnection();

					PreparedStatement stmt = con.prepareStatement(sql);

					stmt.setInt(1, local_id);
					stmt.setBoolean(2, false);

					ResultSet rs = stmt.executeQuery();

						while(rs.next()) {
							int communication_id=rs.getInt("idCommunication");
							int traveller_id=rs.getInt("idTraveler");
							local_id=rs.getInt("localbuddy_id");
							String date=rs.getString("date");
							boolean answer=rs.getBoolean("accept");
							String message=rs.getString("message");
							trav = tr.getTravellerByID(traveller_id);
							local = lb.getLocalBuddyById(local_id);
							communication.add(new Communication(communication_id, trav, local, date, answer, message));
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

				return communication;


			}

		public List<Communication> showAnsweredRequests(int local_id) throws Exception{

							List<Communication> communication = new ArrayList<Communication>();

							DB db = new DB();

							Connection con = null;

							TravellerDAO tr = new TravellerDAO();
							LocalBuddyDAO lb = new LocalBuddyDAO();
							Traveller trav = null;
							LocalBuddy local = null;

							String sql = "SELECT * FROM communication WHERE localbuddy_id=? and accept=?;";

								try {
										db.open();

										con = db.getConnection();

										PreparedStatement stmt = con.prepareStatement(sql);

										stmt.setInt(1, local_id);
										stmt.setBoolean(2, true);

										ResultSet rs = stmt.executeQuery();

											while(rs.next()) {
												int communication_id=rs.getInt("idCommunication");
												int traveller_id=rs.getInt("idTraveler");
												local_id=rs.getInt("localbuddy_id");
												String date=rs.getString("date");
												boolean answer=rs.getBoolean("accept");
												String message=rs.getString("message");
												trav = tr.getTravellerByID(traveller_id);
												local = lb.getLocalBuddyById(local_id);
												communication.add(new Communication(communication_id, trav, local, date, answer, message));
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

									return communication;


			}

			public List<Communication> getCommunication() throws Exception{

					List<Communication> communication = new ArrayList<Communication>();

					DB db = new DB();

					Connection con = null;

					TravellerDAO tr = new TravellerDAO();
					LocalBuddyDAO lb = new LocalBuddyDAO();
					Traveller trav = null;
					LocalBuddy local = null;

					String sql = "SELECT * FROM communication ;";

						try {
								db.open();

								con = db.getConnection();

								PreparedStatement stmt = con.prepareStatement(sql);



								ResultSet rs = stmt.executeQuery();

									while(rs.next()) {
										int communication_id=rs.getInt("idCommunication");
										int traveller_id=rs.getInt("idTraveler");
										int local_id=rs.getInt("localbuddy_id");
										String date=rs.getString("date");
										boolean answer=rs.getBoolean("accept");
										String message=rs.getString("message");
										trav = tr.getTravellerByID(traveller_id);
										local = lb.getLocalBuddyById(local_id);
										communication.add(new Communication(communication_id, trav, local, date, answer, message));
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

							return communication;


			}

			public List<Communication> showResponse(int traveller_id) throws Exception{

					List<Communication> communication = new ArrayList<Communication>();

					DB db = new DB();

					Connection con = null;

					TravellerDAO tr = new TravellerDAO();
					LocalBuddyDAO lb = new LocalBuddyDAO();
					Traveller trav = null;
					LocalBuddy local = null;

					String sql = "SELECT * FROM communication WHERE idTraveler=? and accept=? ;";

						try {
								db.open();

								con = db.getConnection();

								PreparedStatement stmt = con.prepareStatement(sql);

								stmt.setInt(1, traveller_id);
								stmt.setBoolean(2, true);

								ResultSet rs = stmt.executeQuery();

									while(rs.next()) {
										int communication_id=rs.getInt("idCommunication");
										traveller_id=rs.getInt("idTraveler");
										int local_id=rs.getInt("localbuddy_id");
										String date=rs.getString("date");
										boolean answer=rs.getBoolean("accept");
										trav = tr.getTravellerByID(traveller_id);
										local = lb.getLocalBuddyByTraveller(local_id);
										String message=rs.getString("message");
										communication.add(new Communication(communication_id, trav, local, date, answer, message));
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

							return communication;


			}

			public void deleteRequest(int com_id)throws Exception{
				DB db = new DB();
				Connection con = null;
				PreparedStatement stmt = null;
				String sql1 = "DELETE FROM communication WHERE idCommunication=? ";
				try {
					db.open(); //open connection
					con = db.getConnection(); //get Connection object
					stmt = con.prepareStatement(sql1);
					stmt.setInt(1,com_id);

					stmt.executeUpdate();

					stmt.close(); //κλείσιμο του Statement (ή PreparedStatement)
					con.close(); //κλείσιμο συνεδρίας σύνδεσης με την βάση
				} catch (SQLException e) {
					throw new Exception( e.getMessage() );
				} finally {

					try {
						db.close();
					} catch (Exception e) {
					//no need to do anything...
					}
				}

			}

			public void acceptRequest(int com_id)throws Exception{
				DB db = new DB();
				Connection con = null;
				PreparedStatement stmt = null;
				String sql1 = "UPDATE communication SET accept = ? WHERE idCommunication = ?;";
				try {
					db.open(); //open connection
					con = db.getConnection(); //get Connection object
					stmt = con.prepareStatement(sql1);
					stmt.setBoolean(1,true);
					stmt.setInt(2,com_id);

					stmt.executeUpdate();
					stmt.close(); //κλείσιμο του Statement (ή PreparedStatement)
					con.close(); //κλείσιμο συνεδρίας σύνδεσης με την βάση
					} catch (SQLException e) {
						throw new Exception( e.getMessage() );
					} finally {

						try {
							db.close();
						} catch (Exception e) {
							//no need to do anything...
						}
					}
			}

			public void saveCommunication(Communication com) throws Exception {

					DB db = new DB();
					String when = com.getDate();

					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
					java.util.Date date = sdf.parse(when);
                    java.sql.Date sqlDate = new Date(date.getTime());

					Connection con = null;
					PreparedStatement stmt = null;
					String sql1 = "INSERT INTO communication values(?,?,?,?,?,?)";
					try {
							db.open(); //open connection
							con = db.getConnection(); //get Connection object
							stmt = con.prepareStatement(sql1);
							stmt.setInt(1,com.getId());
							stmt.setBoolean(2,com.getAnswer());
							stmt.setDate(3,sqlDate);
							stmt.setInt(4,com.getLocalBuddy().getId());
							stmt.setInt(5,com.getTraveller().getId());
							stmt.setString(6,com.getMessage());
							int rowsInserted = stmt.executeUpdate();

							stmt.close(); //κλείσιμο του Statement (ή PreparedStatement)
							con.close(); //κλείσιμο συνεδρίας σύνδεσης με την βάση
							} catch (SQLException e) {
							  	throw new Exception( e.getMessage() );
					} finally {

						try {
							db.close();
						} catch (Exception e) {
							//no need to do anything...
						}

					}

				}

				public int getMaxId() throws Exception {

					DB db = new DB();
					Connection con = null;
					int maxId = 0;
					String sql = "SELECT MAX(idCommunication) FROM communication;";

					try {
						db.open();

						con = db.getConnection();

						PreparedStatement stmt = con.prepareStatement(sql);

						ResultSet rs = stmt.executeQuery();

						while(rs.next()) {
							maxId=rs.getInt("MAX(idCommunication)");
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

