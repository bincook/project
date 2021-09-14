package vaccination_status;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class VaccinationStatusDao {

	Connection conn;

	public VaccinationStatusDao() throws Exception {

		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://26.168.126.112:3306/guro_project_1";
		conn = DriverManager.getConnection(url, "sje2", "1234");
	}

	public ArrayList<VaccinationStatusDto> getVaccination() throws Exception {
		
		
		String sql = "select vs.*, kc.name_ko, kc.population_count from `vaccination status` vs inner join `korea city` kc using(city_id)";

		Statement stmt = conn.createStatement();

		ResultSet rs = stmt.executeQuery(sql);

		ArrayList<VaccinationStatusDto> list = new ArrayList<>();
		while (rs.next()) {

			VaccinationStatusDto dto = new VaccinationStatusDto();

			dto.setDate(rs.getString("date"));
			dto.setVaccination_status_id(rs.getInt("vaccination_status_id"));
			dto.setCity_id(rs.getInt("city_id"));
			dto.setTotal_count(rs.getInt("total_count"));
			dto.setPrimary_count(rs.getInt("primary_count"));
			dto.setSecondary_count(rs.getInt("secondary_count"));
			dto.setCityNameKo(rs.getString("name_ko"));
			dto.setPopulation_count(rs.getInt("population_count"));

			list.add(dto);
			
			

		}
		
		stmt.close();
		conn.close();

		return list;

	}

}
