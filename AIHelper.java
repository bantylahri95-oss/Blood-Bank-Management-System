package Project;
import java.sql.*;
import java.util.*;
public class AIHelper {
	
	    // 🤖 Smart Donor Matching
	    public static List<String> findDonors(String bloodgroup) {

	        List<String> list = new ArrayList<>();

	        try {
	            Connection con = ConnectionProvider.getCon();

	            PreparedStatement ps = con.prepareStatement(
	                "SELECT name, mobilenumber FROM donor WHERE bloodgroup=?"
	            );

	            ps.setString(1, bloodgroup);

	            ResultSet rs = ps.executeQuery();

	            while(rs.next()) {
	                list.add(rs.getString("name") + " (" + rs.getString("mobilenumber") + ")");
	            }

	        } catch(Exception e) {
	            e.printStackTrace();
	        }

	        return list;
	    }

	    // 🤖 Stock Status AI
	    public static String stockStatus(int units) {
	        if(units <= 5) return "CRITICAL";
	        else if(units <= 15) return "LOW";
	        else return "GOOD";
	    }
	}

