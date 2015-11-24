package com.wannafitshare.vo;

import java.io.Serializable;

public class Health implements Serializable {

	private String csId;
	private double hWeight;
	private double hTall;
	private String hBloodType;
	private double hBloodPressure;
	private double hBmi;
	private double hBloodSugar;
	private double hLdl;
	private double hHdh;
	public Health(String csId, double hWeight, double hTall, String hBloodType, double hBloodPressure, double hBmi,
			double hBloodSugar, double hLdl, double hHdh) {
		super();
		this.csId = csId;
		this.hWeight = hWeight;
		this.hTall = hTall;
		this.hBloodType = hBloodType;
		this.hBloodPressure = hBloodPressure;
		this.hBmi = hBmi;
		this.hBloodSugar = hBloodSugar;
		this.hLdl = hLdl;
		this.hHdh = hHdh;
	}
	public Health() {
		super();
	}
	@Override
	public String toString() {
		return "Health [csId=" + csId + ", hWeight=" + hWeight + ", hTall=" + hTall + ", hBloodType=" + hBloodType
				+ ", hBloodPressure=" + hBloodPressure + ", hBmi=" + hBmi + ", hBloodSugar=" + hBloodSugar + ", hLdl="
				+ hLdl + ", hHdh=" + hHdh + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((csId == null) ? 0 : csId.hashCode());
		long temp;
		temp = Double.doubleToLongBits(hBloodPressure);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		temp = Double.doubleToLongBits(hBloodSugar);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + ((hBloodType == null) ? 0 : hBloodType.hashCode());
		temp = Double.doubleToLongBits(hBmi);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		temp = Double.doubleToLongBits(hHdh);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		temp = Double.doubleToLongBits(hLdl);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		temp = Double.doubleToLongBits(hTall);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		temp = Double.doubleToLongBits(hWeight);
		result = prime * result + (int) (temp ^ (temp >>> 32));
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
		Health other = (Health) obj;
		if (csId == null) {
			if (other.csId != null)
				return false;
		} else if (!csId.equals(other.csId))
			return false;
		if (Double.doubleToLongBits(hBloodPressure) != Double.doubleToLongBits(other.hBloodPressure))
			return false;
		if (Double.doubleToLongBits(hBloodSugar) != Double.doubleToLongBits(other.hBloodSugar))
			return false;
		if (hBloodType == null) {
			if (other.hBloodType != null)
				return false;
		} else if (!hBloodType.equals(other.hBloodType))
			return false;
		if (Double.doubleToLongBits(hBmi) != Double.doubleToLongBits(other.hBmi))
			return false;
		if (Double.doubleToLongBits(hHdh) != Double.doubleToLongBits(other.hHdh))
			return false;
		if (Double.doubleToLongBits(hLdl) != Double.doubleToLongBits(other.hLdl))
			return false;
		if (Double.doubleToLongBits(hTall) != Double.doubleToLongBits(other.hTall))
			return false;
		if (Double.doubleToLongBits(hWeight) != Double.doubleToLongBits(other.hWeight))
			return false;
		return true;
	}
	public String getCsId() {
		return csId;
	}
	public void setCsId(String csId) {
		this.csId = csId;
	}
	public double gethWeight() {
		return hWeight;
	}
	public void sethWeight(double hWeight) {
		this.hWeight = hWeight;
	}
	public double gethTall() {
		return hTall;
	}
	public void sethTall(double hTall) {
		this.hTall = hTall;
	}
	public String gethBloodType() {
		return hBloodType;
	}
	public void sethBloodType(String hBloodType) {
		this.hBloodType = hBloodType;
	}
	public double gethBloodPressure() {
		return hBloodPressure;
	}
	public void sethBloodPressure(double hBloodPressure) {
		this.hBloodPressure = hBloodPressure;
	}
	public double gethBmi() {
		return hBmi;
	}
	public void sethBmi(double hBmi) {
		this.hBmi = hBmi;
	}
	public double gethBloodSugar() {
		return hBloodSugar;
	}
	public void sethBloodSugar(double hBloodSugar) {
		this.hBloodSugar = hBloodSugar;
	}
	public double gethLdl() {
		return hLdl;
	}
	public void sethLdl(double hLdl) {
		this.hLdl = hLdl;
	}
	public double gethHdh() {
		return hHdh;
	}
	public void sethHdh(double hHdh) {
		this.hHdh = hHdh;
	}

	
}
