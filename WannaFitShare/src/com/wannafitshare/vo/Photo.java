package com.wannafitshare.vo;

import java.util.Date;

public class Photo {

	
	/*photo_id number(20) NOT NULL,  사진ID 
	party_id NUMBER NOT NULL,  그룹id 
	photo_name VARCHAR2(20),  사진이름 
	photo_path VARCHAR2(30) NOT NULL,  경로 
	photo_time DATE,  시간 
	photo_comment VARCHAR2(100)  사진설명 */
	
	private int photoId;
	private int partyId;
	private String photoName;
	private String photoPath;
	private Date photoTime;
	private String comment;
	public Photo(int photoId, int partyId, String photoName, String photoPath, Date photoTime, String comment) {
		super();
		this.photoId = photoId;
		this.partyId = partyId;
		this.photoName = photoName;
		this.photoPath = photoPath;
		this.photoTime = photoTime;
		this.comment = comment;
	}
	public Photo() {
		super();
	}
	public Photo(int partyId, String photoName, String photoPath, Date photoTime, String comment) {
		super();
		this.partyId = partyId;
		this.photoName = photoName;
		this.photoPath = photoPath;
		this.photoTime = photoTime;
		this.comment = comment;
	}
	@Override
	public String toString() {
		return "Photo [photoId=" + photoId + ", partyId=" + partyId + ", photoName=" + photoName + ", photoPath="
				+ photoPath + ", photoTime=" + photoTime + ", comment=" + comment + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((comment == null) ? 0 : comment.hashCode());
		result = prime * result + partyId;
		result = prime * result + photoId;
		result = prime * result + ((photoName == null) ? 0 : photoName.hashCode());
		result = prime * result + ((photoPath == null) ? 0 : photoPath.hashCode());
		result = prime * result + ((photoTime == null) ? 0 : photoTime.hashCode());
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
		Photo other = (Photo) obj;
		if (comment == null) {
			if (other.comment != null)
				return false;
		} else if (!comment.equals(other.comment))
			return false;
		if (partyId != other.partyId)
			return false;
		if (photoId != other.photoId)
			return false;
		if (photoName == null) {
			if (other.photoName != null)
				return false;
		} else if (!photoName.equals(other.photoName))
			return false;
		if (photoPath == null) {
			if (other.photoPath != null)
				return false;
		} else if (!photoPath.equals(other.photoPath))
			return false;
		if (photoTime == null) {
			if (other.photoTime != null)
				return false;
		} else if (!photoTime.equals(other.photoTime))
			return false;
		return true;
	}
	public int getPhotoId() {
		return photoId;
	}
	public void setPhotoId(int photoId) {
		this.photoId = photoId;
	}
	public int getPartyId() {
		return partyId;
	}
	public void setPartyId(int partyId) {
		this.partyId = partyId;
	}
	public String getPhotoName() {
		return photoName;
	}
	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}
	public String getPhotoPath() {
		return photoPath;
	}
	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
	}
	public Date getPhotoTime() {
		return photoTime;
	}
	public void setPhotoTime(Date photoTime) {
		this.photoTime = photoTime;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	
	

}
