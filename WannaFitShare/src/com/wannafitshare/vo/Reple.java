package com.wannafitshare.vo;

import java.util.Date;

public class Reple {

/*reple_id NUMBER NOT NULL, 
	photo_id NUMBER,
	replet_content VARCHAR2(50), 
	reple_time DATE, 
	party_name VARCHAR2(30),
	cs_id VARCHAR2(10), 
	*/
	
 private int repleId;
 private int photoId;
 private String repletContent;
 private Date repleTime;
 private String partyName;
 private String csId;
public Reple(int repleId, int photoId, String repletContent, Date repleTime, String partyName, String csId) {
	super();
	this.repleId = repleId;
	this.photoId = photoId;
	this.repletContent = repletContent;
	this.repleTime = repleTime;
	this.partyName = partyName;
	this.csId = csId;
}
public Reple() {
	super();
}
public Reple(int photoId, String repletContent, Date repleTime, String partyName, String csId) {
	super();
	this.photoId = photoId;
	this.repletContent = repletContent;
	this.repleTime = repleTime;
	this.partyName = partyName;
	this.csId = csId;
}
public Reple(int photoId, String repletContent, String partyName, String csId) {
	super();
	this.photoId = photoId;
	this.repletContent = repletContent;
	this.partyName = partyName;
	this.csId = csId;
}
@Override
public String toString() {
	return "Reple [repleId=" + repleId + ", photoId=" + photoId + ", repletContent=" + repletContent + ", repleTime="
			+ repleTime + ", partyName=" + partyName + ", csId=" + csId + "]";
}
@Override
public int hashCode() {
	final int prime = 31;
	int result = 1;
	result = prime * result + ((csId == null) ? 0 : csId.hashCode());
	result = prime * result + ((partyName == null) ? 0 : partyName.hashCode());
	result = prime * result + photoId;
	result = prime * result + repleId;
	result = prime * result + ((repleTime == null) ? 0 : repleTime.hashCode());
	result = prime * result + ((repletContent == null) ? 0 : repletContent.hashCode());
	return result;
}
@Override
public boolean equals(Object obj) {
	if (this == obj)
		return true;
	if (obj == null)
		return false;
	if (!(obj instanceof Reple))
		return false;
	Reple other = (Reple) obj;
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
	if (photoId != other.photoId)
		return false;
	if (repleId != other.repleId)
		return false;
	if (repleTime == null) {
		if (other.repleTime != null)
			return false;
	} else if (!repleTime.equals(other.repleTime))
		return false;
	if (repletContent == null) {
		if (other.repletContent != null)
			return false;
	} else if (!repletContent.equals(other.repletContent))
		return false;
	return true;
}
public int getRepleId() {
	return repleId;
}
public void setRepleId(int repleId) {
	this.repleId = repleId;
}
public int getPhotoId() {
	return photoId;
}
public void setPhotoId(int photoId) {
	this.photoId = photoId;
}
public String getRepletContent() {
	return repletContent;
}
public void setRepletContent(String repletContent) {
	this.repletContent = repletContent;
}
public Date getRepleTime() {
	return repleTime;
}
public void setRepleTime(Date repleTime) {
	this.repleTime = repleTime;
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
 
	

}