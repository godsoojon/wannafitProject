package com.wannafitshare.vo;

import java.io.Serializable;

public class PartyList implements Serializable {
	/*
	그룹고객목록 
	CREATE TABLE partylist (
		cs_id VARCHAR2(10) NOT NULL,  고객_id 
		party_name VARCHAR2(30) NOT NULL  그룹이름
	);
	*/

	private String csId;
	private String partyName;

	public PartyList() {
		super();
	}

	public PartyList(String csId, String partyName) {
		super();
		this.csId = csId;
		this.partyName = partyName;
	}

	public String getCsId() {
		return csId;
	}

	public void setCsId(String csId) {
		this.csId = csId;
	}

	public String getPartyName() {
		return partyName;
	}

	public void setPartyName(String partyName) {
		this.partyName = partyName;
	}

	@Override
	public String toString() {
		return "PartyList [csId=" + csId + ", partyName=" + partyName + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((csId == null) ? 0 : csId.hashCode());
		result = prime * result
				+ ((partyName == null) ? 0 : partyName.hashCode());
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
		PartyList other = (PartyList) obj;
		if (csId == null) {
			if (other.csId != null)
				return false;
		} else if (!csId.equals(other.csId))
			return false;
		if (partyName == null) {
			if (other.partyName != null)
				return false;
		} else if (!partyName.equals(other.partyName))
			return false;
		return true;
	}
}
