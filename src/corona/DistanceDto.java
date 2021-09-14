package corona;

public class DistanceDto {
      private int social_distancing_id,step;
      private String date,city_id,content;
      
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getSocial_distancing_id() {
		return social_distancing_id;
	}
	public void setSocial_distancing_id(int social_distancing_id) {
		this.social_distancing_id = social_distancing_id;
	}
	public String getCity_id() {
		return city_id;
	}
	public void setCity_id(String city_id) {
		this.city_id = city_id;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
      
      
}
