package com.kitri.hotpicks.mypicks.model;

import com.kitri.hotpicks.contents.model.ContentsDto;

public class PickListDto extends ContentsDto{

	private String userId;
	private int contentsId;
	private int wanna;
	private int distence;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getContentsId() {
		return contentsId;
	}
	public void setContentsId(int contentsId) {
		this.contentsId = contentsId;
	}
	public int getWanna() {
		return wanna;
	}
	public void setWanna(int wanna) {
		this.wanna = wanna;
	}
	public int getDistence() {
		return distence;
	}
	public void setDistence(int distence) {
		this.distence = distence;
	}
	@Override
	public String toString() {
		return "PickListDto [userId=" + userId + ", contentsId=" + contentsId + ", wanna=" + wanna + ", distence="
				+ distence + "]";
	}
	
	
	
}
	