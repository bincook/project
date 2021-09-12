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
	
	public ArrayList<covid_status_cityDto> city_list(String city_id, int year, int month) throws Exception {
		/*
		 * String sql =
		 * "select r1.city_id, r1.infected_count, r1.healing_count, r1.deaths_count,";
		 * sql = sql + " r1.infected_rate, r1.date, r2.name_ko "; sql = sql +
		 * "from `covid status by city` as r1, `korea city` as r2 "; sql = sql +
		 * "where r1.city_id = r2.city_id and "; sql = sql +
		 * "r1.city_id = ? order by date desc";
		 */
		/*
		 * PreparedStatement p1 = conn.prepareStatement(sql);
		 * p1.setString(1, city_id);
		 * ResultSet rs = p1.executeQuery();
		 */
		
		
		String sql = "select covid.*, city.name_ko from `covid status by city` covid LEFT JOIN `korea city` city";
		sql = sql + " using(city_id)";
		sql = sql + " where ? <= covid.date and covid.date < ? and covid.city_id = ?";
		sql = sql + " Order by covid.date asc";
		
		PreparedStatement p1 = conn.prepareStatement(sql);
		if(month != 12) {
			p1.setString(1, year+"/"+month+"/01");
			p1.setString(2, year+"/"+(month+1)+"/01");
			p1.setString(3, city_id);
		}
		else {
			p1.setString(1, year+"/"+month+"/01");
			p1.setString(2, (year+1)+"/1/01");
			p1.setString(3, city_id);
		}
		ResultSet rs = p1.executeQuery();
		
		ArrayList<covid_status_cityDto> list = new ArrayList<covid_status_cityDto>();
		while(rs.next()) {
		
			covid_status_cityDto cscd = new covid_status_cityDto();
			cscd.setCity_id(rs.getInt("city_id"));
			cscd.setInfected_count(rs.getInt("infected_count"));
			cscd.setHealing_count(rs.getInt("healing_count"));
			cscd.setDeaths_count(rs.getInt("deaths_count"));
			cscd.setInfected_rate(rs.getInt("infected_rate"));
			cscd.setDate(rs.getString("date"));
			cscd.setName_ko(rs.getString("name_ko"));
		
			list.add(cscd);
		}
		return list;
	}
}
