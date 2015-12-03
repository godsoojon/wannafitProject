package com.wannafitshare.vo;

import java.util.Date;

public class PhotoUpload {
	
/*	 photo_id NUMBER NOT NULL,  사진ID 
	   cs_id VARCHAR2(10),  고객_id 
	   party_name VARCHAR2(30),  그룹이름 
	   photo_time DATE,  시간 
	   photo_content VARCHAR2(100),  내용 
	   photo_title VARCHAR2(30),  사진타이틀 */
	
	private String photoTitle;
	private int photoId; //사진 ID
	private String partyName; //그룹 이름
	private String csId; //고객 ID 
	private Date photoTime; //날짜
	private String photoContent; //사진 HTML
	
	
	
	public PhotoUpload(String photoTitle, int photoId, String partyName, String csId, Date photoTime,
			String photoContent) {
		super();
		this.photoTitle = photoTitle;
		this.photoId = photoId;
		this.partyName = partyName;
		this.csId = csId;
		this.photoTime = photoTime;
		this.photoContent = photoContent;
	}


	public PhotoUpload() {
		super();
	}


	public String getPhotoTitle() {
		return photoTitle;
	}


	public void setPhotoTitle(String photoTitle) {
		this.photoTitle = photoTitle;
	}


	public int getPhotoId() {
		return photoId;
	}


	public void setPhotoId(int photoId) {
		this.photoId = photoId;
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


	public Date getPhotoTime() {
		return photoTime;
	}


	public void setPhotoTime(Date photoTime) {
		this.photoTime = photoTime;
	}


	public String getPhotoContent() {
		return photoContent;
	}


	public void setPhotoContent(String photoContent) {
		this.photoContent = photoContent;
	}


	@Override
	public String toString() {
		return "PhotoUpload [photoTitle=" + photoTitle + ", photoId=" + photoId + ", partyName=" + partyName + ", csId="
				+ csId + ", photoTime=" + photoTime + ", photoContent=" + photoContent + "]";
	}
	
	
	
}
