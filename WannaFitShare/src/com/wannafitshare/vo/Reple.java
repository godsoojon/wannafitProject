package com.wannafitshare.vo;

import java.util.Date;

public class Reple {

/*	reple_id VARCHAR2(20) NOT NULL,  댓글id 
	cs_id VARCHAR2(10) NOT NULL,  고객_id 
	photo_id VARCHAR2(20),  사진ID 
	party_id NUMBER,  그룹id 
	replet_content VARCHAR2(50),  댓글내용 
	reple_time DATE  시간 */
	
	private int repleId;
	private String csId;
	private int photoId;
	
	private String repleContent;
	private Date repleTime;
	public Reple(int repleId, String csId, int photoId, String repleContent, Date repleTime) {
		super();
		this.repleId = repleId;
		this.csId = csId;
		this.photoId = photoId;
		this.repleContent = repleContent;
		this.repleTime = repleTime;
	}
	public Reple() {
		super();
	}
	@Override
	public String toString() {
		return "Reple [repleId=" + repleId + ", csId=" + csId + ", photoId=" + photoId + ", repleContent="
				+ repleContent + ", repleTime=" + repleTime + "]";
	}
	public Reple(String csId, int photoId, String repleContent, Date repleTime) {
		super();
		this.csId = csId;
		this.photoId = photoId;
		this.repleContent = repleContent;
		this.repleTime = repleTime;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((csId == null) ? 0 : csId.hashCode());
		result = prime * result + photoId;
		result = prime * result + ((repleContent == null) ? 0 : repleContent.hashCode());
		result = prime * result + repleId;
		result = prime * result + ((repleTime == null) ? 0 : repleTime.hashCode());
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
		if (photoId != other.photoId)
			return false;
		if (repleContent == null) {
			if (other.repleContent != null)
				return false;
		} else if (!repleContent.equals(other.repleContent))
			return false;
		if (repleId != other.repleId)
			return false;
		if (repleTime == null) {
			if (other.repleTime != null)
				return false;
		} else if (!repleTime.equals(other.repleTime))
			return false;
		return true;
	}
	public int getRepleId() {
		return repleId;
	}
	public void setRepleId(int repleId) {
		this.repleId = repleId;
	}
	public String getCsId() {
		return csId;
	}
	public void setCsId(String csId) {
		this.csId = csId;
	}
	public int getPhotoId() {
		return photoId;
	}
	public void setPhotoId(int photoId) {
		this.photoId = photoId;
	}
	public String getRepleContent() {
		return repleContent;
	}
	public void setRepleContent(String repleContent) {
		this.repleContent = repleContent;
	}
	public Date getRepleTime() {
		return repleTime;
	}
	public void setRepleTime(Date repleTime) {
		this.repleTime = repleTime;
	}
	

}