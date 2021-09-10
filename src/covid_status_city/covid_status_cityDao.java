package covid_status_city;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class covid_status_cityDao {
	
	Connection conn;
	
	public covid_status_cityDao() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://26.168.126.112:3306/guro_project_1";
		conn = DriverManager.getConnection(url, "ysj","1234");
	}
	
	public covid_status_cityDto city_list(String city_id) throws Exception {
		String sql = "select * from `covid status by city` where city_id = ? order by date desc";
		
		PreparedStatement p1 = conn.prepareStatement(sql);
		p1.setString(1, city_id);
		ResultSet rs = p1.executeQuery();
	
		rs.next();
		
		covid_status_cityDto cscd = new covid_status_cityDto();
		cscd.setCity_id(rs.getInt("city_id"));
		cscd.setInfected_count(rs.getInt("infected_count"));
		cscd.setHealing_count(rs.getInt("healing_count"));
		cscd.setDeaths_count(rs.getInt("deaths_count"));
		cscd.setInfected_rate(rs.getInt("infected_rate"));
		cscd.setDate(rs.getString("date"));
		
		return cscd;
	}
}
