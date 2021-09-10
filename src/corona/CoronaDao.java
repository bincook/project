package corona;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

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

	public List<CoronaDto> findAll() throws Exception {
		LocalDate now = LocalDate.now();
		LocalDate monthAgo = now.minusMonths(1);

		String sql = "SELECT * FROM `covid status` WHERE ? <= date and date <= ? ORDER BY date";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setDate(1, Date.valueOf(monthAgo));
		pstmt.setDate(2, Date.valueOf(now));

		ResultSet rs = pstmt.executeQuery();

		List<CoronaDto> coronaDtoList = new ArrayList<>();
		CoronaDto dto;

		while (rs.next()) {
			dto = new CoronaDto();
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

			coronaDtoList.add(dto);
		}

		return coronaDtoList;
	}

	public CoronaDto dstatus() throws Exception {
		
		String sql="SELECT \r\n" + 
				"(select infected_count from `covid status` WHERE DATE='2021-09-01')-(select infected_count from `covid status` WHERE DATE='2021-08-31') AS one\r\n" + 
				",(select infected_count from `covid status` WHERE DATE='2021-08-31')-(select infected_count from `covid status` WHERE DATE='2021-08-30') AS two\r\n" + 
				",(select infected_count from `covid status` WHERE DATE='2021-08-30')-(select infected_count from `covid status` WHERE DATE='2021-08-29') AS three\r\n" + 
				",(select infected_count from `covid status` WHERE DATE='2021-08-29')-(select infected_count from `covid status` WHERE DATE='2021-08-28') AS four\r\n" + 
				",(select infected_count from `covid status` WHERE DATE='2021-08-28')-(select infected_count from `covid status` WHERE DATE='2021-08-27') AS five\r\n" + 
				",(select infected_count from `covid status` WHERE DATE='2021-08-27')-(select infected_count from `covid status` WHERE DATE='2021-08-26') AS six\r\n" + 
				",(select infected_count from `covid status` WHERE DATE='2021-08-26')-(select infected_count from `covid status` WHERE DATE='2021-08-25') AS seven\r\n" + 
				"FROM `covid status` ORDER BY DATE desc LIMIT 1";
		
		Statement stmt = conn.createStatement();
		
		ResultSet rs = stmt.executeQuery(sql);
		
		rs.next();
		
		CoronaDto dto = new CoronaDto();
		
		dto.setOne(rs.getInt("one"));
		dto.setTwo(rs.getInt("two"));
		dto.setThree(rs.getInt("three"));
		dto.setFour(rs.getInt("four"));
		dto.setFive(rs.getInt("five"));
		dto.setSix(rs.getInt("six"));
		dto.setSeven(rs.getInt("seven"));
		
		return dto;
	}
	
	
}
