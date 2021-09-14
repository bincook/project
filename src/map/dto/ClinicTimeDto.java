package map.dto;

import java.sql.Date;
import java.sql.Timestamp;

import map.util.Id;
import map.util.Table;

import static map.util.Assertions.*;

@Table(name = "clinic time")
public class ClinicTimeDto {
	
	@Id
	private Integer clinic_time_id;
	private Integer clinic_id;
	private Timestamp start_date;
	private Timestamp end_date;
	private Integer capacity;
	
	public void validateForSave() {
		assertNotNull(this.clinic_id);
		assertNotNull(this.start_date);
		assertNotNull(this.end_date);
	}
	
	public void validateForUpdate() {
		assertNotNull(this.clinic_time_id);
		assertNotNull(this.clinic_id);
		assertNotNull(this.start_date);
		assertNotNull(this.end_date);
	}
	
	
	
	public ClinicTimeDto() {
		super();
	}
	

	public ClinicTimeDto(Integer clinic_time_id, Timestamp start_date, Timestamp end_date, Integer capacity) {
		super();
		this.clinic_time_id = clinic_time_id;
		this.start_date = start_date;
		this.end_date = end_date;
		this.capacity = capacity;
	}
	
	public Integer getClinic_time_id() {
		return clinic_time_id;
	}
	public void setClinic_time_id(Integer clinic_time_id) {
		this.clinic_time_id = clinic_time_id;
	}
	public Integer getClinic_id() {
		return clinic_id;
	}
	public void setClinic_id(Integer clinic_id) {
		this.clinic_id = clinic_id;
	}
	public Timestamp getStart_date() {
		return start_date;
	}
	public void setStart_date(Timestamp start_date) {
		this.start_date = start_date;
	}
	public Timestamp getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Timestamp end_date) {
		this.end_date = end_date;
	}
	public Integer getCapacity() {
		return capacity;
	}
	public void setCapacity(Integer capacity) {
		this.capacity = capacity;
	}

	public ClinicTimeDto(Integer clinic_time_id, Integer clinic_id, Timestamp start_date, Timestamp end_date, Integer capacity) {
		super();
		this.clinic_time_id = clinic_time_id;
		this.clinic_id = clinic_id;
		this.start_date = start_date;
		this.end_date = end_date;
		this.capacity = capacity;
	}

	@Override
	public String toString() {
		return "ClinicTimeDto [clinic_time_id=" + clinic_time_id + ", clinic_id=" + clinic_id + ", start_date="
				+ start_date + ", end_date=" + end_date + ", capacity=" + capacity + "]";
	}
	
	
	

	
}
