package com.wannafitshare.vo;

import java.io.Serializable;
import java.util.Date;

public class Party implements Serializable {
	/*
	CREATE TABLE party (
	party_name VARCHAR2(30) NOT NULL, 그룹이름 
	cs_id VARCHAR2(10) NOT NULL,  고객_id 
	party_right NUMBER NOT NULL,  그룹권한 
	party_date DATE NOT NULL  생성날짜 
	);
	 */

	private String partyName;
	private String csId;
	private int partyRight;
	private Date partyDate;

	public Party() {
		super();
	}

	public Party(String partyName, String csId, int partyRight,
			Date partyDate) {
		super();
		this.partyName = partyName;
		this.csId = csId;
		this.partyRight = partyRight;
		this.partyDate = partyDate;
	}

	public String getPartyName() {
		return partyName;
	}

	public void setPartyName(String partyName) {
		this.partyName = partyName;
	}

	public String getCsId() {
		return csId;
	}

	public void setCsId(String csId) {
		this.csId = csId;
	}

	public int getPartyRight() {
		return partyRight;
	}

	public void setPartyRight(int partyRight) {
		this.partyRight = partyRight;
	}

	public Date getPartyDate() {
		return partyDate;
	}

	public void setPartyDate(Date partyDate) {
		this.partyDate = partyDate;
	}

	@Override
	public String toString() {
		return "Party [partyName=" + partyName + ", csId=" + csId
				+ ", partyRight=" + partyRight + ", partyDate=" + partyDate
				+ "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((csId == null) ? 0 : csId.hashCode());
		result = prime * result
				+ ((partyDate == null) ? 0 : partyDate.hashCode());
		result = prime * result
				+ ((partyName == null) ? 0 : partyName.hashCode());
		result = prime * result + partyRight;
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
		Party other = (Party) obj;
		if (csId == null) {
			if (other.csId != null)
				return false;
		} else if (!csId.equals(other.csId))
			return false;
		if (partyDate == null) {
			if (other.partyDate != null)
				return false;
		} else if (!partyDate.equals(other.partyDate))
			return false;
		if (partyName == null) {
			if (other.partyName != null)
				return false;
		} else if (!partyName.equals(other.partyName))
			return false;
		if (partyRight != other.partyRight)
			return false;
		return true;
	}
}
