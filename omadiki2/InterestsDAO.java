package omadiki2;
import java.sql.*;
import java.util.List;
import java.util.ArrayList;

public class InterestsDAO {
	public List<Interests> getInterests() throws Exception{
			List<Interests> interests = new ArrayList<Interests>();
			Connection con = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			DB db1 = new DB();
			String sql = "SELECT * FROM interest;";
			try {
				db1.open();
				con = db1.getConnection();
				stmt = con.prepareStatement(sql);
				rs = stmt.executeQuery();
				while(rs.next()) {
					interests.add(new Interests(rs.getInt("idInterest"), rs.getString("name"),rs.getString("category")));
				}
				rs.close();
				stmt.close();
				db1.close();
				return interests;
			}catch(Exception e) {
				throw new Exception(e.getMessage());
			} finally {
				try {
					db1.close();
				}catch (Exception e) {
				}
			}

		}

		public List<Interests> getMyInterests(int traveler_id) throws Exception{
			List<Interests> myInterests = new ArrayList<Interests>();
			Connection con = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			DB db1 = new DB();
			Interests interest = null;

			String sql = "SELECT * FROM myInterest LEFT JOIN interest ON interest.idInterest = myInterest.idInterest WHERE idTraveler=?";
			try {
				db1.open();
				con = db1.getConnection();
				stmt = con.prepareStatement(sql);
				stmt.setInt(1, traveler_id);
				rs  = stmt.executeQuery();
				while(rs.next()) {
					myInterests.add( new Interests(rs.getInt("idInterest"), rs.getString("name"),rs.getString("category")));
				}
				rs.close();
				stmt.close();
				db1.close();
				return myInterests;
			} catch (Exception e) {
				throw new Exception( e.getMessage() );
			} finally {
				try {
					db1.close();
			} catch (Exception e) {}
			}
		}

		public void saveMyInterests(List<Interests> myInterests, int travellerId) throws Exception {
			for(int i=0; i<myInterests.size(); i++) {
			Connection con = null;
			PreparedStatement stmt = null;
			DB db = new DB();
				String sql = "INSERT INTO myInterest VALUES(?,?);";
				try {
					db.open();
					con = db.getConnection();
					stmt = con.prepareStatement(sql);
					stmt.setInt(1, travellerId);
					stmt.setInt(2, myInterests.get(i).getId());
					stmt.executeUpdate();

				}catch (Exception e) {
					throw new Exception(e.getMessage());
				} finally {
					try {
						stmt.close();
						db.close();
					} catch(Exception e ) {
					}
				}
			}
		}

		public Interests getInterestbyName(String name) throws Exception{
			List<Interests> interests = getInterests();
			for(int i=0;i<interests.size();i++){
				if(interests.get(i).getName().equals(name)) {
					return interests.get(i);
				}
			}
			return null;
		}


	}
