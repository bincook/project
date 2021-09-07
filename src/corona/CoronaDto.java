package corona;

public class CoronaDto {
	private int covid_status_id,infected_count,deaths_count,
	examine_count,negative_count,healing_count,
	release_from_quarantine_count,accumulated_inspection_count,
	accumulated_inspection_comp_count;
	
	//오늘-어제 차이값
	private int infected_count_cha,release_from_quarantine_count_cha,
	deaths_count_cha,examine_count_cha;
	
	private String accumulated_infected_rate,date;

	
	
	public int getInfected_count_cha() {
		return infected_count_cha;
	}

	public void setInfected_count_cha(int infected_count_cha) {
		this.infected_count_cha = infected_count_cha;
	}

	public int getRelease_from_quarantine_count_cha() {
		return release_from_quarantine_count_cha;
	}

	public void setRelease_from_quarantine_count_cha(int release_from_quarantine_count_cha) {
		this.release_from_quarantine_count_cha = release_from_quarantine_count_cha;
	}

	public int getDeaths_count_cha() {
		return deaths_count_cha;
	}

	public void setDeaths_count_cha(int deaths_count_cha) {
		this.deaths_count_cha = deaths_count_cha;
	}

	public int getExamine_count_cha() {
		return examine_count_cha;
	}

	public void setExamine_count_cha(int examine_count_cha) {
		this.examine_count_cha = examine_count_cha;
	}

	public int getCovid_status_id() {
		return covid_status_id;
	}

	public void setCovid_status_id(int covid_status_id) {
		this.covid_status_id = covid_status_id;
	}

	public int getInfected_count() {
		return infected_count;
	}

	public void setInfected_count(int infected_count) {
		this.infected_count = infected_count;
	}

	public int getDeaths_count() {
		return deaths_count;
	}

	public void setDeaths_count(int deaths_count) {
		this.deaths_count = deaths_count;
	}

	public int getExamine_count() {
		return examine_count;
	}

	public void setExamine_count(int examine_count) {
		this.examine_count = examine_count;
	}

	public int getNegative_count() {
		return negative_count;
	}

	public void setNegative_count(int negative_count) {
		this.negative_count = negative_count;
	}

	public int getHealing_count() {
		return healing_count;
	}

	public void setHealing_count(int healing_count) {
		this.healing_count = healing_count;
	}

	public int getRelease_from_quarantine_count() {
		return release_from_quarantine_count;
	}

	public void setRelease_from_quarantine_count(int release_from_quarantine_count) {
		this.release_from_quarantine_count = release_from_quarantine_count;
	}

	public int getAccumulated_inspection_count() {
		return accumulated_inspection_count;
	}

	public void setAccumulated_inspection_count(int accumulated_inspection_count) {
		this.accumulated_inspection_count = accumulated_inspection_count;
	}

	public int getAccumulated_inspection_comp_count() {
		return accumulated_inspection_comp_count;
	}

	public void setAccumulated_inspection_comp_count(int accumulated_inspection_comp_count) {
		this.accumulated_inspection_comp_count = accumulated_inspection_comp_count;
	}

	public String getAccumulated_infected_rate() {
		return accumulated_infected_rate;
	}

	public void setAccumulated_infected_rate(String accumulated_infected_rate) {
		this.accumulated_infected_rate = accumulated_infected_rate;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
	
	
}
