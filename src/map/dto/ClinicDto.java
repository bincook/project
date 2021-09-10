package map.dto;

import java.util.ArrayList;
import java.util.List;

import map.util.Ignore;

public class ClinicDto {
	private Integer clinic_id;
	private String name;
	private Double longitude;
	private Double latitude;
	private String address;

	@Ignore
	private List<ClinicTimeDto> todayTimeList = new ArrayList<ClinicTimeDto>();
	
	
	public ClinicDto(Integer clinic_id, String name, Double longitude, Double latitude, String address) {
		super();
		this.clinic_id = clinic_id;
		this.name = name;
		this.longitude = longitude;
		this.latitude = latitude;
		this.address = address;
	}
	
	public Integer getClinic_id() {
		return clinic_id;
	}
	public void setClinic_id(Integer clinic_id) {
		this.clinic_id = clinic_id;
	}
	public Double getLongitude() {
		return longitude;
	}
	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}
	public Double getLatitude() {
		return latitude;
	}
	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public List<ClinicTimeDto> getTodayTimeList() {
		return todayTimeList;
	}

	public void setTodayTimeList(List<ClinicTimeDto> todayTimeList) {
		if (todayTimeList != null)
			this.todayTimeList = todayTimeList;
	}

	@Override
	public String toString() {
		return "ClinicDto [clinic_id=" + clinic_id + ", longitude=" + longitude + ", latitude=" + latitude
				+ ", address=" + address + "]";
	}




	
}
