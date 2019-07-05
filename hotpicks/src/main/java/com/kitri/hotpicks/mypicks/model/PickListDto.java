package com.kitri.hotpicks.mypicks.model;

import com.kitri.hotpicks.contents.model.ContentsDto;

public class PickListDto extends ContentsDto{

	private int seq;
	private String userId;
	private int contentsId;
	private int wanna;
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
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
	@Override
	public String toString() {
		return "PickListDto [seq=" + seq + ", userId=" + userId + ", contentsId=" + contentsId + ", wanna=" + wanna
				+ "]";
	}
	
}
	