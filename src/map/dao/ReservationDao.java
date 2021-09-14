package map.dao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import corona.CoronaDto;
import map.dto.ClinicDto;
import map.dto.ClinicTimeDto;
import map.dto.ReservationDto;
import map.util.Assertions;
import map.util.QueryUtil;

	

public class ReservationDao {
	Connection conn;
	
	public ReservationDao() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://26.168.126.112:3306/guro_project_1";
		conn = DriverManager.getConnection(url,"kyb","1234");
	}
	
	public List<ClinicDto> findAllClinic() throws Exception {
		
		String sql =" select name, clinic_id, longitude, latitude, address from Clinic";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		List<ClinicDto> list = new ArrayList<ClinicDto>();
		
		while (rs.next()) {
			list.add(
				new ClinicDto (
					rs.getInt("clinic_id"), 
					rs.getString("name"),
					rs.getDouble("longitude"),
					rs.getDouble("latitude"), 
					rs.getString("address")
				)
			);
		}
		
		return list;
	}
	
	public void settingTodayTimeTable(List<ClinicDto> dtos) throws Exception {
		
		StringBuilder sb = new StringBuilder();
		
		for (int i=0; i<dtos.size(); i++) {
			sb.append(dtos.get(i).getClinic_id());
			
			
			if (i < dtos.size() - 1)
				sb.append(",");
		}
		
		String sql =" select clinic_time_id, clinic_id, start_date, end_date, capacity from `Clinic Time` where clinic_id in (" + sb.toString() + ") and DATE(start_date)  = DATE(NOW())";
		
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		List<ClinicTimeDto> list = new ArrayList<ClinicTimeDto>();
		
		while (rs.next()) {
			list.add(
				new ClinicTimeDto (
					rs.getInt("clinic_time_id"), 
					rs.getInt("clinic_id"), 
					rs.getTimestamp("start_date"),
					rs.getTimestamp("end_date"),
					rs.getInt("capacity")
				)
			);
		}
		
		Map<Integer, List<ClinicTimeDto>> collect = list.stream().collect(Collectors.groupingBy(time -> time.getClinic_id()));
		
		dtos.stream().forEach(clinic -> clinic.setTodayTimeList(collect.get(clinic.getClinic_id())));

	}
	
	public ClinicDto findClinicById(int id) throws Exception {
		String sql = "select name, clinic_id, longitude, latitude, address from Clinic where clinic_id = %d";
		sql = String.format(sql, id);
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();
		ClinicDto dto = new ClinicDto (
								rs.getInt("clinic_id"), 
								rs.getString("name"),
								rs.getDouble("longitude"),
								rs.getDouble("latitude"), 
								rs.getString("address")
							);
		
		return dto;
	}
	
	
	public List<ClinicTimeDto> findClinictimeByClinicId(Integer clinic_id) throws Exception {
		String sql = "select clinic_time_id, start_date, end_date, capacity from `Clinic Time` where clinic_id = %d";
		sql = String.format(sql, clinic_id);
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		List<ClinicTimeDto> dtos = new ArrayList<ClinicTimeDto>();
		
		while (rs.next()) {
			dtos.add(
				new ClinicTimeDto(
					rs.getInt("clinic_time_id"), 
					rs.getTimestamp("start_date"),
					rs.getTimestamp("end_date"), 
					rs.getInt("capacity")
				)
			);
		}
		
		return dtos;
	}
	
	public List<ReservationDto> findAllReservation() throws Exception {
		String sql = "select r.reservation_id as reservation_id, m.email, " +
				"ci.name as clinic_name, c.start_date as start_date, c.end_date as end_date, " +
				"r.phone_area_code as phone_area_code, " + 
				"r.phone_number as phone_number,"+
				"r.phone_dialing_code as phone_dialing_code "+
				" from Reservation r inner join Member m on r.member_id = m.member_id inner join `Clinic Time` c on r.clinic_time_id = c.clinic_time_id inner join Clinic ci on c.clinic_id = ci.clinic_id";
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		List<ReservationDto> dtos = new ArrayList<ReservationDto>();
		
		while (rs.next()) {
			ReservationDto dto = new ReservationDto();
			dto.setReservation_id(rs.getInt("reservation_id"));
			dto.setClinic_name(rs.getString("clinic_name"));
			dto.setStart_date(rs.getDate("start_date"));
			dto.setEnd_date(rs.getDate("end_date"));
			dto.setPhone_area_code(rs.getString("phone_area_code"));
			dto.setPhone_number(rs.getString("phone_number"));
			dto.setPhone_dialing_code(rs.getString("phone_dialing_code"));
			dto.setMember_email(rs.getString("email"));
			dtos.add(dto);
		}
		
		System.out.println(dtos.size());
		
		return dtos;
	}
	
	public List<ReservationDto> findAllReservationByMemberId(int member_id) throws Exception {
		String sql = "select r.reservation_id as reservation_id, m.email, " +
				"ci.name as clinic_name, c.start_date as start_date, c.end_date as end_date, " +
				"r.phone_area_code as phone_area_code, " + 
				"r.phone_number as phone_number,"+
				"r.phone_dialing_code as phone_dialing_code "+
				" from Reservation r inner join Member m on r.member_id = m.member_id inner join `Clinic Time` c on r.clinic_time_id = c.clinic_time_id inner join Clinic ci on c.clinic_id = ci.clinic_id" +
				" where m.member_id = member_id";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		List<ReservationDto> dtos = new ArrayList<ReservationDto>();
		
		while (rs.next()) {
			ReservationDto dto = new ReservationDto();
			dto.setReservation_id(rs.getInt("reservation_id"));
			dto.setClinic_name(rs.getString("clinic_name"));
			dto.setStart_date(rs.getDate("start_date"));
			dto.setEnd_date(rs.getDate("end_date"));
			dto.setPhone_area_code(rs.getString("phone_area_code"));
			dto.setPhone_number(rs.getString("phone_number"));
			dto.setPhone_dialing_code(rs.getString("phone_dialing_code"));
			dto.setMember_email(rs.getString("email"));
			dtos.add(dto);
		}
		
		return dtos;
	}
	
	public boolean areYouAdmin(String email) throws Exception {
		String sql = "select count(*) as email_count from Member where email = " + email;
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();
		
		if (rs.getInt("email_count") == 1)
			return true;
		else 
			return false;
	}
	
	public void save(ClinicTimeDto clinicTimeDto) throws SQLException {
		clinicTimeDto.validateForSave();
		
		// "Clinic Time"
		String sql = QueryUtil.getInsertQuery(clinicTimeDto);
		System.out.println(sql);
		
		Statement stmt = conn.createStatement();
		stmt.executeUpdate(sql);
	}
	
	public void delete(ClinicTimeDto clinicTimeDto) throws SQLException {
		String sql = QueryUtil.getDeleteQuery(clinicTimeDto);
		
		Statement stmt = conn.createStatement();
		stmt.executeUpdate(sql);
	}
	
	public void update(ClinicTimeDto clinicTimeDto) throws SQLException {
		clinicTimeDto.validateForUpdate();
		
		String sql = QueryUtil.getUpdateQuery(clinicTimeDto);
		Statement stmt = conn.createStatement();
		stmt.executeUpdate(sql);
	}
	
	public void save(ReservationDto reservationDto) throws SQLException {
		reservationDto.validateForSave();
		
		String sql = QueryUtil.getInsertQuery(reservationDto);
		
		Statement stmt = conn.createStatement();
		stmt.executeUpdate(sql);
	}
	
	public void delete(ReservationDto reservationDto) throws SQLException {
		String sql = QueryUtil.getDeleteQuery(reservationDto);
		
		Statement stmt = conn.createStatement();
		stmt.executeUpdate(sql);
	}
	
	public void update(ReservationDto reservationDto) throws SQLException {
		reservationDto.validateForUpdate();
		
		String sql = QueryUtil.getUpdateQuery(reservationDto);
		Statement stmt = conn.createStatement();
		stmt.executeUpdate(sql);
	}
	
	
}
