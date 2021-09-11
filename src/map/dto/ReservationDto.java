package map.dto;

import static map.util.Assertions.*;

import java.sql.Date;

import map.util.Ignore;

public class ReservationDto {
	private Integer reservation_id;
	private Integer member_id;
	private Integer clinic_time_id;
	private String etc;
	private String phone_area_code;
	private String phone_number;
	private String phone_dialing_code;
	
	@Ignore
	private String clinic_name;
	@Ignore
	private Date start_date;
	@Ignore
	private Date end_date;
	
	
	public void validateForSave() {
		assertNotNull(member_id, "member_id is null");
		assertNotNull(clinic_time_id, "clinic_time_id is null");

		assertNotNull(phone_area_code, "phone_area_code is null");
		assertNotNull(phone_number, "phone_number is null");
		assertNotNull(phone_dialing_code, "phone_dialing_code is null");
	}
	
	public void validateForUpdate() {
		assertNotNull(member_id, "member_id is null");
		assertNotNull(clinic_time_id, "clinic_time_id is null");

		assertNotNull(phone_area_code, "phone_area_code is null");
		assertNotNull(phone_number, "phone_number is null");
		assertNotNull(phone_dialing_code, "phone_dialing_code is null");
	}
	
	

	public String getClinic_name() {
		return clinic_name;
	}

	public void setClinic_name(String clinic_name) {
		this.clinic_name = clinic_name;
	}

	public Date getStart_date() {
		return start_date;
	}

	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}

	public Date getEnd_date() {
		return end_date;
	}

	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}

	public Integer getReservation_id() {
		return reservation_id;
	}
	public void setReservation_id(Integer reservation_id) {
		this.reservation_id = reservation_id;
	}
	public Integer getMember_id() {
		return member_id;
	}
	public void setMember_id(Integer member_id) {
		this.member_id = member_id;
	}
	public Integer getClinic_time_id() {
		return clinic_time_id;
	}
	public void setClinic_time_id(Integer clinic_time_id) {
		this.clinic_time_id = clinic_time_id;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public String getPhone_area_code() {
		return phone_area_code;
	}
	public void setPhone_area_code(String phone_area_code) {
		this.phone_area_code = phone_area_code;
	}
	public String getPhone_number() {
		return phone_number;
	}
	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}
	public String getPhone_dialing_code() {
		return phone_dialing_code;
	}
	public void setPhone_dialing_code(String phone_dialing_code) {
		this.phone_dialing_code = phone_dialing_code;
	}
	public String getFullnumber() {
		return phone_area_code + "-" + phone_number + "-" + phone_dialing_code;
	}

	@Override
	public String toString() {
		return "ReservationDto [reservation_id=" + reservation_id + ", member_id=" + member_id + ", clinic_time_id="
				+ clinic_time_id + ", etc=" + etc + ", phone_area_code=" + phone_area_code + ", phone_number="
				+ phone_number + ", phone_dialing_code=" + phone_dialing_code + ", clinic_name=" + clinic_name
				+ ", start_date=" + start_date + ", end_date=" + end_date + "]";
	}

	
	
	

}
