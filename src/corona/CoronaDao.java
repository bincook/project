package corona;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class CoronaDao {
	
	Connection conn;
	
	public CoronaDao() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://26.168.126.112:3306/guro_project_1";
		conn = DriverManager.getConnection(url,"kyb","1234");
	}
	public CoronaDto top() throws Exception {
		
		String sql ="SELECT *\r\n" + 
				",(select infected_count from `covid status` WHERE DATE='2021-09-01')-(select infected_count from `covid status` WHERE DATE='2021-08-31') AS infected_count_cha\r\n" + 
				",(select release_from_quarantine_count from `covid status` WHERE DATE='2021-09-01')-(select release_from_quarantine_count from `covid status` WHERE DATE='2021-08-31') AS release_from_quarantine_count_cha\r\n" + 
				",(select deaths_count from `covid status` WHERE DATE='2021-09-01')-(select deaths_count from `covid status` WHERE DATE='2021-08-31') AS deaths_count_cha\r\n" + 
				",(select examine_count from `covid status` WHERE DATE='2021-09-01')-(select examine_count from `covid status` WHERE DATE='2021-08-31') AS examine_count_cha\r\n" + 
				"FROM `covid status` ORDER BY DATE desc LIMIT 1";
		
		Statement stmt = conn.createStatement();
		
		ResultSet rs = stmt.executeQuery(sql);
		
		rs.next();
		
		CoronaDto dto = new CoronaDto();
		
		dto.setCovid_status_id(rs.getInt("covid_status_id"));//번호
		dto.setInfected_count(rs.getInt("infected_count"));//확진자수
		dto.setDeaths_count(rs.getInt("deaths_count"));//사망자수
		dto.setExamine_count(rs.getInt("examine_count"));//검사진행
		dto.setNegative_count(rs.getInt("negative_count"));//음성
		dto.setHealing_count(rs.getInt("healing_count"));//치료중 환자
		dto.setRelease_from_quarantine_count(rs.getInt("release_from_quarantine_count"));//격리해제
		dto.setAccumulated_inspection_count(rs.getInt("accumulated_inspection_count"));//누적 검사
		dto.setAccumulated_inspection_comp_count(rs.getInt("accumulated_inspection_comp_count"));//누적 검사 완료
		dto.setAccumulated_infected_rate(rs.getString("accumulated_infected_rate"));//누적확진률
		dto.setDate(rs.getString("date"));//날짜
		
		dto.setInfected_count_cha(rs.getInt("infected_count_cha"));
		dto.setRelease_from_quarantine_count_cha(rs.getInt("release_from_quarantine_count_cha"));
		dto.setDeaths_count_cha(rs.getInt("deaths_count_cha"));
		dto.setExamine_count_cha(rs.getInt("examine_count_cha"));
		
		return dto;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
