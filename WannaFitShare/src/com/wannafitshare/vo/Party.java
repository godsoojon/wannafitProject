package com.wannafitshare.vo;

import java.io.Serializable;
import java.util.Date;

public class Party implements Serializable {
	/*
	CREATE TABLE party (
	party_name VARCHAR2(30) NOT NULL,  그룹이름 
	party_right NUMBER NOT NULL,  그룹권한 
	party_date DATE NOT NULL,  생성날짜 
	party_member NUMBER,  가입회원수 
	party_manager VARCHAR2(10)  관리자ID 
	);
	 */

	private String partyName;
	private int partyRight;
	private Date partyDate;
	private int partyMember;
	private String partyManager;

	public Party() {
		super();
	}

	public Party(String partyName, int partyRight, Date partyDate,
			int partyMember, String partyManager) {
		super();
		this.partyName = partyName;
		this.partyRight = partyRight;
		this.partyDate = partyDate;
		this.partyMember = partyMember;
		this.partyManager = partyManager;
	}

	public String getPartyName() {
		return partyName;
	}

	public void setPartyName(String partyName) {
		this.partyName = partyName;
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

	public int getPartyMember() {
		return partyMember;
	}

	public void setPartyMember(int partyMember) {
		this.partyMember = partyMember;
	}

	public String getPartyManager() {
		return partyManager;
	}

	public void setPartyManager(String partyManager) {
		this.partyManager = partyManager;
	}

	@Override
	public String toString() {
		return "Party [partyName=" + partyName + ", partyRight=" + partyRight
				+ ", partyDate=" + partyDate + ", partyMember=" + partyMember
				+ ", partyManager=" + partyManager + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((partyDate == null) ? 0 : partyDate.hashCode());
		result = prime * result
				+ ((partyManager == null) ? 0 : partyManager.hashCode());
		result = prime * result + partyMember;
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
		if (partyDate == null) {
			if (other.partyDate != null)
				return false;
		} else if (!partyDate.equals(other.partyDate))
			return false;
		if (partyManager == null) {
			if (other.partyManager != null)
				return false;
		} else if (!partyManager.equals(other.partyManager))
			return false;
		if (partyMember != other.partyMember)
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
