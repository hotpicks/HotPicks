package com.kitri.hotpicks.mypicks.model;

import com.kitri.hotpicks.contents.model.ContentsDetailDto;

public class PickListDto extends ContentsDetailDto{

	private String userId;
	private int contentsId;
	private int wanna;
	private int distence;
	private String sysdate;
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
	public String getSysdate() {
		return sysdate;
	}
	public void setSysdate(String sysdate) {
		this.sysdate = sysdate;
	}
	@Override
	public String toString() {
		return "PickListDto [userId=" + userId + ", contentsId=" + contentsId + ", wanna=" + wanna + ", distence="
				+ distence + ", sysdate=" + sysdate + "]";
	}
	
	
}
	