package com.wannafitshare.vo;

import java.io.Serializable;

public class FriendList implements Serializable {

	private long flKey;
	private String csId;
	private String friendId;

	public FriendList(long flKey, String csId, String friendId) {
		super();
		this.flKey = flKey;
		this.csId = csId;
		this.friendId = friendId;
	}

	public FriendList() {
		super();
	}

	public FriendList(String csId, String friendId) {
		super();
		this.csId = csId;
		this.friendId = friendId;
	}

	@Override
	public String toString() {
		return "FriendList [flKey=" + flKey + ", csId=" + csId + ", friendId="
				+ friendId + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((csId == null) ? 0 : csId.hashCode());
		result = prime * result + (int) (flKey ^ (flKey >>> 32));
		result = prime * result
				+ ((friendId == null) ? 0 : friendId.hashCode());
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
		FriendList other = (FriendList) obj;
		if (csId == null) {
			if (other.csId != null)
				return false;
		} else if (!csId.equals(other.csId))
			return false;
		if (flKey != other.flKey)
			return false;
		if (friendId == null) {
			if (other.friendId != null)
				return false;
		} else if (!friendId.equals(other.friendId))
			return false;
		return true;
	}

	public long getFlKey() {
		return flKey;
	}

	public void setFlKey(long flKey) {
		this.flKey = flKey;
	}

	public String getCsId() {
		return csId;
	}

	public void setCsId(String csId) {
		this.csId = csId;
	}

	public String getFriendId() {
		return friendId;
	}

	public void setFriendId(String friendId) {
		this.friendId = friendId;
	}

}