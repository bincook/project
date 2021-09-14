package covid_status_city;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;  

public class CovidStatusCityDao {
	
	Connection conn;
	
	public CovidStatusCityDao() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://26.168.126.112:3306/guro_project_1";
		conn = DriverManager.getConnection(url, "ysj","1234");
	}
	
	public ArrayList<CovidStatusCityDto> city_list(String city_id, int year, int month) throws Exception {
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
		
		
//		SELECT covid.*, city.*
//		FROM `covid status by city` covid 
//		left JOIN (SELECT city.*, iss.title, iss.occurrence_date FROM `korea city` city inner JOIN `issue` iss USING(city_id) WHERE iss.city_id = 2 ) city
//		on covid.date = city.occurrence_date
//		WHERE '2021/4/1' <= covid.date and covid.date < '2021/5/30' and covid.city_id = 2
//		Order by covid.date asc

		String sql = new StringBuilder()
				.append("SELECT covid.*, city.*, korea.name_ko ")
				.append("FROM `covid status by city` covid ")
				.append("left JOIN (SELECT iss.title, iss.description, iss.occurrence_date FROM `korea city` city inner JOIN `issue` iss USING(city_id) WHERE iss.city_id = ? ) city ")
				.append("on covid.date = city.occurrence_date ")
				.append("INNER JOIN `korea city` korea ")
				.append("ON covid.city_id = korea.city_id ")
				.append("WHERE ? <= covid.date and covid.date < ? and covid.city_id = ? ")
				.append("Order by covid.date asc")
				.toString()
		;
		 
		
		LocalDate originDate = LocalDate.of(year, month, 1);
		LocalDate addedMonthDate = originDate.plusMonths(1);
			
		
				
		PreparedStatement p1 = conn.prepareStatement(sql);

		p1.setString(1, city_id);
		p1.setDate(2, Date.valueOf(originDate));
		p1.setDate(3, Date.valueOf(addedMonthDate));
		p1.setString(4, city_id);

		ResultSet rs = p1.executeQuery();
		
		ArrayList<CovidStatusCityDto> list = new ArrayList<CovidStatusCityDto>();
		while(rs.next()) {
			
				
			CovidStatusCityDto cscd = new CovidStatusCityDto();
			cscd.setCity_id(rs.getInt("city_id"));
			cscd.setInfected_count(rs.getInt("infected_count"));
			cscd.setHealing_count(rs.getInt("healing_count"));
			cscd.setDeaths_count(rs.getInt("deaths_count"));
			cscd.setInfected_rate(rs.getInt("infected_rate"));
			cscd.setDate(rs.getString("date"));
			cscd.setName_ko(rs.getString("name_ko"));
			cscd.setTitle(rs.getString("title"));
			cscd.setDescription(rs.getString("description")); 
		
			list.add(cscd);
		}
		return list;
	}
	
	public void issue_insert_ok(String city_id, String title, String date, String description, String link) throws Exception {
		String sql = "INSERT INTO issue (city_id, title, description, link, occurrence_date)";
		sql = sql + " VALUES (?, ?, ?, ?, ?)";
		
		PreparedStatement p1 = conn.prepareStatement(sql);
		p1.setString(1, city_id);
		p1.setString(2, title);
		p1.setString(3, description);
		p1.setString(4, link);
		p1.setString(5, date);
		p1.executeUpdate();
		p1.close();
		conn.close();
	}
	
	public void issue_delete_ok(String issue_id) throws Exception {
		String sql = "DELETE FROM issue WHERE issue_id = ?";
		
		PreparedStatement p1 = conn.prepareStatement(sql);
		p1.setString(1, issue_id);
		p1.executeUpdate();
		p1.close();
		conn.close();
	}
	
	public ArrayList<CovidStatusCityDto> issue_list(int year, int month) throws Exception {
		String sql = "SELECT i1.title, i1.occurrence_date, c1.name_ko, i1.issue_id FROM issue i1 LEFT JOIN `korea city` c1";
		sql = sql + " using(city_id)";
		sql = sql + " where ? <= i1.occurrence_date and ? > i1.occurrence_date";
		
		PreparedStatement p1 = conn.prepareStatement(sql);
		if(month != 12) {
			p1.setString(1, year+"/"+month+"/01");
			p1.setString(2, year+"/"+(month+1)+"/01");
		}
		else {
			p1.setString(1, year+"/"+month+"/01");
			p1.setString(2, (year+1)+"/1/01");
		}
		ResultSet rs = p1.executeQuery();
		ArrayList<CovidStatusCityDto> list = new ArrayList<CovidStatusCityDto>();
		while(rs.next()) {
		
			CovidStatusCityDto cscd = new CovidStatusCityDto();
			cscd.setName_ko(rs.getString("name_ko"));
			cscd.setTitle(rs.getString("title"));
			cscd.setOccurrence_date(rs.getString("occurrence_date"));
			cscd.setIssue_id(rs.getInt("issue_id"));
			
			list.add(cscd);
		}
		
		return list;
	}
	
	public ArrayList<CovidStatusCityDto> showIssue(int year, int month) throws Exception {
		String sql = "SELECT issue.*, covid.date ";
		sql = sql + "FROM issue JOIN `covid status by city` AS covid ";
		sql = sql + "ON issue.occurrence_date = covid.date ";
		sql = sql + "WHERE ? <= issue.occurrence_date AND ? > issue.occurrence_date";
		
		PreparedStatement p1 = conn.prepareStatement(sql);
		if(month != 12) {
			p1.setString(1, year+"/"+month+"/01");
			p1.setString(2, year+"/"+(month+1)+"/01");
		}
		else {
			p1.setString(1, year+"/"+month+"/01");
			p1.setString(2, (year+1)+"/1/01");
		}
		
		ResultSet rs = p1.executeQuery();
		ArrayList<CovidStatusCityDto> ilist = new ArrayList<CovidStatusCityDto>();
		while(rs.next()) {
			CovidStatusCityDto dto = new CovidStatusCityDto();
			dto.setTitle(rs.getString("title"));
			
			ilist.add(dto);
		}
		
		//ilist.forEach(System.err::println);
		
		return ilist;
	}
}
