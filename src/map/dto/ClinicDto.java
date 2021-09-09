package map.dto;


public class ClinicDto {
	private Integer clinic_id;
	private Double longitude;
	private Double latitude;
	private String address;
	
	public ClinicDto(Integer clinic_id, Double longitude, Double latitude, String address) {
		super();
		this.clinic_id = clinic_id;
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

	@Override
	public String toString() {
		return "ClinicDto [clinic_id=" + clinic_id + ", longitude=" + longitude + ", latitude=" + latitude
				+ ", address=" + address + "]";
	}




	
}
