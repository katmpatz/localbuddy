package omadiki2;

import java.sql.*;
import java.util.List;
import java.util.ArrayList;

public class LocalBuddyDAO {
 public LocalBuddyDAO() {}

 public void saveLocalBuddy(LocalBuddy localbuddy) throws Exception {
  Connection con = null;
  PreparedStatement stmt = null;
  DB db1 = new DB();
  String sql = "INSERT INTO LocalBuddy VALUES (?,?,?,?,?,?);";
  try {
   db1.open();
   con = db1.getConnection();
   stmt = con.prepareStatement(sql);

   stmt.setInt(1, localbuddy.getIdLocal());
   stmt.setBoolean(2, localbuddy.getStudent());
   stmt.setBoolean(3, localbuddy.getFindAHome());
   stmt.setString(4, localbuddy.getCityDescription());
   stmt.setString(5, localbuddy.getMyDescription());
   stmt.setInt(6, localbuddy.getId());


   stmt.executeUpdate();
   stmt.close();
   db1.close();
  } catch (Exception e) {
   throw new Exception(e.getMessage());
  } finally {
   try {
    db1.close();
   } catch (Exception e) {}
  }
 }

 public LocalBuddy get(int local_id) throws Exception {
  LocalBuddy local = null;
  Connection con = null;
  PreparedStatement stmt = null;
  ResultSet rs = null;
  DB db1 = new DB();
  Location loc = null;
  LocationDAO ld = new LocationDAO();
  String sql = "SELECT * FROM localbuddy LEFT JOIN traveler ON localbuddy.idTraveler = traveler.idTraveler where localbuddy_id=?;";
  try {
   db1.open();
   con = db1.getConnection();
   stmt = con.prepareStatement(sql);
   stmt.setInt(1, local_id);
   rs = stmt.executeQuery();
   if (rs.next()) {
    int lid = rs.getInt("location_id");
    loc = ld.getLocationByID(lid);
    local = new LocalBuddy(rs.getInt("idTraveler"), rs.getString("name"), rs.getString("surname"), rs.getString("email"),
     rs.getString("password"), rs.getString("description"), loc, rs.getString("photo"), rs.getInt("localbuddy_id"), rs.getBoolean("study_offers"),
     rs.getBoolean("find_home"), rs.getString("city_description"), rs.getString("my_description"));
   }
   rs.close();
   stmt.close();
   db1.close();
   return local;
  } catch (Exception e) {
   throw new Exception(e.getMessage());
  } finally {
   try {
    db1.close();
   } catch (Exception e) {}
  }
 }


 public List < LocalBuddy > getLocalBuddy() throws Exception {
  List < LocalBuddy > locals = new ArrayList < LocalBuddy > ();
  Connection con = null;
  PreparedStatement stmt = null;
  ResultSet rs = null;
  DB db1 = new DB();
  Location loc = null;
  LocationDAO ld = new LocationDAO();
  String sql = "SELECT * FROM localbuddy  LEFT JOIN traveler ON localbuddy.idTraveler = traveler.idTraveler;";
  try {
   db1.open();
   con = db1.getConnection();
   stmt = con.prepareStatement(sql);
   rs = stmt.executeQuery();
   while (rs.next()) {
    int lid = rs.getInt("location_id");
    loc = ld.getLocationByID(lid);
    locals.add(new LocalBuddy(rs.getInt("idTraveler"), rs.getString("name"), rs.getString("surname"), rs.getString("email"),
     rs.getString("password"), rs.getString("description"), loc, rs.getString("photo"), rs.getInt("localbuddy_id"), rs.getBoolean("study_offers"),
     rs.getBoolean("find_home"), rs.getString("city_description"), rs.getString("my_description")));
   }
   rs.close();
   stmt.close();
   db1.close();
   return locals;
  } catch (Exception e) {
   throw new Exception(e.getMessage());
  } finally {
   try {
    db1.close();
   } catch (Exception e) {}
  }
 }

 public LocalBuddy getLocalBuddyByTraveller(int traveller_id) throws Exception {
  LocalBuddy local = null;
  Connection con = null;
  PreparedStatement stmt = null;
  ResultSet rs = null;
  DB db1 = new DB();
  Location loc = null;
  LocationDAO ld = new LocationDAO();
  String sql = "SELECT * FROM localbuddy LEFT JOIN traveler ON localbuddy.idTraveler = traveler.idTraveler where localbuddy.idTraveler=?;";
  try {
   db1.open();
   con = db1.getConnection();
   stmt = con.prepareStatement(sql);
   stmt.setInt(1, traveller_id);
   rs = stmt.executeQuery();
   if (rs.next()) {
    int lid = rs.getInt("location_id");
    loc = ld.getLocationByID(lid);
    local = new LocalBuddy(rs.getInt("idTraveler"), rs.getString("name"), rs.getString("surname"), rs.getString("email"),
     rs.getString("password"), rs.getString("description"), loc, rs.getString("photo"), rs.getInt("localbuddy_id"), rs.getBoolean("study_offers"),
     rs.getBoolean("find_home"), rs.getString("city_description"), rs.getString("my_description"));
   }
   rs.close();
   stmt.close();
   db1.close();
   return local;
  } catch (Exception e) {
   throw new Exception(e.getMessage());
  } finally {
   try {
    db1.close();
   } catch (Exception e) {}
  }
 }

 public List < LocalBuddy > findLocals(int id, int reason) throws Exception {

  List < LocalBuddy > locals = new ArrayList < LocalBuddy > ();
  Connection con = null;
  PreparedStatement stmt = null;
  ResultSet rs = null;
  DB db1 = new DB();
  LocationDAO ld = new LocationDAO();
  Location loc = null;
  String sql;
  if (reason == 1) {
   sql = "SELECT * FROM localbuddy  LEFT JOIN traveler ON localbuddy.idTraveler = traveler.idTraveler WHERE location_id = ?;";
  } else if (reason == 2) {
   sql = "SELECT * FROM localbuddy  LEFT JOIN traveler ON localbuddy.idTraveler = traveler.idTraveler WHERE location_id = ? and study_offers = ? ORDER BY study_offers;";
  } else {
   sql = "SELECT * FROM localbuddy  LEFT JOIN traveler ON localbuddy.idTraveler = traveler.idTraveler WHERE location_id = ? and find_home = ? ORDER BY find_home;";
  }

  try {
   db1.open();
   con = db1.getConnection();
   stmt = con.prepareStatement(sql);
   if (reason == 1) {
    stmt.setInt(1, id);
   } else if (reason == 2) {
    stmt.setInt(1, id);
    stmt.setBoolean(2, true);
   } else {
    stmt.setInt(1, id);
    stmt.setBoolean(2, true);
   }

   rs = stmt.executeQuery();
   while (rs.next()) {
    int lid = rs.getInt("location_id");
    loc = ld.getLocationByID(lid);
    locals.add(new LocalBuddy(rs.getInt("idTraveler"), rs.getString("name"), rs.getString("surname"), rs.getString("email"),
     rs.getString("password"), rs.getString("description"), loc, rs.getString("photo"), rs.getInt("localbuddy_id"), rs.getBoolean("study_offers"),
     rs.getBoolean("find_home"), rs.getString("city_description"), rs.getString("my_description")));
   }
   rs.close();
   stmt.close();
   db1.close();
   return locals;
  } catch (Exception e) {
   throw new Exception(e.getMessage());
  } finally {
   try {
    db1.close();
   } catch (Exception e) {}
  }
 }

 public int getMaxId() throws Exception {

  DB db = new DB();
  Connection con = null;
  int maxId = 0;
  String sql = "SELECT MAX(localbuddy_id) FROM localbuddy;";

  try {
   db.open();

   con = db.getConnection();

   PreparedStatement stmt = con.prepareStatement(sql);

   ResultSet rs = stmt.executeQuery();

   while (rs.next()) {
    maxId = rs.getInt("MAX(localbuddy_id)");
   }

   rs.close(); //κλείσιμο του ResultSet
   stmt.close(); //κλείσιμο του Statement (ή PreparedStatement)
   con.close(); //κλείσιμο συνεδρίας σύνδεσης με την βάση
  } catch (SQLException e) {
   throw new Exception(e.getMessage());
  } finally {
   try {
    db.close();
   } catch (Exception e) {}
  }

  return maxId;


 }
}