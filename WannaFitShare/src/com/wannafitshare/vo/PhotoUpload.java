package com.wannafitshare.vo;

import java.util.Date;

public class PhotoUpload {
	
	private String photo_title;
	private int photo_id; //사진 ID
	private String party_name; //그룹 이름
	private String csId; //고객 ID 
	private Date photo_time; //날짜
	private String photo_content; //사진 HTML
	public PhotoUpload(String photo_title, int photo_id, String party_name, String csId, Date photo_time,
			String photo_content) {
		super();
		this.photo_title = photo_title;
		this.photo_id = photo_id;
		this.party_name = party_name;
		this.csId = csId;
		this.photo_time = photo_time;
		this.photo_content = photo_content;
	}
	public PhotoUpload() {
		super();
	}
	public String getPhoto_title() {
		return photo_title;
	}
	public void setPhoto_title(String photo_title) {
		this.photo_title = photo_title;
	}
	public int getPhoto_id() {
		return photo_id;
	}
	public void setPhoto_id(int photo_id) {
		this.photo_id = photo_id;
	}
	public String getParty_name() {
		return party_name;
	}
	public void setParty_name(String party_name) {
		this.party_name = party_name;
	}
	public String getCsId() {
		return csId;
	}
	public void setCsId(String csId) {
		this.csId = csId;
	}
	public Date getPhoto_time() {
		return photo_time;
	}
	public void setPhoto_time(Date photo_time) {
		this.photo_time = photo_time;
	}
	public String getPhoto_content() {
		return photo_content;
	}
	public void setPhoto_content(String photo_content) {
		this.photo_content = photo_content;
	}
	
	
	
}
