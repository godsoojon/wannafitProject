package com.wannafitshare.vo;

import java.util.Date;

public class CalorieCalendar {

	public String csId;
	public Date calorieDate;
	public int totalCalorie;
	public CalorieCalendar(){}
	public CalorieCalendar(String csId, Date calorieDate, int totalCalorie) {
		super();
		this.csId = csId;
		this.calorieDate = calorieDate;
		this.totalCalorie = totalCalorie;
	}
	public CalorieCalendar(String csId, Date calorieDate) {
		super();
		this.csId = csId;
		this.calorieDate = calorieDate;
		this.totalCalorie = 0;
	}
	public String getCsId() {
		return csId;
	}
	public void setCsId(String csId) {
		this.csId = csId;
	}
	public Date getCalorieDate() {
		return calorieDate;
	}
	public void setCalorieDate(Date calorieDate) {
		this.calorieDate = calorieDate;
	}
	public int getTotalCalorie() {
		return totalCalorie;
	}
	public void setTotalCalorie(int totalCalorie) {
		this.totalCalorie = totalCalorie;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((calorieDate == null) ? 0 : calorieDate.hashCode());
		result = prime * result + ((csId == null) ? 0 : csId.hashCode());
		result = prime * result + totalCalorie;
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CalorieCalendar other = (CalorieCalendar) obj;
		if (calorieDate == null) {
			if (other.calorieDate != null)
				return false;
		} else if (!calorieDate.equals(other.calorieDate))
			return false;
		if (csId == null) {
			if (other.csId != null)
				return false;
		} else if (!csId.equals(other.csId))
			return false;
		if (totalCalorie != other.totalCalorie)
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "CalorieCalendar [csId=" + csId + ", calorieDate=" + calorieDate + ", totalCalorie=" + totalCalorie
				+ "]";
	}
	  
	
	
}
