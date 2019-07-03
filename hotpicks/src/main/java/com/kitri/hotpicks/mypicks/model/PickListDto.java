package com.kitri.hotpicks.mypicks.model;

import com.kitri.hotpicks.contents.model.ContentsDto;

public class PickListDto extends ContentsDto{

	private String userId;
	private String contentsId;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getContentsId() {
		return contentsId;
	}
	public void setContentsId(String contentsId) {
		this.contentsId = contentsId;
	}
	
	@Override
	public String toString() {
		return "PickListDto [userId=" + userId + ", contentsId=" + contentsId + "]";
	}
	
	
}
