package corona;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

public class CoronaDao {
	
	Connection conn;
	
	public CoronaDao() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://26.168.126.112:3306/guro_project_1";
		conn = DriverManager.getConnection(url,"kyb","1234");
	}
	public CoronaDto top() throws Exception {
		
		String sql ="SELECT *\r\n" + 
				",(select infected_count from `covid status` WHERE DATE=date_add(curdate(), interval -4 day))-(select infected_count from `covid status` WHERE DATE=date_add(curdate(), interval -5 day)) AS infected_count_cha\r\n" + 
				",(select release_from_quarantine_count from `covid status` WHERE DATE=date_add(curdate(), interval -4 day))-(select release_from_quarantine_count from `covid status` WHERE DATE=date_add(curdate(), interval -5 day)) AS release_from_quarantine_count_cha\r\n" + 
				",(select deaths_count from `covid status` WHERE DATE=date_add(curdate(), interval -4 day))-(select deaths_count from `covid status` WHERE DATE=date_add(curdate(), interval -5 day)) AS deaths_count_cha\r\n" + 
				",(select examine_count from `covid status` WHERE DATE=date_add(curdate(), interval -4 day))-(select examine_count from `covid status` WHERE DATE=date_add(curdate(), interval -5 day)) AS examine_count_cha\r\n" + 
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
		String sql = "SELECT * FROM `covid status` ORDER BY date";

		PreparedStatement pstmt = conn.prepareStatement(sql);

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
				"(select infected_count from `covid status` WHERE DATE=date_add(curdate(), interval -4 day))-(select infected_count from `covid status` WHERE DATE=date_add(curdate(), interval -5 day)) AS one\r\n" + 
				",(select infected_count from `covid status` WHERE DATE=date_add(curdate(), interval -5 day))-(select infected_count from `covid status` WHERE DATE=date_add(curdate(), interval -6 day)) AS two\r\n" + 
				",(select infected_count from `covid status` WHERE DATE=date_add(curdate(), interval -6 day))-(select infected_count from `covid status` WHERE DATE=date_add(curdate(), interval -7 day)) AS three\r\n" + 
				",(select infected_count from `covid status` WHERE DATE=date_add(curdate(), interval -7 day))-(select infected_count from `covid status` WHERE DATE=date_add(curdate(), interval -8 day)) AS four\r\n" + 
				",(select infected_count from `covid status` WHERE DATE=date_add(curdate(), interval -8 day))-(select infected_count from `covid status` WHERE DATE=date_add(curdate(), interval -9 day)) AS five\r\n" + 
				",(select infected_count from `covid status` WHERE DATE=date_add(curdate(), interval -9 day))-(select infected_count from `covid status` WHERE DATE=date_add(curdate(), interval -10 day)) AS six\r\n" + 
				",(select infected_count from `covid status` WHERE DATE=date_add(curdate(), interval -10 day))-(select infected_count from `covid status` WHERE DATE=date_add(curdate(), interval -11 day)) AS seven\r\n" + 
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
	
	
	public ArrayList<CityDto> city_status() throws Exception {
		String sql="SELECT city_id,infected_count FROM `covid status by city` WHERE DATE=date_add(curdate(), interval -5 day)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs =  pstmt.executeQuery();
		
		ArrayList<CityDto> list = new ArrayList<CityDto>();
		
		while(rs.next()) {
			CityDto cdto = new CityDto();
			
			cdto.setCity_id(rs.getInt("city_id"));
			cdto.setInfected_count(rs.getInt("infected_count"));
			
			list.add(cdto);
		}
		return list;
	}
	
	public ArrayList<CityDto> city_status_new() throws Exception {
		
		
		String sql ="SELECT \r\n" + 
				" (SELECT infected_count FROM `covid status by city` WHERE DATE = date_add(curdate(), interval -5 day) AND city_id=2) - (SELECT infected_count FROM `covid status by city` WHERE DATE = date_add(curdate(), interval -6 day) AND city_id=2) AS a2\r\n" + 
				",(SELECT infected_count FROM `covid status by city` WHERE DATE = date_add(curdate(), interval -5 day) AND city_id=3) - (SELECT infected_count FROM `covid status by city` WHERE DATE = date_add(curdate(), interval -6 day) AND city_id=3) AS a3\r\n" + 
				",(SELECT infected_count FROM `covid status by city` WHERE DATE = date_add(curdate(), interval -5 day) AND city_id=4) - (SELECT infected_count FROM `covid status by city` WHERE DATE = date_add(curdate(), interval -6 day) AND city_id=4) AS a4\r\n" + 
				",(SELECT infected_count FROM `covid status by city` WHERE DATE = date_add(curdate(), interval -5 day) AND city_id=5) - (SELECT infected_count FROM `covid status by city` WHERE DATE = date_add(curdate(), interval -6 day) AND city_id=5) AS a5\r\n" + 
				",(SELECT infected_count FROM `covid status by city` WHERE DATE = date_add(curdate(), interval -5 day) AND city_id=6) - (SELECT infected_count FROM `covid status by city` WHERE DATE = date_add(curdate(), interval -6 day) AND city_id=6) AS a6\r\n" + 
				",(SELECT infected_count FROM `covid status by city` WHERE DATE = date_add(curdate(), interval -5 day) AND city_id=7) - (SELECT infected_count FROM `covid status by city` WHERE DATE = date_add(curdate(), interval -6 day) AND city_id=7) AS a7\r\n" + 
				",(SELECT infected_count FROM `covid status by city` WHERE DATE = date_add(curdate(), interval -5 day) AND city_id=8) - (SELECT infected_count FROM `covid status by city` WHERE DATE = date_add(curdate(), interval -6 day) AND city_id=8) AS a8\r\n" + 
				",(SELECT infected_count FROM `covid status by city` WHERE DATE = date_add(curdate(), interval -5 day) AND city_id=9) - (SELECT infected_count FROM `covid status by city` WHERE DATE = date_add(curdate(), interval -6 day) AND city_id=9) AS a9\r\n" + 
				",(SELECT infected_count FROM `covid status by city` WHERE DATE = date_add(curdate(), interval -5 day) AND city_id=10) - (SELECT infected_count FROM `covid status by city` WHERE DATE = date_add(curdate(), interval -6 day) AND city_id=10) AS a10\r\n" + 
				",(SELECT infected_count FROM `covid status by city` WHERE DATE = date_add(curdate(), interval -5 day) AND city_id=11) - (SELECT infected_count FROM `covid status by city` WHERE DATE = date_add(curdate(), interval -6 day) AND city_id=11) AS a11\r\n" + 
				",(SELECT infected_count FROM `covid status by city` WHERE DATE = date_add(curdate(), interval -5 day) AND city_id=12) - (SELECT infected_count FROM `covid status by city` WHERE DATE = date_add(curdate(), interval -6 day) AND city_id=12) AS a12\r\n" + 
				",(SELECT infected_count FROM `covid status by city` WHERE DATE = date_add(curdate(), interval -5 day) AND city_id=13) - (SELECT infected_count FROM `covid status by city` WHERE DATE = date_add(curdate(), interval -6 day) AND city_id=13) AS a13\r\n" + 
				",(SELECT infected_count FROM `covid status by city` WHERE DATE = date_add(curdate(), interval -5 day) AND city_id=14) - (SELECT infected_count FROM `covid status by city` WHERE DATE = date_add(curdate(), interval -6 day) AND city_id=14) AS a14\r\n" + 
				",(SELECT infected_count FROM `covid status by city` WHERE DATE = date_add(curdate(), interval -5 day) AND city_id=15) - (SELECT infected_count FROM `covid status by city` WHERE DATE = date_add(curdate(), interval -6 day) AND city_id=15) AS a15\r\n" + 
				",(SELECT infected_count FROM `covid status by city` WHERE DATE = date_add(curdate(), interval -5 day) AND city_id=16) - (SELECT infected_count FROM `covid status by city` WHERE DATE = date_add(curdate(), interval -6 day) AND city_id=16) AS a16\r\n" + 
				",(SELECT infected_count FROM `covid status by city` WHERE DATE = date_add(curdate(), interval -5 day) AND city_id=17) - (SELECT infected_count FROM `covid status by city` WHERE DATE = date_add(curdate(), interval -6 day) AND city_id=17) AS a17\r\n" + 
				",(SELECT infected_count FROM `covid status by city` WHERE DATE = date_add(curdate(), interval -5 day) AND city_id=18) - (SELECT infected_count FROM `covid status by city` WHERE DATE = date_add(curdate(), interval -6 day) AND city_id=18) AS a18\r\n" + 
				" FROM `covid status by city` LIMIT 1";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ArrayList<CityDto> list = new ArrayList<CityDto>();
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			CityDto cdto = new CityDto();
			
			cdto.setA2(rs.getInt("a2"));
			cdto.setA3(rs.getInt("a3"));
			cdto.setA4(rs.getInt("a4"));
			cdto.setA5(rs.getInt("a5"));
			cdto.setA6(rs.getInt("a6"));
			cdto.setA7(rs.getInt("a7"));
			cdto.setA8(rs.getInt("a8"));
			cdto.setA9(rs.getInt("a9"));
			cdto.setA10(rs.getInt("a10"));
			cdto.setA11(rs.getInt("a11"));
			cdto.setA12(rs.getInt("a12"));
			cdto.setA13(rs.getInt("a13"));
			cdto.setA14(rs.getInt("a14"));
			cdto.setA15(rs.getInt("a15"));
			cdto.setA16(rs.getInt("a16"));
			cdto.setA17(rs.getInt("a17"));
			cdto.setA18(rs.getInt("a18"));
			
			list.add(cdto);
			
		}
		return list;
	}
	
	public ArrayList<DistanceDto> distance() throws Exception {
		

	String sql= "SELECT social_distancing_id,\r\n" + 
				"CASE WHEN city_id = 2 then '제주' \r\n" + 
				"	  WHEN city_id = 3 then '경남' \r\n" + 
				"	  WHEN city_id = 4 then '경북'\r\n" + 
				"	  WHEN city_id = 5 then '전남'\r\n" + 
				"	  WHEN city_id = 6 then '전북'\r\n" + 
				"	  WHEN city_id = 7 then '충남'\r\n" + 
				"	  WHEN city_id = 8 then '충북'\r\n" + 
				"	  WHEN city_id = 9 then '강원'\r\n" + 
				"	  WHEN city_id = 10 then '경기'\r\n" + 
				"	  WHEN city_id = 11 then '세종'\r\n" + 
				"	  WHEN city_id = 12 then '울산'\r\n" + 
				"	  WHEN city_id = 13 then '대전'\r\n" + 
				"	  WHEN city_id = 14 then '광주'\r\n" + 
				"	  WHEN city_id = 15 then '인천'\r\n" + 
				"	  WHEN city_id = 16 then '대구'\r\n" + 
				"	  WHEN city_id = 17 then '부산'\r\n" + 
				"	  WHEN city_id = 18 then '서울' \r\n" + 
				"	  ELSE '그외' \r\n" + 
				"	  END AS city_id\r\n" + 
				",step,DATE,content\r\n" + 
				"FROM `social distancing`";
		
	
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs =  pstmt.executeQuery();
		
		ArrayList<DistanceDto> list = new ArrayList<DistanceDto>();
		while(rs.next()) {
			DistanceDto ddto = new DistanceDto();
			
			ddto.setSocial_distancing_id(rs.getInt("social_distancing_id"));
			ddto.setCity_id(rs.getString("city_id"));
			ddto.setDate(rs.getString("date"));
			ddto.setStep(rs.getInt("step"));
			ddto.setContent(rs.getString("content"));
			
			list.add(ddto);

		}
		
		return list;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
