package covid_status_city;

public class covid_status_cityDto {
	private int city_id, healing_count, deaths_count, infected_count, infected_rate, issue_id;
	private String date, name_ko, title, description, occurrence_date;
	
	public int getIssue_id() {
		return issue_id;
	}
	public void setIssue_id(int issue_id) {
		this.issue_id = issue_id;
	}
	public int getInfected_rate() {
		return infected_rate;
	}
	public void setInfected_rate(int infected_rate) {
		this.infected_rate = infected_rate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {  
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getName_ko() {
		return name_ko;
	}
	public void setName_ko(String name_ko) {
		this.name_ko = name_ko;
	}
	public int getCity_id() {
		return city_id;
	}
	public void setCity_id(int city_id) {
		this.city_id = city_id;
	}
	public int getInfected_count() {
		return infected_count;
	}
	public void setInfected_count(int infected_count) {
		this.infected_count = infected_count;
	}
	public int getHealing_count() {
		return healing_count;
	}
	public void setHealing_count(int healing_count) {
		this.healing_count = healing_count;
	}
	public int getDeaths_count() {
		return deaths_count;
	}
	public void setDeaths_count(int deaths_count) {
		this.deaths_count = deaths_count;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getOccurrence_date() {
		return occurrence_date;
	}
	public void setOccurrence_date(String occurrence_date) {
		this.occurrence_date = occurrence_date;
	}
}
