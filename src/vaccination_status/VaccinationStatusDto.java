package vaccination_status;

public class VaccinationStatusDto {
	
	private String date;
	private Integer vaccination_status_id;
	private Integer city_id;
	private Integer total_count;
	private Integer primary_count;
	private Integer secondary_count;
	private String cityNameKo;
	private Integer population_count;
	
	
	public String getCityNameKo() {
		return cityNameKo;
	}

	public void setCityNameKo(String cityNameKo) {
		this.cityNameKo = cityNameKo;
	}
	
	public Integer getPopulation_count() {
		return population_count;
	}
	public void setPopulation_count(Integer population_count) {
		this.population_count = population_count;
	}
	
	
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public Integer getVaccination_status_id() {
		return vaccination_status_id;
	}
	public void setVaccination_status_id(Integer vaccination_status_id) {
		this.vaccination_status_id = vaccination_status_id;
	}
	public Integer getCity_id() {
		return city_id;
	}
	public void setCity_id(Integer city_id) {
		this.city_id = city_id;
	}
	public Integer getTotal_count() {
		return total_count;
	}
	public void setTotal_count(Integer total_count) {
		this.total_count = total_count;
	}
	public Integer getPrimary_count() {
		return primary_count;
	}
	public void setPrimary_count(Integer primary_count) {
		this.primary_count = primary_count;
	}
	public Integer getSecondary_count() {
		return secondary_count;
	}
	public void setSecondary_count(Integer secondary_count) {
		this.secondary_count = secondary_count;
	}
	
	
}
