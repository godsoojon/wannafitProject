package com.wannafitshare.vo;

public class CalendarInfo {

	String day;
	String totalCalorie;
	
	public CalendarInfo() {
		super();
	}
	public CalendarInfo(String day, String totalCalorie) {
		super();
		this.day = day;
		this.totalCalorie = totalCalorie;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getTotalCalorie() {
		return totalCalorie;
	}
	public void setTotalCalorie(String totalCalorie) {
		this.totalCalorie = totalCalorie;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((day == null) ? 0 : day.hashCode());
		result = prime * result + ((totalCalorie == null) ? 0 : totalCalorie.hashCode());
		return result;
	}
	
	@Override
	public String toString() {
		return "CalendarInfo [day=" + day + ", totalCalorie=" + totalCalorie + "]";
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CalendarInfo other = (CalendarInfo) obj;
		if (day == null) {
			if (other.day != null)
				return false;
		} else if (!day.equals(other.day))
			return false;
		if (totalCalorie == null) {
			if (other.totalCalorie != null)
				return false;
		} else if (!totalCalorie.equals(other.totalCalorie))
			return false;
		return true;
	}
	
}
