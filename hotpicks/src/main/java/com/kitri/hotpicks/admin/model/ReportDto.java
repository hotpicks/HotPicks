package com.kitri.hotpicks.admin.model;

public class ReportDto {

	private int seq;
	private String userId;
	private String reprotContent;
	private String reprotDate;
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
	public String getReprotContent() {
		return reprotContent;
	}
	public void setReprotContent(String reprotContent) {
		this.reprotContent = reprotContent;
	}
	public String getReprotDate() {
		return reprotDate;
	}
	public void setReprotDate(String reprotDate) {
		this.reprotDate = reprotDate;
	}
	
	@Override
	public String toString() {
		return "ReportDto [seq=" + seq + ", userId=" + userId + ", reprotContent=" + reprotContent + ", reprotDate="
				+ reprotDate + "]";
	}
	
	
}
